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
  
       $ sudo apt update
       $ sudo apt upgrade
       $ sudo apt install stress


3. Capture free memory before starting the stress test:

       $ free --mega # make sure output aligns with awk
       $ free --mega | awk 'NR==2 {print $4}' > free_mega_before_stress
       # NR==2 is for row 2 and $4 is col 4

4. Perform the stress test: Execute the stress command to stress the system with virtual memory for 300 seconds:

        $ stress --vm 1 --vm-bytes 512M --vm-keep -t 300s &
        # press enter

5. Capture free memory during the stress test: While the stress test is running, again use the free command to get the amount of free memory in megabytes and save it to a file named free_mega_during_stress:

        $ free --mega
        $ free --mega | awk 'NR==2 {print $4}' > free_mega_during_stress

6. Capture the top 5 memory-consuming processes during the stress test:

       $ ps -eo pid,%mem,%cpu,cmd --sort=-%mem | head -n 6 
   
7. Use BC to calculate the difference between how much memory the stress test used:

       $ bc <<< "$(cat free_mega_before_stress) - $(cat free_mega_during_stress)"



## Virtualisation 

Purpose of Linux Virtualization:
Linux virtualization allows you to create and run multiple virtual machines with a Linux operating system, enabling the efficient use of hardware resources.

How It Works:
By installing a virtual machine application on a Linux system, you can create multiple isolated environments (virtual machines) that each function as a separate computer. These virtual machines share the hardware resources of the host system. Hardware is the solution for full virtualisation (Type 1 VM).


Popular Virtualization Applications:
VMware, VirtualBox, KVM, QEMU, Xen, Parallels Virtuozzo Containers

Advantages: 
- Better utilisation of resources- The overall efficiency of the system can increase while Linux virtualisations as the physical CPU and memory shared. 
- Reduced Management: As the number of physical hardware servers is less so the time and the funds which are raised for the management will be less such as cooling and energy requirements.
- Flexible: Linux Virtualisations provide the flexibility to create a new environment with an existing physical box with the use of applications’ modified Xen virtualization implementations. 
- Reduces other expenses: The cost of licensing is a major factor. So, if the number of hardware is less the cost of licensing will be less.

VMware Server: 
- VMware Server allows a single physical server to be partitioned into multiple virtual servers or machines.
- It supports running multiple operating systems concurrently on the same hardware, including various versions of Linux and Windows. VMware ESXi is an example of a server operating system.
- VMware Workstation supports 19 versions of Windows and 26 versions of Linux, and can run as a host on both systems.
- VMware is not open-source software, but you can try it free for a month. After that, a license is required, which can be purchased online, or you can switch to VMware Player.

Installing Virtual box:
- VirtualBox is a powerful free tool by Oracle for running a virtual operating system on your computer. It runs under Linux, Mac OS X, Windows, and Solaris.
- VirtualBox can be downloaded from [here](https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html)
and the iso image can be downloaded from Ubuntu's website [here](https://ubuntu.com/download/desktop)

- Most data center environments experience changes to performance requirements and workload activity over time. 
- All of these methods provide users with the ability to service their own requests with minimal IT oversight.
  - Create a library of virtual machine templates and copy them to create new VMs
  - Invest in self-service virtualization provisioning systems
  - Give developers and testers permissions to create and deploy new VMs
  - Define standardized configurations for test environment virtual machines
- One of the primary benefits of virtualization is the ability to save the state of a VM and then move or copy it to another location.
- VMs must be able to communicate with each other, they will require network access. 
- Presentation virtualization involves installing and running applications on a central server and allowing clients to access the VMs over the network. An example of this approach is Microsoft’s Windows Terminal Services.
- Microsoft Hyper-V requires 64-bit CPUs with virtualization extensions, NX support, and runs only on x64 editions of Windows Server 2008. 
- The initial version of Microsoft Hyper-V does not support an automatic, live migration of virtual machines and their memory state from one server to another. 
- By default, the Hyper-V Server Role is not enabled on new installations of Windows Server 2008. 


## Package Management

## User Management

Linux user management commands
-  `sudo adduser <username>` - Adds user
-  `sudo passwd -l <username>` - Disable a user
- `sudo userdel -r <username>` - Delete a user
- `sudo usermod -a -G <groupname> <username>` - Adds user to a usergroup
- `sudo deluser <username> <groupname>` - Removes user from a usergroup
- `finger` - Gives information on all logged-in users
- `finger <username>` - Gives information on a particular user



