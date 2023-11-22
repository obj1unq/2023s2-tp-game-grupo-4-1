import wollok.game.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import hud.*
import gameManager.*
import efectos.*
import recolectables.*

object jugador {

	var property position = game.at(1, 1)
	var property vida = 3 // Despues probar sacar el setter
	const property isSolid = false
	const inventario = #{}


	method image() = "personaje_" + self.equipamento() + self.estado() + ".png"

	method equipamento() = self.visualAtaque() + self.visualDefensa()

	method visualAtaque() =  if (self.tieneEspada()) "conEspada_" else "sinEspada_"
	method visualDefensa() = if (self.tieneEscudo()) "conEscudo_" else "sinEscudo_"

	method tieneEspada() = inventario.contains(espada)
	method tieneEscudo() = inventario.contains(escudo)

	method estado() = "idle"

	method mover(direccion) {
		if (vida > 0) {
			self.position(direccion)
		}
	}

	method explotar(explosion) {
		explosion.explotar()
	}

	method agregar(item) {
		inventario.add(item)
	}

	method recibirAtaqueDeEnemigo() {
		if (not self.ataqueBloqueado()) {
			self.bajarVida()
			hud_HP.mostrarCorazonesSanos()
			self.pararJuegoSiElJugadorMuere()
		}
	}
	
	method ataqueBloqueado() = self.chanceDeBloqueo() and self.tieneEscudo()
	
	method chanceDeBloqueo() = (0..2).anyOne() == 0
	
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
			game.say(self, "Vida al maximo!!")
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
			gameManager.derrota()
		}
	}

	method comportamiento() {
		keyboard.up().onPressDo({ self.mover(direcciones.arriba(self.position()))})
		keyboard.down().onPressDo({ self.mover(direcciones.abajo(self.position()))})
		keyboard.left().onPressDo({ self.mover(direcciones.izquierda(self.position()))})
		keyboard.right().onPressDo({ self.mover(direcciones.derecha(self.position()))})
		keyboard.a().onPressDo({
			self.atacar()
		})
		game.onCollideDo(self, { element => element.collide(self)})
	}
	
	method atacar(){
		self.validarSiPuedeAtacar()
		[arriba,abajo,izquierda,derecha].forEach({dir=>
			self.atacarTodosLosPersonajesEnLaDireccion(dir)
			
		})
	}
	
	method validarSiPuedeAtacar(){
		if(not inventario.contains(espada)){
			game.say(self, "Necesitas la espada para pegar")
		}
	}
	method atacarTodosLosPersonajesEnLaDireccion(dir){
		game.getObjectsIn(dir.direccion(self.position())).forEach({enemigo=>
			enemigo.recibirAtaque(self)
		})
	}
	method pasarPortal() {
		gameManager.cambiarAsiguienteNivel()
	}

}


