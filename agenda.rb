class Agenda
	def initialize entradas
		@entradas = entradas
	end

	def telefono nombre
			@entradas.each do |entrada|:
				if (entrada.tiene_nombre? nombre)
					return entrada.telefono					
	end	
	
end