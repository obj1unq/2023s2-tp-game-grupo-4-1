import wollok.game.*
import jugador.*
import recolectables.*

object hud {

	/*
	 * Esta es la clase encargada de mostrar los elementos del hud
	 * y actualizarlos
	 */
	method reset() {
		hud_HP.reset()
		hud_inventario.reset()
	}

	method add() {
		hud_HP.mostrar()
	}

	method eventoMuerte() {
		self.mostrarCartelDeDerrota()
	}

	method mostrarCartelDeDerrota() {
		game.addVisual(derrota)
	}

	method mostrarCartelDeVictoria() {
		game.addVisual(victoria)
	}

}

object hud_inventario {

	var slotsOcupados = 0

	method liberarEspacio() {
		slotsOcupados = 0
	}

	method actualizar(item) {
		if (self.quedaEspacioEnInventario()) {
			item.position(self.primerSlotLibre())
			slotsOcupados++
		} else {
			game.say(jugador, "No puedo cargar con más!!")
		}
	}

	method reset() {
		slotsOcupados = 0
	}

	// method primerSlotLibre() = game.at(game.width()-1, 13 + slotsOcupados)
	method primerSlotLibre() = game.at(12 + slotsOcupados, game.height() - 1)

	method quedaEspacioEnInventario() = slotsOcupados != 3

}

object hud_HP {

	/*
	 * Esta es la clase crea los corazones en base a la 
	 * vida del jugador al momento de llamar el metodo hpVisuals 
	 * y al mismo tiempo se encarga de moficiar los sprites de los corazones
	 * cuando el jugador pierde o recibe daño
	 */
	const property vidas = self.hpVisuals()
	// var vidaActual = jugador.vida() - 1
	var property position

	method reset() {
		self.mostrarCorazonesSanos()
	}

	method mostrarCorazonesSanos() {
		vidas.forEach({ vida => vida.vaciar()})
		if (jugador.vida() > 0) {
			(0 .. (jugador.vida() - 1).max(0)).forEach({ a => self.vidas().get(a).llenar()})
		}
	}

	method mostrar() {
		vidas.forEach({ hp => game.addVisual(hp)})
	}

	method hpVisuals() {
		/*
		 * Describe una lista con todas las instancias de la clase Vida
		 *   
		 */
		const lista = []
		(0 .. jugador.vida() - 1).forEach({ x => lista.add(new Vida(position = game.at(x + 1, game.height() - 1)))})
		return lista
	}

	method validarQueElJugadorEstaVivo() {
		if (jugador.vida() < 0) {
			self.error("El jugador deberia estar muerto")
		}
	}

}

class Vida {

	const property position = null
	var state = full

	method image() = "corazon-" + state.image() + ".png"

	method comportamiento() {
	}

	method collide(x) {
	}

	method vaciar() {
		state = empty
	}

	method llenar() {
		state = full
	}

	method parar() {
	}

}

object full {

	method image() = "1"

}

object empty {

	method image() = "0"

}

object victoria {

	const property position = game.at(0, 0)
	const property image = "mensaje_win.png"

}

object derrota {

	const property position = game.at(0, 0)
	const property image = "derrota.png"

}

