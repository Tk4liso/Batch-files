@echo off
setlocal enabledelayedexpansion

rem Definir el archivo como primer argumento
set FILE=%1

rem Leer el archivo línea por línea
for /f "tokens=*" %%A in (%FILE%) do (
    set host=%%A

    rem Enviar un solo ping con timeout de 1 segundo
    ping -n 1 -w 1000 !host! >nul
    if !errorlevel! equ 0 (
        echo !host! is up.
    )
)
