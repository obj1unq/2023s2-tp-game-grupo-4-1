import wollok.game.*
import entorno.*
import jugador.*
import movimientoPersonaje.*

import gameEntity.*
class Enemigo inherits GameEntity{
	override method collide(entity) {
		entity.recibirAtaque(self)
	}
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
	method cambiarSentido() {
		if (not estado.hayProximaCelda(self.position())) {
			estado = direccionAleatoria.generarDireccion(self.position())
		}
	}
}
object direccionAleatoria {
	const direcctions = [caminandoAlaIzquierda, caminadoAlaDerecha, caminadoArriba, caminadoAbajo]
	method generarDireccion(position){
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

