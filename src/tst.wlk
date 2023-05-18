import wollok.game.*
import topos.*

class Listas {

	method alAzar(lista) = lista.anyOne()
}

object listaTopos inherits Listas {

	const listTopo = new List()

	method setAgregarTopo(topo) {
		if (not self.repetido(topo)) {
			listTopo.add(topo)
		}
	}

	method repetido(topo) = listTopo.contains(topo)
}

object listaPosiciones inherits Listas {
	
	const property pos = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
}

