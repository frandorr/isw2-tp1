require_relative "evento"

eventos = [	
			Evento.new("prueba de matematica, me puse la gorra"), 
			Evento.new("colecta para inundados")
		]

numeroEvento = 1		
eventos.each do |evento|
	puts "#{numeroEvento} - #{evento.evento_anunciado}"
	numeroEvento +=1
end


print "Seleccionar evento:"
ingresado = gets
numeroEventoSeleccionado= Integer(ingresado)

eventoSeleccionado = eventos.at(numeroEventoSeleccionado-1)
puts "Evento seleccionado:  #{eventoSeleccionado.evento_anunciado}"