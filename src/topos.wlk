import wollok.game.*
import config.*

class Topo {

	const hitPoint = 50

	method golpe() {
		puntaje.setPuntajeTotal(hitPoint)
	}

}

object puntaje {

	var puntajeTotal = 0
	const missHit = 0

	method position() = game.at(1, game.height() - 4)

	method textColor() = "FFFFFFFF"

	method text() = "Puntaje: " + self.getPuntajeTotal().toString()

	method getPuntajeTotal() = puntajeTotal

	method setPuntajeTotal(puntaje) {
		puntajeTotal += puntaje
	}

	method missed() {
		self.setPuntajeTotal(missHit)
	}

}

//Topo bronce
object topoNormal inherits Topo {

	method image() = "animacion_topo/frame1.png"

}

//Topo plata
object topoAgua inherits Topo(hitPoint = 75) {

	method image() = "animacion_topo/frame4.png"

}

//Topo Platinum
object topoFuego inherits Topo(hitPoint = 250) {

	method image() = "animacion_topo/frame6.png"

}

//Topo oro
object topoTierra inherits Topo(hitPoint = 125) {

	method image() = "animacion_topo/frame8.png"

}

//Topo bomba
object topoBomba inherits Topo(hitPoint = -100) {

	method image() = "animacion_topo/frame8.png"

}

