require_relative "../enviador"
require_relative "../mensaje"
require_relative "../alumno"

require "test/unit"

class TestEnviador < Test::Unit::TestCase

	def test_enviador
		enviador = Enviador.new
		mensaje = Mensaje.new("carlos", "contenido del mensaje")
		alumno = Alumno.new("Pepito")
		result = "Mensaje de autor #{mensaje.autor} enviado a destinatario #{alumno.nombre}"
		assert_equal(result, enviador.enviar(mensaje, alumno))
		
	end
end