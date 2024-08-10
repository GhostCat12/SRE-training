Installing vim:

    $ sudo apt update   ## Update linux
    $ sudo apt install vim   ## installing vim 
    $ which vim   # check location of vim
    
`vi filename` or `vim filename` Creates and / or edits filename using vim. Vim starts in command mode, where actions are taken on file, Insert mode allows text to be entered and edited, and the Esc key returns to command mode. A useful Vim cheat sheet with all commands can be found [here](https://vim.rtorr.com/).

Basic commands: 

- `Ins` key, or `i` - to enter insert mode from command mode.
- `:w` - Save.
- `:q` - Quit.
- `:wq` or `ZZ` - Save and Quit.
- `:w filename` - Save as filename.
- `:q!` - Force quit.
- `:w!` - Force save (write to non-writeable file).
- `:set number` - Vim will display line numbers on the left side of each line in the text.
- `:set nonumber` - Disable line numbers.

