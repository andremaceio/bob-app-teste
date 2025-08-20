# bob app - Aplicação Kivy

Uma aplicação móvel desenvolvida em Python/Kivy com 3 telas e navegação por ScreenManager.

## 🏗️ Arquitetura

- **main.py**: Entrypoint da aplicação, classes das telas e lógica principal
- **ui.kv**: Layout e estilos em linguagem KV
- **links.py**: Dicionário de links para as diferentes seções
- **requirements.txt**: Dependências do projeto

## 📱 Funcionalidades

### 1. HomeScreen (Tela Principal)
- Grid 2x2 com botões azuis (Condo) e verdes (Impact)
- Navegação para telas secundárias
- Espaço reservado para botões futuros

### 2. CondoScreen
- Lista de botões azuis para links de condomínio
- Botão "Voltar" para Home
- Função `open_future_link()` para abrir URLs

### 3. ImpactScreen
- Lista de botões verdes para links de impacto
- Botão "Voltar" para Home
- Função `open_future_link()` para abrir URLs

## 🚀 Instalação e Execução

### Pré-requisitos
- Python 3.10 ou superior
- pip (gerenciador de pacotes Python)

### Windows
```bash
# 1. Clone ou baixe o projeto
# 2. Abra o PowerShell na pasta do projeto
cd C:\caminho\para\BobTeste

# 3. Instale as dependências
pip install -r requirements.txt

# 4. Execute a aplicação
python main.py
```

### macOS/Linux
```bash
# 1. Clone ou baixe o projeto
# 2. Abra o terminal na pasta do projeto
cd /caminho/para/BobTeste

# 3. Instale as dependências
pip3 install -r requirements.txt

# 4. Execute a aplicação
python3 main.py
```

### Solução de Problemas

**Erro: "No module named 'kivy'"**
```bash
pip install kivy>=2.3.0
```

**Erro de dependências no Windows:**
```bash
pip install --upgrade pip setuptools wheel
pip install kivy[base] kivy_examples
```

**Erro no macOS:**
```bash
brew install pkg-config sdl2 sdl2_image sdl2_ttf sdl2_mixer
pip3 install kivy
```

## 🔧 Personalização

### Adicionando Novos Links

1. **Edite o arquivo `links.py`:**
```python
LINKS = {
    "condo": {
        "link1": "https://exemplo.com/condo/link1",
        "novo_link": "https://exemplo.com/novo"  # ← Adicione aqui
    },
    "impact": {
        "link1": "https://exemplo.com/impact/link1",
        "novo_link": "https://exemplo.com/novo"  # ← Adicione aqui
    }
}
```

2. **Adicione o botão no arquivo `ui.kv`:**
```kv
# Na CondoScreen ou ImpactScreen
CondoButton:  # ou ImpactButton
    text: 'Novo Link'
    on_press: root.open_condo_link('novo_link')  # ou open_impact_link
```

### Modificando Cores

**Cores atuais:**
- **Condo (Azul)**: `#1E88E5` (rgba(0.117647, 0.533333, 0.898039, 1))
- **Impact (Verde)**: `#43A047` (rgba(0.262745, 0.627451, 0.278431, 1))

**Para alterar, edite `ui.kv`:**
```kv
<CondoButton@Button>:
    background_color: 0.5, 0.2, 0.8, 1  # Nova cor (R, G, B, A)
```

### Adicionando Novas Telas

1. **Crie a classe no `main.py`:**
```python
class NovaTela(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.name = 'nova_tela'
```

2. **Adicione o layout no `ui.kv`:**
```kv
<NovaTela>:
    BoxLayout:
        # Seu layout aqui
```

3. **Registre no ScreenManager:**
```python
sm.add_widget(NovaTela())
```

## 📁 Estrutura do Projeto

```
BobTeste/
├── main.py              # Entrypoint e lógica principal
├── ui.kv                # Layout e estilos
├── links.py             # Dicionário de links
├── requirements.txt     # Dependências
└── README.md           # Este arquivo
```

## 🎨 Estilo e Design

- **Layout responsivo** usando BoxLayout, GridLayout e AnchorLayout
- **Cores consistentes** com paleta definida
- **Padding e spacing** para melhor usabilidade
- **Tipografia clara** com tamanhos de fonte apropriados
- **Navegação intuitiva** com botões de retorno

## 🔗 Funcionalidades Futuras

A função `open_future_link()` está preparada para:
- Abrir URLs em navegador
- Navegar para telas específicas
- Executar ações personalizadas
- Integrar com APIs externas

## 📞 Suporte

Para dúvidas ou problemas:
1. Verifique se o Python e Kivy estão instalados corretamente
2. Consulte a documentação oficial do Kivy: https://kivy.org/
3. Verifique os logs no terminal para mensagens de erro

## 📄 Licença

Este projeto é fornecido como exemplo educacional. Sinta-se livre para modificar e distribuir conforme necessário.
