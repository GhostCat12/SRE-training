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

Key points: 
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
