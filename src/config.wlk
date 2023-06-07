import wollok.game.*
import menu.Menu
import topos.topos
import clases.*
import juego.*
import letras.letras
import mapeoTeclas.*

object config {

	method iniciar() {
		const menu = new Menu(items = [ ['jugar', 'menu/lapida_jugar.png','menu/lapida_desactivada.png'], ['guia', 'menu/lapida_guia.png','menu/lapida_desactivada.png'], ['salir', 'menu/lapida_salir.png','menu/lapida_desactivada.png'] ])
		menu.iniciar()
		const accionSpace = { try {
			if (menu.indice() == 'jugar') {
				menu.limpiarMenu()
				variablesDeJuego.limpiarPuntaje()
				end.limpiarScore()
				juego.iniciar()
				juego._generarHueco()
				juego._generarHueco()
				juego._generarHueco()
				juego._generarHueco()
			}
			if (menu.indice() == 'guia') {
				menu.limpiarMenu()
				guia.iniciarGuia()
			}
			if (menu.indice() == 'salir') {
				game.stop()
			}
		} catch e : Exception
			('No se pudo seleccionar')
		}
		const accionBackspace = { if (game.hasVisual(variablesDeJuego)) {
				juego.terminar()
				game.allVisuals().forEach({ visual => game.removeVisual(visual)})
				menu.iniciar()
			}
			if (game.hasVisual(end)) {
				game.allVisuals().forEach({ visual => game.removeVisual(visual)})
				menu.iniciar()
			}
			try {
				game.removeVisual(guia)
				menu.iniciar()
			} catch e : wollok.lang.Exception {
				return 'ya estas en el menu'
			}
		}
		mapeoTeclas.mapearTecla('space', accionSpace)
		mapeoTeclas.mapearTecla('backspace', accionBackspace)
	}

}

