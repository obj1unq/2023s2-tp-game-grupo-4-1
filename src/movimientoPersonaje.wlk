import wollok.game.*
import objetosEntorno.*
import jugador.*
import enemigos.*



//Direcciones

object arriba {method siguiente(position){ return position.up(10)}}
object abajo {method siguiente(position){	return position.down(10)}}
object izquierda {method siguiente(position){ return position.left(10)}}
object derecha {method siguiente(position){ return position.right(10)}}

object tablero {
	method pertenece(_position){ 
		return self.estaDentroDelAncho(_position)  && self.estaDentroDelLargo(_position)
	}
	
	method estaDentroDelAncho(_position) = _position.x().between(-10, game.width()-5)
	method estaDentroDelLargo(_position) = _position.y().between(-10, game.height()-5)
}