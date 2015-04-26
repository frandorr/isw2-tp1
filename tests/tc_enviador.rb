require_relative "../enviador_sms"
require_relative "../mensaje"
require_relative "../alumno"

require "test/unit"

class TestEnviador < Test::Unit::TestCase

	def test_enviador
		enviador_sms = EnviadorSms.new
		mensaje = Mensaje.new("carlos", "contenido del mensaje")
		alumno1 = Alumno.new("Pepito")
		alumno2 = Alumno.new("Joe")
		result = "SMS enviado"
		assert_equal(result, enviador_sms.enviar(mensaje, [alumno1, alumno2]))
		
	end
end