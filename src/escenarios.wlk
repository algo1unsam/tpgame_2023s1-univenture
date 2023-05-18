import wollok.game.*

class Escena {

}

object escenario1 inherits Escena {

	var property position = game.origin()

	method image() = "back_nivel1.png"

}

object reloj {
	
	var tiempo = 0
	
	method text() = tiempo.toString()
	method textColor() = "FFFFFFFF"
	method position() = game.at(1, game.height()-3)
	
	method pasarTiempo() {
		tiempo += 1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}