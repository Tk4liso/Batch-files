@echo off
echo [%date% %time%] Inicio del script >> script.log
echo Conectando al equipo remoto...

:: Intentar ping antes de establecer conexión
ping -n 1 DESKTOP-NM1VGO0 >nul
if %errorlevel% neq 0 (
    echo No se pudo conectar al equipo remoto. >> script.log
    echo Error: Equipo remoto no responde.
    exit /b
)

:: Conexión remota
mstsc /v:DESKTOP-NM1VGO0 /w:1280 /h:720
timeout /t 10

:: Verificar si la conexión se estableció
tasklist /fi "imagename eq mstsc.exe" >nul
if %errorlevel% neq 0 (
    echo No se detectó conexión remota. >> script.log
    echo Error: Conexión remota fallida.
    exit /b
)

:: Copiar archivo si existe
if not exist "C:\Users\Tacos\Downloads\felicitación de cumpleaños.txt" (
    echo Archivo no encontrado. >> script.log
    echo Error: Archivo no existe.
    exit /b
)

echo Copiando archivo...
copy "C:\Users\Tacos\Downloads\felicitación de cumpleaños.txt" "C:\Users\Tacos\OneDrive\Escritorio" >nul
if %errorlevel% neq 0 (
    echo Error al copiar el archivo. >> script.log
    exit /b
)
echo Archivo copiado correctamente. >> script.log

:: Cerrar conexión remota
taskkill /im mstsc.exe /f >nul
echo Conexión cerrada. >> script.log
exit
