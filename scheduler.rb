require_relative 'alarma'

class Scheduler
	attr_reader :plan

	def initialize plan, enviador, destinatarios
		@plan = plan
		@enviador =  enviador
		@destinatarios = destinatarios		
	end

	def iniciarPlan
		alarma = Alarma.new
		@plan.keys.sort.each do |fecha, mensaje|
			#Se llama a la alarma
			puts "Esperando que sea la fecha #{fecha}"
			
			alarma.notificarFecha(fecha)

			#Salio de la alarma quiere decir que llego la fecha
			puts @enviador.enviar(mensaje, @destinatarios)
		end
	end
end 