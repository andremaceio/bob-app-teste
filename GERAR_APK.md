# 📱 Como Gerar APK Android para bob app

## 🚀 Método 1: Script Automático (Recomendado)

1. **Execute o script:**
   ```bash
   gerar_apk.bat
   ```

2. **Aguarde a compilação** (pode demorar 10-30 minutos)

3. **APK será gerado em:** `bin/bobapp-1.0-debug.apk`

## 🔧 Método 2: Manual

### Passo 1: Instalar Buildozer
```bash
pip install buildozer
```

### Passo 2: Inicializar Buildozer
```bash
buildozer init
```

### Passo 3: Gerar APK
```bash
buildozer android debug
```

## 📋 Pré-requisitos

- **Python 3.7+** instalado
- **Java JDK 8** ou superior
- **Android SDK** (será baixado automaticamente)
- **Conexão com internet** para baixar dependências

## ⚠️ Solução de Problemas

### Erro: "Java não encontrado"
```bash
# Baixe e instale Java JDK 8+ de:
# https://adoptium.net/
```

### Erro: "Android SDK não encontrado"
- O Buildozer baixa automaticamente
- Aguarde o download completo

### Erro: "NDK não encontrado"
- O Buildozer baixa automaticamente
- Pode demorar alguns minutos

## 📱 Instalando no Celular

1. **Copie o APK** para seu celular
2. **Ative "Fontes desconhecidas"** nas configurações
3. **Toque no APK** para instalar
4. **Permita as permissões** solicitadas

## 🎯 Características do APK

- **Tamanho**: ~15-25 MB
- **Android mínimo**: 5.0 (API 21)
- **Arquitetura**: ARM64 (compatível com 99% dos celulares)
- **Permissões**: Internet e armazenamento

## 🔄 Atualizações

Para gerar nova versão:
1. Modifique o código
2. Execute `buildozer android debug` novamente
3. Substitua o APK antigo

## 📞 Suporte

Se houver problemas:
1. Verifique se Java está instalado
2. Certifique-se de ter conexão com internet
3. Aguarde o download completo das dependências
4. Consulte: https://buildozer.readthedocs.io/
