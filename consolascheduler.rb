require_relative "evento"
require_relative "mensaje"
require_relative "envio"
require_relative "scheduler"
require_relative "enviador_sms"
require_relative "alumno"
require_relative "despachador_mensaje"
require_relative "entrada_agenda"
require_relative "agenda"


entrada1 = EntradaAgenda.new("Carlos", "47682909")
entrada2 = EntradaAgenda.new("Juancho", "45562819")

agenda = Agenda.new([entrada1, entrada2])

despachador = DespachadorMensaje.new(agenda)
plan = Array.new

puts "Ingrese su nombre"
autor = gets

puts "Ingrese la cantidad de mensajes a enviar:"
cantidad_mensajes = Integer(gets)


i=0
while i < cantidad_mensajes
	puts "Ingrese el contenido del mensaje #{i}:"
	contenido = gets	

	destinatarios = Array.new
	puts "Ingrese destinatario (Carlos o Juancho)"
	nombre = gets
	destinatarios << Alumno.new(nombre)

	mensaje = Mensaje.new(autor, contenido, destinatarios)
	
	puts "Ingrese fecha del mensaje con formato dd mm aaaa:"
	fecha_ingresado = gets
	diaMesAnio = fecha_ingresado.split
	fecha = Time.new(diaMesAnio.at(2),diaMesAnio.at(1),diaMesAnio.at(0))

	envio = Envio.new(fecha,mensaje)
	plan << envio
	i += 1
end

hoy = Time.now

scheduler = Scheduler.new(hoy, plan)

t1=Thread.new{scheduler.iniciarPlan despachador}

t2=Thread.new{
	while scheduler.mensajesPorEnviar > 0
		puts "Presione 1 si quiere pasar al dia siguiente"
		pasar = gets
		scheduler.pasarSiguienteDia
	end
}

t1.join
t2.join