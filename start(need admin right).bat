@echo off
pushd %~dp0
echo ---------------------------------------------------
echo # @author  nekosempai github.com/N3koSempai
echo ---------------------------------------------------
echo This script need this file in the current directory
echo ---------------------------------------------------
echo ##################################
echo # folder x86			 #
echo # folder x64			 #
echo # test.cab		         #
echo # xusb21.cat			 #
echo # xusb21.inf			 #
echo ##################################
pause
echo --------------------------------------------------/
echo --------------------------------------------------/
echo checking the existence of the files..........
REM check for a necesary file
if exist "xusb21.inf" (goto 2:) else (goto forcexit:)
REM error in necesary file need exit
:forcexit
echo "error in xusb21.inf, this is a necesary file"
pause
exit

REM check adicional file
:2
if exist "xusb21.cat" (goto 3:) else (echo "dont have the xusb21.cat")
:3
if exist "test.cab" (goto 4:) else (echo "dont have test.cab")
:4
if exist "x64" (goto 5:) else (echo "dont have the folder x64")
:5
if exist "x64/xusb21.sys" (goto 6:) else (echo "dont have xusb21.sys file in x64 folder")
:6
if exist "x64/WdfCoInstaller01007.dll" (goto 7:) else (echo "dont have WdfCoInstaller01007.dll file in x64 folder")
:7
if exist "x64/xusb21.cat"  (goto 8:) else (echo "dont have xusb21.cat file in x64 folder")
:8
if exist "x86" (goto 9:) else (echo "dont have the folder x86")
:9
if exist "x86/WdfCoInstaller01007.dll" (goto 10:) else (echo "dont have the WdfCoInstaller01007.dll file in x86 folder")
:10
if exist "x86/xusb21.sys" (goto next:) else ("dont have the xusb21.sys file in x86 folder")

:next
echo necesary files are OK if you have a error with any file the program continue but is posible have a problem
pause
cls
echo -------------------------------------
echo now you need to get your hadware id from the device manager
echo dont worry I will open the device manager for you. ONLY PRESS ENTER and follow the steps
echo -------------------------------------
echo 1-- in others devices search your uknown device (if you have many, connect and disconect the xbox receiver and see which disappears)
echo -------------------------------------
echo 2-- right click in your uknow device and click in property
echo -------------------------------------
echo 3-- now click in the details tab
echo -------------------------------------
echo 4-- search for hadware id in the drop down bar
echo -------------------------------------
echo 5--copy the number after "pid_" example: "USB\VID_045E&PID_0291" you need 0291 number in this example
echo -------------------------------------
echo 6--closed all for return to hear and continue with the program
pause
REM search the number in de device manager
call devmgmt.msc
cls
SETLOCAL
set /p number=Enter the number 
PowerShell.exe -Command "(gc xusb21.inf) -replace '0719', '%number%' | Out-file xusb21.inf"
cls
FIND "%number%" xusb21.inf 
echo --------------------------------------------------------
echo if you see 5 lines with %number% all is ok
pause
bcdedit /set testsigning on
echo @echo off > "step2(need admin right).bat"
echo bcdedit /set testsigning off >> "step2(need admin right).bat"
echo cls >> "step2(need admin right).bat"
echo echo you may see a warning, do not worry it is because we have modified the installer >> "step2(need admin right).bat"
echo echo press yes to proceed  >> "step2(need admin right).bat"
echo pause  >> "step2(need admin right).bat"
echo %SystemRoot%\System32\InfDefaultInstall.exe "%cd%\xusb21.inf"  >> "step2(need admin right).bat"
echo bcdedit /set testsigning off  >> "step2(need admin right).bat"
echo cls  >> "step2(need admin right).bat"
echo echo now need restart to aply all change and play. only press enter.  >> "step2(need admin right).bat"
echo pause  >> "step2(need admin right).bat"
echo shutdown.exe /r /t 00  >> "step2(need admin right).bat"
echo now need restart your pc for entry in secure mode.  
echo when pc restart use the step2.bat for next step.
echo press enter for restart
pause
shutdown.exe /r /t 00
