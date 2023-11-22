import wollok.game.*
import jugador.*
import enemigos.*
import entorno.*
import recolectables.*
import hud.*

object _ { method generar(position) { game.addVisual(new Pasto(position = position)) 	}			}
object p { method generar(position) { game.addVisual(new Pared(position = position)) 	} 			}
object h { method generar(position) { game.addVisual(new Hud(position = position)) 		}			} 
object i { method generar(position) { game.addVisual(new Hud_slot(position = position)) }			} 

object c { method generar(position) { moneda.position(position) }   							}
object m { method generar(position) { posionMisteriosa.position(position) }						}
object j { method generar(position) { jugador.position(position) }								}
object d { method generar(position) { escudo.position(position) }								}
object a { method generar(position) { espada.position(position) }								}



object mapa {

	method generar(nivel) {
		game.width(nivel.anyOne().size())
		game.height(nivel.size())
		game.cellSize(96)
		(0 .. game.width() - 1).forEach({ x => (0 .. game.height() - 1).forEach({ y => self.generarCelda(x, y, nivel)})})
		game.addVisual(moneda)
		game.addVisual(posionMisteriosa)
		game.addVisual(espada)
		game.addVisual(escudo)
	}

	method generarCelda(x, y, nivel) {
		const celda = nivel.get(y).get(x)
		celda.generar(game.at(x, y))
	}

}

