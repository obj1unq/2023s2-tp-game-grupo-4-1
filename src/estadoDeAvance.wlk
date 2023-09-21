object avanzarEnX {
	
	method proximaPosicion(posicionActual){
		return posicionActual.x() + 1
	}
}

object retrocederEnX {
	
	method proximaPosicion(posicionActual){
		return posicionActual.x()-1
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