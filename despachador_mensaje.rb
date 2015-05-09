class DespachadorMensaje
	def initialize agenda, enviador
		@agenda = agenda
		@enviador = enviador
	end

	def despachar mensaje
		mensaje.destinatarios.each do |destinatario|:
			tel_destinatario = @agenda.telefono(destinatario)
			enviador.enviar(mensaje.contenido, tel_destinatario)

	end

	
	
end