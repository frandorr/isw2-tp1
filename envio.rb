require_relative "mensaje"
require_relative "fecha"

class Envio 
	attr_reader :fecha_de_envio
	attr_reader :mensaje

	def initialize fecha, mensaje
    @fecha_de_envio = fecha
    @mensaje = mensaje
	end

  def mostrarEnvio
    puts "#{@fecha_de_envio} - #{@mensaje.autor} - #{@mensaje.contenido}"
  end
end
