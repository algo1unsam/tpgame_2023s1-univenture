import wollok.game.*
import topos.*
import escenarios.*

class Niveles {

}

object nivel inherits Niveles {

	method cargar() {
		game.addVisual(escenario1)
		game.addVisual(reloj)	
		reloj.iniciar()
	}
	
	method cargarTopos(){
		
	}
}


