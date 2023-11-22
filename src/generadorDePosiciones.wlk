import wollok.game.*

object generadorDePosiciones {
	method randomPosition() {
		return game.at((3 .. game.width() - 1 ).anyOne(), (4 .. game.height() - 1).anyOne())
	}
	method validPosition(validationBlock) {
		const position = self.randomPosition()
		return if (validationBlock.apply(position)) {
			position
		} else {
			self.validPosition(validationBlock)
		}
	}
	method estaVaciaLaCelda(position) = game.getObjectsIn(position).all({ element => not element.isSolid() })
}

