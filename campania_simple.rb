require_relative "campania"
require_relative "envio"
require_relative "evento"
require_relative "enviador_sms"
require_relative "scheduler"
require_relative "agenda"
require_relative "despachador_mensaje"

class CampaniaSimple < Campania
	def initialize evento, plan
        @evento_asociado = evento
        @plan = plan
        @scheduler = Scheduler.new(Time.now, plan) 
	end

    def imprimir 
        puts "EVENTO = #{@evento_asociado.evento_anunciado}"
        
        puts "PLAN"
        for e in @plan
            e.mostrarEnvio
        end
        return 2
    end

    def iniciar agenda
        despachador = DespachadorMensaje.new(agenda)
        @scheduler.iniciarPlan despachador
    end

    def pasarSiguienteDia
        @scheduler.pasarSiguienteDia
    end

    def mensajesPorEnviar
        @scheduler.mensajesPorEnviar
    end
end
