import wollok.game.*
import estadoDeAvance.*

object recorrerHastaColisionar {

	const maximoDeX = 86
	const maximoDeY = 62
	var avance = avanzarEnX
	method position(entidad) {
		return avance.position(entidad)
	}
	
	
	method siguienteDireccion(){
		avance = retrocederEnX
	}
}

