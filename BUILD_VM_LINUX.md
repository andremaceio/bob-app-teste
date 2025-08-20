# 🖥️ Geração do APK com Buildozer em Máquina Virtual Linux

## 🚀 Visão Geral

Este guia explica como configurar uma Máquina Virtual Linux para gerar o APK do bob app usando Buildozer.

## 📋 Requisitos da VM

### Especificações Mínimas
- **RAM**: 4GB (recomendado: 8GB)
- **CPU**: 2 cores (recomendado: 4 cores)
- **Disco**: 20GB (recomendado: 50GB)
- **Sistema**: Ubuntu 20.04 LTS ou 22.04 LTS

## 🛠️ Passo a Passo

### 1. Criar a Máquina Virtual

#### Opção A: VirtualBox (Gratuito)
```bash
# Baixar VirtualBox: https://www.virtualbox.org/
# Baixar Ubuntu: https://ubuntu.com/download/desktop
```

#### Opção B: VMware Workstation
```bash
# Baixar VMware: https://www.vmware.com/products/workstation-pro/
```

#### Opção C: Hyper-V (Windows Pro/Enterprise)
```bash
# Ativar Hyper-V no Windows
# Criar VM via PowerShell
```

### 2. Instalar Ubuntu na VM

1. **Iniciar a VM** com ISO do Ubuntu
2. **Instalar Ubuntu** com as seguintes opções:
   - ✅ Download updates while installing
   - ✅ Install third-party software
   - ✅ Erase disk and install Ubuntu
3. **Configurar usuário** com senha forte
4. **Reiniciar** a VM

### 3. Configurar o Ambiente Ubuntu

```bash
# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependências essenciais
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
    python3-dev

# Instalar dependências do Kivy
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
    gstreamer1.0-plugins-{base,good} \
    libgirepository1.0-dev \
    libcairo2-dev \
    pkg-config \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev

# Instalar Java JDK 11
sudo apt install -y openjdk-11-jdk

# Configurar JAVA_HOME
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### 4. Instalar e Configurar Buildozer

```bash
# Criar ambiente virtual Python
python3 -m venv buildozer_env
source buildozer_env/bin/activate

# Instalar Buildozer
pip install buildozer

# Instalar Cython (versão específica)
pip install cython==0.29.33

# Verificar instalação
buildozer --version
```

### 5. Configurar Android SDK e NDK

```bash
# Criar diretórios
mkdir -p ~/.buildozer/android/platform
cd ~/.buildozer/android/platform

# Baixar Android SDK (via Buildozer)
buildozer init
```

### 6. Transferir o Projeto para a VM

#### Opção A: Git Clone
```bash
# Na VM
cd ~
git clone https://github.com/andremaceio/bob-app-teste.git
cd bob-app-teste
```

#### Opção B: Compartilhamento de Pasta
```bash
# Configurar pasta compartilhada entre Windows e VM
# Copiar arquivos do projeto para a pasta compartilhada
```

#### Opção C: Transferência via SCP/SFTP
```bash
# Do Windows (PowerShell)
scp -r C:\Users\S021558444\Desktop\BobTeste\* usuario@ip-vm:~/bob-app-teste/
```

### 7. Configurar buildozer.spec

```bash
# Editar buildozer.spec
nano buildozer.spec

# Configurações importantes:
title = bob app
package.name = bobapp
package.domain = org.bobapp
version = 1.0
requirements = python3,kivy,pillow
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE
android.api = 31
android.minapi = 21
android.sdk = 31
android.ndk = 23b
android.arch = arm64-v8a
android.allow_backup = True
android.accept_sdk_license = True
```

### 8. Gerar o APK

```bash
# Ativar ambiente virtual
source ~/buildozer_env/bin/activate

# Navegar para o projeto
cd ~/bob-app-teste

# Gerar APK debug
buildozer android debug

# Ou gerar APK release (assinado)
buildozer android release
```

### 9. Transferir o APK para Windows

```bash
# O APK será gerado em:
# ~/bob-app-teste/bin/

# Copiar via pasta compartilhada ou SCP
```

## 🔧 Solução de Problemas

### Erro: "No module named 'kivy'"
```bash
pip install kivy[base] kivy_examples
```

### Erro: "Java not found"
```bash
sudo apt install openjdk-11-jdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
```

### Erro: "SDK not found"
```bash
# Aguardar Buildozer baixar automaticamente
# Ou baixar manualmente do Android Developer
```

### Erro: "NDK not found"
```bash
# Buildozer baixa automaticamente
# Aguardar ou verificar logs
```

## 📱 Resultado Esperado

- **APK gerado** em `~/bob-app-teste/bin/`
- **APK funcional** para Android
- **Tamanho**: ~15-25MB
- **Compatibilidade**: Android 5.0+ (API 21+)

## 🚀 Comandos Rápidos

```bash
# Script de instalação completa
curl -sSL https://raw.githubusercontent.com/kivy/buildozer/master/install.sh | bash

# Verificar status
buildozer android debug --verbose

# Limpar builds anteriores
buildozer android clean
```

## 📅 Próximos Passos

1. **Configurar VM** seguindo este guia
2. **Transferir projeto** para a VM
3. **Executar buildozer** para gerar APK
4. **Testar APK** no dispositivo Android
5. **Otimizar** configurações se necessário

---

*Guia para geração do APK via Máquina Virtual Linux*
