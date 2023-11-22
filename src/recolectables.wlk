import wollok.game.*
import jugador.*



class ObjetoRecolectable {
	var property position = game.at(0,0)
	method collide(pj) {
		self.accion(self)
		game.removeVisual(self)
		
	}
	
	method isSolid() = false
	
	method accion(item) {jugador.agregar(item)}
	
}




class ObjetoAnimado inherits ObjetoRecolectable{
	const property fotogramas 
	const property nombre
	
	
	var fotograma = 1
	//method parar() {}
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
	


}



// Envenena o da vida a quioen la tome. Esto se determina de manera aleatoria
object posionMisteriosa inherits ObjetoAnimado(fotogramas = 8, nombre = "posion_misteriosa-") { 

	


	override method accion(pj) { 
		
		#{	
			{self.curar()},
			{self.daniar()}
			
		 }.anyOne().apply()
	}
	
	method curar() {
		jugador.subirVida()
		game.say(jugador,"Vida subida!!")
	}
	
	method daniar() {
		jugador.bajarVida()
		game.say(jugador,"Has recibido daño!!")
	}
}


// Recolectable que sirve apara sobornar al guardia
object moneda inherits ObjetoAnimado(fotogramas = 10, nombre = "moneda_de_oro-rotacion-") { // Usa la validacion 
	override method accion(pj) {
		
	}
}

object escudo inherits ObjetoRecolectable{ 
	method image() = "escudo.png"
}


object espada inherits ObjetoRecolectable{ 
	method image() = "espada.png"
}

