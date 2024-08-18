## Docker

**Objectives:** 
1. Create a Dockerfile, build images, and deploy multiple containers on the same host OS.
2. Explain a variety of keywords in Dockerfiles.

In this activity, you will create two Docker images and deploy two containers, one from each image. One image will be for the dev environment, and the other for testing. Both containers will serve as web servers, serving different content on the same host operating system.

## Setup 

1. Ensure Ports 80 and 8080 are open on your host OS firewall:

       sudo ufw allow 80/tcp
       sudo ufw allow 8080/tcp
   
2. Install Docker on Ubuntu:

       sudo apt-get update
       sudo apt-get install -y docker.io
3. Start Docker Daemon (Docker service):

       sudo systemctl start docker
4. Enable Docker to start on boot:

       sudo systemctl enable docker
5. Add User to Docker Group (Optional if you want to run Docker commands without using 'sudo'):

       sudo usermod -aG docker $USERNAME
Log out and in again to apply the group changes.

6. Find Your IP Address:

       hostname -I
       # If using a virtual machine below commands may provide the wrong ip address. 
       curl ifconfig.me
       curl icanhazip.com
       dig +short myip.opendns.com @resolver1.opendns.com
       Visit a website like WhatIsMyIP or IP Chicken.

### Creating test site Docker image

1. Create two directories for each Dockerfile.
   
       mkdir dev-site test-site
2. Create the Dockerfile for Test Site in test-site directory:
   
       cd ~/test-site
       vim Dockerfile
3. Add the following content to the Dockerfile and save:

    `FROM httpd:2.4`
5. Build the Test Site Docker Image and verify image was created:
   
       sudo docker build -t test-httpd .
       sudo docker images
6. Deploy the image to a container:

       sudo docker run -dit --name test-httpd-container -p 80:80 test-httpd
       sudo docker start
If you encounter an error indicating that port 80 is in use, you can stop any service using that port or run the container on a different port (-p 8080:80):

6. List running containers:

        sudo docker ps -a
7. Verify the test site works by visiting `http://<YOUR_IP>` or `http://localhost` in a browser.
    _Output:_ It works!



### Dev Site

1. Navigate to the 'dev-site' directory and create a folder for HTML files and navigate into it:
   
        cd ~/dev-site
        mkdir public-html
        cd public-html
   
2. Create an 'index.html' file with the following content:

       ```
       <html>
        <body>
            <h1>This is the Dev Site</h1>
            <h2>Cohort number <396> </h2>
        </body>
        </html>`
        ```

4. Create the Dockerfile for Dev Site in 'dev-site' directory:
   
        cd ~/dev-site

   Add the following  to the Dockerfile

       FROM httpd:2.4
       COPY ./public-html/ /usr/local/apache2/htdocs/
        
       ENV cohort=396
       RUN sed -i "s/<COHORT>/$cohort/g" /usr/local/apache2/htdocs/*
       EXPOSE 8080
       CMD ["httpd-foreground"]
       
3. Build the Dev Site Docker Image and list docker images to confirm creation:

        sudo docker build -t dev-httpd .
        sudo docker images
5. Deploy the image to a container and run:

        sudo docker run -dit --name dev-httpd-container -p 8080:80 dev-httpd
6. List running containers:

        sudo docker ps -a
7. Verify the dev site works by visiting `http://<YOUR_PUBLIC_IP>:8080` or `http:localhost:8080`.

