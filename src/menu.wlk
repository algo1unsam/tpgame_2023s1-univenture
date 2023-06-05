import wlklib.spriteModule.*
import wollok.game.game
import mapeoTeclas.mapeoTeclas

class Menu {
	var indice = 0;
	/** Espera una lista */
	const items;
	const itemsImage = new Dictionary();
	const itemsObj = new Dictionary();
	const cantidadDeItems = items.size()
	
	method initialize() {
		items.forEach({item =>
			itemsImage.put(item.get(0), [item.get(1), item.get(2)])
		})
		
		if (cantidadDeItems != 0) {
			var incrementalX = game.width()/cantidadDeItems
			var posicionX = incrementalX/2
			
			items.forEach({ itemStr =>
				itemsObj.put(itemStr.get(0), new Item(
					position=game.at(posicionX,game.height()/2),
					sprite=[itemStr.get(1), itemStr.get(2)]
				))
				posicionX = posicionX + incrementalX
			})
		}
	}
	
	method moverIzquierda() {
		if (indice > 0) {
			indice = indice - 1
			self.actualizarVisuales()
		}
	}
	method moverDerecha() {
		if (indice < cantidadDeItems-1) {
			indice = indice + 1
			self.actualizarVisuales()
		}
	}
	
	method actualizarVisuales() {
		itemsObj.forEach({indiceStr, item =>
			if(indiceStr != self.indice()) {
				item.deSeleccionar()
			} else { item.seleccionar()}
		})
	}
	
	method iniciar() {
		mapeoTeclas.mapearTecla('a',{self.moverIzquierda()})
		mapeoTeclas.mapearTecla('d',{self.moverDerecha()})
		self.actualizarVisuales()
		
		itemsObj.forEach({_, item =>
			game.addVisual(item)
		})
	}
	
	method salir() {
		mapeoTeclas.mapearTecla('a',{})
		mapeoTeclas.mapearTecla('d',{})
		mapeoTeclas.mapearTecla('space',{})
		
		itemsObj.forEach({_, item =>
			game.removeVisual(item)
		})
	}
	
	// getters:
	method indice() = items.get(indice).get(0);
	method items() = items;
}

class Item {
	const sprite = []
	var property position;
	var property image = sprite.get(1);
	var seleccionado = false;
	
	method seleccionar() {
		seleccionado = true;
		image = sprite.get(0)
	}
	method deSeleccionar() {
		seleccionado = false;
		image = sprite.get(1)
	}
	
	method seleccionado() = seleccionado;
}