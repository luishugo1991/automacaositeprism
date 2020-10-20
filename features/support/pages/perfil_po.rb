class Perfil < SitePrism::Page
  element :alerta, '.alert-login'
  element :empresa, '#profile-company'
  element :cargo, 'select[name$=job]'
  element :botao, 'button'
end