import wollok.game.*
import jugador.*
import enemigos.*
import movimientoPersonaje.*
import estados.*

object capaDeInvisibilidad {
	var property position = game.at(40,20)
	
	method image(){return "capaDeInvisibilidad.png"}
	method position(){ return position}
	method esAgarrado(personaje){
		position(personaje.listaDeObjetos().position())
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		jugador.estado(invisible)
	}
}

object moneda {
	var property position = game.at(50,70)
	
	method image(){return "moneda.png"}
	method position(){ return game.at(130,50)}
	method esAgarrado(personaje){
		position(personaje.listaDeObjetos().position())
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		if (guardia.position()==personaje.position()){ 
			guardia.recibioSoborno(true)
		}
	}
}
object pocionDeVida {
	var property position = game.at(20,80)
	
	method image(){return "pocionDeVida.png"}
	method position(){ return position}
	method esAgarrado(personaje){
		position = personaje.listaDeObjetos().position()
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		personaje.vida(personaje.vida()+20)
	}
}

object veneno {
	var property position = game.at(20,50)
	
	method image(){return "veneno.png"}
	method position(){ return position}
	method esAgarrado(personaje){
		position = personaje.listaDeObjetos().position()
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		personaje.vida(personaje.vida()-30)
	}
}

object armadura {
	var property position = game.at(160,20)
	
	
	method image(){return "armadura.png"}
	method position(){ return position}
	method esAgarrado(personaje){
		position = personaje.listaDeObjetos().position()
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		personaje.vida(personaje.vida()+30)
	}
	
}

object arma {
	var property position = game.at(70,20)
	
	method image(){return "arma.png"}
	method position(){ return position}
	method esAgarrado(personaje){
		position = personaje.listaDeObjetos().position()
		personaje.listaDeObjetos().agregarObjeto() 
	}
	method efectoDelObjeto(personaje){
		personaje.poderDeAtaque(personaje.poderDeAtaque()+30)
	}
}

object puerta {
	
	method image(){return "puerta-"+ self.estadoImagen()+".png"}
	method position(){ return game.at(100,180)}
	method estadoImagen(){
		return if (guardia.estado()=="muerto"&& jugador.estaEnLaPuerta()) "abierta"
			else "cerrada"
	}
}

object paredHorizontal1 {
	method image(){return "paredHorizontal.jpeg"}
	method position(){return game.at(10,60)}
}

object paredHorizontal2 {
	method image(){return "paredHorizontal.jpeg"}
	method position(){return game.at(75,60)}	
}

object paredHorizontal3 {
	method image(){return "paredHorizontal.jpeg"}
	method position(){return game.at(125,60)}
}

object paredVertical1 {
	method image(){return "paredVertical.jpeg"}
	method position(){return game.at(50,10)}
}

object paredVertical2 {
	method image(){return "paredVertical.jpeg"}
	method position(){return game.at(100,65)}
}

object paredVertical3 {
	method image(){return "paredVertical.jpeg"}
	method position(){return game.at(150,30)}
}

object fondo {
	
	method image(){return "castillo.jpeg"}
	method position(){return game.at(0,0)}
	
}
	
