/**
 * This package defines a standard set of Collection data types. Unlike sequences of values 
 * defined directly using multiplicity, these data types allow for the possibility of collections 
 * as elements of collections.
 */
package Collections {
	private import Base::*;
	private import ScalarValues::*;
	private import SequenceFunctions::size;
	private import IntegerFunctions::*;
	private import ControlFunctions::*;

	/**
	 * Collection is the top level abstract supertype of all collection types.
	 * The name `elements` is used to denote the elements, members or items of the collection.
	 * Note: In many programming languages `items` is used but that would be confusing because of the SysML v2 Item concept.
	 * 
	 * TODO: Question1: Is datatype appropriate for Collection and all its subtypes? Or should it be class?
	 * The decisive trait is whether the collection is mutable or immutable. Or only-mutable-for-adding-elements.
	 * TODO: Question2: Should there be a mutable and an immutable variant for any subtype?
	 */
	abstract datatype Collection {
		feature elements[0..*] nonunique;
	}

	/**
	 * OrderedCollection is the abstract supertype for all ordered collection types.
	 */
    abstract datatype OrderedCollection :> Collection {
		feature elements[0..*] ordered nonunique :>> Collection::elements;
    }

	/**
	 * UniqueCollection is the abstract supertype for all collection types with unique elements.
	 */
    abstract datatype UniqueCollection :> Collection {
		/** Note: Redefinition of `elements` is unique by default. */
		feature elements[0..*] :>> Collection::elements;
    }

    /**
     * An Array is a fixed size, multi-dimensional Collection of which the elements are nonunique and ordered. 
     * Its dimensions specify how many dimensions the array has, and how many elements there are in each dimension. 
     * The rank is equal to the number of dimensions. The flattenedSize is equal to the total number of elements 
     * in the array. The elements of an Array can be assessed by a tuple of indices. The number of indices in such tuple is equal to rank. 
	 * The packing of the elements, i.e. the flattened representation, follows the C programming language convention, 
	 * namely the last index varies fastest.
	 * 
	 * Note: Array can represent the generalized mathematical concept of an infinite matrix of any rank, i.e. not limited to rank two.
     */
    datatype Array :> OrderedCollection {
        // Feature `dimensions` defines the N-dimensional shape of the Array
        // The alternative name `shape` (as used in many programming languages) is not used as it would interfere with a geometric shape feature.
        feature dimensions: Positive[1..*] ordered nonunique;
        feature rank: Natural[1] = size(dimensions);
        feature flattenedSize: Natural[1] = dimensions->reduce '*';
        inv { flattenedSize == size(elements) }
    }
    
	/**
	 * Bag is a variable-size, unordered collection of nonunique elements.
	 */
	datatype Bag :> Collection;
	
	/**
	 * Set is a variable-size, unordered collection of unique elements.
	 */
	datatype Set :> UniqueCollection;

	/**
	 * OrderedSet is a variable-size, ordered collection of unique elements.
	 * 
	 * TODO: Check that multiple inheritance of `elements` from both OrderedCollection and UniqueCollection is handled correctly.
	 */	
	datatype OrderedSet :> OrderedCollection, UniqueCollection {
		///** Note: Redefinition of `elements` is unique by default. */
		feature elements[0..*] ordered :>> OrderedCollection::elements;
	}
		
	/**
	 * List is a variable-size, ordered collection of nonunique elements.
	 */
	datatype List :> OrderedCollection;

	/**
	 * KeyValuePair is a tuple of a key and a value for use in Map collections.
	 * The key must be immutable.
	 * TODO: Move to ScalarValues?
	 */
    datatype KeyValuePair {
        feature key: Anything[0..*] ordered nonunique;
        feature val: Anything[0..*] ordered nonunique;
    }

	/**
	 * Map is a variable-size, unordered collection of elements that are key-value pairs.
	 */
    datatype Map :> Collection {
		/** Note: Redefinition of `elements` is unique by default. 
		 * The `key` of any `KeyValuePair` must be unique over the collection of `KeyValuePair`. The `val` does not need to be unique. 
		 */
		feature elements: KeyValuePair[0..*] :>> Collection::elements;
    }

	/**
	 * OrderedMap is a variable-size, ordered collection of elements that are key-value pairs. 
	 */
    datatype OrderedMap :> Map {
        doc /**
              * An OrderedMap is a Map that maintains the order of its `elements`.
              * The default ordering is as initially constructed.
              */
		/** Note: Redefinition of `elements` is unique by default. */
		feature elements: KeyValuePair[0..*] ordered :>> Map::elements;
    }
    
}