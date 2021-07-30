@echo off
pushd %~dp0
:start
echo Select yor Language
echo 1.EN
echo 2.ES
set /p language=Enter the number 
if %language%==1 (goto EN:) else (goto nextif:)
:nextif
if %language%==2 (goto ES:) else (goto start:)
:EN
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
echo 2-- right click in your uknow device and click in details
echo -------------------------------------
echo 3-- now click in the property tab
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
REM remplace the number in the installer
PowerShell.exe -Command "(gc xusb21.inf) -replace '0719', '%number%' | Out-file xusb21.inf"
cls
FIND "%number%" xusb21.inf 
echo --------------------------------------------------------
echo if you see 5 lines with %number% all is ok
pause
REM active secure mode (windows test mode)
bcdedit /set testsigning on
REM create a secundary bat with the necesary desactivation for secure mode and the install process 
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
goto exit:
:ES
echo ---------------------------------------------------
echo # @author  nekosempai github.com/N3koSempai
echo ---------------------------------------------------
echo Este script necesita los siguientes archivos.
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
echo comprobando que existan los archivos..........
REM check for a necesary file
if exist "xusb21.inf" (goto 2es:) else (goto forcexit:)
REM error in necesary file need exit
:forcexit
echo "error en xusb21.inf, Este arcivo es necesario"
pause
exit

:2es
if exist "xusb21.cat" (goto 3es:) else (echo "no se encuentra xusb21.cat")
:3es
if exist "test.cab" (goto 4es:) else (echo "no se encuentra test.cab")
:4es
if exist "x64" (goto 5es:) else (echo "no se encuentra x64")
:5es
if exist "x64/xusb21.sys" (goto 6es:) else (echo "no existe xusb21.sys  en x64 ")
:6es
if exist "x64/WdfCoInstaller01007.dll" (goto 7es:) else (echo "no existe WdfCoInstaller01007.dll en x64 ")
:7es
if exist "x64/xusb21.cat"  (goto 8es:) else (echo "no existe xusb21.cat  en x64 ")
:8es
if exist "x86" (goto 9es:) else (echo "no se encuentra x86")
:9es
if exist "x86/WdfCoInstaller01007.dll" (goto 10es:) else (echo "no existe WdfCoInstaller01007.dll en x86 ")
:10es
if exist "x86/xusb21.sys" (goto nextEs:) else ("no existe xusb21.sys en x86 ")

:nextEs
echo El archivo necesario esta correcto si viste algun error en otros archivos secundarios
echo el sistema continuara pero pueden ocurrir problemas durante la instalacion
pause
cls
echo -------------------------------------
echo ahora necesitas obtener el id de tu dispositivo
echo no te preocupes te guiare presiona enter y se abrira el administrador de dispositivos
echo sigue estos pasos
echo -------------------------------------
echo 1-- En otros dispositivos busca dispositivo desconocido.(si hay varios solo desconecta y reconecta y veras cual sale y vuelve)
echo -------------------------------------
echo 2-- Click derecho en el dispositivo desconocido y click en detalles
echo -------------------------------------
echo 3-- ahora click en la tabla desplegable propiedades
echo -------------------------------------
echo 4-- busca id de hadware en la barra desplegable
echo -------------------------------------
echo 5-- copia el numero despues de PID_. ejemplo: "USB\VID_045E&PID_0291" necesitas 0291 en este caso
echo -------------------------------------
echo 6-- cierra esa ventana y el administrador para volver a este script y continuar
pause
call devmgmt.msc
cls
SETLOCAL
set /p number=Escribe el numero 
REM remplace the number in the installer
PowerShell.exe -Command "(gc xusb21.inf) -replace '0719', '%number%' | Out-file xusb21.inf"
cls
FIND "%number%" xusb21.inf 
echo --------------------------------------------------------
echo Si ves 5 Lineas con este numero: %number% esta todo Bien
pause
REM active secure mode (windows test mode)
bcdedit /set testsigning on
REM create the secondary script
echo @echo off > "step2(need admin right).bat"
echo bcdedit /set testsigning off >> "step2(need admin right).bat"
echo cls >> "step2(need admin right).bat"
echo echo Puede que veas una advertencia, No te preocupes es porque has modificado el intalador >> "step2(need admin right).bat"
echo echo Preciona si para continuar  >> "step2(need admin right).bat"
echo pause  >> "step2(need admin right).bat"
echo %SystemRoot%\System32\InfDefaultInstall.exe "%cd%\xusb21.inf"  >> "step2(need admin right).bat"
echo bcdedit /set testsigning off  >> "step2(need admin right).bat"
echo cls  >> "step2(need admin right).bat"
echo echo ahora necesitas reiniciar para aplicar los cambios y listo. Solo presiona enter.  >> "step2(need admin right).bat"
echo pause  >> "step2(need admin right).bat"
echo shutdown.exe /r /t 00  >> "step2(need admin right).bat"
REM return to the principal script
echo ahora se reiniciara tu pc para entrar en modo seguro y poder instalar el driver.  
echo Cuando la pc se reinicie ejecuta step2.bat para continuar (se genero en la carpeta).
echo presiona enter para reiniciar.
pause
goto exit:
:exit
shutdown.exe /r /t 00
