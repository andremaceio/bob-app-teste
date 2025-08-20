#!/bin/bash

# 🚀 Script de Instalação Automática do Buildozer para VM Linux
# bob app - Geração de APK

echo "🚀 Iniciando instalação do Buildozer para bob app..."
echo "=================================================="

# Verificar se é root
if [ "$EUID" -eq 0 ]; then
    echo "❌ Não execute este script como root!"
    echo "Use: bash instalar_buildozer_vm.sh"
    exit 1
fi

# Atualizar sistema
echo "📦 Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências essenciais
echo "🔧 Instalando dependências essenciais..."
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    wget \
    curl \
    unzip \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    pkg-config

# Instalar dependências do Kivy
echo "🎨 Instalando dependências do Kivy..."
sudo apt install -y \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    libgstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    libgirepository1.0-dev \
    libcairo2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev

# Instalar Java JDK 11
echo "☕ Instalando Java JDK 11..."
sudo apt install -y openjdk-11-jdk

# Configurar JAVA_HOME
echo "🔧 Configurando JAVA_HOME..."
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Verificar Java
echo "✅ Verificando Java..."
java -version

# Criar ambiente virtual Python
echo "🐍 Criando ambiente virtual Python..."
python3 -m venv ~/buildozer_env
source ~/buildozer_env/bin/activate

# Instalar Buildozer
echo "📱 Instalando Buildozer..."
pip install --upgrade pip
pip install buildozer

# Instalar Cython (versão específica)
echo "🔧 Instalando Cython..."
pip install cython==0.29.33

# Verificar Buildozer
echo "✅ Verificando Buildozer..."
buildozer --version

# Criar diretórios do Buildozer
echo "📁 Criando diretórios do Buildozer..."
mkdir -p ~/.buildozer/android/platform

# Clonar o projeto
echo "📥 Clonando projeto bob app..."
cd ~
if [ -d "bob-app-teste" ]; then
    echo "📁 Projeto já existe, atualizando..."
    cd bob-app-teste
    git pull origin main
else
    echo "📥 Clonando novo projeto..."
    git clone https://github.com/andremaceio/bob-app-teste.git
    cd bob-app-teste
fi

# Configurar buildozer.spec
echo "⚙️ Configurando buildozer.spec..."
if [ -f "buildozer.spec" ]; then
    echo "📄 buildozer.spec já existe"
else
    echo "📄 Criando buildozer.spec..."
    buildozer init
fi

# Atualizar configurações do buildozer.spec
echo "🔧 Atualizando configurações..."
sed -i 's/title = myapp/title = bob app/' buildozer.spec
sed -i 's/package.name = myapp/package.name = bobapp/' buildozer.spec
sed -i 's/package.domain = org.test/package.domain = org.bobapp/' buildozer.spec
sed -i 's/version = 0.1/version = 1.0/' buildozer.spec
sed -i 's/requirements = python3,kivy/requirements = python3,kivy,pillow/' buildozer.spec
sed -i 's/#android.permissions =/android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE/' buildozer.spec
sed -i 's/#android.api =/android.api = 31/' buildozer.spec
sed -i 's/#android.minapi =/android.minapi = 21/' buildozer.spec
sed -i 's/#android.sdk =/android.sdk = 31/' buildozer.spec
sed -i 's/#android.ndk =/android.ndk = 23b/' buildozer.spec
sed -i 's/#android.arch =/android.arch = arm64-v8a/' buildozer.spec
sed -i 's/#android.allow_backup =/android.allow_backup = True/' buildozer.spec
sed -i 's/#android.accept_sdk_license =/android.accept_sdk_license = True/' buildozer.spec

# Criar script de build
echo "📝 Criando script de build..."
cat > ~/buildozer_env/build_apk.sh << 'EOF'
#!/bin/bash
echo "🚀 Iniciando build do APK..."
source ~/buildozer_env/bin/activate
cd ~/bob-app-teste

echo "📱 Gerando APK debug..."
buildozer android debug

if [ $? -eq 0 ]; then
    echo "✅ APK gerado com sucesso!"
    echo "📁 Localização: ~/bob-app-teste/bin/"
    ls -la ~/bob-app-teste/bin/
else
    echo "❌ Erro na geração do APK"
    echo "📋 Verifique os logs em: ~/.buildozer/logs/"
fi
EOF

chmod +x ~/buildozer_env/build_apk.sh

# Criar alias para facilitar o uso
echo "🔧 Criando aliases..."
echo 'alias buildozer="source ~/buildozer_env/bin/activate && buildozer"' >> ~/.bashrc
echo 'alias build-apk="~/buildozer_env/build_apk.sh"' >> ~/.bashrc
echo 'alias activate-buildozer="source ~/buildozer_env/bin/activate"' >> ~/.bashrc

# Recarregar bashrc
source ~/.bashrc

echo ""
echo "🎉 Instalação concluída com sucesso!"
echo "====================================="
echo ""
echo "📋 Comandos disponíveis:"
echo "  buildozer          - Executar buildozer (ambiente ativado)"
echo "  build-apk          - Gerar APK automaticamente"
echo "  activate-buildozer - Ativar ambiente virtual"
echo ""
echo "📁 Diretório do projeto: ~/bob-app-teste/"
echo "📁 Ambiente virtual: ~/buildozer_env/"
echo "📁 Configuração: ~/.buildozer/"
echo ""
echo "🚀 Para gerar o APK, execute:"
echo "  build-apk"
echo ""
echo "📱 O APK será gerado em: ~/bob-app-teste/bin/"
echo ""
echo "⚠️  IMPORTANTE: Na primeira execução, o Buildozer baixará"
echo "   o Android SDK e NDK (pode demorar alguns minutos)"
echo ""
echo "🔗 Repositório: https://github.com/andremaceio/bob-app-teste.git"
echo ""
echo "✅ Instalação finalizada! Reinicie o terminal ou execute: source ~/.bashrc"
