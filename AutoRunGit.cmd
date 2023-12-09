@echo off
echo.
echo [1] clear repo cache 
echo [2] Git Push
echo [3] Git Pull
echo [4] jupyter
echo.
CHOICE /C 1234 /M "Choice:"

REM choice /t 03 /c ynr /cs /d r /m "Do you want to clear github repo (Y/N)?"


IF ERRORLEVEL 4 GOTO jupyter
IF ERRORLEVEL 3 GOTO GitPull
IF ERRORLEVEL 2 GOTO waittofinish
IF ERRORLEVEL 1 GOTO ClearRepo 


jupyter:
if not exist ./env (virtualenv env && .\env\Scripts\activate && jupyter notebook) else (.\env\Scripts\activate && jupyter notebook)
pause

:GitPull
git pull
goto waittofinish

:ClearRepo 
git rm -rf --cached .
goto waittofinish

:waittofinish
git status
timeout /T 2 /nobreak >nul
git add .
timeout /T 2 /nobreak >nul
git commit -m .
timeout /T 2 /nobreak >nul
git push
timeout /T 2 /nobreak >nul


goto End

REM CHOICE COMMAND GUIDE -- https://stackoverflow.com/questions/9307512/create-a-batch-file-with-multiple-options
:BEGIN
CLS
ECHO.
Echo MAKE YOUR LIFE EASIER-SHORTCUT
ECHO.
ECHO 1. Github
ECHO 2. heroku 
ECHO 3. EMPTY

ECHO.

CHOICE /C 123 /M "ENTER THE CHOICE:"  

:: Note - list ERRORLEVELS in decreasing order

IF ERRORLEVEL 3 GOTO EMPTY
IF ERRORLEVEL 2 GOTO Heroku
IF ERRORLEVEL 1 GOTO Github

:Github
ECHO  Github
explorer https://github.com/keithmao/wazeVIP


:Heroku
ECHO  Heroku
explorer https://dashboard.heroku.com/apps


:End

timeout /t 5
