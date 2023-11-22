import wollok.game.*
import jugador.*
import hud.*
import gameManager.*
import animatedImage.*

class ObjetoRecolectable {
	var property position = game.at(0,0)
	method collide(pj) {
		self.accion(self)
	}
	
	method isSolid() = false
	
	method accion(item) {
		jugador.agregar(item)
		hud_inventario.actualizar(item)
	}
	method recibirAtaque(x){}
}
// Envenena o da vida a quioen la tome. Esto se determina de manera aleatoria
object posionMisteriosa inherits ObjetoRecolectable { 
	const imagA = new AnimatedImage(nameImage = "posion_misteriosa", frames = 7, delay = 5)
	method image() = imagA.image()
	override method collide(pj) {
		super(pj)
		game.removeVisual(self)
	}

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
object moneda inherits ObjetoRecolectable{ // Usa la validacion 
	const imagA = new AnimatedImage(nameImage = "moneda_de_oro-rotacion", frames = 9, delay = 5)
	method image() = imagA.image()
	override method collide(e){
		super(e)
		if (gameManager.estaCompletoElNivel()) {
			gameManager.completarNivel()
		}
	}
}

object escudo inherits ObjetoRecolectable{ 
	method image() = "escudo.png"
}


object espada inherits ObjetoRecolectable{ 
	method image() = "espada.png"
}

