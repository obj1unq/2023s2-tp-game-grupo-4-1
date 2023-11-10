import wollok.game.*
import enemigos.*

object generadorDeEnemigos {

	const maximoEnemigos = 3
	const limiteAltura = game.height() - 96
	const limiteAncho = game.width() - 96
	const dificultad = 1
	const enemigos = []
	
	method generar() {
		self.generarEnemigos()
		enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(500, "comportamientoEnemigo", {
				enemigo.comportamiento()
			})
		})
	}
	
	method generarEnemigos(){
		(0..maximoEnemigos).forEach({x =>
			enemigos.add( self.enemigoRandom())
		})
	}
	method enemigoRandom(){
		return new Vigilante(position=game.center())
	}
}

