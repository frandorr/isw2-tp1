require_relative "evento"
require_relative "mensaje"
require_relative "item_plan"
require_relative "campania_simple"
require_relative "alumno"
require_relative "entrada_agenda"
require_relative "agenda"
require_relative "plan"

def ingresoAutor
	puts "Ingrese su nombre"
	autor = gets
	puts "Autor : #{autor}"
	autor
end

def agenda	
	entrada1 = EntradaAgenda.new("Carlos", "47682909")
	entrada2 = EntradaAgenda.new("Juancho", "45562819")
	agenda = Agenda.new([entrada1, entrada2])
	agenda
end

def ingresoEvento
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
	evento = eventos.at(numeroEventoSeleccionado-1)
	puts "Evento seleccionado:  #{evento.evento_anunciado}"
	evento
end

def ingresoFrecuenciaEnvio
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
	frecuenciaEnvio
end

def ingresoPlan autor, frecuenciaEnvio
	#Mensajes
	puts "Ingrese la cantidad de mensajes a enviar:"
	cantidadMensajes= Integer(gets)

	items_plan = Array.new

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
		
		items_plan << ItemPlan.new(fecha,mensaje)
		
		i += 1
		fecha += (60*60*24*frecuenciaEnvio)
	end
	plan = Plan.new(items_plan)
end

#Inicio de la ejecucion

autor = ingresoAutor
evento = ingresoEvento
frecuenciaEnvio = ingresoFrecuenciaEnvio
plan = ingresoPlan(autor, frecuenciaEnvio)

#Campania
camp = CampaniaSimple.new(evento, plan)

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

puts "Campaña finalizada"
puts "Ingrese el valor de la evaluacion: "
camp.setearEficacia Integer(gets)

puts "Evaluacion de campaña: #{camp.obtenerEficacia}"