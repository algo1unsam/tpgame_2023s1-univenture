import wollok.game.*
import config.*
import wlklib.spriteModule.*
import wlklib.essentials

class Topo {
	
	var property inmunidad = true
	
	var property position = game.at(-1, -1)
	
	const property sprite = new Sprite(frames = 10, path="animacion_topo/frame#.png")
	
	var property image = sprite.getFrame()
	
	
	// 50 fps (1000 ms)
	// 200 ms -> topoNormal (10 frames)
	// 150 ms -> topoTierra (15 ms / frame)
	// 100 ms -> topoAgua (5 frames)
	// 100 ms -> topoFuego (5 frames)
	
	method golpe() {
	}
}

object puntaje {

	var property puntajeTotal = 0

	method position() = game.at(1, game.height() - 4)

	method textColor() = "FFFFFFFF"

	method text() = "Puntaje: " + self.puntajeTotal().toString()

}

object topoNormal inherits Topo {
//	method image() = "animacion_topo/frame1.png"

}

object topoAgua inherits Topo {

	override method golpe() {
	}

//	method image() = "animacion_topo/frame4.png"

}

object topoFuego inherits Topo {

	override method golpe() {
	}

//	method image() = "animacion_topo/frame6.png"

}

object topoTierra inherits Topo {

	override method golpe() {
	}

//	method image() = "animacion_topo/frame8.png"

}
























