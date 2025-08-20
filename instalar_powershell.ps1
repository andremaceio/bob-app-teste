# Script PowerShell para instalar e executar o bob app
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    INSTALADOR POWERShell - bob app" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se Python está instalado
Write-Host "Verificando se Python está instalado..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Python encontrado! Versão: $pythonVersion" -ForegroundColor Green
        $pythonInstalled = $true
    } else {
        throw "Python não encontrado"
    }
} catch {
    Write-Host "❌ Python não encontrado!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Por favor, instale o Python primeiro:" -ForegroundColor Yellow
    Write-Host "1. Abra a Microsoft Store e pesquise por 'Python 3.11'" -ForegroundColor White
    Write-Host "2. Ou baixe de: https://www.python.org/downloads/" -ForegroundColor White
    Write-Host "3. IMPORTANTE: Marque 'Add Python to PATH'" -ForegroundColor White
    Write-Host "4. Reinicie o PowerShell após a instalação" -ForegroundColor White
    Write-Host ""
    Read-Host "Pressione Enter para sair"
    exit 1
}

if ($pythonInstalled) {
    Write-Host ""
    Write-Host "Atualizando pip..." -ForegroundColor Yellow
    python -m pip install --upgrade pip
    
    Write-Host ""
    Write-Host "Instalando Kivy..." -ForegroundColor Yellow
    try {
        pip install kivy
        Write-Host "✅ Kivy instalado com sucesso!" -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Tentando instalação alternativa..." -ForegroundColor Yellow
        pip install --user kivy
    }
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "    INSTALAÇÃO CONCLUÍDA!" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Para executar o app, digite: python main.py" -ForegroundColor White
    Write-Host ""
    
    $executar = Read-Host "Deseja executar o app agora? (s/n)"
    if ($executar -eq "s" -or $executar -eq "S" -or $executar -eq "sim") {
        Write-Host ""
        Write-Host "Executando bob app..." -ForegroundColor Green
        python main.py
    } else {
        Write-Host ""
        Write-Host "Para executar manualmente, digite: python main.py" -ForegroundColor White
    }
}

Read-Host "Pressione Enter para sair"
