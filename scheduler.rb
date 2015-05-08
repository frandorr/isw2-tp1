require_relative 'alarma'

class Scheduler
	attr_reader :plan

	def initialize plan, enviador, destinatarios
		@plan = plan
		@enviador =  enviador
		@destinatarios = destinatarios		
	end

	def iniciarPlan
		@plan.keys.sort.each do |fecha, mensaje|
			#Se llama a la alarma
			puts "Esperando que sea la fecha #{fecha}"
			
			alarma = Alarma.new(fecha)

			alarma.iniciar()

			#Salio de la alarma quiere decir que llego la fecha
			puts @enviador.enviar(mensaje, @destinatarios)
		end
	end
end 