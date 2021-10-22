/**
 * This package defines functions on Collections (as defined in the Collections package). 
 * For functions on general sequences of values, see the SequenceFunctions package.
 */
package CollectionFunctions {
	private import Base::Anything;
	private import ScalarValues::*;
	private import SequenceFunctions::equals;
	private import ControlFunctions::exists;
	import Collections::*;
	
	function '==' specializes BaseFunctions::'=='(col1: Collection[0..1], col2: Collection[0..1]): Boolean[1] {
		col1.elements->equals(col2.elements)
	}
	
	function size (col: Collection[1]): Natural[1] {
		SequenceFunctions::size(col.elements)
	}
	
	function isEmpty (col: Collection[1]): Boolean[1] {
		SequenceFunctions::isEmpty(col.elements)
	}
	
	function notEmpty (col: Collection[1]): Boolean[1] {
		SequenceFunctions::notEmpty(col.elements)
	}
	
	function contains(col: Collection[1], value: Anything[1]): Boolean[1] {
		col.elements->exists {in x; x == value}
	}	
	
	function head(col: OrderedCollection[1]): Anything[0..1] {
		SequenceFunctions::head(col.elements)
	}
	
	function tail(col: OrderedCollection[1]): Anything[0..*] ordered nonunique {
		SequenceFunctions::tail(col.elements)		
	}
	
	function last(col: OrderedCollection[1]): Anything[0..1] {
		SequenceFunctions::last(col.elements)
	}
	
	function '[' specializes BaseFunctions::'[' (col: OrderedCollection[1], index: Positive[1]): Anything[0..1] {
		// Cast ensures this function is not called recursively if the elements of col are OrderedCollections.
		(col.elements as Anything)[index]
	}
	
	function 'array[' specializes '[' (arr: Array[1], indexes: Positive[n] ordered nonunique): Anything[0..1] {
		private feature n : Natural[1] = arr.rank;
		
		// Assumes row-major ordering for elements.
		private function index(arr: Array[1], i : Natural, indexes : Positive[1..*]) {
			i <= 1? indexes[1]: arr.dimensions[i] * (index(arr, i-1, indexes) - 1) + indexes[i]
		}
		
		n == 0 || (1..n)->exists {in i; indexes[i] > arr.dimensions[i]}? null: 
			arr.elements[index(arr, n, indexes)]
	}	
}
