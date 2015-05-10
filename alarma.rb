require 'time'

class Alarma
	attr_reader :hoy

	def initialize
		@hoy = Time.now	
	end

	def notificarFecha fecha
		until fecha <= @hoy
			puts "aun no se cumplio la fecha #{fecha.strftime('%d/%m/%Y')}, hoy es #{@hoy.strftime('%d/%m/%Y')}"	
			sleep 5				
		end

	end

	def pasarSiguienteDia
		@hoy += (60*60*24)
		puts "Hoy es #{@hoy.strftime('%d/%m/%Y')}" 
	end
end