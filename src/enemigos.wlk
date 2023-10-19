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
	method collide(a){
		a.recibirAtaque(self)
	}
	method recibirAtaque(a){}
	method cambiarSentido(){}
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
		game.onTick(200, "avanzarVigilante", {
			self.cambiarSentido()
			self.position(estado.siguientePosicion(self))		
		})
	}
	
	override method cambiarSentido(){
		if (not estado.hayProximaCelda(self)){
			estado = estado.siguiente()
			
		}
	}
}

object caminandoAlaIzquierda{ 
	method siguientePosicion(pj)=game.at(pj.position().x()-1, pj.position().y()) 
	
	method hayProximaCelda(pj)=movementValidator.canMove(self.siguientePosicion(pj))
	
	method siguiente()=caminadoAlaDerecha
}
object caminadoAlaDerecha{
	method siguientePosicion(pj)=game.at(pj.position().x()+1, pj.position().y()) 
	
	method hayProximaCelda(pj)= movementValidator.canMove(self.siguientePosicion(pj))
	
	method siguiente()=caminadoArriba
}

object caminadoArriba{
	method siguientePosicion(pj)=game.at(pj.position().x(), pj.position().y()+1) 
	
	method hayProximaCelda(pj)= movementValidator.canMove(self.siguientePosicion(pj))
	
	method siguiente()=caminadoAbajo
}

object caminadoAbajo{
	method siguientePosicion(pj)=game.at(pj.position().x(), pj.position().y()-1) 
	
	method hayProximaCelda(pj)=movementValidator.canMove(self.siguientePosicion(pj))
	
	method siguiente()=caminandoAlaIzquierda
}

