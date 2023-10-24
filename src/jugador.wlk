import wollok.game.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import hud.*

object jugador {

	var property velocidad = 5
	var property estado = "normal"
	var property poderDeAtaque = 5
	var property position = game.at(1, 1)
	var property vida = 3
	const property image = "Jugador.png"
	const property isSolid = false

	method mover(direccion) {
		self.position(direccion)
	}

	method recibirAtaque(gameObject) {
		vida -= gameObject.poderDeAtaque()
		hud.reducirVida()
		
		self.pararJuegoSiElJugadorMuere()
	}
	
	method pararJuegoSiElJugadorMuere(){
		game.say(self, self.vida().toString())
		if(vida <= 0){
			game.allVisuals().forEach({element=>element.parar()})
			hud.mostrarCartelDeDerrota()
		}
	}
	
	method parar(){
		game.removeVisual(self)
	}

	method comportamiento() {
		keyboard.up().onPressDo({ self.mover(direcciones.arriba(self.position()))})
		keyboard.down().onPressDo({ self.mover(direcciones.abajo(self.position()))})
		keyboard.left().onPressDo({ self.mover(direcciones.izquierda(self.position()))})
		keyboard.right().onPressDo({ self.mover(direcciones.derecha(self.position()))})
		game.onCollideDo(self, { element => element.collide(self)})
		
	}

}
