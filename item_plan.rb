class ItemPlan 
	attr_reader :fecha
	attr_reader :tarea

	def initialize fecha, tarea
    @fecha = fecha
    @tarea = tarea
	end

end