::@echo off
set output=%userprofile%\AppData\LocalLow\id Software\quakelive\home\baseq3
if not exist "%output%" set output=%appdata%\id software\quakelive\home\baseq3
if not exist "%output%" goto end

set config_string="seta cg_hudFiles ui/ql_yahud.cfg"
if not exist "%output%\ui\" md "%output%\ui\"
if not exist "%output%\autoexec.cfg" echo.>"%output%\autoexec.cfg"

find /I /C %config_string% "%output%\autoexec.cfg"

if %ERRORLEVEL% EQU 0 (
    @echo Success
) else (
    echo seta cg_hudFiles ui/ql_yahud.cfg >> "%output%\autoexec.cfg"
)

XCOPY ".\ql_yahud.menu" "%output%\ui" /E /S /I
XCOPY ".\ql_yahud.cfg" "%output%\ui" /E /S /I
:end