import wollok.game.*
import entorno.*
import jugador.*
import movimientoEntidades.*
import gameEntity.*

class Enemigo inherits GameEntity {


	override method collide(entity) {
		entity.recibirAtaque() 
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
	override method parar() {}
	override method comportamiento() {}
}

class Kamikaze inherits Enemigo {
	var pasos = 0
	override method image() = "kamikaze.png"



	override method comportamiento() {
		
		if (self.position() != jugador.position()) {
			self.avanzarHaciaElJugador()
		}
		
		if(pasos == 3){  
			game.addVisual(new Trampa(position=self.position()))
		}		
	}

	method avanzarHaciaElJugador() {
		pasos++
		const jugadorP = jugador.position()
		self.posicionEnXHastaElJugador(jugadorP.x())
		self.posicionEnYHastaElJugador(jugadorP.y())
	}

	method posicionEnXHastaElJugador(posicionx) {
		if (position.x() < posicionx) {
			self.position(direcciones.derecha(self.position()))
		} else {
			self.position(direcciones.izquierda(self.position()))
		}
	}

	method posicionEnYHastaElJugador(posiciony) {
		if (position.y() < posiciony) {
			self.position(direcciones.arriba(self.position()))
		} else {
			self.position(direcciones.abajo(self.position()))
		}
	}

}

class Vigilante inherits Enemigo {

	/*
	 * Los Vigilantes son enemigos que 
	 * rondan por todo el mapa
	 */
	var direccion = caminadoAlaDerecha
	var cantidadDePasos = 0

	override method image() = direccion.image("vigilante")

	override method comportamiento() {
		self.cambiarSentido()
		self.position(direccion.siguientePosicion(self.position()))
		cantidadDePasos++
		hitBox.updatePosition()
	}

	override method parar() {
		game.removeTickEvent("avanzarVigilante")
	}

	method cambiarSentido() {
		if (not direccion.hayProximaCelda(self.position()) or cantidadDePasos > 3) {
			cantidadDePasos = 0
			direccion = direccionAleatoria.generarDireccion(self.position())
		}
	}

}

object direccionAleatoria {

	const trayectorias = [ caminandoAlaIzquierda, caminadoAlaDerecha, caminadoArriba, caminadoAbajo ]

	method generarDireccion(position) {
		return self.direccionesValidas(position).anyOne()
	}

	method direccionesValidas(position) {
		/*Toma una lista de direcciones y devuelve unicamente las direcciones
		 * en las que el existe 1 celda en x direccion
		 */
		return trayectorias.filter({ dir => dir.hayProximaCelda(position) })
	}

}

class Dirrecion {

	method image(img) = img + self.dirrecion()

	method dirrecion()

	method siguientePosicion(position)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

object caminandoAlaIzquierda inherits Dirrecion {

	override method dirrecion() = "_left.png"

	override method siguientePosicion(position) = position.left(1)

}

object caminadoAlaDerecha inherits Dirrecion {

	override method dirrecion() = "_right.png"

	override method siguientePosicion(position) = position.right(1)

}

object caminadoArriba inherits Dirrecion {

	override method dirrecion() = "_right.png"

	override method siguientePosicion(position) = position.up(1)

}

object caminadoAbajo inherits Dirrecion {

	override method dirrecion() = "_right.png"

	override method siguientePosicion(position) = position.down(1)

}

