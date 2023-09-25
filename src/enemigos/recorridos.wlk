import wollok.game.*
import estadoDeAvance.*

class RecorrerHastaColisionar {
	var avance = avanzarEnX
	method position(entidad) {
		return avance.position(entidad)
	}
	
	method siguienteDireccion(){
		avance = avance.siguiente()
	}
}

