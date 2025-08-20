# Script PowerShell para enviar o bob app para GitHub
# Execute este script para configurar o repositório e enviar o código

Write-Host "🚀 Configurando repositório GitHub para bob app..." -ForegroundColor Green
Write-Host ""

# Verificar se o Git está instalado
try {
    git --version | Out-Null
    Write-Host "✅ Git encontrado" -ForegroundColor Green
} catch {
    Write-Host "❌ Git não encontrado. Instale o Git primeiro:" -ForegroundColor Red
    Write-Host "   https://git-scm.com/download/win" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Verificar se já é um repositório Git
if (Test-Path ".git") {
    Write-Host "ℹ️  Repositório Git já existe" -ForegroundColor Yellow
} else {
    Write-Host "📁 Inicializando repositório Git..." -ForegroundColor Blue
    git init
    Write-Host "✅ Repositório inicializado" -ForegroundColor Green
}

# Adicionar todos os arquivos
Write-Host "📦 Adicionando arquivos..." -ForegroundColor Blue
git add .

# Fazer commit
Write-Host "💾 Fazendo commit..." -ForegroundColor Blue
git commit -m "Primeira versão do bob app - App Kivy com 5 telas e navegação"

# Configurar branch principal
Write-Host "🌿 Configurando branch principal..." -ForegroundColor Blue
git branch -M main

Write-Host ""
Write-Host "🔗 AGORA VOCÊ PRECISA:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Criar um repositório no GitHub:" -ForegroundColor White
Write-Host "   - Vá para https://github.com" -ForegroundColor White
Write-Host "   - Clique em 'New repository'" -ForegroundColor White
Write-Host "   - Nome: bob-app (ou outro nome)" -ForegroundColor White
Write-Host "   - Deixe público (para GitHub Actions gratuito)" -ForegroundColor White
Write-Host "   - NÃO inicialize com README" -ForegroundColor White
Write-Host ""
Write-Host "2. Copie a URL do repositório (ex: https://github.com/SEU_USUARIO/bob-app.git)" -ForegroundColor White
Write-Host ""
Write-Host "3. Execute o próximo comando substituindo a URL:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/SEU_USUARIO/bob-app.git" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""

# Perguntar se quer continuar
$continuar = Read-Host "Você já criou o repositório no GitHub? (s/n)"
if ($continuar -eq "s" -or $continuar -eq "S") {
    $url = Read-Host "Digite a URL do seu repositório GitHub"
    
    Write-Host "🔗 Adicionando remote origin..." -ForegroundColor Blue
    git remote add origin $url
    
    Write-Host "📤 Enviando código para GitHub..." -ForegroundColor Blue
    git push -u origin main
    
    Write-Host ""
    Write-Host "🎉 Código enviado com sucesso!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📱 AGORA:" -ForegroundColor Yellow
    Write-Host "1. Vá para seu repositório no GitHub" -ForegroundColor White
    Write-Host "2. Clique na aba 'Actions'" -ForegroundColor White
    Write-Host "3. Aguarde a compilação automática do APK (10-20 min)" -ForegroundColor White
    Write-Host "4. Baixe o APK na seção 'Artifacts'" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "📋 RESUMO DOS COMANDOS PARA EXECUTAR DEPOIS:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "git remote add origin https://github.com/SEU_USUARIO/bob-app.git" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Substitua 'SEU_USUARIO' e 'bob-app' pelos valores corretos" -ForegroundColor White
}

Write-Host "✅ Script concluído!" -ForegroundColor Green
Read-Host "Pressione Enter para sair"
