require_relative "campania"
require_relative "evento"
require_relative "plan"
require_relative "scheduler"
require_relative "despachador_mensaje"


class CampaniaCompuesta < Campania
	def initialize hijos
     @campanias_hijos = hijos
	end
	
	def obtenerEficacia
		eficacia = 0
    	@campania_hijos.each do |campania|
			eficacia += campania.obtenerEficacia
		end	
		return eficacia/@campania_hijos.length
    end

    def planCompuesto
        plan = Plan.new
        @campania_hijos.each do |campania|
            plan.agregarItemsDePlan(campania.plan)
        end 
        plan
    end

    def iniciar agenda
        scheduler = Scheduler.new planCompuesto
        despachador = DespachadorMensaje.new(agenda)
        scheduler.iniciarPlan despachador
    end

end
