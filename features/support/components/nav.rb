#Programação reativa - O que atualiza é somente o corpo , menu e barra lateral se mantem.
class NavComponent
    include Capybara::DSL

    def nav_menu
        find('a[href*=dropdown]')

    end

    def sair
        nav_menu.click
        click_Link 'Sair'
    end

    def meu_perfil
       nav_menu.click
        click_Link 'Meu Perfil'
    end

end