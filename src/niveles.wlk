import wollok.game.*
import topos.*
import escenarios.*

class Niveles {

}

object nivel inherits Niveles {

	method cargar() {
		game.addVisual(escenario1)
		game.addVisual(reloj)
		game.addVisual(puntaje)	
		reloj.iniciar()
		
	}
	
	method cargarTopos(){
		
	}
}


