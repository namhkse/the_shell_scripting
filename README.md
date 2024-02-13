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

#!/bin/sh: The location of the Bourne shell on just about every Unix system.
#This is a comment!: A line starting with # is a comment that will be ignored.

Variables - Part 1
==================

Note no spaces around the "="
Work: VAR=value
Not work: VAR = value

In "VAR = value" the shell understands VAR is a command, "=" is first arg, value is second arg.

The shell does not care about types of variables; they may store strings, intergers, real numbers - any thing you like.