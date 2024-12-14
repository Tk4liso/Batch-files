@echo off
:: Script para eliminar archivos generados por el gusano.
:: Asegúrate de que no se esté ejecutando el gusano antes de ejecutar este script.

:: Directorios donde se encuentran las réplicas
set "paths=%USERPROFILE%\Desktop %USERPROFILE%\Documents %USERPROFILE%\Downloads"

:: Mensaje de advertencia
echo "Este script eliminara todas las replicas generadas."
set /p confirm="¿Esta seguro de que desea continuar? (s/n): "

if /i not "%confirm%"=="s" (
    echo "Operación cancelada."
    exit /b
)

:: Eliminar las réplicas
for %%j in (%paths%) do (
    del /q "%%~j\replica*.bat"
    echo Archivos eliminados en "%%~j"
)

echo "Todos los archivos generados han sido eliminados."
pause
exit
