import wollok.game.*

object avanzarEnX {
	
	method position(entidad){
		return game.at(
			entidad.position().x() + 1,
			entidad.position().y() 
		)
	}
	
	method siguiente()= avanzarEnY
}
object avanzarEnY {
	method position(entidad){
		return game.at(
			entidad.position().x(),
			entidad.position().y() +  1 
		)
	}
	method siguiente()= retrocederEnX
}

object retrocederEnX {
	method siguiente()= retrocederEnY
	method position(entidad){
		return game.at(
			entidad.position().x() - 1,
			entidad.position().y() 
		)
	}
}



object retrocederEnY {
	method siguiente()= avanzarEnX
	method position(entidad){
		return game.at(
			entidad.position().x(),
			entidad.position().y() -  1 
		)
	}
}
