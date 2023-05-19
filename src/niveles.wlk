import wollok.game.*
import topos.*
import escenarios.*

class Nivel {
}

object nivel1 inherits Nivel {

	const listaTopo = [ topoNormal, topoFuego, topoAgua, topoTierra ]
	const listaPosiciones = [ pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9 ]

	method cargar() {
		game.addVisual(escenario1)
		game.addVisual(reloj)
		game.addVisual(puntaje)
		self.dibujarTopo()
		reloj.iniciar()
	}

	method dibujarTopo() {
		// game.addVisualIn(self.alAzar(listaTopo), self.alAzar(listaPosiciones).position())
		game.addVisualIn(self.alAzar(listaTopo), listaPosiciones.get(0.randomUpTo(8)).position())
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

