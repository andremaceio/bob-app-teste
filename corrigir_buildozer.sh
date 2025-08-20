#!/bin/bash

echo "=========================================="
echo "CORREÇÃO DO AMBIENTE BUILDozer"
echo "=========================================="
echo ""

echo "1. LIMPANDO CACHE ANTERIOR:"
echo "---------------------------"
rm -rf ~/.buildozer
rm -rf .buildozer
echo "Cache limpo!"
echo ""

echo "2. ATUALIZANDO SISTEMA:"
echo "----------------------"
sudo apt update && sudo apt upgrade -y
echo ""

echo "3. INSTALANDO/REINSTALANDO DEPENDÊNCIAS:"
echo "----------------------------------------"
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    git \
    wget \
    curl \
    unzip \
    build-essential \
    libssl-dev \
    libffi-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libgif-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    openjdk-11-jdk \
    gradle
echo ""

echo "4. CONFIGURANDO JAVA:"
echo "---------------------"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "JAVA_HOME configurado: $JAVA_HOME"
echo ""

echo "5. INSTALANDO PYTHONFORANDROID:"
echo "------------------------------"
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade virtualenv
pip3 install pythonforandroid
echo ""

echo "6. INSTALANDO BUILDozer:"
echo "-----------------------"
pip3 install --upgrade buildozer
pip3 install --upgrade cython==0.29.33
echo ""

echo "7. VERIFICANDO INSTALAÇÕES:"
echo "--------------------------"
echo "Buildozer: $(buildozer --version)"
echo "Pythonforandroid: $(python3 -c 'import pythonforandroid; print("OK")' 2>/dev/null || echo "ERRO")"
echo "Java: $(java -version 2>&1 | head -1)"
echo ""

echo "8. CRIANDO AMBIENTE VIRTUAL (OPCIONAL):"
echo "---------------------------------------"
python3 -m venv buildozer_env
source buildozer_env/bin/activate
pip install buildozer cython==0.29.33 pythonforandroid
echo "Ambiente virtual criado e ativado!"
echo ""

echo "9. TESTANDO BUILDozer:"
echo "---------------------"
buildozer --version
echo ""

echo "=========================================="
echo "CORREÇÃO CONCLUÍDA!"
echo "=========================================="
echo ""
echo "Agora tente executar: buildozer android debug"
echo "Se ainda houver problemas, execute o diagnóstico: ./diagnostico_buildozer.sh"
