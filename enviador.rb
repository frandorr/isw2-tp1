require "singleton"

class Enviador
	include Singleton
	
	def enviar contenido, telefono
		puts "Se envió '#{contenido}' al #{telefono}"
	end	
end