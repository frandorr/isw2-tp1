require 'time'

class Alarma

	def initialize fecha
		@fecha = fecha		
	end

	def iniciar()
		until @fecha <= Time.now
			puts "aun no se cumplio la fecha #{@fecha}"			
		end 
	end
end