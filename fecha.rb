require "time" 

class Fecha 
	def initialize dia, mes, anio
    @fecha = Time.gm(anio,mes,dia)
	end

  def fecha
    @fecha.strftime "%d/%m/%Y"
  end
end