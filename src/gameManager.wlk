import wollok.game.*
import hud.*
import jugador.*
import entorno.*
import enemigos.*
import mapa.*
import generadorDePosiciones.*
import generadorDeEnemigos.*
import levelManagement.*
import recolectables.*

object gameManager {

	var sounds = true
	var cantDeEnemigosVivos = 1
	var cantEnemigos = 1

	method generar() {
		if (levelManager.quedanNiveles()) {
			game.clear()
			mapa.generar(levelManager.nivelActual())
			self.agregarJugador()
			self.generarEnemigosYAumentarDificultad()
			hud.add()
		} else {
			self.victoria()
		}
	// keyboard.c().onPressDo({ self.completarNivel()}) // Quitar despues, solo para devs
	}

	method opcionDeReset() {
		keyboard.r().onPressDo({ self.reset()})
	}

	method reset() {
		jugador.reset()
		levelManager.reset()
		hud.reset()
		self.generar()
	}

	method victoria() {
		game.clear()
		self.opcionDeReset()
		hud.mostrarCartelDeVictoria()
	}

	method agregarJugador() {
		game.addVisual(jugador)
		jugador.position(game.at(1, 1))
		jugador.comportamiento()
	}

	method generarEnemigosYAumentarDificultad() {
		generadorDeEnemigos.generar(cantEnemigos)
		cantDeEnemigosVivos = cantEnemigos
		cantEnemigos++
	}

	method derrota() {
		game.clear()
		self.opcionDeReset()
		hud.mostrarCartelDeDerrota()
	}

	method cambiarAsiguienteNivel() {
		// self.validarSiEstaCompleto()
		self.generar()
	}

	method validarSiEstaCompleto() {
		if (not self.estaCompletoElNivel()) {
			self.error("No se puede cambiar de nivel si no esta completo")
		}
	}

	method completarNivel() {
		self.validarSiEstaCompleto()
		levelManager.aumentarNivelActual()
		self.generarPortal()
	}

	method generarPortal() {
		game.addVisualIn(portal, generadorDePosiciones.validPosition({ position => generadorDeEnemigos.estaVaciaLaCelda(position)}))
		if (sounds) {
			portal.play()
		}
	}

	method estaCompletoElNivel() = cantDeEnemigosVivos <= 0 && jugador.tieneItem(moneda)

	method numeroDeNivel() = levelManager.numeroDeNivel()

	method eliminarEnemigo() {
		cantDeEnemigosVivos--
	}

	method sounds(v) {
		sounds = v
	}

}

