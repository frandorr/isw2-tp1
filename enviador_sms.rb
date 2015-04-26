require_relative 'enviador'

class EnviadorSms < Enviador
	def enviar mensaje, destinatarios
		"SMS enviado"
	end
	
end