import wollok.game.*

class AnimatedImage {

	var nameImage
	const frames
	const delay
	var delayActual = 0
	var frameActual = 0
	const temporal = false

	method image() = nameImage + "_" + self.fotograma() + ".png"

	method nameImage(img) {
		nameImage = img
	}

	method fotograma() {
		self.actualizarFrame()
		return frameActual
	}

	method actualizarFrame() {
		if (frameActual == frames) {
			self.terminarAnimacionSiEsTemporal()
		} else {
			self.actualizarDelay()
		}
	}

	method actualizarDelay() {
		if (delayActual > delay) {
			delayActual = 0
			frameActual = frameActual + 1
		} else {
			delayActual++
		}
	}

	method terminarAnimacionSiEsTemporal() {
		if (not temporal) {
			frameActual = 0
		}
	}

}

