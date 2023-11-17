class AnimatedImage {
	var nameImage 
	const frames 
	const delay
	var delayActual = 0
	var frameActual = 0
	method image() = nameImage + "_" + self.fotograma() + ".png"
	
	method nameImage(img) { nameImage = img}
	method fotograma(){
		self.actualizarFrame()
		return frameActual
	}
	
	method actualizarFrame(){
		if(frameActual == frames ){
			frameActual = 0			
		}else{
			if(delayActual > delay){
				delayActual = 0
				frameActual = frameActual + 1
			}else{
				delayActual++
			}
				
		}
	}
	
	
}
