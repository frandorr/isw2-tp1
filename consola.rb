require_relative "evento"
require_relative "mensaje"
require_relative "envio"
require_relative "campania_simple"
require_relative "alumno"

puts "Ingrese su nombre"
autor = gets
puts "Autor : #{autor}"

eventos = [	
			Evento.new("prueba de matematica, me puse la gorra"), 
			Evento.new("colecta para inundados")
		]

numeroEvento = 1		
eventos.each do |evento|
	puts "#{numeroEvento} - #{evento.evento_anunciado}"
	numeroEvento +=1
end

puts "Seleccionar evento:"

numeroEventoSeleccionado= Integer(gets)

eventoSeleccionado = eventos.at(numeroEventoSeleccionado-1)
puts "Evento seleccionado:  #{eventoSeleccionado.evento_anunciado}"

puts "Ingrese la cantidad de mensajes a enviar:"
cantidadMensajes= Integer(gets)

plan = Array.new

i=0
while i < cantidadMensajes
	puts "Ingrese el contenido del mensaje numero #{i} a enviar:"
	contenido = gets	

	destinatarios = Array.new
	
	puts "Ingrese cantiadad destinatarios"
	cantidadDestinatarios= Integer(gets)	
	j=0
	while j < cantidadDestinatarios
		puts "Ingrese destinatario numero #{j}"
		destinatarios << Alumno.new(gets)
		j += 1;
	end	
	mensaje = Mensaje.new(autor, contenido, destinatarios)
	
	puts "Ingrese fecha del mensaje con formato dd mm aaaa:"
	fechaIngresado = gets
	diaMesAnio = fechaIngresado.split
	fecha = Time.new(diaMesAnio.at(2),diaMesAnio.at(1),diaMesAnio.at(0))

	envio = Envio.new(fecha,mensaje)
	plan << envio

	i += 1
end

camp = CampaniaSimple.new(eventoSeleccionado,plan)

puts "Presione una tecla para iniciar la campaña"
gets

t1=Thread.new{camp.iniciar}

t2=Thread.new{
	while camp.mensajesPorEnviar > 0
		puts "Presione 1 si quiere pasar al dia siguiente"
		gets
		camp.pasarSiguienteDia
	end
}

t1.join
t2.join