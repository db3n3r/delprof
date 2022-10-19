echo off
cd \windows\system32
cls
::usuario aa
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\S-1-5-21-1584636376-2845744721-3618007180-1000" /v ProfileImagePath >%tmp%\f.txt
find /i "c:\users\aa" %tmp%\f.txt
if %errorlevel% == 0 ( reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\S-1-5-21-1584636376-2845744721-3618007180-1000" /f )


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" | find /i "profilelist" >%tmp%\1.txt

echo DELETA MAS ANTES VERIFICAR
for /f "skip=5 tokens=1,6* delims=^" %%i in (%tmp%\1.txt) do (
echo SE %%~ni BATE COM SDRDS
echo SE %%~ni BATE COM 80
echo SE %%~ni BATE COM 81
echo SE %%~ni BATE COM 82
echo SE %%~ni BATE COM 83
echo SE %%~ni BATE COM 84
echo SE %%~ni BATE COM 85
echo SE %%~ni BATE COM ALM
echo SE %%~ni BATE COM dbener
set var=%%i

Call :exib

)


dir c:\users\ /b | find /i "8">%tmp%\4.txt
findstr /i /v "Public" %tmp%\4.txt >%tmp%\5.txt
findstr /i /v "Defaultuser0" %tmp%\5.txt >%tmp%\6.txt
findstr /i /v "sdrds" %tmp%\6.txt >%tmp%\7.txt

for /f %%i in (%tmp%\7.txt) do (
rmdir c:\users\%%i /s /q | echo removendo %%i ...

)

dir c:\users\ /b | find /i "8">%tmp%\8.txt
findstr /i /v "Public" %tmp%\8.txt >%tmp%\9.txt
findstr /i /v "Defaultuser0" %tmp%\9.txt >%tmp%\10.txt
findstr /i /v "sdrds" %tmp%\10.txt >%tmp%\11.txt

for /f %%i in (%tmp%\11.txt) do (
rmdir c:\users\%%i /s /q | echo removendo %%i ...

)




exit
:exib
cd \windows\system32

reg query "%var%" /v ProfileImagePath >%tmp%\g.txt
find /i "c:\users\8" %tmp%\g.txt
if %errorlevel% == 0 ( reg delete "%var%" /f )
exit /b

