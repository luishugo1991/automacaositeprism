require 'faker'

 Dado('que o nome da tarefa é {string}') do |nome_tarefa|
    @nome_tarefa = nome_tarefa
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
  end
  
  Dado('a data de finalização será {string}') do |data_finalizacao|
    @data_tarefa = data_finalizacao
  end
  
  Dado('quero taguear esta tarefa com:') do |tags|
   @tags = tags.hashes
  end

  Dado('já foi cadastrado esta tarefa e esqueci') do
    TarefasPage.new.cadastrar(@nome_tarefa, @data_tarefa)
  end
  
  Quando('fazer o cadastro desta tarefa') do
    TarefasPage.new.cadastrar(@nome_tarefa, @data_tarefa)
  end
  
  Então('deverá ver esta tarefa com o status {string}') do |status_tarefa|
    expect(TarefasPage.new.buscar_tr(@nome_tarefa)).to have_content status_tarefa
  end

  Então('deverá ver a mensagem {string}') do |mensagem_alerta|
    expect(TarefasPage.new.alerta).to eql mensagem_alerta    
  end

  Então('deverá ver somente {int} tarefa com o nome cadastrado') do |quantidade|
    
    res = DAO.new.buscar_tarefa(@nome_tarefa, @usuario[:email])
 
    end