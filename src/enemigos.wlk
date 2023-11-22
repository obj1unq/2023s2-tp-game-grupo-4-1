import wollok.game.*
import entorno.*
import jugador.*
import movimientoEntidades.*
import gameEntity.*
import hitBox.*
import animatedImage.*
import efectos.*
import gameManager.*

class Enemigo inherits GameEntity {

	override method collide(jugador) {
		jugador.recibirAtaqueDeEnemigo()
	}

	method comportamiento()

	override method isSolid() = true

	override method parar() {
	}
	
	override method recibirAtaque(jugador){
		gameManager.eliminarEnemigo()
		game.removeVisual(self)
	}

}

class Guardia inherits Enemigo {
	override method image() = "guardia.png"

}

class Kamikaze inherits Enemigo {

	const animatedImg = new AnimatedImage(nameImage = "kamikaze", frames = 3, delay = 10)

	override method image() = animatedImg.image()

	override method collide(e) {
		super(e)
		e.explotar(self)
	}

	override method comportamiento() {
		if (self.position() != jugador.position()) {
			self.avanzarHaciaElJugador()
		}
	}
	method explotar(){
		const positionToExplosion = self.position()
		game.removeVisual(self)
		game.addVisual(new Explosion(position = positionToExplosion))
		gameManager.eliminarEnemigo()
	}
	method avanzarHaciaElJugador() {
		const jugadorP = jugador.position()
		self.posicionEnYHastaElJugador(jugadorP.y())
		self.posicionEnXHastaElJugador(jugadorP.x())
	}

	method posicionEnXHastaElJugador(posicionx) {
		if (position.x() != posicionx) {
			if (position.x() < posicionx) {
				animatedImg.nameImage("kamikaze_derecha")
				self.position(direcciones.derecha(self.position()))
			} else {
				animatedImg.nameImage("kamikaze_izquierda")
				self.position(direcciones.izquierda(self.position()))
			}
		}
	}

	method posicionEnYHastaElJugador(posiciony) {
		if (position.y() != posiciony) {
			if (position.y() < posiciony) {
				self.position(direcciones.arriba(self.position()))
			} else {
				self.position(direcciones.abajo(self.position()))
			}
		}
	}

}

class Slime inherits Enemigo {

	// Agregar una pequeña animacion
	var direccion = caminadoAlaDerecha
	var cantidadDePasos = 0
	const animatedImg = new AnimatedImage(nameImage = "slime_derecha", frames = 7, delay = 6)
	const hitBox = new HitBox(entity = self, image = "little_slime")

	override method image() = animatedImg.image()

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
			animatedImg.nameImage("slime" + direccion.dirrecion())
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

	method dirrecion() = "_derecha"

	method siguientePosicion(position)

	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

object caminandoAlaIzquierda inherits Dirrecion {

	override method dirrecion() = "_izquierda"

	override method siguientePosicion(position) = position.left(1)

}

object caminadoAlaDerecha inherits Dirrecion {

	override method siguientePosicion(position) = position.right(1)

}

object caminadoArriba inherits Dirrecion {

	override method siguientePosicion(position) = position.up(1)

}

object caminadoAbajo inherits Dirrecion {

	override method siguientePosicion(position) = position.down(1)

}

