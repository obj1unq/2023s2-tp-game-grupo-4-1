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
	var property vida = 3 // Despues probar sacar el setter
	const property image = "Jugador.png"
	const property isSolid = false
	const property inventario = #{}

	method mover(direccion) {
		if (vida > 0) { // Posible cambio a validacion
			self.position(direccion)
		}
	}

	method agregar(item) {
		inventario.add(item)
	}

	method recibirAtaque() {
		self.bajarVida()
		hud_HP.mostrarCorazonesSanos()
		self.pararJuegoSiElJugadorMuere()
			
	}
	
	method recibirCuracion() {
		self.subirVida()
		self.subirVida()
	}
	

	method bajarVida() {
		vida--
	}

	
	method subirVida() {
		vida++
	}	
	
	
	method descartarItem(item){
		self.validarSiPuedeAgregar(item)
		inventario.remove(item)
	}

	method tieneItem(item) {
		return inventario.contains(item)
	}


	
	method validarSiPuedeAgregar(item){
		if(self.tieneItem(item)){
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

