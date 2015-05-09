require_relative "evento"
require_relative "mensaje"
require_relative "envio"
require_relative "campania_simple"
require_relative "alumno"
require_relative "entrada_agenda"
require_relative "agenda"
#
#Agenda
entrada1 = EntradaAgenda.new("Carlos", "47682909")
entrada2 = EntradaAgenda.new("Juancho", "45562819")

#Eventos
eventos = [	
			Evento.new("prueba de matematica, me puse la gorra"), 
			Evento.new("colecta para inundados")
		]

agenda = Agenda.new([entrada1, entrada2])

#Autor de los mensajes
puts "Ingrese su nombre"
autor = gets
puts "Autor : #{autor}"

numeroEvento = 1		
eventos.each do |evento|
	puts "#{numeroEvento} - #{evento.evento_anunciado}"
	numeroEvento +=1
end

puts "Seleccionar evento:"

numeroEventoSeleccionado= Integer(gets)

eventoSeleccionado = eventos.at(numeroEventoSeleccionado-1)
puts "Evento seleccionado:  #{eventoSeleccionado.evento_anunciado}"

#Tipo campania. Con mensajes Diarios o Semanales
puts "Seleccione tipo de campaña. Los mensajes se eviaran con la frecuencia indicada empezando por hoy."
puts "1 - Con mensajes Diarios"
puts "2 - Con mensajes Semanales"
tipoCampania = Integer(gets)

#Se define la frecuencia de envio segun el tipo de campaña seleccionada
case tipoCampania
when 1
	frecuenciaEnvio = 1
when 2
	frecuenciaEnvio = 7
end

#Mensajes
puts "Ingrese la cantidad de mensajes a enviar:"
cantidadMensajes= Integer(gets)

plan = Array.new

i=1
fecha = Time.now
while i <= cantidadMensajes
	puts "Ingrese el contenido del mensaje numero #{i} a enviar:"
	contenido = gets	

	destinatarios = Array.new
	
	puts "Ingrese cantidad destinatarios"
	cantidadDestinatarios= Integer(gets)	
	j=1
	while j <= cantidadDestinatarios
		puts "Ingrese destinatario numero #{j} (Juancho o Carlos)"
		destinatarios << Alumno.new(gets)
		j += 1;
	end	
	mensaje = Mensaje.new(autor, contenido, destinatarios)
	
#	puts "Ingrese fecha del mensaje con formato dd mm aaaa:"
#	fechaIngresado = gets
#	diaMesAnio = fechaIngresado.split
#	fecha = Time.new(diaMesAnio.at(2),diaMesAnio.at(1),diaMesAnio.at(0))

	envio = Envio.new(fecha,mensaje)
	plan << envio

	i += 1
	fecha += (60*60*24*frecuenciaEnvio)
end

#Campania
camp = CampaniaSimple.new(eventoSeleccionado,plan)

puts "Presione una tecla para iniciar la campaña"
gets

t1=Thread.new{camp.iniciar agenda}

t2=Thread.new{
	while camp.mensajesPorEnviar > 0
		puts "Presione 1 si quiere pasar al dia siguiente"
		gets
		camp.pasarSiguienteDia
	end
}

t1.join
t2.join