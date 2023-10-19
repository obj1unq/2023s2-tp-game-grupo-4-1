import wollok.game.*
import entorno.*
import jugador.*
import movimientoPersonaje.*

class Enemigo {
	var vida = 0
	var poderDeAtaque = 0
	var property position = null
	method position()
	method image()
}
class Guardia inherits Enemigo {
	override method image()="guardia.png"
}



