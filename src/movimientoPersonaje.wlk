import wollok.game.*
import objetosEntorno.*
import jugador.*
import enemigos.*



//Direcciones

object arriba {method siguiente(position){ return position.up(1)}}
object abajo {method siguiente(position){	return position.down(1)}}
object izquierda {method siguiente(position){ return position.left(1)}}
object derecha {method siguiente(position){ return position.right(1)}}

object tablero {
	method pertenece(_position){ 
		return _position.x().between(0, game.width()-1) 
		&& _position.y().between(0, game.height()-1)
	}
}