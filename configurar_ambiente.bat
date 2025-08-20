@echo off
echo Configurando ambiente para bob app...
echo.

REM Configurar Java
set JAVA_HOME=C:\Program Files\Java\jdk-21
set PATH=%JAVA_HOME%\bin;%PATH%
echo Java configurado: %JAVA_HOME%

REM Configurar Gradle
set GRADLE_HOME=C:\gradle\gradle-8.5
set PATH=%GRADLE_HOME%\bin;%PATH%
echo Gradle configurado: %GRADLE_HOME%

REM Verificar versões
echo.
echo Verificando versoes instaladas:
echo.
java -version
echo.
C:\gradle\gradle-8.5\bin\gradle -version
echo.
python --version
echo.
buildozer --version
echo.

echo Ambiente configurado com sucesso!
echo Para executar o aplicativo, use: python main.py
echo.
pause
