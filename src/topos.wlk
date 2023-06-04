import wollok.game.game
import letras.*

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
		var puntaje = 5;
		const tiempoDeVidaMaximo;
		var letraRandom = '';
		
		method initialize() {
			game.addVisual(self);
			
			letraRandom = letras.letraUnica();
			letraRandom.position(position);
			game.addVisual(letraRandom);
			
			game.onTick(tiempoDeVidaMaximo, 'topoMaxVida ' + self.identity(), {letraRandom.matar()})
		}
		
		method matar() {
			// animación de matar.
			game.removeVisual(self)
			game.removeTickEvent('topoMaxVida ' + self.identity())
			return puntaje;
		}
		
		method puntaje() = puntaje;
		
		method esTopo() = true;
		method esLetra() = false;
	}
	
	
	class TopoNormal inherits Topo {
		override method initialize() { super() }
	}
	class TopoAgua inherits Topo {
		override method initialize() { super() }
	}
	class TopoFuego inherits Topo {
		override method initialize() { super() }
	}
	class TopoTierra inherits Topo {
		override method initialize() { super() }
	}
	class TopoTiempo inherits Topo {
		const puntajeBase = 100;
		var tiempoDeVida = 1;
		
		override method initialize() {
			super()
			game.onTick(1000, 'topo suma tiempo: ' + self.identity(), {tiempoDeVida = tiempoDeVida + 1})
		}
		
		override method puntaje() = (puntajeBase/tiempoDeVida).truncate(0);
		
		override method matar() {
			super()
			game.removeTickEvent('topo suma tiempo: ' + self.identity());
		}
	}
}