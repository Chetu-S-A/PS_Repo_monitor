mkdir D:\CODE_RUN
mkdir D:\CODE_BASE
cd /d D:\CODE_BASE
 
::GitPull
echo Using GitPull to get your code
echo .
git init
git pull https://github.com/kavyasribasavaraj/WebApplication1.git 
::replace with new link
 
if errorlevel 1 goto gitFailed
echo Code successfully pulled from Git
echo .
goto gitSuccess
 
:gitFailed
echo.
echo Error^: Code not properly Pushed.
echo Try Again Later
 
:gitSuccess
echo .
 
cd /d D:\CODE_BASE
pause
MSBuild.exe WebApplication1.sln  /t:Build /p:Configuration=Release /p:OutDir=D:\CODE_RUN 
:: OutDIR is the same as the IIS Appln path
 
pause

start chrome.exe http://localhost:85