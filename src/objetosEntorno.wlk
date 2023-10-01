import wollok.game.*
import jugador.*
import enemigos.*
import movimientoPersonaje.*


class Piso {
	const property position = game.at(0,0)
	const property image 	= "Piso.png"
}
object capaDeInvisibilidad {
	
	
}

object pildoraDeAltura {
	
	
}

object pocionDeVida {
	
	
}

object veneno {
	
	
}

object zapatosDeVelocidad {
	
	
}

object arma {
	
	
}

class Muro {
	const property position = game.at(0,0)
	const property image = "Muro.png"
} 
object puerta {
	
	method imagen(){return "puerta-"+ self.estadoImagen()+".png"}
	method position(){ return game.at(200,50)}
	method estadoImagen(){
		return if (guardia.estado()=="muerto"&& jugador.estaEnLaPuerta()) "abierta"
			else "cerrada"
	}
}

object paredGrande {
	
	
}

object paredChica {
	
	
}

object fondoCastillo {
	
	method image(){return "castillo.jpeg"}
	method position(){return game.at(game.width(), 1)}
	
}
	
