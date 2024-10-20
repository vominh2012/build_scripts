@echo off

REM del *.pdb

set COMMON_FLAGS=/Od /FC /W2 /Z7 /EHsc /wd4996 /nologo /MD
set BUILD_FLAGS=%COMMON_FLAGS%  /link

cl /c ./src/*.c  /Iraylib/include /Isrc /Isrc/external/glfw/include /DPLATFORM_DESKTOP %BUILD_FLAGS% Shell32.lib user32.lib gdi32.lib msvcrt.lib winmm.lib
lib /nologo /out:raylib.lib *.obj

REM del *.ilk
del *.obj
