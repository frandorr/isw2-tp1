require_relative 'alarma'
require_relative "envio"

class Scheduler
	attr_reader :plan

	def initialize plan, enviador, destinatarios
		@plan = plan
		@enviador =  enviador
		@destinatarios = destinatarios		
	end

	def iniciarPlan
		alarma = Alarma.new
		@plan.sort! {|a,b| a.fecha_de_envio <=> b.fecha_de_envio}

		@plan.each do |envio|
			#Se llama a la alarma
			puts "Esperando que sea la fecha #{envio.fecha_de_envio}"
	
			alarma.notificarFecha(envio.fecha_de_envio)

			#Salio de la alarma quiere decir que llego la fecha
			puts @enviador.enviar(envio.mensaje, @destinatarios)
		end
	end
end 