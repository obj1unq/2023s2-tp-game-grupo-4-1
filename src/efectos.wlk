import wollok.game.*
import animatedImage.*

class Efecto inherits gameEntity.GameEntity {

	override method image() = self.calcularImagen()

	method calcularImagen()

}

class Explosion inherits Efecto {

	const animatedImg = new AnimatedImage(nameImage = "explosion", frames = 3, delay = 5, temporal = true)
	
	override method calcularImagen()=animatedImg.image()
}

