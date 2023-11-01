import wollok.game.*
import enemigos.*

object generadorDeEnemigos {

	const maximoEnemigos = 3
	const limiteAltura = game.height() - 96
	const limiteAncho = game.width() - 96
	const dificultad = 1

	method generar() {
		game.addVisual(new Vigilante(position = game.center()))
	}

}

