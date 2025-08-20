# 🐧 Instalação do Ubuntu 22.04 LTS no WSL

## 🚨 **IMPORTANTE: Execute como Administrador**

Este processo requer privilégios de administrador. Siga os passos abaixo:

## 📋 **Passo a Passo:**

### 1. **Abrir PowerShell como Administrador**
- Pressione `Windows + X`
- Selecione **"Windows PowerShell (Admin)"** ou **"Terminal (Admin)"**
- Clique em **"Sim"** na janela de confirmação

### 2. **Habilitar Recursos do Windows**
```powershell
# Habilitar WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All

# Habilitar Plataforma da Máquina Virtual
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All
```

### 3. **Reiniciar o Computador**
- **Reinicie o computador** para aplicar as mudanças
- Isso é **obrigatório** após habilitar os recursos

### 4. **Após Reiniciar - Instalar Ubuntu 22.04 LTS**
```powershell
# Abrir PowerShell como Administrador novamente
# Instalar Ubuntu 22.04 LTS
wsl --install Ubuntu-22.04
```

### 5. **Configurar Usuário Ubuntu**
- **Nome de usuário**: `buildozer` (ou sua preferência)
- **Senha**: `bobapp123` (ou sua preferência)
- **Confirmar senha**: Digite a mesma senha

## 🔧 **Alternativa: Usar Comandos DISM**

Se o PowerShell não funcionar, use estes comandos no **Prompt de Comando como Administrador**:

```cmd
# Habilitar WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Habilitar Plataforma da Máquina Virtual
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## 📱 **Verificar Instalação**

Após a instalação, verifique se está funcionando:

```powershell
# Listar distribuições instaladas
wsl --list --verbose

# Entrar no Ubuntu
wsl -d Ubuntu-22.04

# Verificar versão
cat /etc/os-release
```

## 🚀 **Após Instalação do Ubuntu**

### **Atualizar Sistema:**
```bash
sudo apt update && sudo apt upgrade -y
```

### **Instalar Dependências:**
```bash
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
    openjdk-11-jdk
```

### **Instalar Buildozer:**
```bash
python3 -m venv buildozer_env
source buildozer_env/bin/activate
pip install buildozer cython==0.29.33
```

## 🚨 **Solução de Problemas**

### **Erro: "WSL2 não é compatível"**
- Verifique se a virtualização está habilitada na BIOS
- Verifique se o Hyper-V está habilitado

### **Erro: "Permissões elevadas obrigatórias"**
- Execute o PowerShell como **Administrador**
- Use **"Executar como administrador"**

### **Erro: "Recurso não encontrado"**
- Verifique se o Windows está atualizado
- Execute `sfc /scannow` para verificar integridade do sistema

## 📋 **Checklist de Instalação**

- [ ] PowerShell aberto como Administrador
- [ ] WSL habilitado
- [ ] Plataforma da Máquina Virtual habilitada
- [ ] Computador reiniciado
- [ ] Ubuntu 22.04 LTS instalado
- [ ] Usuário configurado
- [ ] Sistema atualizado
- [ ] Buildozer instalado

## 🔗 **Links Úteis**

- **Documentação WSL**: https://docs.microsoft.com/en-us/windows/wsl/
- **Ubuntu 22.04 LTS**: https://ubuntu.com/download/desktop
- **Buildozer**: https://buildozer.readthedocs.io/

---

*Guia para instalação do Ubuntu 22.04 LTS no WSL*
