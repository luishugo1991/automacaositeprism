require 'mongo'

class DAO
    attr_accessor :client
    def initialize
        @client = Mongo::Client.new('mongodb://127.0.0.1:27017/markdb')  
    end

    def obter_usuario(email)
        users = @client[:users]
        users.find('profile.email' => email).first
    end

    def buscar_tarefa(nome, email)
        user = obter_usuario(email)
        tasks = @client[:tasks]
       
        tasks.find('title' => nome, 'createdBy' => user[:_id])
    end

    def remover_tarefas(nome, email)
        user = obter_usuario(email)
        tasks = client[:tasks]
        tasks.delete_one('title' => nome, 'createdBy' => user[:_id])
    end
end
