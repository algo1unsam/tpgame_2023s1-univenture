import wollok.game.*
import config.*

class Topo {
	method golpe() {
	}

}

object puntaje {

	var property puntajeTotal = 0

	method position() = game.at(1, game.height() - 4)

	method textColor() = "FFFFFFFF"

	method text() = "Puntaje: " + self.puntajeTotal().toString()

}

object topoNormal inherits Topo {
	method image() = "animacion_topo/frame1.png"

}

object topoAgua inherits Topo {

	override method golpe() {
	}

	method image() = "animacion_topo/frame4.png"

}

object topoFuego inherits Topo {

	override method golpe() {
	}

	method image() = "animacion_topo/frame6.png"

}

object topoTierra inherits Topo {

	override method golpe() {
	}

	method image() = "animacion_topo/frame8.png"

}

