@echo off

set Qt5_DIR=
set Qt5Core_DIR=
set Qt5Widgets_DIR=
set Qt4_DIR=
set Qt4Core_DIR=
set Qt4Widgets_DIR=

if exist usrenv.bat (call usrenv.bat %*)

if "%BOOST_ROOT%"=="" set BOOST_ROOT=d:\workspace\project\local\Boost\include\boost-1_55
if "%IDA_DIR%"=="" set IDA_DIR=d:\tools\IDA6.8
if "%IDA_SDK_DIR%"=="" set IDA_SDK_DIR=d:\tools\IDA6.8\sdk\idasdk68
if "%X64DBG_SDK_DIR%"=="" set X64DBG_SDK_DIR=d:\workspace\research\Debugger\x64dbg\release\pluginsdk

if /i "%1"=="x32" (
    if /i "%2"=="qt5" (
        if "%Qt5_DIR%"=="" set Qt5_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013
        if "%Qt5Core_DIR%"=="" set Qt5Core_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013\lib\cmake
        if "%Qt5Widgets_DIR%"=="" set Qt5Widgets_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013\lib\cmake
    ) else (
        if "%Qt4_DIR%"=="" set Qt4_DIR=c:\Qt\qt-4.8.6-x86-msvc2013\qt-4.8.6-x86-msvc2013
        if "%Qt4Core_DIR%"=="" set Qt4Core_DIR=c:\Qt\qt-4.8.6-x86-msvc2013\qt-4.8.6-x86-msvc2013\lib\cmake
        if "%Qt4Widgets_DIR%"=="" set Qt4Widgets_DIR=c:\Qt\qt-4.8.6-x86-msvc2013\qt-4.8.6-x86-msvc2013\lib\cmake
    )

    del /s /q build32 > nul 2>nul
    mkdir build32
    cd build32

    cmake -G "Visual Studio 12 2013" ../src && cmake-gui ../src

    cd ..
    goto eof
)

if /i "%1"=="x64" (
    if /i "%2"=="qt5" (
        if "%Qt5_DIR%"=="" set Qt5_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013_64
        if "%Qt5Core_DIR%"=="" set Qt5Core_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013_64\lib\cmake
        if "%Qt5Widgets_DIR%"=="" set Qt5Widgets_DIR=d:\Qt\Qt5.6.0\5.6\msvc2013_64\lib\cmake
    ) else (
        if "%Qt4_DIR%"=="" set Qt4_DIR=c:\Qt\qt-4.8.6-x64-msvc2013\qt-4.8.6-x64-msvc2013
        if "%Qt4Core_DIR%"=="" set Qt4Core_DIR=c:\Qt\qt-4.8.6-x64-msvc2013\qt-4.8.6-x64-msvc2013\lib\cmake
        if "%Qt4Widgets_DIR%"=="" set Qt4Widgets_DIR=c:\Qt\qt-4.8.6-x64-msvc2013\qt-4.8.6-x64-msvc2013\lib\cmake
    )

    del /s /q build64 > nul 2>nul
    mkdir build64
    cd build64

    cmake -G "Visual Studio 12 2013 Win64" -D IDA_64_BIT_EA_T=1 ../src && cmake-gui ../src

    cd ..
    goto eof
)

:usage
echo "Usage: configure.bat x32|x64 [qt4|qt5]"
echo.

:eof
