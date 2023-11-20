import wollok.game.*
import hud.*
import jugador.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import generadorDeEnemigos.*

object gameManager {
	var estaCompleto = false
	method generar() {
		estaCompleto = false
		game.clear()
		mapa.generar() // NO TOCAR
		game.addVisual(jugador)
		generadorDeEnemigos.generar()
		jugador.comportamiento()
		hud.add()
	}
	
	method cambiarNivelSiEstaCompleto(){
		self.validarSiEstaCompleto()
		self.generar()
	}
	
	method validarSiEstaCompleto() {
		if(not estaCompleto){
			self.error("No se puede cambiar de nivel si no esta completo")
		}
	}
	method completarNivel(){
		estaCompleto = true
		levelManager.siguienteNivel()
	}
	method estaCompletoElNivel() = estaCompleto
	method nivelActual() = levelManager.numeroDeNivel()
}

object levelManager{
	const niveles = []
	var nivelActual = 0
	method numeroDeNivel() = nivelActual
	
	method siguienteNivel() { nivelActual++}
}

