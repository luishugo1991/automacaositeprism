
class LoginPage
    include Capybara::DSL

    def acessa
        visit '/login'
    end

    def cadastro
      visit '/register'
    end
end

class Login < SitePrism::Page
  element :campo_email, '#login_email'
  element :campo_senha, '#login_password'
  element :botao_login, 'button'
  element :alerta, '.alert-login'
end