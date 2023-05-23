import wollok.game.*
import topos.*
import escenarios.*
import wlklib.*

class Nivel {
}

object nivel1 inherits Nivel {

	const listaTopo = [ topoNormal, topoFuego, topoAgua, topoTierra ]
//	const listaPosiciones = [ pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9 ]
	const listaPosiciones = [
		game.at(1, 19),
		game.at(17, 18),
		game.at(28, 16),
		game.at(7, 13),
		game.at(18, 9),
		game.at(28, 10),
		game.at(3, 5),
		game.at(14, 2),
		game.at(26, 3)
	]
	const listaPrueba = []
	
//	method cargar() {
//		game.addVisual(escenario1)
//		game.addVisual(reloj)
//		game.addVisual(puntaje)
//		self.dibujarTopo()
//		reloj.iniciar()
//	}
	
	method cargar() {
		game.addVisual(escenario1)
		game.addVisual(reloj)
		game.addVisual(puntaje)
		keyboard.space().onPressDo({ self.dibujarTopo() })
		keyboard.w().onPressDo({ self.pegar() })
		reloj.iniciar()
	}

	method dibujarTopo() {
		
		const topoRandom = self.alAzar(listaTopo)
		const posRandom = self.alAzar(listaPosiciones)
		
		
		topoRandom.position(posRandom)
		game.addVisual(topoRandom)
//		listaTopo.remove(topoRandom)
		listaPrueba.add(topoRandom)
		
		essentials.makeCycle(10, topoRandom.sprite().frames()-1, { topoRandom.image(topoRandom.sprite().cycle()) })
		game.schedule(10*topoRandom.sprite().frames(), { topoRandom.inmunidad(false) })
		
//      game.addVisualIn(self.alAzar(listaTopo), self.alAzar(listaPosiciones).position())
//		game.addVisualIn(self.alAzar(listaTopo), listaPosiciones.get(0.randomUpTo(8)).position())
	}
	
	// todo nuevo
	method pegar() {
		listaPrueba.forEach({ e => if(not e.inmunidad()) {game.removeVisual(e); listaPrueba.remove(e)} })
	}

	method borrarTopo() {
	}

	method alAzar(lista_) = lista_.anyOne()

	method getlista() = listaPosiciones

}

object pos1 {

	const property position = game.at(1, 19)

}

object pos2 {

	const property position = game.at(17, 18)

}

object pos3 {

	const property position = game.at(28, 16)

}

object pos4 {

	const property position = game.at(7, 13)

}

object pos5 {

	const property position = game.at(18, 9)

}

object pos6 {

	const property position = game.at(28, 10)

}

object pos7 {

	const property position = game.at(3, 5)

}

object pos8 {

	const property position = game.at(14, 2)

}

object pos9 {

	const property position = game.at(26, 3)

}

