import wollok.game.*
import jugador.*
import enemigos.*
import entorno.*
import recolectables.*

object m {

	method generar(position) {
		moneda.position(position)
	}

}

object po {

	method generar(position) {
		posionMisteriosa.position(position)
	}

}

object _ {

	method generar(position) {
		game.addVisual(new Pasto(position = position))
	}

}

object op {

	method generar(position) {
		game.addVisual(new ObstaculoPared(position = position))
	}

}

object o {

	method generar(position) {
		game.addVisual(new Obstaculo(position = position))
	}

}

object p {

	method generar(position) {
		game.addVisual(new Pared(position = position))
	}

}

object pr {

	method generar(position) {
		game.addVisual(new Puerta(position = position))
	}

}

object g {

	method generar(position) {
		game.addVisual(new Guardia(position = position))
	}

}

object h {

	method generar(position) {
		game.addVisual(new Hud(position = position))
	}

}

object e {

	method generar(position) {
		game.addVisual(new Escotilla(position = position))
	}

}

/*
 * object p {
 * 	//door
 * 	method generar(position) {
 * 		game.addVisual(puerta)
 * 	}	
 * }
 * object e{
 * 	method generar(position) {
 * 		game.addVisual(vigilanteJoven)
 * 		//silvestre calcula solo su posicion
 * 	}		
 * }

 */
object mapa {

	method generar(nivel) {
		game.width(nivel.anyOne().size())
		game.height(nivel.size())
		game.cellSize(96)
		(0 .. game.width() - 1).forEach({ x => (0 .. game.height() - 1).forEach({ y => self.generarCelda(x, y, nivel)})})
		game.addVisual(moneda)
		game.addVisual(posionMisteriosa)
	}

	method generarCelda(x, y, nivel) {
		const celda = nivel.get(y).get(x)
		celda.generar(game.at(x, y))
	}

}

