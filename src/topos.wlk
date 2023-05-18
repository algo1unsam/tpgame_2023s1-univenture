import wollok.game.*
import config.*

object puntaje {

	var property puntajeTotal = 0

	method position() = game.at(1, game.height() - 4)

	method textColor() = "FFFFFFFF"
	

	method text() = "Puntaje: " + self.puntajeTotal().toString()

}

class Topo {

	method golpe() {
	}

}

object topoNormal {

}

object topoAgua inherits Topo {

	override method golpe() {
	}

}

object topoFuego inherits Topo {

	override method golpe() {
	}

}

object topoTierra inherits Topo {

	override method golpe() {
	}

}

