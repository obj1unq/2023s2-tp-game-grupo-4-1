import wollok.game.*
import jugador.*

object hud {
	
	/*
	 * Esta es la clase encargada de mostrar los elementos del hud
	 * y actualizarlos
	 */
	 
	
	method add() {
		hud_HP.mostrar()

	}
	
//	method actualizarHUD() {
//		hud_HP.mostrarCorazonesSanos()
//		//hud_Inventario.mostrarItems()
//	}
//	
	method eventoMuerte(){
		//jugador.morir()
		self.mostrarCartelDeDerrota()
	}
	

	method mostrarCartelDeDerrota() {
		game.addVisual(derrota)
	}

}

object derrota {

	const property position = game.at(0, game.width() / 4 + 1)
	const property image = "derrota.png"

}

object hud_HP {

	/*
	 * Esta es la clase crea los corazones en base a la 
	 * vida del jugador al momento de llamar el metodo hpVisuals 
	 * y al mismo tiempo se encarga de moficiar los sprites de los corazones
	 * cuando el jugador pierde o recibe daño
	 */
	const property vidas = self.hpVisuals()
	//var vidaActual = jugador.vida() - 1

	var property position 

	
	
	 
//	 method mostrarCorazonesSanos() {
//		var contador = jugador.vida() 
//		
//		vidas.forEach({ vida => if (contador >= 0) 
//									{vida.llenar() contador--} 
//								else vida.vaciar()
//					}
//			)
//	 	 
//	 }


	 method mostrarCorazonesSanos() {
		
		 vidas.forEach({vida => vida.vaciar()})
			
		if (jugador.vida() > 0) {
			(0 .. (jugador.vida() -1).max(0)).forEach({ a => self.vidas().get(a).llenar()})
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
//
//	method reducirVida() {
//		self.validarQueElJugadorEstaVivo()
//		vidas.get(vidaActual).vaciar()
//		vidaActual = vidaActual - 1
//	}
//
//	method aumentarVida() {
//		self.validarQueElJugadorEstaVivo()
//		vidas.get(vidaActual).llenar()
//		vidaActual = vidaActual + 1
//	}
//
//	method envenenarVida() {
//		self.validarQueElJugadorEstaVivo()
//		vidas.forEach({ vida => vida.envenenar()})
//	}
//
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

	method envenenar() {
		state = poisoned
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

object poisoned {

	method image() = "_poisoned"

}

