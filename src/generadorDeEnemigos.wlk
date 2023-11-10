import wollok.game.*
import enemigos.*

object generadorDeEnemigos {
	const onTickEvent = ""
	const maximoEnemigos = 3
	const limiteAltura = game.height() - 96
	const limiteAncho = game.width() - 96
	const dificultad = 1
	const enemigos = []
	method generar() {
		self.crearEnemigos()
		
		enemigos.forEach({enemigo=>
			game.addVisual(enemigo)
			game.onTick(500, "comportamientoEnemigos", {
				enemigo.comportamiento()				
			})
		})
	}
	
	method crearEnemigos() {
		
	}
}

