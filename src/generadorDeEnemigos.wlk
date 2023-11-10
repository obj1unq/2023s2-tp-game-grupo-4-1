import wollok.game.*
import enemigos.*

object generadorDeEnemigos {

	var maximoEnemigos = 3
	const limiteAltura = game.height() - 96
	const limiteAncho = game.width() - 96
	const dificultad = 1
	const enemigos = []
	
	method generar() {
		(0..maximoEnemigos).forEach({x =>
			const enemigo = self.enemigoRandom()
			game.addVisual(enemigo)
			game.onTick(500, "comportamientoEnemigo", {
				enemigo.comportamiento()
			})
		})
		maximoEnemigos = 0
	}
	method enemigoRandom(){
		return new Vigilante(position=self.validPosition())
	}
	
	method randomPosition(){
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method validPosition(){
		const position = self.randomPosition()
		if(game.getObjectsIn(position).all({element => not element.isSolid() })){
			return position
		}else{
			return self.validPosition()
		}
	}
	
	method esUnaCeldaValida(){
		
	}
	
	
	
}

