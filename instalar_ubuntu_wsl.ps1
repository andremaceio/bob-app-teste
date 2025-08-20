#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Script para instalar Ubuntu 22.04 LTS no WSL
.DESCRIPTION
    Este script habilita os recursos necessários do Windows e instala o Ubuntu 22.04 LTS
    para uso com Buildozer e desenvolvimento Kivy.
.AUTHOR
    Engenheiro Python/Kivy
.VERSION
    1.0
#>

Write-Host "🚀 Instalando Ubuntu 22.04 LTS no WSL" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
Write-Host ""

# Verificar se está rodando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Este script deve ser executado como Administrador!" -ForegroundColor Red
    Write-Host "💡 Clique com o botão direito no PowerShell e selecione 'Executar como administrador'" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "✅ Executando como Administrador" -ForegroundColor Green
Write-Host ""

# Função para verificar se um recurso está habilitado
function Test-WindowsFeature {
    param([string]$FeatureName)
    
    try {
        $feature = Get-WindowsOptionalFeature -Online -FeatureName $FeatureName
        return $feature.State -eq "Enabled"
    }
    catch {
        return $false
    }
}

# Função para habilitar um recurso
function Enable-WindowsFeature {
    param([string]$FeatureName, [string]$DisplayName)
    
    Write-Host "🔧 Verificando $DisplayName..." -ForegroundColor Cyan
    
    if (Test-WindowsFeature -FeatureName $FeatureName) {
        Write-Host "✅ $DisplayName já está habilitado" -ForegroundColor Green
        return $true
    }
    
    Write-Host "📥 Habilitando $DisplayName..." -ForegroundColor Yellow
    
    try {
        Enable-WindowsOptionalFeature -Online -FeatureName $FeatureName -All -NoRestart | Out-Null
        Write-Host "✅ $DisplayName habilitado com sucesso" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ Erro ao habilitar $DisplayName: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Habilitar WSL
Write-Host "📋 Passo 1: Habilitando WSL..." -ForegroundColor Cyan
if (-not (Enable-WindowsFeature -FeatureName "Microsoft-Windows-Subsystem-Linux" -DisplayName "WSL")) {
    Write-Host "❌ Falha ao habilitar WSL. Abortando instalação." -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Habilitar Plataforma da Máquina Virtual
Write-Host "📋 Passo 2: Habilitando Plataforma da Máquina Virtual..." -ForegroundColor Cyan
if (-not (Enable-WindowsFeature -FeatureName "VirtualMachinePlatform" -DisplayName "Plataforma da Máquina Virtual")) {
    Write-Host "❌ Falha ao habilitar Plataforma da Máquina Virtual. Abortando instalação." -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host ""
Write-Host "🎉 Recursos do Windows habilitados com sucesso!" -ForegroundColor Green
Write-Host ""

# Verificar se WSL está funcionando
Write-Host "🔍 Verificando status do WSL..." -ForegroundColor Cyan
try {
    $wslStatus = wsl --status 2>&1
    Write-Host "✅ WSL está funcionando" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ WSL pode precisar de reinicialização" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🚨 ATENÇÃO: REINICIE O COMPUTADOR AGORA!" -ForegroundColor Red
Write-Host "💡 Após reiniciar, execute o próximo script para instalar o Ubuntu" -ForegroundColor Yellow
Write-Host ""

# Perguntar se quer reiniciar agora
$reiniciar = Read-Host "Deseja reiniciar o computador agora? (S/N)"

if ($reiniciar -eq "S" -or $reiniciar -eq "s" -or $reiniciar -eq "Sim" -or $reiniciar -eq "sim") {
    Write-Host "🔄 Reiniciando o computador em 10 segundos..." -ForegroundColor Yellow
    Write-Host "💾 Salve todos os trabalhos abertos!" -ForegroundColor Red
    Start-Sleep -Seconds 10
    Restart-Computer -Force
}
else {
    Write-Host ""
    Write-Host "📋 Próximos passos após reiniciar:" -ForegroundColor Cyan
    Write-Host "1. Reinicie o computador" -ForegroundColor White
    Write-Host "2. Abra PowerShell como Administrador" -ForegroundColor White
    Write-Host "3. Execute: wsl --install Ubuntu-22.04" -ForegroundColor White
    Write-Host "4. Configure usuário e senha" -ForegroundColor White
    Write-Host "5. Execute o script de instalação do Buildozer" -ForegroundColor White
    Write-Host ""
    Write-Host "✅ Instalação dos recursos concluída!" -ForegroundColor Green
}

Read-Host "Pressione Enter para sair"
