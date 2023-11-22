import wollok.game.*
import enemigos.*
import jugador.*
import generadorDePosiciones.*

object generadorDeEnemigos  {

	method generar(maximoEnemigos) {
		(1.. maximoEnemigos).forEach({ x =>
			const enemigo = self.enemigoRandom()
			game.addVisual(enemigo)
			game.onTick(750, "comportamientoEnemigo", { enemigo.comportamiento()})
		})
	}

	method enemigoRandom() {
		return	if ((0 .. 2 ).anyOne() > 1) {
			new Slime(position = generadorDePosiciones.validPosition({position => self.estaVaciaLaCelda(position)}))
		} else {
			new Kamikaze(position = generadorDePosiciones.validPosition({position => self.estaVaciaLaCelda(position)}))
		}
	}

	method estaVaciaLaCelda(position) = game.getObjectsIn(position).all({ element => not element.isSolid() })

}

