require_relative "../scheduler"
require_relative "../enviador_sms"
require_relative "../mensaje"
require_relative "../alumno"
require_relative "../fecha"
require_relative "../envio"

require 'time'

require "test/unit"

class TestEnviador < Test::Unit::TestCase

	def test_enviador
		enviador = EnviadorSms.new
		alumno1 = Alumno.new("Pepito")
		alumno2 = Alumno.new("Joe")
		destinatarios = [alumno1,alumno2]
	
		f1 = Time.new(2015, 05, 10)
		f2 = Time.new(2015, 05, 2) 
		f3 = Time.new(2015, 05, 1)
		
		m1 = Mensaje.new("Prof Carlos", "No se olviden de estudiar")
		m2 = Mensaje.new("Prof Hugo", "Maniana salida al museo")
		m3 = Mensaje.new("Prof Sorete", "Lalala")

		env1 = Envio.new(f1,m1)
		env2 = Envio.new(f2,m2)
		env3 = Envio.new(f3,m3)

		plan = [env1,env2,env3]
		scheduler = Scheduler.new(Time.now,plan, enviador, destinatarios)
		
		scheduler.pasarSiguienteDia
		scheduler.pasarSiguienteDia

		scheduler.iniciarPlan
		
	end
end