import wollok.game.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import hud.*
import gameManager.*

object jugador {

	var property position = game.at(1, 1)
	var property vida = 3 // Despues probar sacar el setter
	const property image = "Jugador.png"
	const property isSolid = false
	const property inventario = #{llave}
	
	method abrir(){}
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


	method validarSiElItemEstaEnElInventario(item){
		if(not inventario.contains(item)){
			self.error("El item no esta en el inventario")
		}
	}
	method descartarItem(item) {
		self.validarSiElItemEstaEnElInventario(item)

	}
	
	method subirVida() {
		vida++
	}	
	
	


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
		keyboard.a().onPressDo({ 
			game.getObjectsIn(self.position()).forEach({
				elemento => elemento.abrir()
			})
		})
		keyboard.space().onPressDo({ 
			gameManager.cambiarNivelSiEstaCompleto()
		})
		game.onCollideDo(self, { element => element.collide(self)})
	}

}

