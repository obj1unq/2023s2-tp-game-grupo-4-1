import wollok.game.*
import animatedImage.*

class HitBox {

	var entity = null
	const image
	var position = entity.position()
	const boxes = [ new BoxTop(position=position, entity=entity, image=image ), new BoxRight(position=position, entity=entity,image=image), new BoxLeft(position=position, entity=entity, image=image), new BoxBot(position=position, image=image,entity=entity) ]
	var generated = false
	method entity()=entity
	method updatePosition() {
		if(entity != null){
			self.generarHitbox()
			position = entity.position()
			boxes.forEach({ box => box.position(position)})			
		}
	}
	method position() = position

	method generarHitbox() {
		if (not generated) {
			boxes.forEach({ box => game.addVisual(box)})
			generated = true
		}
	}
	method actualizarImageDeBoxes(img){
		boxes.forEach({box=>box.image(img)})
	}
	method remove(){
		entity = null
		boxes.forEach({box=> 
			box.remove()
		})
		boxes.clear()
	}
}

class Box {

	var entity = null
	var position = null
	var image
	var img = new AnimatedImage(nameImage = image, frames = 7, delay = 6)
	method entity()=entity
	method image() = if (game.getObjectsIn(position).any({ element => element.isSolid() })) {
		"empty.png"
	} else {
		img.image()
	}
	method remove(){
		if(entity != null){			
			entity = null
			game.removeVisual(self)
		}
	}
	method image(nImg) {img.nameImage(nImg)}
	method position(p)

	method position() = position

	method isSolid() = false

	method parar() {
	}

	method recibirAtaque(jugador) {
		entity.recibirAtaque(jugador)
		game.removeVisual(self)
	}

	method collide(e) {
		entity.collide(e)
	}

}

class BoxTop inherits Box {

	override method position(p) {
		position = p.up(1)
	}

}

class BoxRight inherits Box {

	override method position(p) {
		position = p.right(1)
	}

}

class BoxLeft inherits Box {

	override method position(p) {
		position = p.left(1)
	}

}

class BoxBot inherits Box {

	override method position(p) {
		position = p.down(1)
	}

}

