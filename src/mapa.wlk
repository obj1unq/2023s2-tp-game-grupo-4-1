import wollok.game.*
import jugador.*
import enemigos.*
import objetosEntorno.*
object _ {
	
	method generar(position) {
		//El vacio no agrega nada
	}	
}

object j {
	method generar(position) {
		jugador.position(position)
	}		
}

object m {
	method generar(position) {
		
	}			
}
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

class Mapa {
	
	var celdas = [
		[_,_,_,_,_,_,_,_,_,p],
		[_,_,j,_,_,_,_,_,_,_],
		[_,_,m,m,_,_,m,_,_,_],
		[_,_,_,_,_,_,m,_,_,_],
		[_,_,_,_,_,_,m,_,_,_],		
		[_,_,_,_,_,_,m,m,_,_],		
		[_,_,_,e,_,_,_,_,_,_]		
	].reverse() //reverse porque el y crece en el orden inverso
	
	
	
	method generar() {
		game.width(celdas.anyOne().size())
		game.height(celdas.size())
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