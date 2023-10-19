import wollok.game.*
import entorno.*
import jugador.*
import enemigos.*



//Direcciones

object movementValidator{
	method canMove(position){
		return game.getObjectsIn(position).all({element => not element.isSolid()})
	}
}

object arriba {
	method siguiente(position) = if(movementValidator.canMove(position.up(1))) { position.up(1) } else {position}
}
object abajo {
	method siguiente(position) = if(movementValidator.canMove(position.down(1))) { position.down(1) } else {position}
}
object izquierda {
	method siguiente(position) = if(movementValidator.canMove(position.left(1))) { position.left(1) } else {position}
}
object derecha {
	method siguiente(position) = if(movementValidator.canMove(position.right(1))) { position.right(1) } else {position}
}

object tablero {
	method pertenece(_position){ 
		return _position.x().between(0, game.width()-1) 
		&& _position.y().between(0, game.height()-1)
	}
}