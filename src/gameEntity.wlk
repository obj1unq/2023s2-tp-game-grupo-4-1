import hitBox.*
class GameEntity {
	const hitBox = new HitBox(entity=self)
	const property poderDeAtaque = 0
	var property position = null
	const property isSolid = false
	var vida = 0
	method image()
	method comportamiento() {}
	method collide(a)
	method recibirAtaque(a) {}
}
