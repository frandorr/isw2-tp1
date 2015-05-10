require_relative "enviador"
class DespachadorMensaje

	def initialize agenda
		@agenda = agenda
		@enviador = Enviador.instance
	end

	def despachar mensaje
		mensaje.destinatarios.each do |destinatario|
			tel_destinatario = @agenda.telefono(destinatario.nombre)
			puts "dest nombre #{destinatario.nombre} y su tel #{tel_destinatario}"
			@enviador.enviar(mensaje.contenido, tel_destinatario)
		end
	end
end