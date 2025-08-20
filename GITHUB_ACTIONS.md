# 🚀 Gerando APK Android Automaticamente com GitHub Actions

Este guia explica como usar o GitHub Actions para compilar automaticamente seu app Kivy em um APK Android.

## 📋 Pré-requisitos

1. **Conta no GitHub** (gratuita)
2. **Seu código no GitHub** (repositório público ou privado)
3. **Pacote GitHub Actions** (gratuito para repositórios públicos)

## 🔧 Configuração Automática

### 1. **Estrutura de Arquivos**
O workflow já está configurado em `.github/workflows/build-apk.yml` e inclui:
- ✅ Instalação automática do Buildozer
- ✅ Configuração do ambiente Linux
- ✅ Compilação automática do APK
- ✅ Upload do APK como artifact

### 2. **Como Funciona**
- **Trigger**: A cada push para `main` ou `master`
- **Ambiente**: Ubuntu Linux (compatível com Buildozer)
- **Saída**: APK Android na aba "Actions" do GitHub

## 📱 Passos para Usar

### **Passo 1: Enviar Código para GitHub**
```bash
# Se ainda não tem repositório
git init
git add .
git commit -m "Primeira versão do bob app"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git
git push -u origin main
```

### **Passo 2: Verificar Actions**
1. Vá para seu repositório no GitHub
2. Clique na aba **"Actions"**
3. Clique em **"Build Android APK"**
4. Aguarde a compilação (pode levar 10-20 minutos)

### **Passo 3: Baixar o APK**
1. Após a compilação, clique no workflow executado
2. Role para baixo até **"Artifacts"**
3. Clique em **"bob-app-apk"** para baixar
4. O arquivo será um `.zip` contendo o APK

## 🔍 Monitoramento

### **Logs de Compilação**
- **Verde**: ✅ Sucesso
- **Vermelho**: ❌ Erro
- **Amarelo**: ⚠️ Aviso

### **Tempo de Compilação**
- **Primeira vez**: 15-25 minutos (download de dependências)
- **Compilações seguintes**: 10-15 minutos

## 🛠️ Solução de Problemas

### **Erro: "Build failed"**
1. Clique no workflow falhado
2. Verifique os logs na aba "Actions"
3. Procure por mensagens de erro específicas
4. Corrija o código e faça novo push

### **Erro: "Dependencies failed"**
- O Buildozer pode falhar na primeira tentativa
- Faça um novo push para re-executar
- GitHub Actions tenta novamente automaticamente

### **APK não aparece**
1. Verifique se a compilação foi bem-sucedida
2. Procure por "Artifacts" na aba Actions
3. O APK pode estar em `.buildozer/bin/`

## 📊 Vantagens do GitHub Actions

✅ **Automático**: Compila a cada push
✅ **Gratuito**: Para repositórios públicos
✅ **Confiável**: Ambiente Linux estável
✅ **Rastreável**: Logs completos de compilação
✅ **Distribuição**: APK sempre atualizado

## 🎯 Próximos Passos

1. **Teste o APK** no seu celular Android
2. **Compartilhe** o APK com outros usuários
3. **Atualize** o app e faça novo push
4. **Monitore** as compilações automáticas

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs do GitHub Actions
2. Consulte a documentação do Buildozer
3. Abra uma issue no repositório

---

**🎉 Parabéns! Seu app agora compila automaticamente no GitHub!**
