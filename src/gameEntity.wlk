import hitBox.*
import wollok.game.*

class GameEntity {

	var vida = 0
	const velocidad = 1
	const hitBox = new HitBox(entity = self)
	const property poderDeAtaque = 1
	var property position = null
	const property isSolid = false
	method tieneMoneda()=false
	method image()

	method comportamiento() {
	}

	method collide(a)

	method recibirAtaque(a) {
	}

	method parar()

}

