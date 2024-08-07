# SRE-training
Site Reliability Engineer training by WileyEdge / Mthree 

## Table of Contents

#### 🔶 1 &nbsp; Basic Concepts
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.1 &nbsp;&nbsp; Activity: AWS EC2 Setup
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.2 &nbsp;&nbsp; Activity: Linux Exercises - Basic Commands
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.3 &nbsp;&nbsp; Activity: Linux Tools & Navigation
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.4 &nbsp;&nbsp; Activity: File Management and Git
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.5 &nbsp;&nbsp; Activity: Editing Files in Linux
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.6 &nbsp;&nbsp; Activity: Fix Log Analysis
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.7 &nbsp;&nbsp; Activity: File Systems in Linux
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.8 &nbsp;&nbsp; Activity: Linux Jobs
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.9 &nbsp;&nbsp; Activity: Scheduling and Automation
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.10 &nbsp;&nbsp; Activity: File Systems in Linux
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 1.11 &nbsp;&nbsp; Activity: File Systems in Linux
#### 🔶 2 &nbsp; Advanced Linux
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 2.1 &nbsp;&nbsp; Activity: Using Vi
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 2.2 &nbsp;&nbsp; Activity: Linux Networking and Sys Admin
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 2.3 &nbsp;&nbsp; Activity: Advanced Commands
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 2.4 &nbsp;&nbsp; Activity: File Permissions in Linux
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 🔸 2.5 &nbsp;&nbsp; Activity: AWS EC2 Setup
#### 🔶 3 &nbsp; DevOps Foundations


## Advanced Linux 


### 2.2 Linux Networking and Sys Admin

Summary of the machine’s memory, where `MemTotal` is total ram installed, `MemFree ` is currently unused RAM, `MemAvailable` is RAM available for new applications. Alternatively, `free` command using megabytes and human-readable flags displays this information.


    $ cat /proc/meminfo
[Screenshot_1]
    
    $ free --mega -h  
[Screenshot_2]    

    $ vmstat 1
[Screenshot_3]

    $ ps aux --sort -rss # rss is Resident Set Size (memory descending)
    $ ps aux --sort -%mem # % of rss used by the process. The minus sign before %mem indicates descending order, whereas a plus sign would do ascending.
    $ ps -eo user,pid,%mem,stat,cmd --sort=-%mem # only include output (-o) columns that we want (user,pid,%mem,stat,cmd)    
    $ ps aux --sort -%cpu # can also sort by cpu
    $ ps aux --forest # useful to see a tree of parent processes
    $ watch 'ps aux --sort -%mem | head' # run the command every 2 seconds
    $ top # use top
    
Inodes 
Linux filesystem uses blocks to store file data. Each block is commonly 4 KB (4096 bytes). An inode is a data structure that stores metadata about a file, such as its size, ownership, permissions, and timestamps, along with pointers to the blocks where the file’s actual data is stored.

    $ dd if=/dev/urandom of=8kb_file bs=1K count=8
    $ stat 8kb_file

    $ df -i

Network Diagnostic Tools

Ping

    $ ping 8.8.8.8
    $ ping -c 4 8.8.8.8
nslookup

    $ nslookup example.com
    $ nslookup 8.8.8.8
traceroute

    $ traceroute example.com

dig

    $ dig example.com
    # You can also query specific DNS record types, such as A, MX, TXT, etc.:
    $ dig example.com A
    $ dig example.com MX
    $ dig -x 8.8.8.8 # reverse DNS lookup

curl

    $ curl https://example.com
    $ curl -o index.html https://example.com # Save Output to a File: Save the retrieved web page to a file
    $ curl -L -o redirected.html https://example.com # Follow Redirects: Follow HTTP redirects and show final URL
    $ curl -X POST -d 'username=user&password=pass' https://example.com/login -f 
    # -f is to fail on http error, useful for scripts or pipelines that use exit codes
    
    # Headers and Cookies: Include headers or cookies in requests:
    $ curl -H "Authorization: Bearer token" https://api.example.com/data
    $ curl -b "cookie1=value1; cookie2=value2" https://example.com

Listening Ports

    $ sudo lsof -i -P # sudo is likely needed

Monitoring network traffic

    $ netstat -c # c is for continuous
    $ ss # this is similar, you can see how many established connections are on your machine and what protocol they are using (eg how many people are logged in via ssh or using your web server)

Private IP and Subnet

    $ ifconfig


Exercise 
    
1. Install stress:
  
       $ dnf search stress
       $ sudo dnf install stress

2. Capture free memory before starting the stress test:

       $ free --mega # make sure output aligns with awk
       $ free --mega | awk 'NR==2 {print $4}' > free_mega_before_stress
       # NR==2 is for row 2 and $4 is col 4

3. Perform the stress test: Execute the stress command to stress the system with virtual memory for 300 seconds:

        $ stress --vm 1 --vm-bytes 512M --vm-keep -t 300s &
        # press enter

4. Capture free memory during the stress test: While the stress test is running, again use the free command to get the amount of free memory in megabytes and save it to a file named free_mega_during_stress:

        $ free --mega
        $ free --mega | awk 'NR==2 {print $4}' > free_mega_during_stress

5. Capture the top 5 memory-consuming processes during the stress test:

       $ ps -eo pid,%mem,%cpu,cmd --sort=-%mem | head -n 6 
   
6. Use BC to calculate the difference between how much memory the stress test used:

       $ bc <<< "$(cat free_mega_before_stress) - $(cat free_mega_during_stress)"

   
