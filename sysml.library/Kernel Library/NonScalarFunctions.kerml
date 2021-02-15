package NonScalarFunctions {
	private import Base::Anything;
	import ScalarValues::*;
	import NonScalarValues::*;
	
	function size specializes BaseFunctions::size (col: Collection[1]): Natural {
		BaseFunctions::size(col::values)
	}
	
	function isEmpty specializes BaseFunctions::isEmpty (col: Collection[1]): Boolean {
		BaseFunctions::isEmpty(col::values)
	}
	
	function notEmpty specializes BaseFunctions::notEmpty (col: Collection[1]): Boolean {
		BaseFunctions::notEmpty(col::values)
	}
	
	function contains(col: Collection[1], value: Anything[1]): Boolean {
		col::values->exists x (x == value)
	}	
	
	function head specializes BaseFunctions::head (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::head(col::values)
	}
	
	function tail specializes BaseFunctions::tail (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::tail(col::values)		
	}
	
	function last specializes BaseFunctions::last (col: OrderedCollection[1]): Anything[0..1] {
		BaseFunctions::last(col::values)
	}
	
	function '[' specializes BaseFunctions::'[' (col: OrderedCollection[1], index: Integer[1]): Anything[0..1] {
		col::values[index]
	}
	
}