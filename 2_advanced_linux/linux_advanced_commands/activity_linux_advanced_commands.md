
**First run the fixGenerator.sh script in your home directory:**

   ```bash
    ./fixGenerator.sh &
   ```

1. Create a directory named logs.

   ```bash
    mkdir logs 
   ```

3. Move the log output from the fixGenerator script into the logs directory. (Be sure the script has finished before doing this.)

    ```bash
    mv fixlog20240812105445.log logs/.
    ```

4. From the command line, replace all instances of MTHREE in the file with M3 and put the output into a new file named fixlog2.log in the logs directory.

   ```bash
   cat fixlog20240812105445.log | sed 's/MTHREE/M3/g' > logs/fixlog2.log
   ```

5. Run a command to pull all fill messages from fixlog2.log and put the output into a new log file named fills.log. (You may need to look up how to tell if a message is a fill.)

   ```bash
   grep 35=8 logs/fixlog2.log | grep -v 32=0 > logs/fills.log
   ```

6. Run a command to pull all cancel acknowledgment messages (39=4) from fixlog2.log into a new log named cancels.log in the same directory.
    ```bash
    grep 39=4 logs/fixlog2.log > logs/cancels.log
    ```

7. Run a command to create a new log file named partialFills.log and add the partial fills from fills.log to the new file.
    ```bash
    grep 39=1 logs/fills.log > logs/partialFills.log
    ```

8. Use awk to create a new file out of the partial fill log that has the following tags only: Symbol (55); orderID (11); side(54); fill price (31); fill quantity (32); execution id (17). Name the file parsedPartialFills.log and make sure you print the columns in the order listed here.
    ```bash
    awk '{print $7, $9, $13, $10, $15, $16}' logs/partialFills.log > logs/parsedPartialFills.log
    ```

9. Using an editor, remove the first part of every fix tag (so you are left with the value only) and turn the file into a comma-separated list with no spaces. This is how you might have to get a file ready to send to a trader.

  `:%s/55=//g`, `:%s/11=//g`, `:%s/54=//g`, `:%s/31=//g`, `:%s/32=//g`, `:%s/17=//g`, `:%s/; /,/g`, `:%s/;/,/g`.

10. In the file, add a row of column headers separated by commas. The headers should be Symbol, OrderID, Side, Price, Qty, and ExecID.

   `ggO`

11. Save the file as <yourname>.module10.csv in the location specified by your instructor. Submit this file to this assignment page along with your text file.

    ```bash
    cp parsedPartialFills.log MaryamHashmi.module10.csv
    ```


12. Make a copy of the cancels file and name it cancels2.log.
     ```bash
    cp cancels.log cancels2.log
     ```

14. Open the cancels2.log file in an editor. Find the first symbol (tag 55) in the first line and add the letter A to the beginning of the value. (If it was 55=GOOG, it will become 55=AGOOG.)

  `:s/55=/55=A/g`, `:wq`

15. Run a difference between the original cancels file and the new file you just edited.

    ```bash
    diff logs/cancels.log logs/cancels2.log
    ``` 
