#!/usr/bin/env python3
"""
Script para gerar APK usando Buildozer no Windows
Autor: Engenheiro Python/Kivy
Versão: 1.0
"""

import os
import sys
import subprocess
import shutil
from pathlib import Path

def verificar_dependencias():
    """Verifica se todas as dependências estão instaladas."""
    print("🔍 Verificando dependências...")
    
    # Verificar Python
    python_version = sys.version_info
    print(f"✅ Python {python_version.major}.{python_version.minor}.{python_version.micro}")
    
    # Verificar Kivy
    try:
        import kivy
        print(f"✅ Kivy {kivy.__version__}")
    except ImportError:
        print("❌ Kivy não encontrado")
        return False
    
    # Verificar Buildozer
    try:
        import buildozer
        print(f"✅ Buildozer {buildozer.__version__}")
    except ImportError:
        print("❌ Buildozer não encontrado")
        return False
    
    # Verificar Java
    try:
        result = subprocess.run(['java', '-version'], 
                              capture_output=True, text=True, shell=True)
        if result.returncode == 0:
            print("✅ Java encontrado")
        else:
            print("❌ Java não encontrado")
            return False
    except FileNotFoundError:
        print("❌ Java não encontrado")
        return False
    
    # Verificar Gradle
    gradle_path = Path("C:/gradle/gradle-8.5/bin/gradle.bat")
    if gradle_path.exists():
        print("✅ Gradle encontrado")
    else:
        print("❌ Gradle não encontrado")
        return False
    
    return True

def configurar_ambiente():
    """Configura as variáveis de ambiente necessárias."""
    print("🔧 Configurando ambiente...")
    
    # Configurar JAVA_HOME
    java_home = "C:\\Program Files\\Java\\jdk-21"
    if os.path.exists(java_home):
        os.environ['JAVA_HOME'] = java_home
        os.environ['PATH'] = f"{java_home}\\bin;{os.environ['PATH']}"
        print(f"✅ JAVA_HOME configurado: {java_home}")
    else:
        print("❌ JAVA_HOME não encontrado")
        return False
    
    # Configurar GRADLE_HOME
    gradle_home = "C:\\gradle\\gradle-8.5"
    if os.path.exists(gradle_home):
        os.environ['GRADLE_HOME'] = gradle_home
        os.environ['PATH'] = f"{gradle_home}\\bin;{os.environ['PATH']}"
        print(f"✅ GRADLE_HOME configurado: {gradle_home}")
    else:
        print("❌ GRADLE_HOME não encontrado")
        return False
    
    return True

def tentar_buildozer():
    """Tenta executar o Buildozer."""
    print("🚀 Tentando executar Buildozer...")
    
    try:
        # Verificar se buildozer.spec existe
        if not os.path.exists('buildozer.spec'):
            print("📄 Criando buildozer.spec...")
            result = subprocess.run(['buildozer', 'init'], 
                                  capture_output=True, text=True, shell=True)
            if result.returncode != 0:
                print(f"❌ Erro ao criar buildozer.spec: {result.stderr}")
                return False
        
        # Tentar executar buildozer android debug
        print("📱 Executando: buildozer android debug")
        result = subprocess.run(['buildozer', 'android', 'debug'], 
                              capture_output=True, text=True, shell=True)
        
        if result.returncode == 0:
            print("✅ APK gerado com sucesso!")
            print("📁 Verifique a pasta 'bin/' para o APK")
            return True
        else:
            print(f"❌ Erro na execução: {result.stderr}")
            return False
            
    except Exception as e:
        print(f"❌ Erro ao executar Buildozer: {e}")
        return False

def main():
    """Função principal."""
    print("🚀 Script de Geração de APK com Buildozer")
    print("=" * 50)
    
    # Verificar dependências
    if not verificar_dependencias():
        print("\n❌ Dependências não atendidas. Instale as dependências primeiro.")
        return False
    
    # Configurar ambiente
    if not configurar_ambiente():
        print("\n❌ Erro na configuração do ambiente.")
        return False
    
    # Tentar executar Buildozer
    if not tentar_buildozer():
        print("\n❌ Erro na execução do Buildozer.")
        print("\n💡 Alternativas:")
        print("1. Use o GitHub Actions (já configurado)")
        print("2. Configure uma Máquina Virtual Linux")
        print("3. Use o Kivy Launcher para testes")
        return False
    
    print("\n🎉 APK gerado com sucesso!")
    return True

if __name__ == '__main__':
    main()
