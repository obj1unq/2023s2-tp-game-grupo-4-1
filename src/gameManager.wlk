import wollok.game.*
import hud.*
import jugador.*
import entorno.*
import enemigos.*
import movimientoEntidades.*
import mapa.*
import generadorDeEnemigos.*
import levelManagement.*

object gameManager {

	var estaCompleto = false

	method generar() {
		estaCompleto = false
		game.clear()
		mapa.generar(levelManager.nivelActual())
		game.addVisual(jugador)
		generadorDeEnemigos.generar()
		jugador.comportamiento()
		hud.add()
	}

	method cambiarAsiguienteNivel() {
		self.validarSiEstaCompleto()
		self.generar()
	}

	method validarSiEstaCompleto() {
		if (not estaCompleto) {
			self.error("No se puede cambiar de nivel si no esta completo")
		}
	}

	method completarNivel() {
		estaCompleto = true
		levelManager.aumentarNivelActual()
		self.generarPortal()
	}

	method generarPortal(){
		game.addVisualIn(portal, generadorDeEnemigos.validPosition())
	}
	method estaCompletoElNivel() = estaCompleto

	method numeroDeNivel() = levelManager.numeroDeNivel()

}

