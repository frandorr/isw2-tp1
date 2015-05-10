class Plan
	attr_reader :items_plan
	
	def initialize 
		@items_plan = Array.new
	end
	
	def initialize items
		@items_plan = items
	end
	
	def agregarItemsDePlan plan
		@items_plan.concat(plan.items_plan)
	end
end