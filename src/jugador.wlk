import wollok.game.*
import entorno.*
import enemigos.*
import movimientoPersonaje.*
import mapa.*
import hud.* 
object jugador {
	var property velocidad = 5 
    var property estado = "normal"
	var property poderDeAtaque = 5 
	var property position = game.at(1,1)
	var property vida = 3
	const property image = "Jugador.png"
	const property isSolid = false
	method mover(direccion){
		if (tablero.pertenece(self.position())){
			self.position(direccion.siguiente(self.position()))}
	}
	
	method morir(){if (vida <= 0) estado = "muerto"}  
	
	method recibirAtaque(gameObject){
		vida -= gameObject.poderDeAtaque()
		hud.reducirVida()
		game.say(self, "auch")
	}
	method comportamiento(){
		game.onCollideDo(self, {element=> element.collide(self)})
	}	
}
