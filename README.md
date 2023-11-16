# autoripper
Based on Regripper and Autorip script. Written in batch and python. Alpha version
### Regripper
https://github.com/keydet89/RegRipper3.0

### Autorip
http://journeyintoir.blogspot.com/2013/05/unleashing-autorip.html

## Description
This script will look for the specified registry files within a given directory and parse them using RegRipper, saving the output to a designated reports directory.

## Batch: autoripper.bat
To use this script:
- Replace C:\path\to\regripper\ with the actual path to your RegRipper rip.exe file and the plugins directory.
- Run the batch file; it will ask for the input path of the registry hives and the output path for reports.
- The script will create the reports directory if it doesn't exist and then process each specified registry hive, creating a report for each.
-It outputs messages to the console indicating the progress.

Before running the script, ensure that you have the necessary administrative privileges to access the registry hive files and the RegRipper tool. As always, be cautious when running scripts that access or modify system files. It is recommended to work on copies of the registry hives rather than live system files.

## Python: autoripper.py
Save this script to a .py file on your local machine. You can run it from the command line by navigating to the directory containing the script and running the following command:

`python autoripper.py "C:/path/to/hives" "C:/path/to/reports" "C:/path/to/rip.exe"`

Make sure to replace the placeholder paths with the actual paths relevant to your setup. The script expects three command-line arguments: the path to the hives (either a directory or a single file), the path to save reports, and the path to the RegRipper executable.
