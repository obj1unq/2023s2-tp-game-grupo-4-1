import wollok.game.*
import jugador.*
import enemigos.*
import objetosEntorno.*
object _ {
	
	method generar(position) {
		game.addVisual(
			new Piso(position=position)
		)
	}	
}

object j {
	method generar(position) {
		jugador.position(position)
	}		
}

object m {
	method generar(position) {
		game.addVisual(
			new Muro(position=position)
		)
	}			
}

object p {
	method generar(position){
		game.addVisual(
			new Pared(position=position)
		)
	}
}
/*
object p {
	//door
	method generar(position) {
		game.addVisual(puerta)
	}	
}
object e{
	method generar(position) {
		game.addVisual(vigilanteJoven)
		//silvestre calcula solo su posicion
	}		
}

*/

object mapa {
	/*
	 * P = pared - Dependiendo de la posicion de la pared se carga un asset diferente 
	 * M = Muro  - 
	 */
	const celdas = [
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,m,m,m,_,_,_,_,_,_,_,_,p],
		[p,_,m,_,m,_,m,_,_,_,_,_,_,p],
		[p,_,m,_,m,_,m,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p],		
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p],		
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p]
	].reverse() //reverse porque el y crece en el orden inverso
	
	method generar() {
		game.width(celdas.anyOne().size())
		game.height(celdas.size())
		game.cellSize(96)
		(0..game.width() -1).forEach({x =>
			(0..game.height() -1).forEach( {y =>
				self.generarCelda(x,y)
			})
		})
		game.addVisual(jugador) //agrego al final por un tema del z index
	}
	
	method generarCelda(x,y) {
		const celda = celdas.get(y).get(x)
		celda.generar(game.at(x,y))
	}
	
}