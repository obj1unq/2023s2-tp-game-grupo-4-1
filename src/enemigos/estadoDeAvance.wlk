import wollok.game.*

object avanzarEnX {
	
	method position(entidad){
		return game.at(
			entidad.position().x() + 1,
			entidad.position().y() 
		)
	}
}

object retrocederEnX {
	
	method position(entidad){
		return game.at(
			entidad.position().x() - 1,
			entidad.position().y() 
		)
	}
}


object avanzarEnY {
	method proximaPosicion(posicionActual){
		return posicionActual.y()+1
	} 
}

object retrocederEnY {
	method proximaPosicion(posicionActual){
		return posicionActual.y()-1
	} 
}

object avanceNuloEnY{
	method proximaPosicion(posicionActual){
		return posicionActual.y()
	} 
}

object avanceNuloEnX{
	method proximaPosicion(posicionActual){
		return posicionActual.x()
	} 
}