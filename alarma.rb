require 'time'

class Alarma

	def initialize 		
	end

	def notificarFecha fecha
		until fecha <= Time.now
			puts "aun no se cumplio la fecha #{fecha}"			
		end 
	end
end