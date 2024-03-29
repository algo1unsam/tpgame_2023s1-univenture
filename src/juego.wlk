import wollok.game.game
import clases.*
import topos.topos
import topos.tiposDeTopos.*
import letras.letras
import mapeoTeclas.*

object juego {
	var conjuntoPosiciones = #{};
	const conjuntoHuecos = #{};
	
	method initialize() {		
		
	}
	
	method _generarPosiciones() {
		conjuntoPosiciones.clear()
		const _conjunto = #{}
		
		(0..(game.width()-1)).forEach({x =>
			// -2 por el score arriba.
			(0..(game.height()-2)).forEach({y => _conjunto.add(game.at(x,y))})
		})
		
		conjuntoPosiciones = _conjunto;
	}
	
	method _posicionUnica() {
		const posicionRandom = conjuntoPosiciones.anyOne();
		conjuntoPosiciones.remove(posicionRandom)
		return posicionRandom;
	}
	
	method _generarHueco() {
		var _hueco;
		const posicionRandom = self._posicionUnica();
		
		_hueco = new Hueco(position=posicionRandom)
		game.addVisual(_hueco)
		conjuntoHuecos.add(_hueco)
		return _hueco;
	}
	
	method huecosLibres() {
		const huecosConTopos = conjuntoHuecos.filter({hueco =>
			game.getObjectsIn(hueco.position()).any({objeto => objeto.esTopo()})
		})
		return conjuntoHuecos.difference(huecosConTopos);
	}
	
	method huecoLibre() = self.huecosLibres().asList().anyOne()
	
	method generarTopo() {
		topos.crearTopo( self.huecoLibre().position())
	}
	
	method generarTopo(hueco) {
		topos.crearTopo( hueco.position())
	}
	
	method iniciar() {
		self.configurarTeclas()
		self._generarPosiciones()
		game.addVisual(variablesDeJuego)
		variablesDeJuego.tiempo(50)
		game.onTick(1000, 'tick general del juego', {
			if (variablesDeJuego.tiempo() <= 0) {
				self.terminar()
			}
			
			variablesDeJuego.decrementarTiempo()
			const huecosASpawnear = self.huecosLibres().filter({hueco => hueco.disponible()})
			if (huecosASpawnear.size() > 0) {
				huecosASpawnear.forEach({hueco => self.generarTopo(hueco)})
			}
			
		})
	}
	
	method terminar() {
		game.removeVisual(variablesDeJuego)
		game.removeTickEvent('tick general del juego');
		conjuntoHuecos.forEach({hueco =>
			game.getObjectsIn(hueco.position()).forEach({obj => obj.borrar()})
		})
		conjuntoHuecos.clear()
		self._generarPosiciones()
		end.puntajeFinal(variablesDeJuego.puntaje())
	}
	
	method configurarTeclas() {
		const bloqueLetra = { caracterLetra =>
			const letra = letras.letrasDic().get(caracterLetra)
			if (game.hasVisual(letra)) {
				letra.matar()
			}
		}
	
		letras.abecedario().forEach({letra =>
			mapeoTeclas.mapearTecla(letra, {bloqueLetra.apply(letra)})
		})
	}
}

object variablesDeJuego {
	var tiempo;
	var puntaje = 0;
	
	var texto = '';
						
    method textColor() = "3E403ECC";
    method text() = texto;
    method position() = game.at(3, game.height() - 1)
    
    method actualizarTablero() {
    	texto = "\tTIEMPO: " + tiempo + "\n\tPUNTAJE: " + puntaje;
    }
    
    method decrementarTiempo() {
    	tiempo = tiempo - 1
    	self.actualizarTablero()
    }
    
    method tiempo(_tiempo) {
    	tiempo = _tiempo;
    	self.actualizarTablero()
    }
    
    method tiempo() = tiempo;
    
    method sumarPuntaje(_puntaje) {
    	puntaje = puntaje + _puntaje;
    	self.actualizarTablero()
    }
    
    method sumarTiempo(_tiempo) {
    	tiempo = tiempo + _tiempo;
    	self.actualizarTablero()
    }
    method puntaje() = puntaje
    method limpiarPuntaje(){ puntaje = 0}
}

object guia {
	const _position = game.origin()
	method iniciarGuia() {
		game.addVisual(self)
	}
	method image() = 'guia.png'	
	method position() = _position
}

object end {
	var _estado = false
	var texto = 'SCORE: ';
	const position = game.center()
	
    method textColor() = "3E403ECC";
    method text() = texto;
    method position() = position
    method puntajeFinal(_puntaje){
    	_estado = true
    	texto = texto + _puntaje
    	game.addVisual(self)
    }
    method estadoFinal() = _estado
    method limpiarScore(){texto ='SCORE: '; }
}



