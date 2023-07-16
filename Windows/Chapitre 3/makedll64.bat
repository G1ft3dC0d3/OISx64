@echo off

REM Définir les variables pour les chemins
set ml64_path="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe"
set user32_lib_path="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64\user32.lib"

REM Définir les dossiers pour les sources, binaires et fichiers temporaires
set srcs=srcs
set binaries=binaries

REM Demander le nom du programme
set /p prog=[+] program name (without extension): 

REM Compiler et lier le programme
%ml64_path% %srcs%\%prog%.asm /link /subsystem:console /defaultlib:%user32_lib_path% /entry:LibMain /out:%binaries%\%prog%.dll /RELEASE /DLL /DEF:%srcs%\%prog%.def

REM Supprimer les fichiers intermédiaires
del *.obj
del *.lnk

pause