import wollok.game.*
import jugador.*
import enemigos.*
import movimientoPersonaje.*

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
	
