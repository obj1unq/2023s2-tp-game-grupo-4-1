import wollok.game.*
import enemigos.*
import jugador.*

object generadorDeEnemigos {

	var maximoEnemigos = 3

	method generar() {
		(0 .. maximoEnemigos).forEach({ x =>
			const enemigo = self.enemigoRandom()
			game.addVisual(enemigo)
			game.onTick(750, "comportamientoEnemigo", { enemigo.comportamiento()})
		})
		maximoEnemigos = 3
	}

	method enemigoRandom() {
		return new Guardian(position=self.validPosition())
	}

	method randomNumber() = (0 .. 3).anyOne()

	method randomPosition() {
		return game.at((3 .. game.width() - 1 ).anyOne(), (4 .. game.height() - 1).anyOne())
	}

	method validPosition() {
		const position = self.randomPosition()
		return if (self.esUnaCeldaValida(position)) {
			position
		} else {
			self.validPosition()
		}
	}
	


	method esUnaCeldaValida(position) = game.getObjectsIn(position).all({ element => not element.isSolid() })

}

