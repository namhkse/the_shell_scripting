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

The command "export" has a fundamental effect on the scope of variables

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
The below code is error because 'touch $USER_NAME_file" will be understand as a undeclared variable, cause execute "touch" command without arg
Correct: touch "${USER_NAME}_file"
