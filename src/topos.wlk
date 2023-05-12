import wollok.game.*
import config.*

class Topo {
	
	var property position

	method image() = "cell_30.png"
}

const topo1 = new Topo(position = game.center())