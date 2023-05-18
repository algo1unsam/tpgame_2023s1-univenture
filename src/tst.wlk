import wollok.game.*
import topos.*

class Listas {

	method alAzar(lista) {
		return lista.anyOne()
	}

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

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
object lista {

	var property listTopo = new Dictionary()
	var id = 0

	method AgregarTopo(topo) {
		listTopo.put(topo, id)
		id += 1
	}

	method idLista() {
		return listTopo.values()
	}

//Por si las dudas.
	method joinNull() {
		return [ null ] + (self.idLista())
	}

	method idListaConNull() {
		return self.joinNull()
	}

}

object funciones {

	// RAND NUMEROS
	method rand(lista) {
		return self.redondear(0.randomUpTo(self.tamanioListaNull(lista))) - 1
	}

	method redondear(num) {
		return num.roundUp()
	}

	method tamanioListaNull(lista) {
		return lista.size() - 1
	}

	// RAND TOPOS
	method alAzar(lista) {
		return lista.anyOne()
	}

}

