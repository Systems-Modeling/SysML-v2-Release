package ProductSelection {
	
	class SelectionInfo {}
	class ShoppingCart {}
	class Product {}
	
	// User-specified association definition
	assoc ProductSelection {
		feature info: SelectionInfo;
		
		end cart: ShoppingCart[0..*];
		end selectedProduct: Product[0..*];
	}
	
	// Equivalent association definition showing library model specialization.
	assoc ProductSelection_ specializes Links::BinaryLink {
		feature info: SelectionInfo;
		
		end cart: ShoppingCart[0..*] redefines source;
		end selectedProduct: Product[0..*] redefines target;
		
//		feature cart_: ShoppingCart[1..1] redefines sourceParticipant;
//		feature selectedProduct_: ShoppingCart[1..1] redefines targetParticipant;
	}
	
	feature myCart: ShoppingCart;
	
	feature product1: Product;
	feature info1: SelectionInfo;	
	feature selection1: ProductSelection { 
		feature :>> info = info1; 
		feature :>> cart = myCart; 
		feature :>> selectedProduct = product1;
	}
	
	feature product2: Product;
	feature info2: SelectionInfo;	
	feature selection2: ProductSelection { 
		feature :>> info = info2; 
		feature :>> cart = myCart; 
		feature :>> selectedProduct = product2;
	}
}