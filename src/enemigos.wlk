import wollok.game.*
import entorno.*
import jugador.*
import movimientoEntidades.*
import gameEntity.*

class Enemigo inherits GameEntity {

	override method collide(entity) {
		entity.recibirAtaque(self)
	}

	method comportamiento()
	override method isSolid() = true
}

class Guardia inherits Enemigo {

	/*
	 * Los guardias son enemigos que no se 
	 * mueven de la puerta y atacan al jugador
	 * a menos que el jugador tenga una moneda
	 */
	override method image() = "guardia.png"

	override method parar() {
	}

	override method comportamiento() {
	}

}

class Kamikaze inherits Enemigo {

	override method image() = "kamikaze.png"
	
	override method parar() {
	}

	override method comportamiento() {
		if(self.position() != jugador.position()){			
			self.avanzarHaciaElJugador()
		}
	}

	method avanzarHaciaElJugador() {
		const jugadorP = jugador.position()
		self.posicionEnXHastaElJugador(jugadorP.x())
		self.posicionEnYHastaElJugador(jugadorP.y())
	}
	method posicionEnXHastaElJugador(posicionx) {
		if (position.x() < posicionx) {
			self.position(direcciones.derecha(self.position() ))
		} else {
			self.position(direcciones.izquierda(self.position() ))
		}
	}

	method posicionEnYHastaElJugador(posiciony) {
		if (position.y() < posiciony) {
			self.position(direcciones.arriba(self.position() ))
		} else {
			self.position(direcciones.abajo(self.position() ))
		}
	}

}

class Vigilante inherits Enemigo {

	/*
	 * Los Vigilantes son enemigos que 
	 * rondan por todo el mapa
	 */
	var direccion = caminadoAlaDerecha

	override method image() = direccion.image("vigilante")

	override method comportamiento() {
		self.cambiarSentido()
		self.position(direccion.siguientePosicion(self.position()))
		hitBox.updatePosition()
	}

	override method parar() {
		game.removeTickEvent("avanzarVigilante")
	}

	method cambiarSentido() {
		if (not direccion.hayProximaCelda(self.position())) {
			direccion = direccionAleatoria.generarDireccion(self.position())
		}
	}

}

object direccionAleatoria {

	const direcctions = [ caminandoAlaIzquierda, caminadoAlaDerecha, caminadoArriba, caminadoAbajo ]

	method generarDireccion(position) {
		direcctions.reverse()
		return self.direccionesValidas(position).anyOne()
	}

	method direccionesValidas(position) {
		/*Toma una lista de direcciones y devuelve unicamente las direcciones
		 * en las que el existe 1 celda en x direccion
		 */
		return direcctions.filter({ dir => dir.hayProximaCelda(position) })
	}

}

object caminandoAlaIzquierda {

	method image(img) = img + "_left.png"

	method siguientePosicion(position) = position.left(1)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

object caminadoAlaDerecha {

	method image(img) = img + "_right.png"

	method siguientePosicion(position) = position.right(1)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

object caminadoArriba {

	method image(img) = img + "_right.png"

	method siguientePosicion(position) = position.up(1)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

object caminadoAbajo {

	method image(img) = img + "_right.png"

	method siguientePosicion(position) = position.down(1)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

