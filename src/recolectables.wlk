import wollok.game.*
import jugador.*








class ObjetoAnimado {
	const property fotogramas 
	const property nombre
	
	
	var fotograma = 1
	var property position = game.at(0,0)
	method parar() {}
	method isSolid() = false
	method image() = nombre + fotograma + ".png"
	
	method comportamiento() {
		game.onTick(self.msFotogramas(),"animacion",{self.animation()})
	}
	
	method msFotogramas() = 50
	
	method animation(){
		if (fotograma != fotogramas) {
			fotograma++
		} else {fotograma = 1}
	}
	

	
	 method collide(pj) {
		self.accion(pj)
		game.removeVisual(self)
	}
	
	method accion(pj)
}

class ObjetoRecolectable inherits ObjetoAnimado {

	method colide(pj) {
		pj.agregar(self)
	}
}

// Envenena o da vida a quioen la tome. Esto se determina de manera aleatoria
object posionMisteriosa inherits ObjetoAnimado(fotogramas = 8, nombre = "posion_misteriosa-") { 

	override method accion(pj) { 

		#{	pj.subirVida(), 
			pj.bajarVida()
		 }.anyOne()
	}
	
	
}


// Recolectable que sirve apara sobornar al guardia
object moneda inherits ObjetoAnimado(fotogramas = 10, nombre = "moneda_de_oro-rotacion-") { // Usa la validacion 
	override method accion(pj) {
		
	}
}

// Equipabler que otorga velocidad
object zapatosDeVelocidad { // Usa state (del pj)
	
}


// Clase para construir distintas espadas con distintas cualidades (p.ej.: daño, visual)	
class Espada { // Usa herencia 
	
}

