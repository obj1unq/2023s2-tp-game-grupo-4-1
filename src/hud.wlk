import wollok.game.*
import jugador.*
object hud {
	method add(){
		hud_HP.mostrar()
	}
	
	method reducirVida(){
		hud_HP.reducirVida()
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
			lista.add(new HalfHp(position=game.at(x,game.height()-1)))
		})		
		lista.add(endHp)
		
		return lista
	}
	method reducirVida(){
		vida.get(vidaActual).changeState()
		vidaActual = vidaActual - 1
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
	
	method changeState(){
		state = "_void"
	}
}

object startHp {
	const property position = game.at(0, game.height()-1)
	var state = ""
	method image()= "hp_start" + state + ".png"
	method comportamiento(){
		game.say(self, "aqui")
	} 
	method collide(a){}
	method isSolid()=false
	
	method changeState(){ state = "_void"}
}

object endHp{
	const property position = game.at(jugador.vida(),game.height()-1)
	var state = ""
	method image()= "hp_end" + state + ".png"
	method changeState(){ state = "_void"}
	method comportamiento(){
		game.say(self, "aqui")
	}
	method collide(a){}
	method isSolid()=false
}