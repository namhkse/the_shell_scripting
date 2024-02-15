The Shell Scripting Tutorial
============================

Philosophy
==========

Advantage
- Unix system administrators
- The speed at which interpreted program
- Easy to write a simple batch-job type shell script

A First Script
==============

- #!/bin/sh: The location of the Bourne shell on just about every Unix system.
- #This is a comment!: A line starting with # is a comment that will be ignored.

Variables - Part 1
==================

Note no spaces around the "="
- Work: VAR=value
- Not work: VAR = value

In "VAR = value" the shell understands VAR is a command, "=" is first arg, value is second arg.

The shell does not care about types of variables; they may store strings, intergers, real numbers - any thing you like.

Scope of variables
- Variable in shell do not have to be declared
- Try to read an undeclared variable, the result is empty string, no WARNING

The command `export` has a fundamental effect on the scope of variables

When a shell scrip is excuted, a new shell is spawned to run the script. The variabled is not shared. We need to export the variable
for it to be inherited by another program - include a shell script

In order to receive enviroment changes back from the script, we must source script. We can source the script via the "."(dot) command

```sh
#!/bin/sh
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called ${USER_NAME}_file"
touch $USER_NAME_file
```
The below code is error because `touch $USER_NAME_file` will be understand as a undeclared variable, cause execute "touch" command without arg

Correct: touch `${USER_NAME}_file`

Wildcards
=========
Think first how you would copy all the files from /tmp/a into /tmp/b. All the .txt files? All the .html files?
```sh
cp /tmp/a/* /tmp/b      # Copy all the files
cp /tmp/a/*.txt /tmp/b  # Copy all the txt files
cp /tmp/a/*.html /tmp/b  # Copy all the html files
```

How would you list the files in `/tmp/a` without `ls /tmp/a`?
May I use `echo /tmp/a/*`?

How could you rename all .txt files to .bak?
```sh
mv *.txt *.bak  # This is not worked
```
Thinking about the expaned by the shell. The above command will be interpreted as
```sh
mv a.txt b.txt  # If no have .bak files
# Or
mv a.txt b.txt c.bak d.bak # If have .bak files
```

Escape Characters
=================
So how do we display: Hello    "World" ?
```sh
echo "Hello    "World""
# Or
echo "Hello    \"World\""
```
The `echo "Hello    "Would""` code would be interpreted as three parameters
1. "Hello    "
2. World
3. ""

Most characters(*, ', ect) are not intepreted by placed in double quotes("")

However ", $, `, and \ are still interpreted by the shell
The backslash (\) is used to mark special characters so they are not intepreted by the shell

Loops
=====
We have **for** and **while** in shell

Tip from **Linux From Scratch**:
```sh
mkdir rc{0,1,2,3,4,5,6,S}.d
```
More cumbersome
```sh
for runlever in 0 1 2 3 4 5 6 S
do
    mkdir rc${runlever}.d
done
```
Trick list dir recursive 
```sh
    ls {,usr,usr/local}/{bin,sbin,lib}
```

Test
====

The **[** is a symbolic link to **test**. The **[** is actual program so must be surronded by spaces.
```sh
if [$foo = "bar" ]
```
After interpreted **if test$foo = "bar" ]**.
```sh
[ EXPRESSION ] 
# Equal
test EXPRESSION
# See more operators in "test" command in "man test" 
```

The **&&** and **||** command give code to run if the result is true or false
```sh
if [ EXPRESSION ]; then
    echo "Run if true"
else
    echo "Run if false"
fi
```
My rewrite use **&&** and *||** a below
```sh
[ EXPRESSION ] && echo "Run if true" || echo "Run if false"
```

Case
====

Variables - Part 2
==================
There are some special variables, can not be assigned to them.
They contain useful information, can be used by the script to know about the env in which it running

```sh
$0 is name of called program
$1 .. $9 are 9 addition args
$# is a number parameter was passed to script 
$@ or $* is all parameter
$? contains exited value
$$ is PID of current running shell
$! is PID of last background process
$IFS run var5.sh to know 
```

Variables - Part 3
==================

Print default for variable when it is undefined by using `:-` and `{}`
```sh
echo "${number:-0}"
echo "number is: $number"
```

Asign default for variable when it is undefined by using `:=` and `{}`
```sh
echo "${number:-0}"
echo "number is: $number"
```

External Programs
=================

Functions
=========