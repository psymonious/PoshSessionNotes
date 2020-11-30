# PoshSessionNotes
Notes from the PowerShell sessions

## Session 1 - Introduction
- [Session Notes](https://github.com/psymonious/PoshSessionNotes/blob/master/session1.ps1)

## Session 2 - Te fun begins
- [Session Notes](https://github.com/psymonious/PoshSessionNotes/blob/master/session2.ps1)

# Exercises
&#x1F4A1; Througout all the exercises use '*.GetType*' and '*Get-Member*' to see what you are working with &#x1F4A1;

## Environment
- open PowerShell (Admin not needed)
- List and get used to the default variables of the current session
- Explore the output of '*Get-PSDrive*'
- Find a way to access the environment variables

## Files - Level 1
- Find all *.log files in %AppData% and below
- Count the amount of found files
- Suppress possible errors

## Files - Level 2
- based on above
- Create new item of type directory named 'TeamsLogs' in your profile root
- Go through all files found in Level1
- Look for files with 'Teams' in the path name
- Write the name of the file to the shell when found and make it appear yellow
- copy the file to the variable of the directory
- Remove the folder and force the command to confirm the delete action

## Services & processes - Level 1
- Find services that start with the name 'De'
- Only show not running services

## Services & processes - Level 2
- open paint by hand or by command
- Find the process related to the paint instance you just openend
- Display attributes that shows the process ID, the path to the executable and the file version
- stop the process via the pipeline (use -WhatIf to make sure you just stop the single process)

## Events - Level 1
- List Events from 'Application' EventLog
- Only show the 100 newest events
- Select columns that contain the date, eventid and the message of the event
- show result in gridview for manual inspection

## Events - Level 2
- based on above
- Select all events with warning or error
- export the data into a csv file, with a delimiter of your choice and without type information