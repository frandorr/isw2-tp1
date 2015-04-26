require_relative "../enviador_sms"
require_relative "../mensaje"
require_relative "../alumno"

require "test/unit"

class TestEnviador < Test::Unit::TestCase

	def test_enviador
		enviador_sms = EnviadorSms.new
		mensaje1 = Mensaje.new("Prof Carlos", "No se olviden de estudiar")
		alumno1 = Alumno.new("Pepito")
		alumno2 = Alumno.new("Joe")
		assert_equal("SMS enviado", enviador_sms.enviar(mensaje1, [alumno1, alumno2]))
		mensaje2 = Mensaje.new("Prof Hugo", "Mañana salida al museo")
		assert_equal("SMS enviado", enviador_sms.enviar(mensaje2, [alumno2]))
		puts enviador_sms.mensajes_enviados
		
	end
end