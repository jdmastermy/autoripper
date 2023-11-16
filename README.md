# autoripper
Based on Regripper and Autorip script
This script will look for the specified registry files within a given directory and parse them using RegRipper, saving the output to a designated reports directory.

To use this script:

    1) Replace C:\path\to\regripper\ with the actual path to your RegRipper rip.exe file and the plugins directory.
    2) Run the batch file; it will ask for the input path of the registry hives and the output path for reports.
    3) The script will create the reports directory if it doesn't exist and then process each specified registry hive, creating a report for each.
    4) It outputs messages to the console indicating the progress.

Before running the script, ensure that you have the necessary administrative privileges to access the registry hive files and the RegRipper tool. As always, be cautious when running scripts that access or modify system files. It is recommended to work on copies of the registry hives rather than live system files.
