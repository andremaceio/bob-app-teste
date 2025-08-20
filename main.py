#!/usr/bin/env python3
"""
bob app - Aplicação Kivy com múltiplas telas e navegação
Autor: Engenheiro Python/Kivy
Versão: 1.0
"""
import webbrowser
from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.core.window import Window
from kivy.properties import StringProperty
from kivy.lang import Builder

# Configuração da janela
Window.size = (400, 700)
Window.minimum_width = 350
Window.minimum_height = 600

from links import LINKS

def open_future_link(section, link_id):
    """
    Função placeholder para abrir links futuros.
    Por enquanto apenas imprime o link e tenta abrir no navegador.
    """
    print(f"Tentando abrir link: {section} - {link_id}")
    
    if section in LINKS and link_id in LINKS[section]:
        url = LINKS[section][link_id]
        print(f"URL encontrada: {url}")
        try:
            webbrowser.open(url)
            print(f"Link aberto com sucesso: {url}")
        except Exception as e:
            print(f"Erro ao abrir link: {e}")
    else:
        print(f"Link não encontrado: {section} - {link_id}")
        print("Para adicionar novos links, edite o arquivo 'links.py'")

class BottomNavigationBar(BoxLayout):
    """Menu de navegação inferior padronizado para todas as telas."""
    current_screen = StringProperty('home')
    
    def navigate_to(self, screen_name):
        # Access manager via app.root (ScreenManager)
        App.get_running_app().root.current = screen_name

class HomeScreen(Screen):
    """Tela inicial do aplicativo."""
    pass

class CondoScreen(Screen):
    """Tela da seção Condo."""
    def open_future_link(self, section, link_id):
        open_future_link(section, link_id)

class ImpactScreen(Screen):
    """Tela da seção Impact."""
    def open_future_link(self, section, link_id):
        open_future_link(section, link_id)

class MatchScreen(Screen):
    """Tela da seção Match."""
    def open_future_link(self, section, link_id):
        open_future_link(section, link_id)

class BusinessScreen(Screen):
    """Tela da seção Business."""
    def open_future_link(self, section, link_id):
        open_future_link(section, link_id)

class BobApp(App):
    """Aplicação principal bob app."""
    def build(self):
        print("Iniciando bob app...")
        print("Para adicionar novos links, edite o arquivo 'links.py'")
        print("Para modificar a interface, edite o arquivo 'ui.kv'")
        print("-" * 50)
        
        Builder.load_file('ui.kv')
        sm = ScreenManager()
        sm.add_widget(HomeScreen(name='home'))
        sm.add_widget(CondoScreen(name='condo'))
        sm.add_widget(ImpactScreen(name='impact'))
        sm.add_widget(MatchScreen(name='match'))
        sm.add_widget(BusinessScreen(name='business'))
        return sm

if __name__ == '__main__':
    BobApp().run()
