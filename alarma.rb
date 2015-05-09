require 'time'

class Alarma
	attr_reader :hoy

	def initialize hoy
		@hoy = hoy	
	end

	def notificarFecha fecha
		until fecha <= @hoy
			puts "aun no se cumplio la fecha #{fecha}, hoy es #{@hoy}"	
			sleep 5				
		end 
	end

	def pasarSiguienteDia
		@hoy += (60*60*24)
		puts "Hoy es #{@hoy}" 
	end
end