# 🚀 INSTRUÇÕES RÁPIDAS - GitHub Actions

## ⚡ **PASSO A PASSO EM 5 MINUTOS:**

### 1️⃣ **Criar Repositório no GitHub**
- Vá para: https://github.com
- Clique em **"New repository"**
- Nome: `bob-app` (ou outro)
- **IMPORTANTE**: Deixe **PÚBLICO** (para GitHub Actions gratuito)
- **NÃO** marque "Add README"
- Clique em **"Create repository"**

### 2️⃣ **Executar Script Automático**
```powershell
# No PowerShell, na pasta do projeto:
.\enviar_github.ps1
```

### 3️⃣ **Copiar URL do Repositório**
- No GitHub, copie a URL: `https://github.com/SEU_USUARIO/bob-app.git`
- Cole no script quando solicitado

### 4️⃣ **Aguardar Compilação Automática**
- Vá para aba **"Actions"** no GitHub
- Clique em **"Build Android APK"**
- Aguarde: **15-25 minutos** (primeira vez)

### 5️⃣ **Baixar APK**
- Após sucesso, clique no workflow
- Role para baixo até **"Artifacts"**
- Clique em **"bob-app-apk"** para baixar

---

## 🎯 **O QUE ACONTECE AUTOMATICAMENTE:**

✅ **GitHub Actions instala Buildozer**
✅ **Compila seu app Kivy**
✅ **Gera APK Android**
✅ **Faz upload do APK**
✅ **Tudo gratuito e automático**

---

## 📱 **RESULTADO:**
- **APK Android** pronto para instalar
- **Compilação automática** a cada atualização
- **Sem instalação** de ferramentas no Windows
- **Ambiente Linux** estável e confiável

---

## 🆘 **SE DER PROBLEMA:**
1. Verifique os logs na aba "Actions"
2. Faça um novo push para re-executar
3. O GitHub Actions tenta novamente automaticamente

---

**🎉 É ISSO! Seu app compila sozinho no GitHub!**
