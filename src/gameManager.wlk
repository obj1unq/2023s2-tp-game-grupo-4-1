import wollok.game.*
import hud.*
import jugador.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import generadorDeEnemigos.*

object gameManager {
	var estaCompleto = true
	method generar() {
		game.clear()
		mapa.generar() // NO TOCAR
		game.addVisual(jugador)
		generadorDeEnemigos.generar()
		jugador.comportamiento()
		hud.add()
		estaCompleto = false
	}
	
	method cambiarNivelSiEstaCompleto(){
		if(estaCompleto){ 
			self.generar()
		}
	}
	
	method nivelCompletado(){estaCompleto=true}
	
}

