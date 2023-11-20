import wollok.game.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import hud.*
import gameManager.*
import efectos.*

object jugador {

	var property position = game.at(1, 1)
	var property vida = 3 // Despues probar sacar el setter
	const property image = "Jugador.png"
	const property isSolid = false
	const property inventario = #{  }
	
	method mover(direccion) {
		if (vida > 0) { // Posible cambio a validacion
			self.position(direccion)
		}
	}

	method explotar(explosion){
		const positionToExplosion = explosion.position()
		game.removeVisual(explosion)
		game.addVisual(new Explosion(position = positionToExplosion))
	}
	method trapped(trap) {
		self.bajarVida()
	}

	method agregar(item) {
		inventario.add(item)
	}

	method recibirAtaque() {
		self.bajarVida()
		hud_HP.mostrarCorazonesSanos()
		self.pararJuegoSiElJugadorMuere()
	}


	method validarSiElItemEstaEnElInventario(item) {
		if (not inventario.contains(item)) {
			self.error("El item no esta en el inventario")
		}
	}

	method descartarItem(item) {
		self.validarSiElItemEstaEnElInventario(item)
	}

	method subirVida() {
		self.validarTopeDeVida()
		vida++
		hud_HP.mostrarCorazonesSanos()
	}

	method bajarVida() {
		vida--
		hud_HP.mostrarCorazonesSanos()
		self.pararJuegoSiElJugadorMuere()
	}
	
	method validarTopeDeVida() {
		if (self.vidaAlMaximo()) {
			game.say(self,"Vida al maximo!!")
		}
	}
	
	method vidaAlMaximo() = vida == 3

	method tieneItem(item) {
		return inventario.contains(item)
	}

	method validarSiPuedeAgregar(item) {
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
	method pasarPortal(portal) {
		gameManager.validarSiEstaCompleto()
		gameManager.cambiarAsiguienteNivel()
	}

}

