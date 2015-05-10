require_relative "campania"
require_relative "envio"
require_relative "evento"
require_relative "scheduler"
require_relative "agenda"
require_relative "despachador_mensaje"

class CampaniaSimple < Campania
	def initialize evento, plan
        @evento_asociado = evento        
        @scheduler = Scheduler.new plan 
	end

    def iniciar agenda
        despachador = DespachadorMensaje.new(agenda)
        @scheduler.iniciarPlan despachador
    end

    def pasarSiguienteDia
        @scheduler.pasarSiguienteDia
    end

    def mensajesPorEnviar
        @scheduler.tareasPorRealizar
    end
    
    def setearEficacia eficacia
        @eficacia = eficacia
    end
    
    def obtenerEficacia
    	@eficacia
    end
    
end
