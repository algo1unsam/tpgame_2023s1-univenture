import clases.Letra
import wollok.game.game

object letras {
	const property abecedario = [
		'a','b','c','d','e','f','g','h','i','j','k',
		'l','m','n','o','p','q','r','s','t','u','v',
		'w','x','y','z'
	]
	
	/** objetos letra */
	const property letras = []
	const property letrasDic = new Dictionary()
	
	method initialize() {
		abecedario.forEach({ letra =>
			const _letra = new Letra(letra=letra, position=game.at(0,0))
			letras.add(_letra)
			letrasDic.put(letra,_letra)
		})
	}
	
	method letraUnica() {
		
		const letrasDisponibles = letras.filter({letra => !game.hasVisual(letra)})
		const letraRandom = letrasDisponibles.anyOne();
		return letraRandom;
	}
}
