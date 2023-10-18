import wollok.game.*

object capaDeInvisibilidad {
	
}

object pildoraDeAltura {
	
}








// Test de animaciones 
object posionMisteriosa { // Usa lo aleatorio
	// Envenena o da vida a quioen la tome. Esto se determina de manera aleatoria
	
}


object moneda { 
	// Recolectable que sirve apara sobornar al guardia
	const fotogramas = 10
	var fotograma = 1
	var property position = game.at(0,0)
	
	method image() =  "moneda_de_oro-rotacion-"+ fotograma +".png"
	
	method animation(){
		if (fotograma != fotogramas) {
			fotograma++
		} else {fotograma = 1}
	}
	
	
}

object zapatosDeVelocidad { // Usa state (del pj)
	// Equipabler que otorga velocidad
}

class Espada { // Usa herencia 
	// Clase para construir distintas espadas con distintas cualidades (p.ej.: velocidad, daño, etc)
	
}

