Same as basic tools and navigation under 1_basic_concepts:   

Command format:

    command [-options] [arguments]

List of commands:
- `man <command>` - Linux online manual for commands 
- `pwd` - Displays the complete path of the current working directory. 
- `ls` - Lists the contents of current directory (subdirectories and files).
  - `ls /path` - list contents of directory of a specified path. 
  - `ls -a` or `ls --all` - List all files including hidden files in the current directory.
  - `ls -d */` - List directories in the current directory.
  - `ls -l` - list the contents of a directory in a long detailed format (Read write and execute permissions for owner group and others; Number of links; Owner; Group; File size (bytes); Date and timestamp; File name). 
  - `ls -ltra` - List `a` all contents in `l` long format, sorted by `r` reversed `t` time format (oldest to newest).
- `cd directoryname` or `cd /home/absolute/path` -  Changes the working directory (subdirectory must exist in the current directory, else, use absolute path).
- `cd ..` or `cd ../` - Move up to the (current directory's) parent directory.
    - `cd ../../` - Move up two directory levels from your current location.
    - `cd /` - Move to system's root directory.
    - `cd ~` - Move to the user's home directory.
- `history` - Displays a history of all commands issued on the machine: 
  - `history -5` - Displays a history of recent 5 commands issued.
- `uname -a` or `uname --all` -  Information about the current Linux operating system
