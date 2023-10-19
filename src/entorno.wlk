import wollok.game.*
import jugador.*
import enemigos.*
import movimientoPersonaje.*



object tableroPosition {
	/*
	 * TODO: Revisar o refactorizar
	 * 
	 */
	 
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

class SolidObject {
	method isSolid()=true
}
class Pared inherits SolidObject{
	/*
	 * Determina la imagen segun la propiedad position
	 */
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
		return "Muro.png" // En ningun caso tendría que llegar a cargar esta imagen
	}
}
class Piso {
	const property position = game.at(0,0)
	const property image 	= "Piso.png"
	const property isSolid	= false
}

class ObstaculoPared inherits SolidObject {
	const property position = game.at(0,0)
	const property image	= "Obstaculo_pared.png"
}

class Obstaculo inherits SolidObject{
	const property position = game.at(0,0)
	const property image	= "Obstaculo.png"
}  
class Puerta {
	const property position = 0
	const estado = puertaAbierta
	method imagen()=estado.image()
}
object puertaCerrada {
	method image()= "PuertaCerrada.png"
}

object puertaAbierta {
	method image()= "PuertaAbierta.png"
}
	
