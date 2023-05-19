import wollok.game.*
import niveles.*
import tutorial.*

object menu {
	method comenzar(){
		nivel1.cargar()
	}
	method instrucciones(){
		
	}
	method salir(){
		game.stop()
	}
}

