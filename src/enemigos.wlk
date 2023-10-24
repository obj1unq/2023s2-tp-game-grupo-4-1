import wollok.game.*
import entorno.*
import jugador.*
import movimientoPersonaje.*
import hitBox.*
class Enemigo {
	const hitBox = new HitBox(entity=self)
	const property isSolid = false
	const property poderDeAtaque = 10
	var vida = 0
	var property position = null

	method position(a)
	method image()
	method comportamiento() {
	}

	method collide(a) {
		a.recibirAtaque(self)
		
		
	}
	method recibirAtaque(a) {}
	method cambiarSentido() {}

}

class Guardia inherits Enemigo {
	/*
	 * Los guardias son enemigos que no se 
	 * mueven de la puerta y atacan al jugador
	 * a menos que el jugador tenga una moneda
	 */
	override method image() = "guardia.png"
}

class Vigilante inherits Enemigo {
	/*
	 * Los Vigilantes son enemigos que 
	 * rondan por todo el mapa
	 */
	var estado = caminadoAlaDerecha

	override method image() = "vigilante.png"
	override method comportamiento() {
		game.onTick(300, "avanzarVigilante", { 
			self.cambiarSentido()
			self.position(estado.siguientePosicion(self.position()))
			hitBox.updatePosition()
		})
	}
	override method cambiarSentido() {
		if (not estado.hayProximaCelda(self.position())) {
			estado = randomState.direccionAleatoria(self.position())
		}
	}

}
object randomState {
	const direcctions = [caminandoAlaIzquierda, caminadoAlaDerecha, caminadoArriba, caminadoAbajo]
	method direccionAleatoria(position){
		direcctions.reverse()
		return self.direccionesValidas(position).anyOne() 
	}
	
	method direccionesValidas(position){
		/*Toma una lista de direcciones y devuelve unicamente las direcciones
		 * en las que el existe 1 celda en x direccion
		 */
		 return direcctions.filter({dir=> 
		 	dir.hayProximaCelda(position)
		 })
	}

}
object caminandoAlaIzquierda {
	method siguientePosicion(position) = game.at(position.x() - 1, position.y())
	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))
}

object caminadoAlaDerecha {
	method siguientePosicion(position) = game.at(position.x() + 1, position.y())
	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))
}

object caminadoArriba {
	method siguientePosicion(position) = game.at(position.x(), position.y() + 1)
	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))
}

object caminadoAbajo {
	method siguientePosicion(position) = game.at(position.x(), position.y() - 1)
	method hayProximaCelda(position) = movementValidator.canMove(self.siguientePosicion(position))

}

