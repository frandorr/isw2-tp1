require_relative "campania"
require_relative "envio"
require_relative "evento"

class CampaniaSimple < Campania
	def initialize evento, plan
        @evento_asociado = evento
        @plan = plan
	end

    def imprimir 
        puts "EVENTO = #{@evento_asociado.evento_anunciado}"
        
        puts "PLAN"
        for e in @plan
            e.mostrarEnvio
        end
        return 2
    end
end
