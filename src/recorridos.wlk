import wollok.game.*
import estadoDeAvance.*
object recorrerBorde {
	const maximoDeX 	 = 86
	const maximoDeY 	 = 62
	var movimientoEnX    = avanzarEnX  
	var movimientoEnY    = avanceNuloEnY  
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
		if(posicionActual.x() == 0){
			movimientoEnX = avanzarEnX
		}
		
		if( posicionActual.y() > maximoDeY ){
			movimientoEnY = retrocederEnY
		}
		
		if( posicionActual.y() == 0){
			movimientoEnY = avanzarEnY
		}
	}
}
