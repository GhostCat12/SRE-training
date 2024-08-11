## Part 1: Avengers

## 1. Open a new file named avengers in your home directory in your editor and paste in the following text:

Six stones, three teams, one shot. Five years ago, we lost. All of us. We lost friends. We lost family. We lost a part of ourselves. Today, we have a chance to take it all back. You know your teams. You know your missions. Get the stones. Get them back. One round trip each. No mistakes. No do-overs. Most of us are going somewhere we know. that doesn't mean we should know what to expect. Be careful. Look out for each other. This is the fight of our lives, and we're gonna win. Whatever it takes. Good luck.

        $ vi avengers
        `i` (enter insert mode) 
        'p' (paste) 
        
### 2. Exit and save the file.

`Esc` (command mode), `:wq` (save and exit)
        
### 3. Run a word count on the file.

        $ wc -w avengers
        
### 4.  Edit the file to add a blank line and type in "word count" followed by the value you just got.
        
        $ vi avengers
`G` (Go to last line), `o` (new line), 'word count 98', `Esc`
        
### 5. Now use search and replace within the editor to replace every instance of the word the with THE. Ensure that you only catch the word the and not words that contain the letters the (like them).
        
`:%s/\<the\>/THE/g`
        
### 6. Copy the first line of the file and paste it after your word count entry at the bottom of the file.

`gg` (go to first line), `yy` (yank / copy), `G` (Go to last line), `p` (paste).
        
### 7. Delete the first line of the file.

`gg` (go to first line), `dd`(delete entire line).

### 8. Undo that deletion.
`u` (undo)

### 9. Insert at the top of the file the text "Captain America – Endgame" followed by an empty line.

`gg` (go to first line), `O` (insert new line above), 'Captain America - Endgame', `o` (new line)

### 10. Save the changes and exit the editor.

`Esc` (command mode), `:wq` (save and exit).

### 11. Find out the number of lines in the file now.

        $ wc -l avengers

### 12. Write the number of lines into the file one line above the word count with the text "line count" plus the value.

        $ vim avengers
`gg` (go to first line), `O` (insert new line above), 'line count 5' 

### 13. Delete "Good luck" wherever it occurs in the file.

`:%s/Good luck//g`.

### 14. Save and exit the file

`Esc` (command mode), `:wq` (save and exit).

## Part 2: Log Files

### 1. Run the fixGenerator.sh script again from your home directory using the following commands:

cd ~
./fixGenerator.sh &
Creates a fix log output now from running the script earlier.

### 1. Run a search for all new order singles in the fix log output and put the output of that search into a file named newOrders.log in your home directory.
### 1. Open newOrders.log in your editor.
### 1. Duplicate the first line in the file.
### 1. Go to the fifth line in the file and duplicate it also.
### 1. Find and replace every instance of MTHREE with M3.
### 1. Find and replace every ; (semicolon) with a , (comma) and ensure there is no space after the commas.
### 1. Save and exit the file.
