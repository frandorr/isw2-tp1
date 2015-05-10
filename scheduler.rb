require_relative 'alarma'

class Scheduler
	attr_reader :plan
	attr_reader :tareasPorRealizar

	def initialize plan
		@alarma = Alarma.new
		@plan = plan.sort! {|a,b| a.fecha <=> b.fecha}
		@tareasPorRealizar = plan.length
	end

	def iniciarPlan despachador
		@plan.each do |item|
			#Se llama a la alarma			
			@alarma.notificarFecha(item.fecha)

			#Salio de la alarma quiere decir que llego la fecha
			puts "Se cumplio la fecha #{item.fecha.strftime('%d/%m/%Y')}"

			#Se despacha el mensaje correspondiente	
			despachador.despachar(item.tarea)
			@tareasPorRealizar -= 1
		end
	end

	def pasarSiguienteDia
		@alarma.pasarSiguienteDia
	end
end 