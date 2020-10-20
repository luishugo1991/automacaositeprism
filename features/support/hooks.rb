# Regex ou expressao regular
# contem => *
# termina com => $
# começa com => ^
require 'report_builder'
include Capybara::DSL

Before('@login')do

 @usuario = {email: 'luis.hugo@live.com', senha:'123456'}

 LoginPage.new.acessa
 Login.new.campo_email.set 'luis.hugo@live.com'
 Login.new.campo_senha.set '123456'
 Login.new.botao_login.click
 page.current_window.resize_to(1280, 800)
end
After('@logout') do
  Navbar.new.sair

end
After do |scenario|
  if scenario.failed?
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')    
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot="reports/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    attach("reports/screenshots/#{nome_cenario}.png", 'image/png')
end
end


at_exit do
  ReportBuilder.input_path = "cucumber.json"
  ReportBuilder.configure do |config|
     config.report_path = "reports/run"
     config.report_types = %i[json html]
   options = {
     report_title: "Automacao QA"
   }
  ReportBuilder.build_report options
  end
  end