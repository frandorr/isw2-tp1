class DespachadorMensaje
	def initialize agenda, enviador
		@agenda = agenda
		@enviador = enviador
	end

	def despachar mensaje
		mensaje.destinatarios.each do |destinatario|:
			datos_destinatario = @agenda.entrada(destinatario)
			tel_destinatario = datos_destinatario['telefono']
			enviador.enviar(mensaje.contenido, tel_destinatario)

	end

	
	
end