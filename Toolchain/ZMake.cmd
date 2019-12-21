@ECHO OFF
chcp 65001>nul
set UDIR=C:\Program Files (x86)\UTAU\
if exist %~dp0config.ini for /f "eol=; tokens=1,2* delims==" %%i in (%~dp0config.ini) do IF %%i==UDIR SET UDIR=%%j
if %1.==clean. goto clean
if %1.==install. goto install
@FOR /F "tokens=1 delims=. " %%i IN ('dir *.wav /b') DO @set /p =%%i <nul >>0Rrec.txt
ECHO 1/5 生成Roto
genroto 0Rrec.txt >>0log.log 2>&1
ECHO. >>0log.log 2>&1
ECHO 2/5 音量归一化
wavnorm Roto.json -g 2 -V >>0log.log 2>&1
ECHO. >>0log.log 2>&1
ECHO 3/5 生成RUCE数据文件
genrudb Roto.json -V >>0log.log 2>&1
ECHO. >>0log.log 2>&1
ECHO 4/5 生成UTAU数据文件
@for %%i in ("*.wav") do "%UDIR%\resampler.exe" "%%i" nul 100 100 GN 0 50 >>0log.log 2>&1
@for %%i in ("*.aiff") do "%UDIR%\resampler.exe" "%%i" nul 100 100 GN 0 50 >>0log.log 2>&1
ECHO. >>0log.log 2>&1
ECHO 5/5 生成OTO
roto2oto Roto.json >>0log.log 2>&1
ECHO. >>0log.log 2>&1
goto end
:clean
ECHO 清除文件中。。。
del *.frq
del *.rudb
del Roto.json
del 0log.log
goto end
:install
chcp 932>nul
for /f "eol=; tokens=1,2* delims==" %%i in (character.txt) do IF %%i==name SET name=%%j
set dir=%CD%
pushd "%UDIR%\voice\"
mkdir %name%
pushd "%UDIR%\voice\%name%"
copy "%dir%\*.*" "%CD%\"
popd
popd
:end
del 0Rrec.txt
ECHO ON