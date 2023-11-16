@echo off
SETLOCAL ENABLEEXTENSIONS

:: Set the path to your RegRipper rip.exe file and plugins directory
SET RRPath=C:\path\to\regripper\rip.exe
SET RRPlugins=C:\path\to\regripper\plugins

:: Set the directory where the hive files are located and the output path for your reports
SET /P HiveFolderPath=Enter the full path to the folder containing the registry hives: 
SET /P ReportPath=Enter the full path to the folder where you want to save the reports: 

:: Create reports directory if it doesn't exist
IF NOT EXIST "%ReportPath%" (
    MKDIR "%ReportPath%"
)

:: Ensure trailing backslash
IF NOT "%HiveFolderPath:~-1%"=="\" SET HiveFolderPath=%HiveFolderPath%\
IF NOT "%ReportPath:~-1%"=="\" SET ReportPath=%ReportPath%\

:: Process system hives
CALL :PROCESSHIVE "%HiveFolderPath%SYSTEM" "system" "%ReportPath%system.txt"
CALL :PROCESSHIVE "%HiveFolderPath%SOFTWARE" "software" "%ReportPath%software.txt"
CALL :PROCESSHIVE "%HiveFolderPath%SECURITY" "security" "%ReportPath%security.txt"
CALL :PROCESSHIVE "%HiveFolderPath%SAM" "sam" "%ReportPath%sam.txt"

:: Process user hives
FOR /D %%U IN ("%HiveFolderPath%Users\*") DO (
    CALL :PROCESSHIVE "%%U\NTUSER.DAT" "ntuser" "%ReportPath%%%~nU_ntuser.txt"
    CALL :PROCESSHIVE "%%U\AppData\Local\Microsoft\Windows\UsrClass.dat" "usrclass" "%ReportPath%%%~nU_usrclass.txt"
)

echo.
echo Registry parsing is complete.
ENDLOCAL
pause
GOTO :EOF

:PROCESSHIVE
IF EXIST %1 (
    echo Processing %2 hive...
    %RRPath% -r %1 -f %2 > %3
) ELSE (
    echo Warning: %2 hive does not exist at %1.
)
GOTO :EOF
