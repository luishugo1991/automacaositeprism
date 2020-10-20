class CadastroPage < SitePrism::Page
  element :campo_nome, '#register_name'
  
  element :campo_email, '#register_email'
  element :campo_senha, '#register_password'
  element :botao_cadastrar, 'button[type=submit]'
  element :alertamensagem, '#task-board'
  element :alertaerro, '.alert-message'
end