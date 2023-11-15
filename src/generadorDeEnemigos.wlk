import wollok.game.*
import enemigos.*

object generadorDeEnemigos {

	var maximoEnemigos = 3
	const dificultad = 1
	method generar() {
		(0..maximoEnemigos).forEach({x =>
			const enemigo = self.enemigoRandom()
			game.addVisual(enemigo)
			game.onTick(750, "comportamientoEnemigo", {
				enemigo.comportamiento()
			})
		})
		maximoEnemigos = 0
	}
	method enemigoRandom(){
		return if((0..2 ).anyOne() > 1){
			new Vigilante(position=self.validPosition())
		}else{
			new Kamikaze(position=self.validPosition())
		}
			
	}
	method randomNumber() = (0..3).anyOne()
	method randomPosition(){
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method validPosition(){
		const position = self.randomPosition()
		return if(self.esUnaCeldaValida(position)){ position}else{self.validPosition()}
	}
	
	method esUnaCeldaValida(position)=game.getObjectsIn(position).all({element => not element.isSolid() })
	
	
	
}

