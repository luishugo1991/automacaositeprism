    Dado('que esteja autenticado com {string} e {string}') do |email, senha|
      LoginPage.new.acessa
      Login.new.campo_email.set email 
      Login.new.campo_senha.set senha
      Login.new.botao_login.click
    end

    Dado('que esteja em Perfil') do
      Sidebar.new.acessa_perfil
    end

    Quando('completar o cadastro com {string} e {string}') do |empresa, cargo|
      Perfil.new.empresa.set empresa
      Perfil.new.cargo.set cargo
      Perfil.new.cargo.click
      Perfil.new.botao.click
    end

    Então('deverá ver a mensagem de atualização cadastral:') do |mensagem|
      expect(Perfil.new.alerta).to have_content mensagem
    end