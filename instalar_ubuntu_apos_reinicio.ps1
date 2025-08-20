#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Script para instalar Ubuntu 22.04 LTS após reinicialização
.DESCRIPTION
    Este script instala o Ubuntu 22.04 LTS no WSL após os recursos do Windows
    terem sido habilitados e o sistema reiniciado.
.AUTHOR
    Engenheiro Python/Kivy
.VERSION
    1.0
#>

Write-Host "Instalando Ubuntu 22.04 LTS no WSL" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""

# Verificar se está rodando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "ERRO: Este script deve ser executado como Administrador!" -ForegroundColor Red
    Write-Host "DICA: Clique com o botão direito no PowerShell e selecione 'Executar como administrador'" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "OK: Executando como Administrador" -ForegroundColor Green
Write-Host ""

# Verificar se WSL está funcionando
Write-Host "Verificando status do WSL..." -ForegroundColor Cyan
try {
    $wslStatus = wsl --status 2>&1
    Write-Host "OK: WSL está funcionando" -ForegroundColor Green
}
catch {
    Write-Host "ERRO: WSL não está funcionando. Execute o script anterior primeiro." -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Verificar se Ubuntu já está instalado
Write-Host "Verificando distribuições instaladas..." -ForegroundColor Cyan
$distributions = wsl --list --verbose 2>&1

if ($distributions -match "Ubuntu-22.04") {
    Write-Host "OK: Ubuntu 22.04 LTS já está instalado" -ForegroundColor Green
    Write-Host ""
    Write-Host "DICA: Para acessar o Ubuntu, use: wsl -d Ubuntu-22.04" -ForegroundColor Yellow
    Write-Host "DICA: Para instalar o Buildozer, execute o script: instalar_buildozer_wsl.sh" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair"
    exit 0
}

Write-Host "Ubuntu 22.04 LTS não encontrado. Iniciando instalação..." -ForegroundColor Yellow
Write-Host ""

# Instalar Ubuntu 22.04 LTS
Write-Host "Instalando Ubuntu 22.04 LTS..." -ForegroundColor Cyan
Write-Host "Isso pode demorar alguns minutos..." -ForegroundColor Yellow
Write-Host ""

try {
    $installResult = wsl --install Ubuntu-22.04 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "OK: Ubuntu 22.04 LTS instalado com sucesso!" -ForegroundColor Green
    } else {
        Write-Host "ERRO na instalação: $installResult" -ForegroundColor Red
        Read-Host "Pressione Enter para sair"
        exit 1
    }
}
catch {
    Write-Host "ERRO na instalação: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host ""
Write-Host "Instalação concluída!" -ForegroundColor Green
Write-Host ""

# Verificar instalação
Write-Host "Verificando instalação..." -ForegroundColor Cyan
$distributions = wsl --list --verbose 2>&1
Write-Host $distributions -ForegroundColor White

Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor Cyan
Write-Host "1. Abra um novo terminal (PowerShell ou CMD)" -ForegroundColor White
Write-Host "2. Execute: wsl -d Ubuntu-22.04" -ForegroundColor White
Write-Host "3. Configure usuário e senha quando solicitado" -ForegroundColor White
Write-Host "4. Execute o script de instalação do Buildozer" -ForegroundColor White
Write-Host ""

# Perguntar se quer testar agora
$testar = Read-Host "Deseja testar o Ubuntu agora? (S/N)"

if ($testar -eq "S" -or $testar -eq "s" -or $testar -eq "Sim" -or $testar -eq "sim") {
    Write-Host "Iniciando Ubuntu 22.04 LTS..." -ForegroundColor Green
    Write-Host "DICA: Configure o usuário e senha quando solicitado" -ForegroundColor Yellow
    Write-Host "DICA: Para sair, digite: exit" -ForegroundColor Yellow
    Write-Host ""
    
    # Iniciar Ubuntu
    wsl -d Ubuntu-22.04
}
else {
    Write-Host ""
    Write-Host "DICA: Para usar o Ubuntu mais tarde:" -ForegroundColor Yellow
    Write-Host "   wsl -d Ubuntu-22.04" -ForegroundColor White
    Write-Host ""
    Write-Host "Instalação concluída com sucesso!" -ForegroundColor Green
}

Read-Host "Pressione Enter para sair"
