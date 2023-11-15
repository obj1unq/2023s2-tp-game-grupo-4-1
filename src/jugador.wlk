import wollok.game.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import hud.*

object jugador {

	// var property velocidad = 5
	// var property estado = "normal"
	// var property poderDeAtaque = 5
	var property position = game.at(1, 1)
	var property vida = 3
	const property image = "Jugador.png"
	const property isSolid = false
	const property inventario = #{}

	method mover(direccion) {
		if (vida > 0) {
			self.position(direccion)
		}
	}

	method agregar(item) {
		inventario.add(item)
	}

	method recibirAtaque(enemigo) {
		self.alterarVida(-enemigo.poderDeAtaque())
		hud.reducirVida()
		self.pararJuegoSiElJugadorMuere()
	}

	method alterarVida(valor) {
		vida += valor
	}

	method descartarItem(item) {
		self.validarQueTieneItem(item)
		inventario.remove(item)
	}

	method tieneItem(item) {
		return inventario.contains(item)
	}

	method validarQueTieneItem(item) {
		if (self.tieneItem(item)) {
			self.error("el item  esta en el inventario por lo tanto no se puede eliminar")
		}
	}

	method pararJuegoSiElJugadorMuere() {
		if (vida <= 0) {
			hud.mostrarCartelDeDerrota()
		}
	}

	method parar() {
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

