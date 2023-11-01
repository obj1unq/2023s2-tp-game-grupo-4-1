import wollok.game.*
import entorno.*
import jugador.*
import enemigos.*

//Direcciones
object movementValidator {

	method canMove(position) {
		return game.getObjectsIn(position).all({ element => not element.isSolid() })
	}

}

object direcciones {

	method arriba(position) = if (self.canMove(position.up(1))) {
		position.up(1)
	} else {
		position
	}

	method abajo(position) = if (self.canMove(position.down(1))) {
		position.down(1)
	} else {
		position
	}

	method derecha(position) = if (self.canMove(position.right(1))) {
		position.right(1)
	} else {
		position
	}

	method izquierda(position) = if (self.canMove(position.left(1))) {
		position.left(1)
	} else {
		position
	}

	method canMove(position) {
		return game.getObjectsIn(position).all({ element => not element.isSolid() })
	}

}

