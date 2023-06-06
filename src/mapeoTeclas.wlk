import wollok.game.keyboard
/** Objeto que controla el mapeo de teclas de forma mas facil para reducir
el codigo en otros ambientes. */
object mapeoTeclas {
//	const keys = new Dictionary();
	const acciones = new Dictionary();
	const abecedarioObjetos = [
		['a',keyboard.a()],['b',keyboard.b()],['c',keyboard.c()],['d',keyboard.d()],
		['e',keyboard.e()],['f',keyboard.f()],['g',keyboard.g()],['h',keyboard.h()],
		['i',keyboard.i()],['j',keyboard.j()],['k',keyboard.k()],['l',keyboard.l()],
		['m',keyboard.m()],['n',keyboard.n()],['o',keyboard.o()],['p',keyboard.p()],
		['q',keyboard.q()],['r',keyboard.r()],['s',keyboard.s()],['t',keyboard.t()],
		['u',keyboard.u()],['v',keyboard.v()],['w',keyboard.w()],['x',keyboard.x()],
		['y',keyboard.y()],['z',keyboard.z()],['space',keyboard.space()], ['backspace', keyboard.backspace()]
	]
	
	/** Contexto de todas las las keys. */
	method initialize() {
		abecedarioObjetos.forEach({tupla =>
			const caracter = tupla.get(0)
			const key = tupla.get(1)
			
			acciones.put(caracter, {})	
			key.onPressDo({acciones.get(caracter).apply()})
		})
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