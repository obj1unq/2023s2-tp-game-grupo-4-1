import wollok.game.*
import jugador.*
import enemigos.*
import movimientoPersonaje.*



object tableroPosition {
	method esBordeInferiorIzquierdo(position) {
		return position == game.origin()
	}
	method esBordeSuperiorIzquierdo(position) {
		return position.x() == 0 and position.y() == game.height()-1
	}
	method esBordeInferiorDerecho(position) {
		return position.x() == game.width()-1 and position.y() == 0
	}
	method esBordeSuperiorDerecho(position) {
		return position.x()==game.width()-1 and position.y() == game.height()-1
	}
	
	method esParedDerecha(position){
		return position.x() == game.width()-1
	}
	method esParedIzquierda(position){
		return position.x() == 0
	}
	
	method esParedSuperior(position){
		return position.y() ==game.height()-1
	}
	method esParedInferior(position){
		return position.y() == 0 
	}
}

class Pared {
	const property position = game.at(0,0)

	method image(){
		if (tableroPosition.esBordeInferiorIzquierdo(position)){
			return "ParedBordeInferiorIzquierdo.png"
		}
		if(tableroPosition.esBordeSuperiorIzquierdo(position)){
			return "ParedBordeSuperiorIzquierdo.png"
		}
		if(tableroPosition.esBordeInferiorDerecho(position)){
			return "ParedBordeInferiorDerecho.png"
		}
		if(tableroPosition.esBordeSuperiorDerecho(position)){
			return "ParedBordeSuperiorDerecho.png"
		}
		if(tableroPosition.esParedDerecha(position)){
			return "ParedDerecha.png"
		}
		if(tableroPosition.esParedIzquierda(position)){
			return "ParedIzquierda.png"
		}
		if(tableroPosition.esParedSuperior(position)){
			return "ParedArriba.png"
		}
		if(tableroPosition.esParedInferior(position)){
			return "ParedAbajo.png"
		}
		return "Muro.png"
	}
	
	
}

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
	
