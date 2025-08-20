# Instalação do Python e bob app no Windows

## 🐍 Passo 1: Instalar Python

### Opção A: Microsoft Store (Recomendado para iniciantes)
1. Abra a **Microsoft Store** no Windows
2. Pesquise por "Python 3.11" ou "Python 3.12"
3. Clique em **Instalar** na versão mais recente
4. Aguarde a instalação completar

### Opção B: Download direto (Para usuários avançados)
1. Acesse: https://www.python.org/downloads/
2. Clique em **Download Python 3.x.x**
3. Execute o instalador baixado
4. **IMPORTANTE**: Marque a opção "Add Python to PATH"
5. Clique em **Install Now**

## 🔍 Passo 2: Verificar a Instalação

Abra o **PowerShell** ou **Prompt de Comando** e digite:
```bash
python --version
```

Se aparecer algo como "Python 3.x.x", a instalação foi bem-sucedida!

## 📦 Passo 3: Instalar o bob app

1. **Navegue até a pasta do projeto:**
```bash
cd C:\Users\S021558444\Desktop\BobTeste
```

2. **Instale as dependências:**
```bash
pip install -r requirements.txt
```

3. **Execute a aplicação:**
```bash
python main.py
```

## ❗ Solução de Problemas Comuns

### "Python não foi encontrado"
- Reinstale o Python marcando "Add Python to PATH"
- Ou reinicie o computador após a instalação

### "pip não foi encontrado"
```bash
python -m pip install --upgrade pip
```

### Erro ao instalar Kivy
```bash
pip install --upgrade pip setuptools wheel
pip install kivy[base]
```

### Erro de dependências
```bash
pip install --user kivy
```

## 🎯 Alternativa: Anaconda

Se tiver problemas com a instalação padrão do Python:

1. Baixe o **Anaconda** em: https://www.anaconda.com/download
2. Instale normalmente
3. Abra o **Anaconda Prompt**
4. Navegue até a pasta do projeto
5. Execute:
```bash
conda install kivy
python main.py
```

## 📱 Executando o App

Após a instalação bem-sucedida:
1. Abra o PowerShell na pasta `BobTeste`
2. Digite: `python main.py`
3. A aplicação deve abrir em uma janela
4. Use os botões para navegar entre as telas

## 🆘 Ainda com Problemas?

1. Verifique se o Python está no PATH do sistema
2. Tente executar como administrador
3. Consulte: https://kivy.org/doc/stable/installation/installation-windows.html
4. Verifique se o antivírus não está bloqueando a instalação
