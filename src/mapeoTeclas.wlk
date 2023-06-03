import wollok.game.keyboard
/** Objeto que controla el mapeo de teclas de forma mas facil para reducir
el codigo en otros ambientes. */
object mapeoTeclas {
//	const keys = new Dictionary();
	const acciones = new Dictionary();
	
	/** Contexto de todas las las keys. */
	method initialize() {
		acciones.put('a',{});
		keyboard.a().onPressDo({acciones.get('a').apply()});
		acciones.put('d',{});
		keyboard.d().onPressDo({acciones.get('d').apply()});
		acciones.put('q',{});
		keyboard.q().onPressDo({acciones.get('q').apply()});
		acciones.put('e',{});
		keyboard.e().onPressDo({acciones.get('e').apply()});
		acciones.put('r',{});
		keyboard.r().onPressDo({acciones.get('r').apply()});
		acciones.put('x',{});
		keyboard.x().onPressDo({acciones.get('x').apply()});
		acciones.put('f',{});
		keyboard.f().onPressDo({acciones.get('f').apply()});
		acciones.put('g',{});
		keyboard.g().onPressDo({acciones.get('g').apply()});
	}
	
	/** Limpia todos los mapeos globales de las teclas del contexto. */
	method limpiar() {
		console.println('clearing keys')
		acciones.forEach({key,_ => 
			acciones.put(key,{});
		});
	}
	
	/** Key: letra en formato String, Action: Bloque de codigo a mapear.*/
	method mapearTecla(key, action) {
		acciones.put(key, action);
	}
	/** Key: letra en formato String.*/
	method limpiarTecla(key) {
		acciones.put(key, {});
	}
}