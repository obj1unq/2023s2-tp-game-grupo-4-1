import wollok.game.*
import estadoDeAvance.*
object recorridoLargo {
	const maximoDeX 	 = 86
	const maximoDeY 	 = 62
	var movimientoEnX    = avanzarEnX  
	var movimientoEnY    = avanzarEnY  
	method siguientePaso(posicionActual){
		
		self.actualizarEstado(posicionActual)
		
		return game.at(
				movimientoEnX.proximaPosicion(posicionActual),
				movimientoEnY.proximaPosicion(posicionActual)
		)
	}
	
	method actualizarEstado(posicionActual) {
		if( posicionActual.x() > maximoDeX ){
			movimientoEnX = retrocederEnX
		}
		
		if( posicionActual.y() > maximoDeY ){
			movimientoEnY = retrocederEnY
		}
	}
	

}
