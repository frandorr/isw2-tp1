require_relative 'alarma'
require_relative "envio"

class Scheduler
	attr_reader :plan
	attr_reader :tareasPorRealizar

	def initialize plan
		@alarma = Alarma.new
		@plan = plan
		@tareasPorRealizar = plan.length
	end

	def iniciarPlan despachador
		@plan.sort! {|a,b| a.fecha_de_envio <=> b.fecha_de_envio}

		@plan.each do |tarea|
			#Se llama a la alarma			
			@alarma.notificarFecha(tarea.fecha_de_envio)

			#Salio de la alarma quiere decir que llego la fecha
			puts "Se cumplio la fecha #{tarea.fecha_de_envio.strftime('%d/%m/%Y')}"

			#Se despacha el mensaje correspondiente	
			despachador.despachar(tarea.mensaje)
			@tareasPorRealizar -= 1
		end
	end

	def pasarSiguienteDia
		@alarma.pasarSiguienteDia
	end
end 