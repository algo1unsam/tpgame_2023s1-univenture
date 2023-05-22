import wollok.game.*
import topos.*

object config {

	// Teclado
	method configurarTeclas() {
		keyboard.num1().onPressDo({ self.coll(1, 19)}) // pos = game.at(1,19)
		keyboard.num2().onPressDo({ self.coll(17, 18)}) // pos = game.at(17,18)
		keyboard.num3().onPressDo({ self.coll(28, 16)}) // pos = game.at(28,16)
		keyboard.num4().onPressDo({ self.coll(7, 13)}) // pos = game.at(7,13)
		keyboard.num5().onPressDo({ self.coll(18, 9)}) // pos = game.at(18,9)
		keyboard.num6().onPressDo({ self.coll(28, 10)}) // pos = game.at(28,10)
		keyboard.num7().onPressDo({ self.coll(3, 5)}) // pos = game.at(3,5)
		keyboard.num8().onPressDo({ self.coll(14, 5)}) // pos = game.at(14,2)
		keyboard.num9().onPressDo({ self.coll(26, 3)}) // pos = game.at(26,3)
	}

	method coll(x, y) {
		var objectList = []
		objectList = game.getObjectsIn(game.at(x, y))
		if (objectList.isEmpty()) {
			game.say(puntaje, "Fallaste")
		} else {
			objectList.forEach({ topo => topo.golpe()})
		}
	}

}

