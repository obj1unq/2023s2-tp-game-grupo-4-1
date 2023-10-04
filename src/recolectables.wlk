import wollok.game.*

object capaDeInvisibilidad {
	
	
}

object pildoraDeAltura {
	
	
}


// Test de animaciones 
object pocionDeVida {
	
	
}

object veneno {
	
	
}


object moneda {
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

object zapatosDeVelocidad {
	
	
}

object arma {
	
	
}