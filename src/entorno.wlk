import wollok.game.*
import jugador.*
import enemigos.*
import movimientoEntidades.*

class Entorno {

	const property isSolid = false

	method collide(pj) {
	}

	method comportamiento() {
	}

	method parar() {
	}
	


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
	
	method esLadoDerecho(position)=position.x() > game.width()  / 2
	method esLadoSuperior(position)=position.y() > game.height() / 2
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
	const property image = "pasto-"+self.texturaRandom()+".png"


	method texturaRandom() {
		const valorRandom = (1..2).anyOne()
		
		return 
			if (valorRandom == 1) 0
			else (1..14).anyOne() 
		
	} 
	
	method poderDeAtaque() = 0

	method recibirAtaque(pj) {
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

	const property position = 0
	const estado = puertaAbierta

	method poderDeAtaque() = 0

	method imagen() = estado.image()

	method recibirAtaque(a) {
	}

}

object puertaCerrada {

	method image() = "PuertaCerrada.png"

}

object puertaAbierta {

	method image() = "PuertaAbierta.png"

}

