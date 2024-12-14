@echo off
:: Escaneo de la red local para encontrar dispositivos activos
for /L %%i in (1,1,254) do (
    ping 172.26.167.%%i -n 1 -w 100 >nul
    if not errorlevel 1 echo 172.26.167.%%i esta activo.
)
