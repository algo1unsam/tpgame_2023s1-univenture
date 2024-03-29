import wollok.game.game
import wlklib.spriteModule.Sprite

class ObjetoPantalla{
	method matar(){}
	method esTopo() = false;
	method borrar(){}
}

class Hueco inherits ObjetoPantalla{
	var property position;
	var property image = 'hueco.png';
	var contador = (1..10).anyOne(); // <-- orientado a objetos
	override method borrar() {
		game.removeVisual(self)
	}
	
	method disponible() {
		if (contador > 0) {
			contador = contador - 1
			return false
		} else {
			contador = (1..10).anyOne()
			return true
		}
	}
}

class Letra inherits ObjetoPantalla{
	const property letra;
	var property position;
	var image = null;
	
	method initialize() {
		image = 'controles/' + letra + '.png'
	}
	
	method image() = image;
	
	override method matar() {
		self.borrar()
		const objetosEnPosicion = game.getObjectsIn(position);
		objetosEnPosicion.remove(self)
		objetosEnPosicion.forEach({objeto => objeto.matar()})
	}
	
	override method borrar() {
		game.removeVisual(self)
	}
}

class Explosion inherits ObjetoPantalla{
	const property sprite = new Sprite(frames=3, path='explosion/frame#.png')
	const property position;
	var image = sprite.getFrame()
	
	method image() = image;
	
	method cycle() {
		image = sprite.cycle()
	}

}

class Texto inherits ObjetoPantalla {
	
	var position 
	var text= "green"
	var textColor = "FFFFFFFF"
	var valor
	
	method initialize(){
		if(valor < 0){
			textColor = "E00700FF"
		}else if (valor > 0){
			textColor = "30E004FF"
		}
	}
	
	method position(){
		return position
	}
	
	method text()
	
	method textColor(){
		return textColor
	}
}

class TextoPuntaje inherits Texto {
	
	override method initialize(){
		super()
	}
	
	override method text(){
		return "                       " + valor.toString() + " Puntos"
	}
	
}

class TextoTiempo inherits Texto {
	
	override method initialize(){
		super()
	}
	
	override method text(){
		return "\n                       " + valor.toString() + " Segundos"
	}
	
}





