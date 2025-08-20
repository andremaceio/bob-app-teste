# 🖥️ Configuração Rápida da VM no VirtualBox

## 🚀 Passo a Passo para VirtualBox

### 1. **Baixar Software**
- **VirtualBox**: https://www.virtualbox.org/wiki/Downloads
- **Ubuntu Desktop**: https://ubuntu.com/download/desktop (22.04 LTS)

### 2. **Instalar VirtualBox**
1. Execute o instalador do VirtualBox
2. Siga as instruções padrão
3. Reinicie o computador se solicitado

### 3. **Criar Nova Máquina Virtual**

#### Configurações Básicas:
- **Nome**: `bob-app-buildozer`
- **Tipo**: Linux
- **Versão**: Ubuntu (64-bit)

#### Memória:
- **RAM**: 4096 MB (4GB) - **Mínimo**
- **Recomendado**: 8192 MB (8GB)

#### Disco Rígido:
- **Criar disco rígido virtual agora**
- **Tipo**: VDI (VirtualBox Disk Image)
- **Armazenamento**: Dinamicamente alocado
- **Tamanho**: 50 GB (recomendado)

### 4. **Configurações Avançadas da VM**

#### Sistema → Processador:
- **Processadores**: 2 (mínimo) / 4 (recomendado)
- **Ativar PAE/NX**

#### Sistema → Aceleração:
- **Ativar VT-x/AMD-V**
- **Ativar aninhamento VT-x/AMD-V**

#### Display:
- **Memória de vídeo**: 128 MB
- **Ativar aceleração 3D**

#### Rede:
- **Tipo**: NAT (padrão)

### 5. **Instalar Ubuntu na VM**

1. **Iniciar a VM** (primeira vez)
2. **Selecionar ISO** do Ubuntu
3. **Instalar Ubuntu** com opções:
   - ✅ Download updates while installing
   - ✅ Install third-party software
   - ✅ Erase disk and install Ubuntu
4. **Configurar usuário**:
   - Nome: `buildozer`
   - Nome do computador: `bob-app-vm`
   - Senha: `bobapp123` (ou sua preferência)
5. **Aguardar instalação** (15-30 minutos)
6. **Reiniciar** quando solicitado

### 6. **Configurar Pasta Compartilhada (Opcional)**

#### No Windows (Host):
1. Criar pasta: `C:\bob-app-shared`
2. Copiar arquivos do projeto para esta pasta

#### Na VM (Ubuntu):
1. **Dispositivos** → **Pastas compartilhadas** → **Configurar pastas compartilhadas**
2. **Adicionar nova pasta compartilhada**:
   - **Caminho da pasta**: `C:\bob-app-shared`
   - **Nome da pasta**: `shared`
   - ✅ **Montar automaticamente**
   - ✅ **Tornar permanente**
3. **Reiniciar** a VM

### 7. **Executar Script de Instalação**

#### Na VM (Ubuntu):
```bash
# Abrir terminal
# Navegar para a pasta compartilhada (se configurada)
cd /media/buildozer/shared

# Ou baixar diretamente
wget https://raw.githubusercontent.com/andremaceio/bob-app-teste/main/instalar_buildozer_vm.sh

# Dar permissão de execução
chmod +x instalar_buildozer_vm.sh

# Executar script
bash instalar_buildozer_vm.sh
```

### 8. **Gerar o APK**

```bash
# Após a instalação, gerar APK
build-apk

# Ou manualmente
cd ~/bob-app-teste
source ~/buildozer_env/bin/activate
buildozer android debug
```

## 🔧 **Configurações de Performance**

### **Para Melhor Performance:**
- **RAM**: 8GB ou mais
- **Processadores**: 4 cores
- **Disco**: SSD (se possível)
- **Aceleração 3D**: Ativada
- **VT-x/AMD-V**: Ativado

### **Para Economia de Recursos:**
- **RAM**: 4GB
- **Processadores**: 2 cores
- **Disco**: 30GB
- **Aceleração 3D**: Desativada

## 📱 **Resultado Esperado**

- **APK gerado** em `~/bob-app-teste/bin/`
- **Tamanho**: ~15-25MB
- **Compatibilidade**: Android 5.0+ (API 21+)
- **Tempo de build**: 10-30 minutos (primeira vez)

## 🚨 **Solução de Problemas**

### **VM não inicia:**
- Verificar se VT-x/AMD-V está ativado na BIOS
- Verificar se VirtualBox está atualizado

### **Ubuntu lento:**
- Aumentar RAM da VM
- Ativar aceleração 3D
- Usar menos processadores

### **Erro de espaço em disco:**
- Aumentar tamanho do disco virtual
- Limpar arquivos temporários

## 📋 **Checklist de Instalação**

- [ ] VirtualBox instalado
- [ ] VM criada com configurações corretas
- [ ] Ubuntu instalado na VM
- [ ] Script de instalação executado
- [ ] Buildozer funcionando
- [ ] APK gerado com sucesso

---

*Guia para configuração da VM no VirtualBox*
