# Clase que representa a un mensaje
class Mensaje
	attr_reader :autor, :contenido, :destinatarios	

	def initialize autor, contenido, destinatarios 
		@autor = autor
		@contenido = contenido
		@destinatarios = destinatarios
	end
	
end