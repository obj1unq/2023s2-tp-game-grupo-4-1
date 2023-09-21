import wollok.game.*
import objetosEntorno.*
import jugador.*
import enemigos.*



//Direcciones


object arriba {
	method estado()=self
	method image()="jugador-arriba.png"
	method siguiente(position) =  position.up(1)
}
object abajo {
	method estado()=self
	method image()="jugador-abajo.png"
	method siguiente(position) = position.down(1)
}
object izquierda {
	method estado()=self
	method image()="jugador-izquierda.png"
	method siguiente(position) = position.left(1)
}
object derecha {
	method estado()=self
	method image()="jugador-derecha.png"
	method siguiente(position) = position.right(1)
}

object tablero {
	method pertenece(_position){ 
		return _position.x().between(0, game.width()-1) 
		&& _position.y().between(0, game.height()-1)
	}
}

object normal {
	
	method image () = "jugador.png"
}