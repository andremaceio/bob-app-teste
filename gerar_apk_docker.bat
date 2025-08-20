@echo off
echo 🚀 Gerando APK com Buildozer via Docker
echo ========================================

REM Verificar se Docker está instalado
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker não está instalado
    echo 📥 Baixe em: https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

echo ✅ Docker encontrado

REM Verificar se Docker está rodando
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker não está rodando
    echo 🚀 Inicie o Docker Desktop
    pause
    exit /b 1
)

echo ✅ Docker está rodando

REM Criar diretório para o build
if not exist "build_docker" mkdir build_docker

REM Copiar arquivos do projeto para o diretório de build
echo 📁 Copiando arquivos do projeto...
copy "main.py" "build_docker\"
copy "ui.kv" "build_docker\"
copy "links.py" "build_docker\"
copy "requirements.txt" "build_docker\"

REM Criar Dockerfile
echo 📄 Criando Dockerfile...
(
echo FROM ubuntu:22.04
echo.
echo ENV DEBIAN_FRONTEND=noninteractive
echo.
echo RUN apt-get update ^&^& apt-get install -y \
echo     python3 \
echo     python3-pip \
echo     python3-venv \
echo     git \
echo     wget \
echo     curl \
echo     unzip \
echo     build-essential \
echo     libssl-dev \
echo     libffi-dev \
echo     python3-dev \
echo     openjdk-11-jdk \
echo     libsdl2-dev \
echo     libsdl2-image-dev \
echo     libsdl2-mixer-dev \
echo     libsdl2-ttf-dev \
echo     libportmidi-dev \
echo     libswscale-dev \
echo     libavformat-dev \
echo     libavcodec-dev \
echo     zlib1g-dev \
echo     libgstreamer1.0 \
echo     gstreamer1.0-plugins-base \
echo     gstreamer1.0-plugins-good \
echo     libgirepository1.0-dev \
echo     libcairo2-dev \
echo     pkg-config \
echo     libgstreamer1.0-dev \
echo     libgstreamer-plugins-base1.0-dev
echo.
echo ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
echo ENV PATH=$JAVA_HOME/bin:$PATH
echo.
echo WORKDIR /app
echo.
echo RUN python3 -m venv buildozer_env
echo RUN . buildozer_env/bin/activate ^&^& pip install buildozer cython==0.29.33
echo.
echo COPY . .
echo.
echo CMD ["/bin/bash", "-c", "source buildozer_env/bin/activate && buildozer android debug"]
) > "build_docker\Dockerfile"

REM Construir imagem Docker
echo 🐳 Construindo imagem Docker...
cd build_docker
docker build -t bob-app-buildozer .

if %errorlevel% neq 0 (
    echo ❌ Erro ao construir imagem Docker
    pause
    exit /b 1
)

echo ✅ Imagem Docker construída

REM Executar container para gerar APK
echo 📱 Executando Buildozer...
docker run --rm -v "%cd%:/app" bob-app-buildozer

if %errorlevel% neq 0 (
    echo ❌ Erro na geração do APK
    pause
    exit /b 1
)

echo ✅ APK gerado com sucesso!
echo 📁 Verifique a pasta 'build_docker/bin/' para o APK

REM Voltar ao diretório original
cd ..

pause
