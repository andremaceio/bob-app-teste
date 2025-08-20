Write-Host "Configurando ambiente para bob app..." -ForegroundColor Green
Write-Host ""

# Configurar Java
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
Write-Host "Java configurado: $env:JAVA_HOME" -ForegroundColor Yellow

# Configurar Gradle
$env:GRADLE_HOME = "C:\gradle\gradle-8.5"
$env:PATH = "$env:GRADLE_HOME\bin;$env:PATH"
Write-Host "Gradle configurado: $env:GRADLE_HOME" -ForegroundColor Yellow

# Verificar versões
Write-Host ""
Write-Host "Verificando versões instaladas:" -ForegroundColor Cyan
Write-Host ""

try {
    $javaVersion = java -version 2>&1
    Write-Host "Java:" -ForegroundColor Green
    Write-Host $javaVersion -ForegroundColor White
} catch {
    Write-Host "Java não encontrado" -ForegroundColor Red
}

Write-Host ""

try {
    $gradleVersion = C:\gradle\gradle-8.5\bin\gradle -version 2>&1
    Write-Host "Gradle:" -ForegroundColor Green
    Write-Host $gradleVersion -ForegroundColor White
} catch {
    Write-Host "Gradle não encontrado" -ForegroundColor Red
}

Write-Host ""

try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python:" -ForegroundColor Green
    Write-Host $pythonVersion -ForegroundColor White
} catch {
    Write-Host "Python não encontrado" -ForegroundColor Red
}

Write-Host ""

try {
    $buildozerVersion = buildozer --version 2>&1
    Write-Host "Buildozer:" -ForegroundColor Green
    Write-Host $buildozerVersion -ForegroundColor White
} catch {
    Write-Host "Buildozer não encontrado" -ForegroundColor Red
}

Write-Host ""
Write-Host "Ambiente configurado com sucesso!" -ForegroundColor Green
Write-Host "Para executar o aplicativo, use: python main.py" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pressione qualquer tecla para continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
