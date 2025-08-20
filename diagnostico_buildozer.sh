#!/bin/bash

echo "=========================================="
echo "DIAGNÓSTICO DO AMBIENTE BUILDozer"
echo "=========================================="
echo ""

echo "1. VERIFICANDO VERSÕES:"
echo "------------------------"
echo "Python3: $(python3 --version)"
echo "Pip3: $(pip3 --version)"
echo "Buildozer: $(buildozer --version)"
echo ""

echo "2. VERIFICANDO DEPENDÊNCIAS:"
echo "----------------------------"
echo "Java: $(java -version 2>&1 | head -1)"
echo "Gradle: $(gradle --version 2>&1 | head -1)"
echo ""

echo "3. VERIFICANDO VARIÁVEIS DE AMBIENTE:"
echo "-------------------------------------"
echo "JAVA_HOME: $JAVA_HOME"
echo "ANDROID_HOME: $ANDROID_HOME"
echo "ANDROID_NDK_HOME: $ANDROID_NDK_HOME"
echo ""

echo "4. VERIFICANDO INSTALAÇÕES:"
echo "---------------------------"
echo "Buildozer packages:"
ls -la ~/.buildozer/android/packages/ 2>/dev/null || echo "Pasta não encontrada"
echo ""

echo "5. VERIFICANDO PERMISSÕES:"
echo "-------------------------"
echo "Pasta atual: $(pwd)"
echo "Permissões: $(ls -la | head -5)"
echo ""

echo "6. VERIFICANDO PYTHONFORANDROID:"
echo "-------------------------------"
python3 -c "import pythonforandroid; print('pythonforandroid instalado')" 2>/dev/null || echo "pythonforandroid NÃO instalado"
echo ""

echo "7. VERIFICANDO KIVY:"
echo "-------------------"
python3 -c "import kivy; print('Kivy instalado:', kivy.__version__)" 2>/dev/null || echo "Kivy NÃO instalado"
echo ""

echo "8. VERIFICANDO ARQUIVO BUILDozer.SPEC:"
echo "-------------------------------------"
if [ -f "buildozer.spec" ]; then
    echo "buildozer.spec encontrado"
    echo "Primeiras linhas:"
    head -10 buildozer.spec
else
    echo "buildozer.spec NÃO encontrado"
fi
echo ""

echo "9. VERIFICANDO ESPAÇO EM DISCO:"
echo "------------------------------"
df -h | head -3
echo ""

echo "10. VERIFICANDO MEMÓRIA:"
echo "-----------------------"
free -h
echo ""

echo "=========================================="
echo "DIAGNÓSTICO CONCLUÍDO"
echo "=========================================="
