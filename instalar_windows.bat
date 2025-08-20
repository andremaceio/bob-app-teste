@echo off
echo ========================================
echo    INSTALADOR AUTOMATICO - bob app
echo ========================================
echo.

echo Verificando se Python esta instalado...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python nao encontrado!
    echo.
    echo Por favor, instale o Python primeiro:
    echo 1. Acesse: https://www.python.org/downloads/
    echo 2. Baixe a versao mais recente
    echo 3. Execute o instalador
    echo 4. MARQUE "Add Python to PATH"
    echo 5. Reinicie este script
    echo.
    pause
    exit /b 1
)

echo Python encontrado! Versao:
python --version
echo.

echo Atualizando pip...
python -m pip install --upgrade pip
echo.

echo Instalando dependencias...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo.
    echo Erro ao instalar dependencias!
    echo Tentando instalacao alternativa...
    pip install --user kivy
)

echo.
echo ========================================
echo    INSTALACAO CONCLUIDA!
echo ========================================
echo.
echo Para executar o app, digite:
echo python main.py
echo.
echo Pressione qualquer tecla para executar agora...
pause >nul

echo Executando bob app...
python main.py

pause
