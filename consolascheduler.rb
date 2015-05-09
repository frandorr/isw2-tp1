require_relative "evento"
require_relative "mensaje"
require_relative "envio"
require_relative "scheduler"
require_relative "enviador_sms"
require_relative "alumno"

puts "Ingrese su nombre"
autor = gets


puts "Ingrese la cantidad de mensajes a enviar:"

cantidadMensajes= Integer(gets)

plan = Array.new

i=0
while i < cantidadMensajes
	puts "Ingrese el contenido del mensaje a enviar:"
	contenido = gets	

	destinatarios = Array.new
	
	puts "Ingrese destinatario"
	destinatarios << Alumno.new(gets)

	mensaje = Mensaje.new(autor, contenido, destinatarios)
	
	puts "Ingrese fecha del mensaje con formato dd mm aaaa:"
	fechaIngresado = gets
	diaMesAnio = fechaIngresado.split
	fecha = Time.new(diaMesAnio.at(2),diaMesAnio.at(1),diaMesAnio.at(0))

	envio = Envio.new(fecha,mensaje)
	plan << envio

	i += 1
end

enviador = EnviadorSms.new
hoy = Time.now

scheduler = Scheduler.new(hoy, plan, enviador)

t1=Thread.new{scheduler.iniciarPlan}

t2=Thread.new{
	while scheduler.mensajesPorEnviar > 0
		puts "Presione 1 si quiere pasar al dia siguiente"
		pasar = gets
		scheduler.pasarSiguienteDia
	end
}

t1.join
t2.join