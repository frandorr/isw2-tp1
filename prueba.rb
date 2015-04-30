require_relative "fecha"
require_relative "envio"
require_relative "evento"
require_relative "campaniaSimple"
require_relative "campaniaCompuesta"

f1 = Fecha.new(1,1,2000)
f2 = Fecha.new(2,2,2001)
f3 = Fecha.new(3,3,2003)
f4 = Fecha.new(4,4,2007)

m1 = Mensaje.new("Carlo Bianchi", "Libertadores 2000")
m2 = Mensaje.new("Martin Palermo", "Libertadores 2001")
m3 = Mensaje.new("Guillermo Barros Schelotto", "Libertadores 2003")
m4 = Mensaje.new("Miguel Angel Russo", "Libertadores 2007")

env1 = Envio.new(f1,m1)
env2 = Envio.new(f2,m2)
env3 = Envio.new(f3,m3)
env4 = Envio.new(f4,m4)

event = Evento.new("prueba de matematica, me puse la gorra")

camps = CampaniaSimple.new(event,[env1,env2])
campc = CampaniaCompuesta.new(camps,[env3,env4])

campc.imprimir




