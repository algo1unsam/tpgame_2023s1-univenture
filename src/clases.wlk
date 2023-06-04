import wollok.game.game

class Hueco {
	var property position;
	var property image = 'topos/topo_agua/frame0.png';
	
	method esTopo() = false;
	method matar(){};
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
		console.println('letra ' +letra+' '+game.getObjectsIn(position) + ' ' + position.x() + ' '+  position.y())
		const objetosEnPosicion = game.getObjectsIn(position);
		
		objetosEnPosicion.remove(self)
		objetosEnPosicion.forEach({objeto => objeto.matar()})
		
		game.removeVisual(self)
	}
}

class Explosion {
	
	method esTopo() = false;
	method matar();
}