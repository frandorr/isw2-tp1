require_relative "campania"
require_relative "envio"
require_relative "evento"

class CampaniaSimple < Campania
	def initialize evento, envios
        @evento_asociado = evento
        @secuencia_de_envios = envios
	end

    def imprimir 
        puts "EVENTO = #{@evento_asociado.evento_anunciado}"
        puts "CAMPANIA #1"
        puts "ENVIOS"
        for e in @secuencia_de_envios
            e.mostrarEnvio
        end
        return 2
    end
end
