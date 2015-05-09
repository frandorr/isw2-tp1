require_relative "evento"
require_relative "mensaje"
require_relative "envio"
require_relative "campania_simple"

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
	puts "Ingrese el contenido del mensaje a enviar:"
	contenido = gets	
	mensaje = Mensaje.new(autor, contenido)
	
	puts "Ingrese fecha del mensaje con formato dd mm aaaa:"
	fechaIngresado = gets
	diaMesAnio = fechaIngresado.split
	fecha = Time.new(diaMesAnio.at(2),diaMesAnio.at(1),diaMesAnio.at(0))

	envio = Envio.new(fecha,mensaje)
	plan << envio

	i += 1
end

camp = CampaniaSimple.new(eventoSeleccionado,plan)
camp.imprimir