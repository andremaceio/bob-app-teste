# 📱 Como Instalar bob app no Android

## 🚀 Método 1: Kivy Launcher (Mais Fácil)

### Passo 1: Instalar Kivy Launcher
1. **Abra a Google Play Store** no seu celular
2. **Pesquise por "Kivy Launcher"**
3. **Instale o app** (gratuito)

### Passo 2: Transferir Arquivos
1. **Conecte seu celular** ao computador via USB
2. **Copie estes arquivos** para a pasta `kivy` no seu celular:
   - `main.py`
   - `ui.kv`
   - `links.py`

### Passo 3: Executar
1. **Abra o Kivy Launcher** no celular
2. **Toque em "bob app"** na lista
3. **O app será executado** automaticamente

## 🔧 Método 2: Compilação Manual (Avançado)

### Pré-requisitos:
- **Linux ou WSL** (Windows Subsystem for Linux)
- **Python 3.7+**
- **Java JDK 8+**

### Comandos:
```bash
# Instalar Buildozer
pip install buildozer

# Inicializar projeto
buildozer init

# Gerar APK
buildozer android debug
```

## 📋 Método 3: Servidor Web (Alternativo)

### Passo 1: Executar no Computador
```bash
py main.py
```

### Passo 2: Acessar via Navegador
1. **Abra o navegador** no celular
2. **Digite o IP** do seu computador
3. **Use o app** como uma web app

## ⚠️ Solução de Problemas

### "Kivy Launcher não encontrado"
- Use o link direto: https://play.google.com/store/apps/details?id=org.kivy.pygame

### "Arquivos não aparecem"
- Verifique se estão na pasta `kivy` correta
- Reinicie o Kivy Launcher

### "App não executa"
- Verifique se todos os arquivos foram copiados
- Certifique-se de que o Python está funcionando

## 🎯 Vantagens do Kivy Launcher

✅ **Instalação rápida** (5 minutos)
✅ **Sem compilação** necessária
✅ **Atualizações fáceis** (só trocar arquivos)
✅ **Compatível** com todos os Androids
✅ **Gratuito** e oficial

## 📱 Funcionalidades no Android

- **Navegação por toque** otimizada
- **Menu inferior** responsivo
- **Links funcionais** (abrem navegador)
- **Interface adaptativa** para mobile
- **Performance nativa** do Kivy

## 🔄 Atualizações

Para atualizar o app:
1. **Modifique os arquivos** no computador
2. **Copie novamente** para o celular
3. **Reinicie** o Kivy Launcher

## 📞 Suporte

Se precisar de ajuda:
1. Verifique se todos os arquivos estão copiados
2. Reinicie o Kivy Launcher
3. Consulte: https://kivy.org/docs/installation/installation-android.html
