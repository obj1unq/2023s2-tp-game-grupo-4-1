import wollok.game.*
import objetosEntorno.*
import jugador.*
import enemigos.*
import estados.*



//Direcciones

object arriba {
    method estado()=self
    method image()="jugador-arriba.png"
    method siguiente(position) =  position.up(jugador.velocidad())
}
object abajo {
    method estado()=self
    method image()="jugador-abajo.png"
    method siguiente(position) = position.down(jugador.velocidad())
}
object izquierda {
    method estado()=self
    method image()="jugador-izquierda.png"
    method siguiente(position) = position.left(jugador.velocidad())
}
object derecha {
    method estado()=self
    method image()="jugador-derecha.png"
    method siguiente(position) = position.right(jugador.velocidad())
}

object tablero {
	method pertenece(_position){ 
		return _position.x().between(0, game.width()-1) 
		&& _position.y().between(0, game.height()-1)
	}
}