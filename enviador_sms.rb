require_relative 'enviador'

class EnviadorSms < Enviador
	def enviar mensaje, destinatarios
		@mensajes_enviados[mensaje] = destinatarios
		"SMS enviado"
	end

end