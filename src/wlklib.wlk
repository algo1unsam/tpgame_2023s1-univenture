import wollok.game.*

object __wlklib__ inherits _inf_inc {
	method get0s(_path, _i) {
		if (_path.contains("#")) {
			const _newpath = _path.substring(_path.indexOf("#") + 1)
			return self.get0s(_newpath,_i + 1)
		}
		return _i
	}
	
	method zeroed(number, digits) {
		//number = 324
		const n = (number/10).truncate(0)
		//n = 32
		const rem = number%10
		//rem 4
		if (digits > 1) { return self.zeroed(n, digits-1).toString() + rem.toString() }
		return rem.toString()
	}
}

mixin _inf_inc {
	var _inc = 0; // Incrementar infinitamente.
	method _inc() {
		_inc += 1
		return (_inc - 1)
	}
}

// Objeto principal de essentials.
object essentials inherits _inf_inc {		
		method makeCycle(ms, times, block) {
			const rand = {0.randomUpTo(2147483647).toString()}
			const blockName = "MakeCycle: " + rand.apply() + rand.apply() + _inc.toString()
			var _times = times
			game.onTick(ms, blockName, {
				if (_times > 0){
					block.apply()
					_times = _times - 1
				} else game.removeTickEvent(blockName)
			})
		}
		
		method makeCycle(ms, times, block, name) {
			var _times = times
			game.onTick(ms, name, {
				if (_times > 0){
					block.apply()
					_times = _times - 1
				} else game.removeTickEvent(name)
			})
		}
		
		method makeCycle(ms, times, block, name, endBlock) {
			var _times = times
			game.onTick(ms, name, {
				if (_times > 0){
					if (_times == 0) { endBlock.apply() }
					block.apply()
					_times = _times - 1
				} else game.removeTickEvent(name)
			})
		}
		
		method makeCycle(ms, times, block, name, endBlock, cycleOffsetBlock) {
			var _times = times
			game.onTick(ms, name, {
				if (_times > 0){
					block.apply()
					_times = _times - 1
					if (_times == 0) { endBlock.apply() }
				} else {game.removeTickEvent(name); cycleOffsetBlock.apply() }
			})
		}
		
	}

package spriteModule {
 
	/* Clase Sprite, permite tener un mejor control de los frames de los elementos visuales
	 * de wollok.
	 * 
	 * para información de como utilizarla leer el README.md del repositorio
	 * https://github.com/santuchoagus/wollok-lib
	 */
	class Sprite {
		const property frames
		const property path
		const _digits = __wlklib__.get0s(path, 0) //retorna el numero de "#" del sprite.
		var cycleRange = [0, frames-1]
		var index = 0
		/* Formato path:
		 * Usar un solo caracter # en donde va el número
		 * ejemplos...
		 * "sprite/personaje-#_anim.png" 
		 * "personaje/pj_#.jpg"
		 */
		
		method getFrame(_frame) {
			if (_digits > 1) {
				return  (
						path.substring(0,path.indexOf("#")) + 
						__wlklib__.zeroed(_frame,_digits) +
				 		path.substring(path.lastIndexOf("#")+1, path.length())
				 		)
				 
			} else return path.replace('#',_frame.toString())
		}
		// Steps negativos invierten la animación.
		method cycle(step) {
			index = (cycleRange.last()-cycleRange.first() + 1 + index + step) % (cycleRange.last()-cycleRange.first()+1)
			return self.getFrame()
		}
	
		method getFrame() {	return self.getFrame(index + cycleRange.first()) }
		method getFrameNumber() {	return index + cycleRange.first() }
		
		// Metodos para setear un frame en particular o un offset.
		method setFrame(_frame) {
			/* frame = index + cyclefirst
			 * index = frame - cyclefirst
			 */
			index = _frame - cycleRange.first()
			return self.getFrame()
		}
		method setIndex(_index) { 
			index = _index
			return self.getFrame()
		}
		
		method getIndex() = index
		
		method remainingFrames() = (cycleRange.last()-cycleRange.first()+1) - index
		
		method cycle() {
			index = (index + 1) % (cycleRange.last()-cycleRange.first() + 1)
			return self.getFrame()
		}
		
		
		// framef  first  x
		// x = frame + first
		
		// Rango de ciclo (primer y ultimo frame) setter y getter.
		method setRange(_firstframe, _lastframe) { 
			cycleRange = [_firstframe, _lastframe]
			return self.getFrame(_firstframe)
		}
		method getRange() = cycleRange.first()..cycleRange.last()
	}
	
	// Cosas agregadas ahora	
}

// Para debugear con sprites.
package debug {
	class _DebugObject {
		var thickness;
		var height;
		var property position = game.at(game.width()+1, game.height()+1);
		var property worldPosition = [0,0]
		
		method thickness() = thickness;
		method height() = height;
		
		method center() = game.at(position.x() + thickness/2 - 2, position.y() + height/2 - 2)
		method center(_pos) {
			position = _pos;
			position = game.at(_pos.x() - ( thickness/2 - 2), _pos.y() - (height/2 - 2));
		}
	}
	
	class WollokObject inherits _DebugObject {
		var property image;
	}
	
	// Objetos para debugear
	class Box32 inherits _DebugObject {
		var property image = 'debug/texture32x32.png'
		method initialize() {
			thickness = 32; height = 32; game.addVisual(self);
		}
	}
	class VerticalBar inherits _DebugObject {
		var property image = 'debug/verticalBar-red.png'
		const property variant = new Dictionary()
		method initialize() {
			thickness = 4; height = 500; game.addVisual(self);
			
			variant.put('red', 'debug/verticalBar-red.png')
			variant.put('dotted', 'debug/vertical-bardotted-orange.png')
			variant.put('dotted2', 'debug/verticalDotted2x256.png')
		}
		
		method variant(_variant) {
			image = variant.get(_variant)
		}
	}
	
	class HorizontalBar inherits _DebugObject {
		var property image = 'debug/horizontalBar-green.png'
		method initialize() {
			thickness = 500; height = 4; game.addVisual(self);
		}
	}
	
	class RotatedBar inherits _DebugObject {
		var property image = 'debug/45degDotted.png'
		method initialize() {
			thickness = 1176; height = 1176; game.addVisual(self);
		}
	}
	
	class Pixel inherits _DebugObject {
		var property image = 'debug/PixelPerfect.png'
		method initialize() {
			thickness = 168; height = 168; game.addVisual(self);
		}
	}
}
