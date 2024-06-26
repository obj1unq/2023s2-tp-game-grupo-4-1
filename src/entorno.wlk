import wollok.game.*
import jugador.*
import enemigos.*
import movimientoEntidades.*
import gameManager.*
import animatedImage.*

class Entorno {

	method isSolid() = false

	method parar() {
	}

	method collide(a) {
	}

	method abrir() {
	}
	method recibirAtaque(e){}
}

object portal inherits Entorno {

	const img = new AnimatedImage(nameImage = "Portal", frames = 10, delay = 5)

	method image() = img.image()

	method play() {
		game.sound("portal_thunder.mp3").play()
	}

	override method collide(jugador) {
		jugador.pasarPortal()
	}

}

object llave inherits Entorno {

	const property position = game.at(0, 0)

	method image() = "llave.png"

}

class Trampa inherits Entorno {

	const property position

	method image() = "trampa.png"

	override method collide(alguien) {
		alguien.trapped(self)
		game.say(self, "boom")
		game.removeVisual(self)
	}

}


object cerrada {

	method image() = "cerrada"

}

object abierta {

	method image() = "abierta"

}

class Hud inherits Entorno {

	const property position 

	override method isSolid() = true

	method image() = "hud.png"

}



class Hud_slot inherits SolidObject {
	const property position 
	
	method image() = "hud_i.png"
}

object tableroPosition {

	/*
	 * TODO: Revisar o refactorizar
	 * 
	 */
	method esEsquina(position) {
		if (position.x() == 0) {
			return position.y() == game.height() - 1 or position.y() == 0
		} else if (position.x() == game.width()) {
			return position.y() == game.height() - 1 or position.y() == 0
		} else {
			return false
		}
	}

	method esLadoDerecho(position) = position.x() > game.width() / 2

	method esLadoSuperior(position) = position.y() > game.height() / 2

}

class SolidObject inherits Entorno {

	override method isSolid() = true

	method comportamiento() {
	}

}

class Pared inherits SolidObject {

	/*
	 * Determina la imagen segun la propiedad position
	 */
	const property position = game.at(0, 0)

	method image() = "Pared.png"

}

class Pasto inherits Entorno {

	const property position = game.at(0, 0)
	const property image = "pasto-" + self.texturaRandom() + ".png"

	method texturaRandom() {
		const valorRandom = (1 .. 2).anyOne()
		return if (valorRandom == 1) 0 else (1 .. 14).anyOne()
	}

}

class ObstaculoPared inherits SolidObject {

	const property position = game.at(0, 0)
	const property image = "Obstaculo_pared.png"

}

class Obstaculo inherits SolidObject {

	const property position = game.at(0, 0)
	const property image = "Obstaculo.png"

}

class Puerta inherits Entorno {

	const property position = game.center()
	const estado = puertaCerrada

	override method isSolid() = estado.isSolid()

	method image() = estado.image()

}

object puertaCerrada {

	method image() = "PuertaCerrada.png"

	method isSolid() = true

}

object puertaAbierta {

	method isSolid() = false

	method image() = "PuertaAbierta.png"

}

