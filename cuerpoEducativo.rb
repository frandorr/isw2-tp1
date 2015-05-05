#Clase que representa a un integrante del Cuerpo Educativo (Docente, Director, Secretario)
class CuerpoEducativo

	def nuevoMensaje(contenido, destinatario)
		mensaje = Mensaje.new(contenido, destinatario)
		return mensaje
	end

end
