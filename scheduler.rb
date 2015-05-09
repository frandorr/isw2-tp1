require_relative 'alarma'
require_relative "envio"

class Scheduler
	attr_reader :plan
	attr_reader :mensajesPorEnviar

	def initialize hoy, plan, enviador, destinatarios
		@alarma = Alarma.new hoy
		@plan = plan
		@enviador =  enviador
		@destinatarios = destinatarios		
		@mensajesPorEnviar = plan.length
	end

	def iniciarPlan	
		@plan.sort! {|a,b| a.fecha_de_envio <=> b.fecha_de_envio}

		@plan.each do |envio|
			#Se llama a la alarma			
			@alarma.notificarFecha(envio.fecha_de_envio)

			#Salio de la alarma quiere decir que llego la fecha
			puts "Se cumplio la fecha #{envio.fecha_de_envio}"

			#Se envia el mensaje correspondiente	
			puts @enviador.enviar(envio.mensaje, @destinatarios)
			@mensajesPorEnviar -= 1
		end
	end

	def pasarSiguienteDia
		@alarma.pasarSiguienteDia
	end
end 