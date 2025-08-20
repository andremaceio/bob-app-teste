@echo off
echo ========================================
echo    GERADOR DE APK - bob app
echo ========================================
echo.

echo Instalando Buildozer...
pip install buildozer

echo.
echo Configurando ambiente Android...
buildozer init

echo.
echo Gerando APK...
buildozer android debug

echo.
echo ========================================
echo    APK GERADO COM SUCESSO!
echo ========================================
echo.
echo O arquivo APK estara em:
echo bin/bobapp-1.0-debug.apk
echo.
echo Copie este arquivo para seu celular
echo e instale normalmente!
echo.
pause
