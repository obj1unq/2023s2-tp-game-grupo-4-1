import wollok.game.*
import jugador.*
import enemigos.*
import movimientoEntidades.*

class Entorno {

	const property isSolid = false

	method collide(a) {
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

	method recibirAtaque(a) {
	}

	method isSolid() = true

	method comportamiento() {
	}

	method collide(a) {
		a.cambiarSentido()
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

	method image() {
		if (tableroPosition.esBordeInferiorIzquierdo(position)) {
			return image + "BordeInferiorIzquierdo.png"
		}
		if (tableroPosition.esBordeSuperiorIzquierdo(position)) {
			return image + "BordeSuperiorIzquierdo.png"
		}
		if (tableroPosition.esBordeInferiorDerecho(position)) {
			return image + "BordeInferiorDerecho.png"
		}
		if (tableroPosition.esBordeSuperiorDerecho(position)) {
			return image + "BordeSuperiorDerecho.png"
		}
		if (tableroPosition.esParedDerecha(position)) {
			return image + "Derecha.png"
		}
		if (tableroPosition.esParedIzquierda(position)) {
			return image + "Izquierda.png"
		}
		if (tableroPosition.esParedSuperior(position)) {
			return image + "Arriba.png"
		}
		if (tableroPosition.esParedInferior(position)) {
			return image + "Abajo.png"
		}
		return "Muro.png" // En ningun caso tendría que llegar a cargar esta imagen
	}

}

class Piso inherits Entorno {

	const property position = game.at(0, 0)
	const property image = "Piso.png"

	method poderDeAtaque() = 0

	method recibirAtaque(a) {
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

	method image()= estado.image()

	method recibirAtaque(a) {
	}

}

object puertaCerrada {

	method image() = "PuertaCerrada.png"

}

object puertaAbierta {

	method image() = "PuertaAbierta.png"

}

