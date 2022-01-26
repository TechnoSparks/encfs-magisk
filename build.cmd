@echo off
set "file=encfs-magisk.zip"
del %file%
7z a -tzip -mx=9 -mmt=12 -myx=9 %file% * -x!%file% -x!.git* -x!build.cmd
pause