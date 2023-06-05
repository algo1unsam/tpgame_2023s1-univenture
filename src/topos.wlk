import wollok.game.game
import letras.*
import juego.variablesDeJuego
import wlklib.spriteModule.*
import wlklib.essentials
import clases.Explosion

object topos {
//	/** topos en orden ascendente por difucultad */
//	const tiposDeTopos = ['normal', 'aire', 'bomba', 'fuego']
	method matar(topo) {
		
	}
	
	/** Crea un topo a partir de un tipo en string */
	method crearTopo(tipo, pos) {
		// logica de segun el tipo devuelve un topo.
		const topoElegido = ['fuego', 'normal','agua','viento','bomba'].anyOne()
		if (topoElegido == 'fuego') {
			const nuevoTopo = new tiposDeTopos.TopoFuego(position=pos)
		} else if (topoElegido == 'normal'){
			const nuevoTopo = new tiposDeTopos.TopoTierra(position=pos)
		}else if (topoElegido == 'agua'){
			const nuevoTopo = new tiposDeTopos.TopoAgua(position=pos)
		}else if (topoElegido == 'viento'){
			const nuevoTopo = new tiposDeTopos.TopoViento(position=pos)
		}else if (topoElegido == 'bomba'){
			const nuevoTopo = new tiposDeTopos.TopoBomba(position=pos)
		}
	}
}

package tiposDeTopos {
	class Topo {
		var sprite = new Sprite(frames=7, path='topos/topo_tierra/frame#.png')
		var property image = sprite.getFrame()
		var property position;
		var puntaje = 0;
		var bonusTiempo = 0;
		const tiempoDeVidaMaximo = 5000;
		var letraRandom = '';
		var velocidad = 10;
		var loMatoElJugador=true;
		var puntajeFinDeTiempo = 0;
		
		method initialize() {
			game.addVisual(self);
            
            essentials.makeCycle(velocidad, sprite.frames()-1, 
                {image = sprite.cycle()},
                'topoAnimSubir ' + self.identity(),
                { // cuando termina la animación ejecuta este bloque.
                    self.crearLetraUnica()           
                    game.onTick(tiempoDeVidaMaximo, 'topoMaxVida ' + self.identity(), {
                    	// entra acá si se pasó de tiempo.
                    	loMatoElJugador = false;
                    	letraRandom.matar()
                    	puntaje=puntajeFinDeTiempo;
                    })
                },{}
            )
		}
		
		method crearLetraUnica() {
			letraRandom = letras.letraUnica();
			letraRandom.position(position);
			game.addVisual(letraRandom);
		}
		
		method matar() {
			if (loMatoElJugador) {
				self.borrar()
				var explosion = new Explosion(position=position)
				game.addVisual(explosion)
				image = sprite.getFrame(0)
				
				essentials.makeCycle(30,explosion.sprite().frames()-1,{
					explosion.cycle()
				},'exp'+self.identity(),{
					game.removeVisual(explosion)
				},{})
				
			} else {
				essentials.makeCycle(velocidad, sprite.frames()-1,{
	            	sprite.cycle(-1);
	            	image = sprite.getFrame();
	            },'topoAnimBajar ' + self.identity(),{
	            	self.borrar()
	            },{})
			}
			
			variablesDeJuego.sumarPuntaje(puntaje)
			variablesDeJuego.sumarTiempo(bonusTiempo)
			return puntaje;
		}
		
		method borrar() {
			game.removeVisual(self)
			game.removeTickEvent('topoMaxVida ' + self.identity())
		}
		
		method puntaje() = puntaje;
		method bonusTiempo() = bonusTiempo;
		
		method esTopo() = true;
		method esLetra() = false;
	}
	
	class TopoAgua inherits Topo {
		override method initialize() {
			sprite = new Sprite(frames=5, path='topos/topo_agua/frame#.png')
			puntaje = 50
			velocidad = 5
			super()
		}
	}
	class TopoFuego inherits Topo {
		override method initialize() { 
			sprite = new Sprite(frames=5, path='topos/topo_fuego/frame#.png')
			velocidad = 30
			puntaje = 50
			bonusTiempo = -2
			super()
		}
	}
	class TopoTierra inherits Topo {
		
		override method initialize() {
			puntaje = 5
			super()
		}
	}
	class TopoViento inherits Topo {
		override method initialize() {
			sprite = new Sprite(frames=10, path='topos/topo_normal/frame#.png')
			bonusTiempo = 2
			velocidad = 7
			super()
		}

	}
		class TopoBomba inherits Topo {
		override method initialize() {
			sprite = new Sprite(frames=5, path='topos/topo_bomba/frame#.png')
			puntaje = -100
			bonusTiempo = -10
			velocidad = 10
			super()
		}

	}
}