class Agenda
	attr_reader :entradas
	def initialize entradas
		@entradas = entradas
	end

	def telefono nombre
		@entradas.each do |entrada|
			if (entrada.nombre.strip.eql? nombre.strip)
				return entrada.telefono
			end
		end		
	end	
	
end