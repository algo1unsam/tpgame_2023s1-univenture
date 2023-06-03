class Menu {
	var indice = 0;
	/** Espera una lista */
	const items;
	const itemsDic = new Dictionary();
	
	method initialize() {
		
		items.forEach({item =>
			itemsDic.put(item.get(0), item.get(1))
		})
	}
	
	// getters:
	method indice() = items.get(indice).get(0);
	method items() = items;
}