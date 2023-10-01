import wollok.game.*
import objetosEntorno.*
import jugador.*
import movimientoPersonaje.*

object vigilanteJoven {
	var vida = 5
	var poderDeAtaque = 5

	method image() = "vigilanteJoven.png"
	
	method estado() = if (vida <= 0) "muerto" else "vigilando"

	
	method recibirAtaque(personaje){
		vida -= personaje.poderDeAtaque()
		poderDeAtaque+=1
	}

	method atacar(personaje){
		personaje.recibirAtaque(self)
	}
	
}

object vigilanteViejo{
	var vida = 5
	var poderDeAtaque = 5
	
	method image() = "vigilanteViejo.png"
	
	method estado()=  if (vida <= 0)  "muerto" else "vigilando"
	
	
	method recibirAtaque(personaje){
		vida -= personaje.poderDeAtaque()
		poderDeAtaque-=1
	}

	method atacar(personaje){
		personaje.recibirAtaque(self)
	}
}

object guardia{
	var vida = 5
	var poderDeAtaque = 5

	method image()="guardia.png"
	
	method estado(){
		return if (vida <= 0)  "muerto"
		else "vigilando"
	}
	
	method recibirAtaque(personaje){
		vida -= personaje.poderDeAtaque()
	}

	
	method atacar(personaje){
		personaje.recibirAtaque(self)
	}
}

object visionDeVigilanteViejo{
	var property position
	const origen = vigilanteViejo 
	
	method image() = "visionViejo.png"
	
}
object visionDeVigilanteJoven{
	var property position
	const origen = vigilanteJoven
	
	method image() = "visionJoven.png"
	
}
object visionDeGuardia{
	var property position
	const origen = guardia
	
	method image() = "visionGuardia.png"
	
}


