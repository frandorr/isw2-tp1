require_relative "campania"
require_relative "envio"
require_relative "evento"

class CampaniaCompuesta < Campania
	def initialize hijo, envios
        @campania_hijo = hijo
        @secuencia_de_envios = envios
	end

#    def imprimir 
#        nro = @campania_hijo.imprimir
#        puts ""
#        puts "CAMPANIA ##{nro}"
#        puts "ENVIOS"
#        for e in @secuencia_de_envios
#            e.mostrarEnvio
#        end
#        return (nro+1)
#    end
end
