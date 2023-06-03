import wollok.game.game

object topos {
	method matar(topo) {
		
	}
	
	/** Crea un topo a partir de un tipo en string */
	method crearTopo(tipo, pos) {
		// logica de segun el tipo devuelve un topo.
	}
}

package tiposDeTopos {
	class Topo {
		var property image;
		var property position;
		var invulnerabilidad = true;
		var puntaje = 5;
		
		method morir() {
			// animación de matar.
		}
		
		method puntaje() = puntaje;
		
		method esTopo() = true;
	}
	
	
	class TopoNormal inherits Topo {
		
	}
	class TopoAgua inherits Topo {
		
	}
	class TopoFuego inherits Topo {
		
	}
	class TopoTierra inherits Topo {
		
	}
	class TopoTiempo inherits Topo {
		const puntajeBase = 100;
		var tiempoDeVida = 1;
		
		method initialize() {
			game.onTick(1000, 'topo: ' + self.identity(), {tiempoDeVida = tiempoDeVida + 1})
		}
		
		override method puntaje() = (puntajeBase/tiempoDeVida).truncate(0);
		
		override method morir() {
			game.removeTickEvent('topo: ' + self.identity())
		}
	}
}