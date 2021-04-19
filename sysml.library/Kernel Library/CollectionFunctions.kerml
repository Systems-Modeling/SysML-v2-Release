package CollectionFunctions {
	private import Base::Anything;
	import ScalarValues::*;
	import Collections::*;
	
	function size specializes BaseFunctions::size (col: Collection[1]): Natural {
		BaseFunctions::size(col::elements)
	}
	
	function isEmpty specializes BaseFunctions::isEmpty (col: Collection[1]): Boolean {
		BaseFunctions::isEmpty(col::elements)
	}
	
	function notEmpty specializes BaseFunctions::notEmpty (col: Collection[1]): Boolean {
		BaseFunctions::notEmpty(col::elements)
	}
	
	function contains(col: Collection[1], value: Anything): Boolean {
		col::elements->exists x (x == value)
	}	
	
	function head specializes BaseFunctions::head (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::head(col::elements)
	}
	
	function tail specializes BaseFunctions::tail (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::tail(col::elements)		
	}
	
	function last specializes BaseFunctions::last (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::last(col::elements)
	}
	
	function '[' specializes BaseFunctions::'[' (col: OrderedCollection[1], index: Integer[1]): Anything[0..1] {
		col::elements[index]
	}	
}
