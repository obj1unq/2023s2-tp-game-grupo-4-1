import wollok.game.*
class HitBox {
	const property entity = null
	var position = entity.position()
	const boxes = [
			new BoxTop(position=position),
			new BoxRight(position=position),
			new BoxLeft(position=position),
			new BoxBot(position=position)
		]
	var generated = false
	
	method updatePosition(){
		self.generarHitbox()
		position = entity.position()
		boxes.forEach({ box => box.position(position)})
		
	}
	method position()=position
	method generarHitbox(){
		if (not generated){
			boxes.forEach({ box => game.addVisual(box)})
			generated = true			
		}
	}
}


class Box{
	var position = null	
	method image()= "hitboxPreview.png"
	method position(p)
	method position()=position
	method collide(e){
		
	}
	method isSolid()=false
}

class BoxTop inherits Box{
	override method position(p){
		position = p.up(1)
	}
}
class BoxRight inherits Box{
	override method position(p){
		position = p.right(1)
	}
}
class BoxLeft inherits Box{
	override method position(p){
		position = p.left(1)
	}
}
class BoxBot inherits Box{
	override method position(p){
		position = p.down(1)
	}
}