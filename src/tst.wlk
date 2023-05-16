import wollok.game.*

object funciones {

	method rand(lista) {
		return self.redondear(0.randomUpTo(self.tamanioListaNull(lista))) - 1
	}

	method redondear(num) {
		return num.roundUp()
	}

	method tamanioListaNull(lista) {
		return lista.size() - 1
	}
	method topoAlAzar(lista){
		return lista.anyOne()
	}
}

object listaDeNumeros {

	// EL PRIMER VALOR DEBE SER NULO
	var property lista = [ null, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

}

object listaTopos {

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
		return [null]+(self.idLista())
	}

	method idListaConNull() {
		return self.joinNull()
	}

}
