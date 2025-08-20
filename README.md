# bob app - Aplicação Kivy Completa

Uma aplicação Kivy moderna com 5 telas, navegação fluida e design inspirado no Nubank.

## 🚀 Status do Projeto

✅ **Aplicativo funcionando perfeitamente** no Windows  
✅ **5 telas implementadas** com navegação completa  
✅ **Design responsivo** com estética Nubank  
✅ **GitHub Actions configurado** para build automático do APK  
✅ **Todas as dependências instaladas** e configuradas  
✅ **Máquina Virtual Linux configurada** para build local  

## 📱 Funcionalidades

- **HomeScreen**: Tela inicial com botões principais
- **CondoScreen**: Seção Condo com botões azuis
- **ImpactScreen**: Seção Impact com botões verdes  
- **MatchScreen**: Seção Match com botões vermelhos
- **BusinessScreen**: Seção Business com botões amarelos
- **Navegação inferior**: Barra de navegação com 5 botões
- **Design Nubank**: Cores suaves, bordas arredondadas, sombras sutis

## 🛠️ Instalações Realizadas

### ✅ Python e Kivy
- Python 3.13.7
- Kivy 2.3.1
- Todas as dependências Kivy

### ✅ Java e Gradle
- Java JDK 21.0.8
- Gradle 8.5
- Variáveis de ambiente configuradas

### ✅ Ferramentas de Build
- Buildozer 1.5.0
- WSL 2.5.10 (para futuras compilações Linux)

## 🚀 Como Executar

### 1. Configurar Ambiente (Recomendado)
```bash
# Windows Batch
configurar_ambiente.bat

# PowerShell
.\configurar_ambiente.ps1
```

### 2. Executar Aplicativo
```bash
python main.py
```

## 📱 Geração do APK

### 🎯 **Opções Disponíveis:**

#### 1. **GitHub Actions (Recomendado - Automático)**
- ✅ **Configurado e funcionando**
- APK gerado automaticamente a cada push
- Sem necessidade de configuração local

#### 2. **Máquina Virtual Linux (Local - Completo)**
- 🖥️ **Configurado e documentado**
- Controle total do processo de build
- Ideal para desenvolvimento contínuo
- Scripts de instalação automatizados

#### 3. **WSL (Windows Subsystem for Linux)**
- ⚠️ **Instalado, requer configuração adicional**
- Alternativa para builds manuais

### 🚀 **Como Usar a VM Linux:**

1. **Baixar e instalar VirtualBox**
2. **Criar VM Ubuntu** seguindo `CONFIGURAR_VM_VIRTUALBOX.md`
3. **Executar script automático**: `instalar_buildozer_vm.sh`
4. **Gerar APK**: `build-apk`

**Arquivos de configuração incluídos:**
- `BUILD_VM_LINUX.md` - Guia completo
- `CONFIGURAR_VM_VIRTUALBOX.md` - Configuração da VM
- `instalar_buildozer_vm.sh` - Script de instalação automática
- `buildozer_vm.spec` - Configuração otimizada do Buildozer

## 📁 Estrutura do Projeto

```
BobTeste/
├── main.py                 # Aplicação principal
├── ui.kv                   # Interface do usuário
├── links.py                # Sistema de links
├── buildozer.spec          # Configuração para Android
├── .github/workflows/      # CI/CD automático
├── configurar_ambiente.bat # Script de configuração Windows
├── configurar_ambiente.ps1 # Script de configuração PowerShell
├── BUILD_VM_LINUX.md       # Guia para VM Linux
├── CONFIGURAR_VM_VIRTUALBOX.md # Configuração VirtualBox
├── instalar_buildozer_vm.sh # Script de instalação VM
├── buildozer_vm.spec       # Configuração otimizada VM
└── INSTALACOES_REALIZADAS.md # Documentação das instalações
```

## 🔧 Configuração Automática

### Scripts de Configuração
- **`configurar_ambiente.bat`**: Para Windows (CMD)
- **`configurar_ambiente.ps1`**: Para PowerShell
- **`instalar_buildozer_vm.sh`**: Para VM Linux (Ubuntu)

Estes scripts configuram automaticamente:
- JAVA_HOME
- GRADLE_HOME  
- PATH
- Verificam todas as versões instaladas

## 🎨 Design

- **Cores Condo**: Azul suave (#1E88E5)
- **Cores Impact**: Verde suave (#43A047)  
- **Cores Match**: Vermelho suave
- **Cores Business**: Amarelo suave
- **Estilo**: Bordas arredondadas, sombras sutis, tipografia clara

## 📋 Requisitos

- Python 3.10+
- Kivy 2.x
- Windows 10/11 (para desenvolvimento local)
- GitHub (para CI/CD e geração do APK)
- VirtualBox (para VM Linux - opcional)

## 🔗 Links Úteis

- **Repositório**: https://github.com/andremaceio/bob-app-teste.git
- **Documentação Kivy**: https://kivy.org/
- **Buildozer**: https://buildozer.readthedocs.io/
- **VirtualBox**: https://www.virtualbox.org/

## 📅 Atualizações

**20 de Agosto de 2025**
- ✅ Todas as instalações concluídas
- ✅ Ambiente configurado
- ✅ Scripts de configuração criados
- ✅ Documentação atualizada
- ✅ Máquina Virtual Linux configurada
- ✅ Scripts de instalação automatizados

---

*Desenvolvido com ❤️ usando Kivy e Python*
