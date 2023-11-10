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
	method esBordeInferiorIzquierdo(position) {
		return position == game.origin()
	}

	method esBordeSuperiorIzquierdo(position) {
		return position.x() == 0 and position.y() == game.height() - 1
	}

	method esBordeInferiorDerecho(position) {
		return position.x() == game.width() - 1 and position.y() == 0
	}

	method esBordeSuperiorDerecho(position) {
		return position.x() == game.width() - 1 and position.y() == game.height() - 1
	}

	method esParedDerecha(position) {
		return position.x() == game.width() - 1
	}

	method esParedIzquierda(position) {
		return position.x() == 0
	}

	method esParedSuperior(position) {
		return position.y() == game.height() - 1
	}

	method esParedInferior(position) {
		return position.y() == 0
	}

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
	const image = "Pared"
	const property position = game.at(0, 0)

	method image() = "pared_text2.png" 
//	{
//		return image +
//		
//		if (tableroPosition.esBordeInferiorIzquierdo(position)) {
//			 "BordeInferiorIzquierdo"
//		}
//		else if (tableroPosition.esBordeSuperiorIzquierdo(position)) {
//			 "BordeSuperiorIzquierdo."
//		}
//		else if (tableroPosition.esBordeInferiorDerecho(position)) {
//			 "BordeInferiorDerecho"
//		}
//		else if (tableroPosition.esBordeSuperiorDerecho(position)) {
//			 "BordeSuperiorDerecho"
//		}
//		
//		
//		
//		else if (tableroPosition.esParedDerecha(position)) {
//			 "_derecha"
//		}
//		else if (tableroPosition.esParedIzquierda(position)) {
//			 "Izquierda"
//		}
//		else if (tableroPosition.esParedSuperior(position)) {
//			"Arriba"
//		}
//		else if (tableroPosition.esParedInferior(position)) {
//			 "Abajo"
//		}
//		
//		
//		else self.error("404: TEXTYRA NO ENCONTRADA ")  
//	} 

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

