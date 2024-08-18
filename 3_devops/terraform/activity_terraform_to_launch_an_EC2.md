## Terraform
Terraform is Infrastructure as Code (IaC). Main terraform commands : 
- terraform init: Initializes terraform and confirm the cloud credentials.
- terraform plan: Print a plan of changes before applying them.
- terraform apply: Creates or updates computing resources to match the IaC.
- terraform output: Prints the outputs you specify, such as created resource names or nameservers.
- terraform destroy: Destroys the resources that it created. To do this, save the generated file after running terraform apply. You can configure saving this in an S3 bucket so that you can destroy and apply updates.

## Activity

### Step 1 Cloudshell
Log into the AWS Console and search for Cloudshell

### Step 2 Install Terraform
Visit the official terraform site for installation instructions under Linux AmazonLinux. Make sure you select AmazonLinux for package manager. Run the commands. Note that Cloudshell preserves your files in the home folder, but will not preserve installations. You will have to install terraform each time you log in.

### Step 3 Clone the Terraform IaC
First, clone [repository](https://github.com/theacademy/sre-ec2-terraform) Then cd to the terraform folder.
      
      git clone https://github.com/theacademy/sre-ec2-terraform
      cd sre-ec2-terrraform/terraform

Notice that you have the files shown below.
- **main.tf** - Every terraform project has a main.tf file. This file is typically used to import modules. For our simple example, we do not need to import any other modules.
- **ec2.tf** - This file makes the ec2 instance. Read the docs on the [instance resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).
- **backend.tf** - The backend specifies where to back up terraform.tfstate file. The state file modifies the terraform code, run terraform apply again, and only add the new changes. It also allows us to delete the resources created by Terraform.
- **outputs.tf** - This file is typically used to define outputs that you want to display by running terraform output. In our setup, we use it to display the private key, which is used to SSH into our instance.
- **variables.tf** - Used to store variables. You can supplement the values at the command line, or just modify the default values of this file.

### Step 4 Terraform

Initialize Terraform using CloudShell.

    terraform init
You can also validate the plan before running to ensure the code is valid. Examine the plan’s output. It will show you the resources that it plans on creating or updating.

    terraform validate
    terraform plan
Next, create the planned resources.

    terraform apply
Print the outputs from the output.tf file.

    terraform output
    
Run ls and notice that you have a terraform.state file. This file stores the state and allows you to modify or delete everything that was created.

    ls  

### Step 5 Connect to Instance

To connect to the instance, you will need to store and download the private key. command below does not give the private key.

    terraform output
Use the -json flag to obtain private data from terraform output command.

    terraform output -json
    
The jq command is a JSON parser tool that can parse and extract values from JSON. Below, we use it to save the private key in a file named private.pem.

    terraform output -json | jq -r '.private_key.value' > private.pem

Download a file in Cloudshell by clicking the “Action” button and selecting Download. Use this path to download sre-ec2-terraform/terraform/private.pem.

Make sure you set the permissions of the file correctly.

    chmod 400 private.pem

Obtain the public ip address from the terraform output command. Then use it in the ssh command.
    
    terraform output
    ssh -i private.pem ec2-user@public-ip-address # replace public-ip-address with the ip from terraform output

Cleanup
Navigate to the terraform directory and run terraform destroy after terraform init.

      cd sre-ec2-terraform/terraform/
      terraform init
      terraform destroy
