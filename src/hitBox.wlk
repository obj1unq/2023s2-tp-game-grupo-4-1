import wollok.game.*

class HitBox {

	const property entity = null
	const image 
	var position = entity.position()
	const boxes = [ new BoxTop(position=position, entity=entity, image=image ), new BoxRight(position=position, entity=entity,image=image), new BoxLeft(position=position, entity=entity, image=image), new BoxBot(position=position, image=image,entity=entity) ]
	var generated = false

	method updatePosition() {
		self.generarHitbox()
		position = entity.position()
		boxes.forEach({ box => box.position(position)})
	}

	method position() = position

	method generarHitbox() {
		if (not generated) {
			boxes.forEach({ box => game.addVisual(box)})
			generated = true
		}
	}
	
	
}

class Box {

	const entity = null
	var position = null
	var image 
	method image() = if(game.getObjectsIn(position).any({element => element.isSolid() })) { "empty" } else { image } + ".png"

	method position(p)

	method position() = position

	method isSolid() = false

	method parar() {
	}
	method recibirAtaque(jugador){
		entity.recibirAtaque(jugador)
	}
	method collide(e) {
		game.removeVisual(self)
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

