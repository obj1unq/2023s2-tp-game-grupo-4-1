import mapa.*

object levelTemplates {

	method nivel1() = [
		[h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h],
		[p,_,_,_,_,_,_,_,p,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,p,_,p,_,_,_,_,_,_,_,_,_,p],
		[p,p,_,_,_,_,_,_,p,_,_,_,_,_,p,p,p],
		[p,_,_,_,_,p,_,p,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],		
		[p,_,_,_,_,_,_,_,_,_,_,_,_,m,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,p,_,_,_,_,_,_,_,_,_,p],		
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p]
	].reverse() 
	method nivel2() = [
		[h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h],
		[p,_,_,_,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,p,_,p,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,p,_,p,p,_,_,_,_,_,_,_,p,p,p,p,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,p,_,e,_,p],		
		[p,_,_,_,_,_,_,m,_,_,_,_,p,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],		
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p]
	].reverse() 
	method nivel3() = [
		[h,h,h,h,h,h,h,h,h,h,h,p,h,h,h,h,h],
		[p,_,_,_,_,_,_,_,p,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,_,_,p,_,_,_,_,_,_,_,p],
		[p,p,p,p,p,p,p,p,p,_,_,_,_,p,p,p,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,p,_,_,p],
		[p,_,_,_,_,p,_,_,_,_,_,_,_,p,_,_,p],		
		[p,_,_,_,_,_,_,_,_,p,_,_,_,m,_,_,p],
		[p,_,_,_,_,_,p,p,p,p,_,_,_,_,_,_,p],
		[p,_,_,_,_,_,p,_,_,_,_,_,_,_,_,_,p],		
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p]
	].reverse() 
	
	method nivel4()= [
		[h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h,h],
		[p,_,_,_,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,_,_,_,p,_,_,_,_,p,_,_,_,_,_,_,p],
		[p,p,_,p,p,_,_,_,_,_,_,_,_,_,_,_,p],
		[p,p,_,p,p,_,_,_,_,_,_,_,p,p,p,p,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,p,_,_,_,p],		
		[p,_,_,_,_,_,_,m,_,_,_,_,p,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,p,_,_,_,p],
		[p,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,p],		
		[p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p]
	].reverse()
	
	method niveles() {
		return [
				self.nivel1(),
				self.nivel2(),
				self.nivel3(),
				self.nivel4()
		]
	}
}
object levelManager {

	const niveles = levelTemplates.niveles()
	var nivelActual = 0

	method numeroDeNivel() = nivelActual

	method nivelActual() {
		return niveles.get(nivelActual)
	}

	method aumentarNivelActual() {
		self.validarQueExistenMasNiveles()
		nivelActual++
	}
	
	method validarQueExistenMasNiveles(){
		if(niveles.size() < nivelActual){
			self.error("No existen más niveles")
		}
	}

}

