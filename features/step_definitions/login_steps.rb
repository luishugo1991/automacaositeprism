  require 'site_prism'
  Dado('que esteja na Home') do
    LoginPage.new.acessa
  end

  Quando('fazer o login com {string} e senha {string}') do |email, senha|
    Login.new.campo_email.set email 
    Login.new.campo_senha.set senha
    Login.new.botao_login.click
  end

  Então('deverá ver a mensagem de boas vindas {string}') do |mensagem|
    expect(Tarefas.new.painel).to have_content mensagem
  end

  Então('deverá ver a mensagem de alerta {string}') do |mensagem|
    expect(Login.new.alerta).to have_content mensagem
  end