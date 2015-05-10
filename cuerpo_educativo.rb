#Clase que representa a un integrante del Cuerpo Educativo (Docente, Director, Secretario)
class CuerpoEducativo

	def nuevoMensaje(contenido, destinatarios)
		mensaje = Mensaje.new(self, contenido, destinatarios)
		return mensaje
	end

end
