class EntradaAgenda
	attr_reader :nombre, :telefono
	def initialize nombre, telefono
		@nombre = nombre
		@telefono = telefono
	end

	def tiene_nombre? nombre
		return @nombre == nombre
	end

end