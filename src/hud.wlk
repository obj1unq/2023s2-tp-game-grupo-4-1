import wollok.game.*
import jugador.*

object hud {

	method add() {
		hud_HP.mostrar()
	}

	method reducirVida() {
		hud_HP.reducirVida()
	}

	method aumentarVida() {
		hud_HP.aumentarVida()
	}

}

object hud_HP {

	const vidas = self.hpVisuals()
	var vidaActual = jugador.vida()-1

	method mostrar() {
		vidas.forEach({ hp => game.addVisual(hp)})
	}

	method hpVisuals() {
		const lista = []
		(0..jugador.vida() - 1).forEach({ x => 
			lista.add(
				new Vida(position = game.at(x + 1, game.height() - 1))
			)
		})
		return lista
	}

	method reducirVida() {
		vidas.get(vidaActual).vaciar()
		vidaActual = vidaActual - 1
	}

	method aumentarVida() {
		vidas.get(vidaActual).llenar()
		vidaActual = vidaActual + 1
	}
	method envenenarVida(){
		vidas.forEach({vida=> vida.envenenar()})
	}

}
class Vida {
	const property position = null
	var state = full
	method image()= "hp" + state.image() + ".png"
	method comportamiento(){}
	method collide(x){}
	method vaciar(){state=empty}
	method llenar(){state=full}
	method envenenar(){state=poisoned}
}

object full {
	method image()= "_full"
}
object empty {
	method image()="_empty"
}

object poisoned{
	method image()="_poisoned"
} 


