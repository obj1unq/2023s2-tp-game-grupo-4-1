import wollok.game.*
import jugador.*
object hud {
	method add(){
		hud_HP.mostrar()
	}
}


object hud_HP {
	const vida = self.hpVisuals()
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
}

class HalfHp {
	const property position = null
	method image()="hp_center.png"
	method comportamiento(){
		game.say(self, "aqui")
	}
	method isSolid()=false
	method collide(a){}
}

object startHp {
	const property position = game.at(0, game.height()-1)
	method image()= "hp_start.png"
	method comportamiento(){
		game.say(self, "aqui")
	} 
	method collide(a){}
	method isSolid()=false
}

object endHp{
	const property position = game.at(jugador.vida(),game.height()-1)
	method image()= "hp_end.png"
	method comportamiento(){
		game.say(self, "aqui")
	}
	method collide(a){}
	method isSolid()=false
}