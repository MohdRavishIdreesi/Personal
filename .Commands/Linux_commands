####################################################################################################
####################################################################################################
####################################################################################################
✅ LINUX

What is Linux?
➔ Linux is an open-source operating system based on UNIX, known for its stability, security, and flexibility.

What is a Shell?
➔ A shell is a program that takes commands from the user and passes them to the operating system to execute.

To Install Ubuntu WSL on Windows:
Open PowerShell as Administrator.
🧪 Run Below Command:
wsl --install -d Ubuntu


🧪 Sample Command:
pwd: Prints the current working directory.
ls: Lists files and directories in the current directory.
cd: Changes the current directory.
touch: Creates an empty file or updates the timestamp of a file.
mkdir: Creates a new directory.
rm: Removes files or directories.
cp: Copies files or directories.
mv: Moves or renames files or directories.
clear: Clears the terminal screen.
cat: Displays the content of a file.
more: Views file content one page at a time (forward only).
less: Views file content one page at a time (forward and backward).
echo: Prints a line of text or variable value to the terminal.

####################################################################################################

✅ Essential Comamnds

ls -lart – Listing Files with Flags
What ls -lart Does
This is a combination of multiple options:

l → Long listing format (shows permissions, owner, size, timestamp)
a → All files, including hidden ones (starting with .)
r → Reverse order
t → Sort by modification time (latest last)

Example Output:
ls -lart
-rw-r--r--  1 user user   0 Apr 16 14:05 .hiddenfile
-rw-r--r--  1 user user 123 Apr 16 14:10 file1.txt
drwxr-xr-x  2 user user 4096 Apr 16 14:11 myfolder
-rwxr-xr-x  1 user user 456 Apr 16 14:15 script.sh


✅ Combining commands in Linux helps automate tasks, chain operations, and handle errors efficiently. Here'r some of them:

🧩 1. ; (Sequential Execution)
command1; command2; command3
🧪 Sample Command:
echo "Start"; mkdir testdir; echo "Done"

🧩 2. && (AND Operator – Run Next Only If Previous Succeeds) Command2 runs only if Command1 succeeds (exit code 0).
command1 && command2
🧪 Sample Command:
mkdir myfolder && cd myfolder
If mkdir fails, cd won’t run.

🧩 3. || (OR Operator – Run Next Only If Previous Fails)
Command2 runs only if Command1 fails (non-zero exit).
command1 || command2
🧪 Sample Command:
mkdir myfolder || echo "Folder already exists"

🧩 4. Grouping with {} or ()
{} runs commands in the current shell
() runs them in a subshell (isolated)
{ command1; command2; }     # Current shell
( command1; command2 )      # Subshell
🧪 Sample Command:
{ cd /tmp; ls; }

🧩 5. Piping | (Pass Output of One Command as Input to Another)
command1 | command2
🧪 Sample Command:
ls -l | grep "myfile"
cd /var/log && ls | grep error || echo "No error logs"
If cd succeeds, ls runs and filters with grep. If it fails, it echoes a fallback message.

####################################################################################################

✅ Piping commands elaborated

🧩 1. ps + grep (Find Running Processes)
List running processes and filter for a specific process (e.g., nginx):
🧪 Sample Command:
ps aux | grep "nginx"
ps aux: Shows all running processes.
grep "nginx": Filters and shows processes related to nginx.

🧩 2. ls + sort (List Files Sorted Alphabetically)
List files in the current directory and sort them alphabetically:
🧪 Sample Command:
ls -l | sort
ls -l: Lists files with details.
sort: Sorts the output alphabetically.

🧩 3. df + grep (Disk Space for Specific File System)
Check disk space usage, then filter for a specific file system (e.g., /dev/sda1):
🧪 Sample Command:
df -h | grep "/dev/sda1"
df -h: Shows disk space in human-readable format.
grep "/dev/sda1": Filters the output for /dev/sda1 file system.

🧩 4. cat + grep (Find a Pattern in a File)
Search for a specific term inside a file:
🧪 Sample Command:
cat myfile.txt | grep "error"
cat myfile.txt: Outputs the contents of myfile.txt.
grep "error": Filters the content to show lines with "error".

🧩 5. ls + wc (Count Number of Files)
Count the number of files in the current directory:
🧪 Sample Command:
ls | wc -l
ls: Lists files in the current directory.
wc -l: Counts the number of lines (files) output by ls.

🧩 6. dmesg + grep (Filter Kernel Messages)
Filter kernel messages for a specific term (e.g., "usb"):
🧪 Sample Command:
dmesg | grep "usb"
dmesg: Displays kernel ring buffer messages.
grep "usb": Filters messages containing "usb".

🧩 7. echo + tee (Write Output to File & Display)
Write output to a file and also display it on the screen:
🧪 Sample Command:
echo "Hello, World!" | tee output.txt
echo "Hello, World!": Prints "Hello, World!".
tee output.txt: Writes the output to output.txt and displays it.

🧩 8. find + grep (Find Files and Filter by Name)
Find all .txt files and filter the results by a keyword:
🧪 Sample Command:
find /path/to/search -type f -name "*.txt" | grep "report"
find /path/to/search -type f -name "*.txt": Finds all .txt files.
grep "report": Filters the files containing the word "report".

🧩 9. ls + head (Display First Few Files)
Display the first 5 files in a directory:
🧪 Sample Command:
ls -l | head -n 5
ls -l: Lists files in long format.
head -n 5: Shows the first 5 lines of the output.

🧩 10. tail + grep (Find Last Few Lines Matching Pattern)
Find the last 10 lines of a file and search for a pattern (e.g., "error"):
🧪 Sample Command:
tail -n 10 myfile.log | grep "error"
tail -n 10 myfile.log: Shows the last 10 lines of myfile.log.
grep "error": Filters those lines for "error".

🧩 11. ps + awk (Process Info and Extract Fields)
List processes and extract the process IDs (PID) using awk:
🧪 Sample Command:
ps aux | awk '{print $2}'
ps aux: Lists all running processes.
awk '{print $2}': Prints the second column, which is the PID.


####################################################################################################


✅ Learn File Permissions in Linux
Topics to Cover:

ls -l output — understand:
File types (-, d, l)
Permissions (r, w, x)
Owners, groups

Modify permissions using:

🧩 1. chmod – Change File Permissions

Linux File Permission Basics:

#When you run ls -l, {-rwxr-xr--}
- r w x r - x r - -
0 1 2 3 4 5 6 7 8 9

a. The first character: - (file), d (directory), or l (link)
0 = - , d or l

The next 1-9 characters are grouped in threes: rwx r-x r--
User (Owner): rwx → read, write, execute
Group: 		  r-x → read, no write, execute
Others: 	  r-- → read only

# How chmod Works
You can use chmod in two ways:

a. Symbolic Mode
u = user (owner)
g = group
o = others
a = all
+ = add permission
- = remove permission
= = set exact permission

🧪 Sample Command:
chmod u+x file.txt     # Add execute permission to user (owner)
chmod g-w file.txt     # Remove write permission from group
chmod o=r file.txt     # Set others' permission to read only
chmod a+rw file.txt    # Give read & write to all (user, group, others)

b. Numeric Mode (Octal)
Each permission has a number:
r = 4
w = 2
x = 1

Add them together for each group (user, group, others):

chmod 755 file.txt → rwxr-xr-x
7 (user): 4+2+1 = rwx
5 (group): 4+0+1 = r-x
5 (others): 4+0+1 = r-x

🧪 Sample Command:
chmod 777 file.txt    # All permissions to everyone
chmod 644 file.txt    # Owner can read/write, group and others can read
chmod 600 file.txt    # Only owner can read/write, rest no access
chmod 700 script.sh   # Only owner can read/write/execute

#List Only Normal (Human) Users
🧪 Sample Command:
awk -F: '$3 >= 1000 && $3 < 65534 {print $1,$3,$4,$6}' /etc/passwd
Normal user accounts usually start from UID 1000. You can filter like this:
This excludes system/service accounts and lists only human users.


🧩 2. chown – Change File Owner and Group

chown stands for "change ownership". It's used to change the user (owner) and/or group of a file or directory.

Basic Syntax:
chown [OPTIONS] user[:group] filename
user = new owner username
group = new group name (optional, use : to separate)
filename = target file or directory

a. Change owner only:
🧪 Sample Command:
chown john file.txt
Changes: the owner of file.txt to john. Group remains unchanged.

b. Change owner and group:
🧪 Sample Command:
chown john:dev file.txt
Changes:
Owner → john
Group → dev

c. Change only group (use : with empty user):
🧪 Sample Command:
chown :dev file.txt
Changes group of the file to dev, owner remains the same.

d. Change ownership recursively:
🧪 Sample Command:
chown -R john:dev /home/john
Changes ownership of /home/john and all files/directories under it to john:dev.

e. This adds user john to the developers group. 
🧪 Sample Command:
sudo usermod -aG developers john
Important: Use -aG (append to group) — without -a, it will remove the user from other groups.

f. Check Ownership with ls -l:
🧪 Sample Command:
ls -l file.txt
Output:
-rw-r--r-- 1 john dev 123 Apr 16 15:30 file.txt
Here:
john is the owner
dev is the group


🧩 3. chgrp (change group)
🧪 Sample Command:
sudo chgrp teamgamma gamma.txt



####################################################################################################


✅ Learn about File Redirection
Topics:
🧩 1. > and >> (redirect output) : This sends the output of a command to a file, overwriting the file if it already exists.

a. redirect output (>)
Syntax:
command > filename

🧪 Sample Command:
ls -l > output.txt
The list of files is saved to output.txt.
If output.txt exists, its content is replaced.

b. Append Output (>>)
Same as above, but it adds to the file instead of replacing it.

🧪 Sample Command:
echo "Hello" >> output.txt
Adds Hello to the end of output.txt.


🧩 2. < (redirect input) This redirects the contents of a file into a command as input.

Syntax:
command < filename
🧪 Sample Command:
sort < names.txt
sort reads the contents of names.txt instead of you typing manually.
Equivalent to: cat names.txt | sort


🧩 3. Combined Example:
🧪 Sample Command:
sort < names.txt > sorted.txt
Reads from names.txt
Sorts it
Saves the sorted result in sorted.txt

🧩 4. Bonus: Stdin, Stdout, Stderr
0 = Standard Input (<)
1 = Standard Output (>)
2 = Standard Error

🧪 Sample Command:
command 2> error.txt
Redirects only errors to error.txt

🧪 Sample Command:
echo "Hello" > file.txt       # overwrite
echo "World" >> file.txt      # append
cat < file.txt
cat file.txt | grep "Hello"
ls nonexistent 2> error.log   # redirect error

a. Standard Input (stdin)
🧪 Sample Command:
sort < names.txt
This redirects the content of names.txt as input for the sort command.

b. Standard Output (stdout)
🧪 Sample Command:
ls > files.txt
This sends the output of ls into the files.txt file instead of printing it on the terminal.

c. Standard Error (stderr)
🧪 Sample Command:
cat non_existent_file.txt 2> error.log
This sends the error message to error.log instead of displaying it in the terminal.

🧪 Sample Command:
command > output.txt 2>&1
> output.txt redirects stdout to output.txt.
2>&1 redirects stderr (2) to the same place as stdout (&1), so both outputs go into the same file.

d. You can manipulate these using redirection (<, >, 2>, etc.) or pipes (|) for chaining commands together.
Examples Combining All Three:

Redirect stdout to file and stderr to another file:
🧪 Sample Command:
command > output.txt 2> error.txt

Redirect both stdout and stderr to the same file:
🧪 Sample Command:
command > all_output.txt 2>&1

Pipe stdout to another command and redirect stderr to a file:
🧪 Sample Command:
command | another_command 2> error.txt

####################################################################################################


✅ 3. Learn and Practice search and sort: (find, grep, wc, cut, awk, head, tail)

🧪 Sample Command:

🧩 1. find command

# Find a file named "filename.txt" in /path/to/search
find /path/to/search -name "filename.txt"

# Case-insensitive search for "filename.txt"
find /path/to/search -iname "filename.txt"

# Find all files in the current directory and subdirectories
find . -type f

# Find all directories in the current directory and subdirectories
find . -type d

# Find all .log files
find . -name "*.log"

# Find all empty files and directories
find . -empty

# Find files modified in the last 7 days
find . -type f -mtime -7

# Find files modified more than 30 days ago
find . -type f -mtime +30

# Find files accessed in the last 2 days
find . -type f -atime -2

# Find files larger than 100MB
find . -type f -size +100M

# Find files smaller than 1KB
find . -type f -size -1k

# Find files exactly 10MB in size
find . -type f -size 10M

# Find files owned by a specific user (replace username)
find . -user username

# Find files with permission 777
find . -type f -perm 0777

# Find all symbolic links
find . -type l

# Find and delete all .tmp files
find . -name "*.tmp" -exec rm {} \;

# Find and list all files with full details
find . -type f -exec ls -lh {} \;

# Find files and run a custom command (example: echo file name)
find . -type f -exec echo Found file: {} \;

# Find files newer than a specific file (e.g., reference.txt)
find . -newer reference.txt

# Find all files and print only file names (omit ./ prefix)
find . -type f -printf "%f\n"

# Find all directories and print their depth
find . -type d -exec bash -c 'echo "{} - Depth: $(echo "{}" | tr -cd "/" | wc -c)"' \;

# Find files with inode number (replace 123456)
find / -inum 123456

# Find files and change permission (chmod example)
find . -type f -name "*.sh" -exec chmod +x {} \;


🧩 2. grep commands

# Search for the word "error" in a file
grep "error" filename.txt

# Case-insensitive search for "error"
grep -i "error" filename.txt

# Search recursively in all files under current directory
grep -r "error" .

# Show line numbers along with matches
grep -n "error" filename.txt

# Search for exact word match
grep -w "error" filename.txt

# Count the number of matches
grep -c "error" filename.txt

# Invert match (show lines that do NOT contain "error")
grep -v "error" filename.txt

# Show only the matching part (not the full line)
grep -o "error" filename.txt

# Use regular expression (match lines starting with 'error')
grep "^error" filename.txt

# Match lines ending with 'error'
grep "error$" filename.txt

# Match lines with either "error" or "fail"
grep -E "error|fail" filename.txt

# Use grep with multiple patterns from a file (one pattern per line)
grep -f patterns.txt filename.txt

# Search multiple files for a pattern
grep "error" file1.txt file2.txt

# Highlight matches (useful in terminal)
grep --color=auto "error" filename.txt

# Exclude specific file types (e.g., skip .log files)
grep -r --exclude="*.log" "error" .

# Include only specific file types (e.g., only .conf files)
grep -r --include="*.conf" "error" .

# Print filenames only, not the matching lines
grep -l "error" *.log

# Print filenames that do NOT contain the pattern
grep -L "error" *.log


🧩 3. wc command

# Count lines in a file
wc -l filename.txt

# Count words in a file
wc -w filename.txt

# Count characters in a file
wc -m filename.txt

# Count bytes in a file
wc -c filename.txt

# Count lines, words, and characters (default behavior)
wc filename.txt

# Count number of lines in multiple files
wc -l file1.txt file2.txt

# Total lines across multiple files
wc -l file1.txt file2.txt | tail -n 1

# Count words from output of another command (e.g., list of files)
ls | wc -l

# Count words from piped input
echo "This is a test" | wc -w

# Count characters from piped input
echo "This is a test" | wc -m

# Count lines from piped input
cat filename.txt | wc -l

# Use wc with grep to count matches
grep -o "error" filename.txt | wc -l


🧩 4. cut Command: cut is used to extract specific columns or characters from a line or file.

Syntax:
cut -d '<delimiter>' -f <field_number> <file>

a) Extract usernames from /etc/passwd:
🧪 Sample Command:
cut -d: -f1 /etc/passwd
-d: = delimiter is colon (:)
-f1 = print the first field (usernames)

b) Get first 10 characters of a file:
🧪 Sample Command:
cut -c 1-10 filename.txt
-c = cut by character position

# Cut by character position: get characters 1 to 5 from each line
cut -c 1-5 filename.txt

# Cut only the 3rd character
cut -c 3 filename.txt

# Cut by byte position (useful for fixed-width formats)
cut -b 1-10 filename.txt

# Cut fields (columns) using delimiter: get the 1st field separated by colon (:)
cut -d ':' -f 1 /etc/passwd

# Get the 1st and 3rd fields separated by comma (,)
cut -d ',' -f 1,3 data.csv

# Get fields from a tab-separated file (default delimiter is TAB)
cut -f 2 data.tsv

# Combine with echo for quick testing
echo "apple:banana:cherry" | cut -d ':' -f 2

# Use with pipes: extract username from who command
who | cut -d ' ' -f 1

# Get last field using rev (reverse line) + cut
echo "one:two:three" | rev | cut -d ':' -f 1 | rev

# Remove the first field (get everything after the delimiter)
echo "name:age:location" | cut -d ':' -f 2-

# Extract column from command output (e.g., IP address from `ifconfig`)
ifconfig eth0 | grep 'inet ' | awk '{print $2}' | cut -d ':' -f2


🧩 5. awk Command: awk is much more powerful — used for pattern scanning and processing. (default delimiter is space: " ")

Basic Syntax:
awk '{print $1}' <file>

a) Print first column of output:
🧪 Sample Command:
ls -l | awk '{print $1}'
Shows file permissions.

b) Print username and shell from /etc/passwd:
🧪 Sample Command:
awk -F: '{print $1, $7}' /etc/passwd
-F: = field separator is colon
$1 = username, $7 = shell

c) Print lines with more than 10 characters:
🧪 Sample Command:
awk 'length($0) > 10' filename.txt

## Difference Between cut and awk:
Use cut when fields are consistently structured and simple.
Use awk when you need conditions, calculations, or more complex logic.

# Print the entire file (default behavior)
awk '{print}' filename.txt

# Print the first column of each line
awk '{print $1}' filename.txt

# Print the first and third columns
awk '{print $1, $3}' filename.txt

# Print lines where the third column is greater than 100
awk '$3 > 100' filename.txt

# Print lines where the first column equals "John"
awk '$1 == "John"' filename.txt

# Use a custom field separator (e.g., comma)
awk -F ',' '{print $2}' data.csv

# Print line number with each line
awk '{print NR, $0}' filename.txt

# Sum the values in the second column
awk '{sum += $2} END {print "Total:", sum}' filename.txt

# Average of second column
awk '{sum += $2; count++} END {print "Average:", sum/count}' filename.txt

# Print only lines containing "error"
awk '/error/' filename.txt

# Print lines that do NOT contain "error"
awk '!/error/' filename.txt

# Replace "apple" with "orange" in the whole file
awk '{gsub("apple", "orange"); print}' filename.txt

# Print last field in each line
awk '{print $NF}' filename.txt

# Print number of fields in each line
awk '{print NF}' filename.txt

# Process CSV and print full name (first + last)
awk -F ',' '{print $1 " " $2}' names.csv

# Print column header and values (example for structured output)
awk 'NR==1 {print "Name,Age"} NR>1 {print $1 "," $2}' filename.txt


🧩 6. head -n 5 file.txt

# Show the first 10 lines of a file (default behavior)
head filename.txt

# Show the first 5 lines of a file
head -n 5 filename.txt

# Show the first 20 lines of a file
head -n 20 filename.txt

# Show everything except the last 10 lines (opposite of tail)
head -n -10 filename.txt

# Use with pipes: show first 10 processes
ps aux | head

# Show the first 10 lines of multiple files
head file1.txt file2.txt

# Read only the first 100 bytes of a file
head -c 100 filename.txt

# Show first 3 lines from output of a grep
grep "error" logfile.txt | head -n 3

# Show first 10 lines from output of a find command
find . -name "*.log" | head

# Combine head with sort to get top N lines (e.g., top 5 biggest files)
du -sh * | sort -rh | head -n 5


🧩 7. tail -n 10 file.txt

# Show the last 10 lines of a file (default)
tail filename.txt

# Show the last 5 lines of a file
tail -n 5 filename.txt

# Show the last 20 lines of a file
tail -n 20 filename.txt

# Show all lines starting from line 11
tail -n +11 filename.txt

# Show the last 100 bytes of a file
tail -c 100 filename.txt

# Show the last 10 lines of multiple files
tail file1.txt file2.txt

# Monitor a file live as it grows (e.g., log file)
tail -f /var/log/syslog

# Follow multiple files live
tail -f file1.log file2.log

# Follow a file and suppress headers
tail -q -f file1.log file2.log

# Combine with grep: show last 50 lines containing "error"
tail -n 50 logfile.txt | grep "error"

# View log updates in real time and filter by keyword
tail -f /var/log/syslog | grep --line-buffered "failed"


####################################################################################################

✅ 4. Hands-on Mini-Project

####################################################################################################

🧩 Project Name: Log Filter Script

🧩 Objective:
   Create a shell script that:
   Reads a log file (logfile.txt)
   Filters all lines with ERROR
   Appends it to errors.log
   Counts and displays how many errors were found

🧪 Sample Script:

#!/bin/bash
grep "ERROR" logfile.txt >> errors.log
count=$(grep -c "ERROR" logfile.txt)
echo "Total Errors: $count"

####################################################################################################

🧩 Project Name: To practice Linux user and group management.

#creating groups
sudo groupadd teamalpha
sudo groupadd teambeta
sudo groupadd teamgamma

#to list the groups
cat /etc/group | grep -Ei 'teamalpha|teambeta|teamgamma' 

#creating users in groups

sudo useradd -m -G teamalpha alpha01
sudo useradd -m -G teamalpha alpha02
sudo useradd -m -G teamalpha alpha03
sudo useradd -m -G teamalpha alpha04
sudo useradd -m -G teamalpha alpha05

sudo useradd -m -G teambeta beta01
sudo useradd -m -G teambeta beta02
sudo useradd -m -G teambeta beta03
sudo useradd -m -G teambeta beta04
sudo useradd -m -G teambeta beta05

sudo useradd -m -G teamgamma gamma01
sudo useradd -m -G teamgamma gamma02
sudo useradd -m -G teamgamma gamma03
sudo useradd -m -G teamgamma gamma04
sudo useradd -m -G teamgamma gamma05

#creating passord for them
sudo passwd alpha01
sudo passwd alpha02
sudo passwd alpha03
sudo passwd alpha04
sudo passwd alpha05
sudo passwd beta01
sudo passwd beta02
sudo passwd beta03
sudo passwd beta04
sudo passwd beta05
sudo passwd gamma01
sudo passwd gamma02
sudo passwd gamma03
sudo passwd gamma04
sudo passwd gamma05

#to change the user
su - UserName
OR
ssh UserName@localhost

#to list the users
cat /etc/passwd | grep -Ei 'alpha|beta|gamma' 

#to check if the users added to the groups
getent group | grep -Ei 'teamalpha|teambeta|teamgamma'

#creating files 
mkdir PERMISSSIONs
cd PERMISSSIONs
touch alpha.txt
touch beta.txt
touch gamma.txt
ls -lart

#changing the ownership

#WAY 1
sudo chown :teamalpha alpha.txt
sudo chown :teambeta beta.txt
sudo chown :teamgamma gamma.txt

#WAY 2
sudo chgrp teamalpha alpha.txt
sudo chgrp teambeta beta.txt
sudo chgrp teamgamma gamma.txt

#Gave read and write permission to the group, but no access to others:
sudo chmod 660 alpha.txt
sudo chmod 660 beta.txt
sudo chmod 660 gamma.txt

FINAL OUTPUT:
rawish@MSI:~/PERMISSIONs$ ls -lt
total 0
-rw-rw---- 1 rawish teamalpha 0 Apr 26 14:17 alpha.txt
-rw-rw---- 1 rawish teambeta  0 Apr 26 14:17 beta.txt
-rw-rw---- 1 rawish teamgamma 0 Apr 26 14:17 gamma.txt

CLEANUP:
sudo deluser alpha01
sudo deluser alpha02
sudo deluser alpha03
sudo deluser alpha04
sudo deluser alpha05
sudo deluser beta01
sudo deluser beta02
sudo deluser beta03
sudo deluser beta04
sudo deluser beta05
sudo deluser gamma01
sudo deluser gamma02
sudo deluser gamma03
sudo deluser gamma04
sudo deluser gamma05

sudo deluser --remove-home alpha01
sudo deluser --remove-home alpha02
sudo deluser --remove-home alpha03
sudo deluser --remove-home alpha04
sudo deluser --remove-home alpha05
sudo deluser --remove-home beta01
sudo deluser --remove-home beta02
sudo deluser --remove-home beta03
sudo deluser --remove-home beta04
sudo deluser --remove-home beta05
sudo deluser --remove-home gamma01
sudo deluser --remove-home gamma02
sudo deluser --remove-home gamma03
sudo deluser --remove-home gamma04
sudo deluser --remove-home gamma05

sudo rm -rf alpha01
sudo rm -rf alpha02
sudo rm -rf alpha03
sudo rm -rf alpha04
sudo rm -rf alpha05
sudo rm -rf beta01
sudo rm -rf beta02
sudo rm -rf beta03
sudo rm -rf beta04
sudo rm -rf beta05
sudo rm -rf gamma01
sudo rm -rf gamma02
sudo rm -rf gamma03
sudo rm -rf gamma04
sudo rm -rf gamma05

sudo delgroup teamalpha
sudo delgroup teambeta
sudo delgroup teamgamma

cd ..
rm -rf PERMISSIONs/


####################################################################################################
####################################################################################################
####################################################################################################
