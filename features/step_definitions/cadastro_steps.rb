require 'faker'

Dado('que esteja no Formulário de Cadastro') do
    LoginPage.new.cadastro
  end
  
  Dado('possuir os seguintes dados nome:{string} email:{string} e senha:{string}') do |nome, email, senha|
    
    CadastroPage.new.campo_nome.set nome
    email = email + Faker::Lorem.characters(number: 4)
    CadastroPage.new.campo_email.set email
    CadastroPage.new.campo_senha.set senha
    
    
  end
  
  Quando('fazer o Cadastro') do
    CadastroPage.new.botao_cadastrar.click
    sleep 5
  end

  Então('deverá ver uma mensagem {string}') do |mensagem|
    expect(CadastroPage.new.alertamensagem).to have_content mensagem
  end

  Então('deverá ver essa mensagem {string}') do |erromsg|
    
    expect(CadastroPage.new.alertaerro).to have_content erromsg
  end