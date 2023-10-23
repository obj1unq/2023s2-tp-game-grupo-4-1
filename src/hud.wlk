import wollok.game.*
import jugador.*
object hud {
	method add(){
		hud_HP.mostrar()
	}
	
	method reducirVida(){
		hud_HP.reducirVida()
	}
	method aumentarVida(){
		hud_HP.aumentarVida()
	}
}


object hud_HP {
	const vida = self.hpVisuals()
	var vidaActual = jugador.vida()
	method mostrar(){
		vida.forEach({hp=> game.addVisual(hp)})
	}
	
	method hpVisuals(){
		const lista = [startHp]
		(1..jugador.vida()-1).forEach({ x =>
			lista.add(new HalfHp(position=game.at(x+1,game.height()-1)))
		})		
		lista.add(endHp)
		
		return lista
	}
	method reducirVida(){
		vida.get(vidaActual).reducir()
		vidaActual = vidaActual - 1
	}
	method aumentarVida(){
		vida.get(vidaActual).aumentar()
		vidaActual = vidaActual + 1
	}
}

class HalfHp {
	const property position = null
	var state= ""
	method image()="hp_center" + state + ".png"
	method comportamiento(){
		game.say(self, "aqui")
	}
	method isSolid()=false
	method collide(a){}
	
	method reducir(){
		state = "_void"
	}
method aumentar(){state = ""}
}

object startHp {
	const property position = game.at(1, game.height()-1)
	var state = ""
	method image()= "hp_start" + state + ".png"
	method comportamiento(){
		game.say(self, "aqui")
	} 
	method collide(a){}
	method isSolid()=false
	
	method reducir(){ state = "_void"}
	method aumentar(){state = ""}
}

object endHp{
	const property position = game.at(jugador.vida(),game.height()-1)
	var state = ""
	method image()= "hp_end" + state + ".png"
	method reducir(){ state = "_void"}
	method comportamiento(){
		game.say(self, "aqui")
	}
	method aumentar(){state = ""}
	method collide(a){}
	method isSolid()=false
}