import wollok.game.*

class Escena {

}

object escenario1 inherits Escena {

	var property position = game.origin()

	method image() = "back_nivel1.png"

}

object reloj {

	var tiempo = 5

	method textColor() = "FFFFFFFF"

	method text() = "Tiempo: " + tiempo.toString()

	method position() = game.at(1, game.height() - 3)

	method pasarTiempo() {
		if (tiempo == 0) {
			self.detener()
		} else {
			tiempo -= 1
		}
	}
	

	method iniciar() {
		game.onTick(1000, "tiempo", { self.pasarTiempo()})
	}

	method detener() {
		game.removeTickEvent("tiempo")
	}

}

