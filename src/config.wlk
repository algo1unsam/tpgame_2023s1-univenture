import wollok.game.*
import topos.*

object config {

	method user_inputs() {
		keyboard.i().onPressDo { game.say(topo1, "hola!") }
	}

}