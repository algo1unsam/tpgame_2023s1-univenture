import wollok.game.game
import clases.*
import topos.topos
import topos.tiposDeTopos.*
import letras.letras
import mapeoTeclas.*

object juego {
	var listaTipos = ['normal','aire','fuego','tierra', 'tiempo'];
	var conjuntoPosiciones = #{};
	const conjuntoHuecos = #{};
	//	const listaTopos = [];
	//	const listaLetras = [];
	
	method initialize() {
		const letra = letras.letrasDic().get('g');
		if(game.hasVisual(letra)) {
			letra.matar()}
			
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
	
	method huecoLibre() = self.huecosLibres().asList().anyOne().position()
	
	method generarTopo() {
		const huecoLibre = self.huecoLibre()
		conjuntoHuecos.remove(huecoLibre)
	
		const nuevoTopo = new TopoNormal(image='explosion/frame0.png', position=huecoLibre, tiempoDeVidaMaximo=5000)
		
		
		
	}
	
}
