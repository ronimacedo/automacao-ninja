class LoginPage
        include Capybara::DSL
        
        def visita
            visit "http://mark7.herokuapp.com/login"
        end

        def com(email,senha)
            find('#login_email').set email
            find('input[name=password').set senha
            click_button 'Login'
        end
   

        def alerta
            find('.alert-login').text
        end

end