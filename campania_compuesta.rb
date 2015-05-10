require_relative "campania"
require_relative "envio"
require_relative "evento"

class CampaniaCompuesta < Campania
	def initialize hijos, envios
    @campanias_hijos = hijos
    @secuencia_de_envios = envios
	end
	
	def obtenerEficacia
		eficacia = 0
    	@campania_hijos.each do |campania|
			eficacia += campania.obtenerEficacia
		end	
		return eficacia/@campania_hijos.length
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
