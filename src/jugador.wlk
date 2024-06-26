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
	const property  inventario = #{}
	var dir = "derecha_"

	method image() = "personaje_" + self.direccion() + self.equipamento() + self.estado() + ".png"
	
	method direccion() = dir
	method equipamento() = self.visualAtaque() + self.visualDefensa()

	method visualAtaque() = if (self.tieneEspada()) "conEspada_" else "sinEspada_"

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

	method chanceDeBloqueo() = (0 .. 2).anyOne() >= 1

	method validarSiElItemEstaEnElInventario(item) {
		if (self.tieneItem(item)) {
			self.error("El item no esta en el inventario")
		}
	}

	method descartarItem(item) {
		self.validarSiElItemEstaEnElInventario(item)
	}

	method subirVida() {
		if (not self.vidaAlMaximo()) {
			vida++
			hud_HP.mostrarCorazonesSanos()
		} else {
			game.say(self, "Vida al maximo!!")
		}
	}
	
	method bajarVida() {
		vida--
		hud_HP.mostrarCorazonesSanos()
		self.pararJuegoSiElJugadorMuere()
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
		keyboard.left().onPressDo({
			dir = "izquierda_" 
			self.mover(direcciones.izquierda(self.position()))
		})
		keyboard.right().onPressDo({
			dir = "derecha_"  
			self.mover(direcciones.derecha(self.position()))
		})
		keyboard.a().onPressDo({ self.atacar()})
		game.onCollideDo(self, { element => element.collide(self)})
	}

	method atacar() {
		self.validarSiPuedeAtacar()
		[ arriba, abajo, izquierda, derecha ].forEach({ direc => self.atacarTodosLosPersonajesEnLaDireccion(direc)})
	}

	method validarSiPuedeAtacar() {
		
	}

	method atacarTodosLosPersonajesEnLaDireccion(_dir) {
		if (inventario.contains(espada)) {
			game.getObjectsIn(_dir.direccion(self.position())).forEach({ enemigo => enemigo.recibirAtaque(self)})
		}else{
			game.say(self, "Necesitas la espada para pegar")
			
		}
	}

	method pasarPortal() {
		self.vaciarInventario()
		self.subirVida()
		gameManager.cambiarAsiguienteNivel()
	}
	
	method vaciarInventario() {
		inventario.clear()
		hud_inventario.liberarEspacio()
	}
	method reset() {
		self.vaciarInventario()
		vida = 3
	}

}

