require_relative "mensaje"
require_relative "fecha"

class Envio 
	def initialize fecha, mensaje
	    @fecha_de_envio = fecha
        @aviso = mensaje
	end

    def mostrarEnvio
        puts "#{@fecha_de_envio.fecha} - #{@aviso.contenido}"
    end
end
