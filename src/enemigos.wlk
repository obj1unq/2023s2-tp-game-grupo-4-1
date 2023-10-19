import wollok.game.*
import entorno.*
import jugador.*
import movimientoPersonaje.*
class Enemigo {
	const property isSolid = false
	const property poderDeAtaque = 10
	var vida = 0
	var property position = null
	method position()
	method image()
	method comportamiento(){}
	method collide(a){}
	method recibirAtaque(a){}
}
class Guardia inherits Enemigo {
	/*
	 * Los guardias son enemigos que no se 
	 * mueven de la puerta y atacan al jugador
	 * a menos que el jugador tenga una moneda
	 */
	override method image()="guardia.png"
}

class Vigilante inherits Enemigo {
	/*
	 * Los Vigilantes son enemigos que 
	 * rondan por todo el mapa
	 */
	 
	var estado = caminandoAlaIzquierda
	override method image()="vigilante.png"
	override method comportamiento(){
		game.onCollideDo(self, {element=> element.recibirAtaque(self)})
	}
}

object caminandoAlaIzquierda{
	method siguientePosicion(p)=game.at(p.position().x()+1, p.position().y())
}

