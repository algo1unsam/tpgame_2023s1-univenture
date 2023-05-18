import wollok.game.*
import niveles.*
import tutorial.*

object menu {
	method comenzar(){
		nivel.cargar()
	}
	method instrucciones(){
		
	}
	method salir(){
		game.stop()
	}
}

