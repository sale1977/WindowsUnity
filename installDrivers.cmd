@ECHO OFF
@PUSHD %~DP0
@CLS
@Color 0a
@openfiles > NUL 2>&1
if %errorlevel%==0 (
	echo Elevation found! Proceeding...
) else (
	echo You are not running as Administrator...
	echo This batch cannot do it's job without elevation!
	echo.
	echo Right-click and select ^'Run as Administrator^' and try again...
	echo.
	echo Press any key to exit...
	pause > NUL
	exit
)
TITLE Installation Treiber - by SALE.
echo.
echo ** Installationsroutine Treiber **
SETLOCAL enabledelayedexpansion

echo -------------------------------
set "model="&for /F "skip=1 tokens=2 delims==:" %%m in ('wmic computersystem get model /VALUE') do if not defined model set "model=%%m"
SET Test=!model:~0,-1!
echo Gefundenes Model = "%Test%"
echo -------------------------------
SET exp_Path="%~dp0%Test%" 
echo|set /p "=%exp_Path%">temp.txt
endlocal
set /p MyTemp=<%~dp0temp.txt
del %~dp0temp.txt /Q >nul
pushd %MyTemp% >nul 2>nul

IF EXIST "%MyTemp%\" GOTO IMPORT

:BAD
echo.
echo Treiber-Ordner "%MyTemp%\" existiert nicht.
rundll32.exe cmdext.dll,MessageBeepStub
TIMEOUT 3
GOTO END

:IMPORT
pushd %MyTemp%
zpaq extract repo.zpaq
pnputil /add-driver *.inf /install /subdirs 
popd && popd
GOTO END


:END
echo Ende vom Script.
:: exit /B
