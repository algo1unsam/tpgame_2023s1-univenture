import wollok.game.game
import wlklib.spriteModule.Sprite

class Hueco {
	var property position;
	var property image = 'hueco.png';
	var contador = (1..10).anyOne(); // <-- orientado a objetos
	
	method esTopo() = false;
	method matar(){};
	method borrar() {
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

class Letra {
	const property letra;
	var property position;
	var image = null;
	
	method initialize() {
		image = 'controles/' + letra + '.png'
	}
	
	method image() = image;
	
	method esTopo() = false;
	method matar() {
		self.borrar()
		const objetosEnPosicion = game.getObjectsIn(position);
		objetosEnPosicion.remove(self)
		objetosEnPosicion.forEach({objeto => objeto.matar()})
	}
	
	method borrar() {
		game.removeVisual(self)
	}
}

class Explosion {
	const property sprite = new Sprite(frames=3, path='explosion/frame#.png')
	const property position;
	var image = sprite.getFrame()
	method esTopo() = false;
	method matar() {
		
	};
	method image() = image;
	method cycle() {
		image = sprite.cycle()
	}
}