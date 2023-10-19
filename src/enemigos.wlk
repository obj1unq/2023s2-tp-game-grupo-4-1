import wollok.game.*
import entorno.*
import jugador.*
import movimientoPersonaje.*
import gameObject.*
class Enemigo inherits GameObject{
	var vida = 0
	var poderDeAtaque = 0
	var property position = null
	method position()
	method image()
}
class Guardia inherits Enemigo {
	/*
	 * Los guardias son enemigos que no se 
	 * mueven de la puerta y atacan al jugador
	 * a menos que el jugador tenga una moneda
	 */
	override method comportamiento(){}
	override method image()="guardia.png"
}

class Vigilante inherits Enemigo {
	/*
	 * Los Vigilantes son enemigos que 
	 * rondan por todo el mapa
	 */
	 
	const estado = caminandoAlaIzquierda
	override method image()="vigilante.png"
	
	override method comportamiento(){
		position= estado.siguientePosicion(self)
	}
}

object caminandoAlaIzquierda{
	method siguientePosicion(p)= game.at(p.position().x()+1, p.position().y())
}

