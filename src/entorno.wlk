import wollok.game.*
import jugador.*
import enemigos.*
import movimientoEntidades.*

class Cuarto{}

class Entorno {

	const property isSolid = false

	method parar() {
	}
	

	method collide(a){}
}


class Hud inherits Entorno{

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
	const estado = puertaAbierta


	method image() = "PuertaAbierta.png"
}

object puertaCerrada {

	method image() = "PuertaCerrada.png"

}

object puertaAbierta {

	method image() = "PuertaAbierta.png"

}

