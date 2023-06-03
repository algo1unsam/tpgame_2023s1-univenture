class Hueco {
	var property position;
	var property image = 'topos/topo_agua/frame0.png';
	
	method esTopo() = false;
}

class Letra {
	const letra;
	var property position;
	var image = null;
	
	method initialize() {
		image = 'controles/' + letra + '.png'
	}
	
	method image() = image;
	method esTopo() = false;
}

class Explosion {
	
	method esTopo() = false;
}