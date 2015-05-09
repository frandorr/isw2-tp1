class DespachadorMensaje
	attr_reader :agenda, :enviador
	def initialize agenda, enviador
		@agenda = agenda
		@enviador = enviador
	end

	def despachar mensaje
		mensaje.destinatarios.each do |destinatario|
			tel_destinatario = @agenda.telefono(destinatario.nombre)
			enviador.enviar(mensaje.contenido, tel_destinatario)
		end
	end
end