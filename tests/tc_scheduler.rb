require_relative "../scheduler"
require_relative "../enviador_sms"
require_relative "../mensaje"
require_relative "../alumno"
require 'time'

require "test/unit"

class TestEnviador < Test::Unit::TestCase

	def test_enviador
		enviador = EnviadorSms.new
		alumno1 = Alumno.new("Pepito")
		alumno2 = Alumno.new("Joe")
		destinatarios = [alumno1,alumno2]
		fecha1 = Time.new(2015, 05, 9)
		fecha2 = Time.new(2015, 05, 2) 
		fecha3 = Time.new(2015, 05, 1)
		mensaje1 = Mensaje.new("Prof Carlos", "No se olviden de estudiar")
		mensaje2 = Mensaje.new("Prof Hugo", "Maniana salida al museo")
		mensaje3 = Mensaje.new("Prof Sorete", "Lalala")
		plan = {fecha1=>mensaje1, fecha2=>mensaje2, fecha3=>mensaje3}
		scheduler = Scheduler.new(plan, enviador, destinatarios)
		scheduler.iniciarPlan
		
	end
end