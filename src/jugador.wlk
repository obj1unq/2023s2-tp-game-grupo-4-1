import wollok.game.*
import entorno.*
import enemigos.*
import movimientoPersonaje.*
import mapa.*
object jugador {
	var property velocidad = 5 
    var property estado = "normal"
	var property poderDeAtaque = 5 
	var property position = game.at(1,1)
	var property vida = 10 
	
	const property image = "Jugador.png"
	method mover(direccion){
		
		if (tablero.pertenece(self.position())){
			self.position(direccion.siguiente(self.position()))}
	}
	
	method estaEnLaPuerta() = self.position() == puerta.position()
	
	method tomarPocion() { vida+=10 }
	
	method atacar(personaje){ personaje.recibirAtaque(poderDeAtaque) }
	
	method usar(objeto){/**/}
	
	method agarrar(objeto){/**/}

	method valorPoderDeAtaque(){/**/}
	
	method morir(){if (vida <= 0) estado = "muerto"} // evalúa la muerte pero no necesariamente muere 
	
	method recibirAtaque(fuerzaDeAtaque){
		vida -= fuerzaDeAtaque
		poderDeAtaque-=1
	}
		
	method estado() = estado
	
}
