import wollok.game.*
import jugador.*
import enemigos.*
import movimientoEntidades.*
import gameManager.*

class Cuarto {

}

class Entorno {

	method isSolid() = false

	method parar() {
	}

	method collide(a) {
	}
	method abrir(){}
}

object llave inherits Entorno {

	const property position = game.at(0, 0)

	method image() = "llave.png"

}
class Trampa inherits Entorno {
	const property position 
	method image()= "trampa.png"
	
	override method collide(alguien) {
		//pj.reducirVida()
		//TERMINAR
		alguien.trapped(self)
		
		game.say(self, "boom")
		game.removeVisual(self)
	}
} 

class Escotilla inherits Entorno {

	const property position = game.at(0, 0)
	var estado = cerrada

	method image() = "escotilla_" + estado.image() + ".png"

	override method abrir() {
		self.validarApertura()
		jugador.descartarItem(llave)
		estado = abierta
		gameManager.nivelCompletado()
	}

	method validarApertura() {
		if (not jugador.tieneItem(llave)) {
			self.error("A donde vas mostro??!!! La llave papi, la llave")
		}
	}

}

object cerrada {
	
	method image() = "cerrada"
	
}

object abierta {

	method image() = "abierta"

}

class Hud inherits Entorno {

	const property position = game.at(0, 0)

	override method isSolid() = true

	method image() = "hud.png"

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

class SolidObject {

	method recibirAtaque(pj) {
	}

	method isSolid() = true

	method comportamiento() {
	}

	method collide(pj) {
		pj.cambiarSentido()
	}

	method parar() {
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

