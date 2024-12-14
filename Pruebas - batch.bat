@echo off 
echo ===============================
echo PARTE 3
echo ===============================
:inicio
echo.
set/p variable=¿Cuanto es 2+2?
cls
echo.
if %variable%==4 goto correcto else goto incorrecto
:incorrecto
echo nop xd
echo.
echo vuelve a intentarlo
pause
cls
goto inicio
:correcto
echo asi es xd
echo Pulsa alguna tecla para salir
pause>nul
exit