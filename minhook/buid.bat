@echo off

IF NOT DEFINED IS_SETUP_VS_ENV (
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
set IS_SETUP_VS_ENV=1
)

set SRC_DIR=%~dp0
set BUILD_DIR=%SRC_DIR%\build
IF NOT EXIST %BUILD_DIR% mkdir %BUILD_DIR%

pushd %BUILD_DIR%
cl /c -O2 -MD -EHsc %SRC_DIR%\single.c
lib single.obj 
copy single.lib libMinHook.x86.lib
popd