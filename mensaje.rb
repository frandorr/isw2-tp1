# Clase que representa a un mensaje
class Mensaje
	attr_reader :autor, :contenido	

	def initialize autor, contenido 
		@autor = autor
		@contenido = contenido
	end
	
end