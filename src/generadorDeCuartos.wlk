import wollok.game.*
import entorno.*
object generadorDeCuartos{
	
	var cantidad = 2
	method randomPosition(){
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	method validPosition(){
		const position = self.randomPosition()
		return if(self.esUnaPosicionValida(position)){ position}else{self.validPosition()}
	}
	
	method esUnaPosicionValida(position){
		return self.esUnCuartoAbierto(position)
		
	}
	
	method esCeldaVacia(position) = game.getObjectsIn(position).all({element => not element.isSolid() }) 
	method generar(){
		(0..cantidad).forEach({x =>
			//game.addVisual(new Cuarto(self.validPosition()))
		})
	}
	method esUnCuartoAbierto(position){
		return self.esCeldaVacia(position) and self.esCeldaVacia(position.up(1)) and self.esCeldaVacia(position.down(1))
		and self.esCeldaVacia(position.left(1)) and  self.esCeldaVacia(position.right(1))
	} 
	method generarCuarto(position){
		
		self.generarParedSuperior(position)
		self.generarParedDerecha(position)
		self.generarParedIzquierda(position)
		self.generarPuerta(position)
	}
	method generarParedIzquierda(position){
		game.addVisual(new Pared(position=position.left(1)))
	}
	method generarParedDerecha(position){
		game.addVisual(new Pared(position=position.right(1)))
	}
	method generarParedSuperior(position){
		game.addVisual(new Pared(position=position.up(1)))
		game.addVisual(new Pared(position=position.up(1).left(1)))
		game.addVisual(new Pared(position=position.up(1).right(1)))
	}
	method generarPuerta(position){
		game.addVisual(new Pasto(position=position.down(1)))
		game.addVisual(new Pared(position=position.down(1).left(1)))
		game.addVisual(new Pared(position=position.down(1).right(1)))
	}

}
