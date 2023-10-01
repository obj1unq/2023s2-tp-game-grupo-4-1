import wollok.game.*
import entorno.*
import jugador.*
import enemigos.*



//Direcciones


object arriba {
	method siguiente(position) =  position.up(1)
}
object abajo {
	method siguiente(position) = position.down(1)
}
object izquierda {
	method siguiente(position) = position.left(1)
}
object derecha {
	method siguiente(position) = position.right(1)
}

object tablero {
	method pertenece(_position){ 
		return _position.x().between(0, game.width()-1) 
		&& _position.y().between(0, game.height()-1)
	}
}