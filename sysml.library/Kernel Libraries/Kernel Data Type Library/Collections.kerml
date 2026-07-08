standard library package Collections {
    doc
    /*
     * This package defines a standard set of Collection data types. Unlike sequences of values 
     * defined directly using multiplicity, these data types allow for the possibility of collections 
     * as elements of collections.
     */

    private import Base::*;
    private import ScalarValues::*;
    private import SequenceFunctions::size;
    private import SequenceFunctions::equals;
    private import IntegerFunctions::*;
    private import ControlFunctions::*;

    abstract datatype Collection {
        doc
        /*
         * A Collection is a DataValue that represents a collection of elements of a given type.
         */
        
        feature elements[0..*] nonunique {
            doc
            /*
             * The contents of the Collection.
             */
        }
    }

    abstract datatype OrderedCollection :> Collection {
        doc
        /*
         * An OrderedCollection is a Collection of which the elements are ordered and not necessarily unique.
         */
        
        feature elements[0..*] ordered nonunique :>> Collection::elements;
    }

    abstract datatype UniqueCollection :> Collection {
        doc
        /*
         * A UniqueCollection is a Collection of which the elements are unique and not necessarily ordered.
         */
        
        feature elements[0..*] :>> Collection::elements {
            doc
            /* Note: Redefinition of 'elements' is unique by default. */
        }
    }

    datatype Array :> OrderedCollection {
        doc
        /*
         * An Array is a fixed size, multi-dimensional Collection of which the elements are nonunique and ordered. 
         * Its dimensions specify how many dimensions the array has, and how many elements there are in each dimension. 
         * The rank is equal to the number of dimensions. The flattenedSize is equal to the total number of elements 
         * in the array.
         * 
         * Feature elements is a flattened sequence of all elements of an Array and can be accessed by a tuple of indices. 
         * The number of indices is equal to rank. The elements are packed according to row-major convention.
         * 
         * The elements of an Array can be accessed by a tuple of indices. The number of indices in such tuple is equal to rank. 
         * The elements are packed according to the row-major convention.
         * 
         * Note 1. Feature dimensions may be empty, which denotes a zero dimensional array, allowing an Array to collapse to a single element. 
         * This is useful to allow for specialization of an Array into a type restricted to represent a scalar. 
         * The flattenedSize of a zero dimensional array is 1.
         * 
         * Note 2: An Array can represent the generalized mathematical concept of an infinite matrix of any rank, i.e. not limited to rank two.
         */
         
        feature dimensions: Positive[0..*] ordered nonunique {
            doc
               /* 
                * Defines the N-dimensional shape of the Array.
                */
        }
        
        feature rank: Natural[1] = size(dimensions) {
            doc
            /*
             * The number of dimensions.
             */
        }
        
        feature flattenedSize: Positive[1] = dimensions->reduce '*' ?? 1 {
            doc
            /*
             * The number of elements in the Array, given as the product of the dimensions,
             * or 1 if dimensions is empty.
             */
        }
        
        inv { flattenedSize == size(elements) }
    }
    
    datatype Bag :> Collection {
        doc
        /*
         * A Bag is a variable-size Collection of which the elements are unordered and nonunique.
         */        
    }
    
    datatype Set :> UniqueCollection {
        doc
        /*
         * A Set is a variable-size Collection of which the elements are unique and unordered.
         */
    }

    datatype OrderedSet :> OrderedCollection, UniqueCollection 
        intersects OrderedCollection, UniqueCollection {
        doc
        /*
         * An OrderedSet is a variable-size Collection of which the elements are unique and ordered.
         */    
        
        feature elements[0..*] ordered :>> OrderedCollection::elements, UniqueCollection::elements {
            doc
            /* Note: Redefinition of elements is unique by default. */
        }
    }
        
    datatype List :> OrderedCollection {
        doc
        /*
         * A List is a variable-size Collection of which the elements are nonunique and ordered.
         */
    }

    datatype KeyValuePair {
        doc
        /*
         * A KeyValuePair is a DataValue that represents a pair of a key and an associated val, 
         * primarily for use in Maps.
         */
        
        feature key: Anything[0..*] ordered nonunique;
        feature val: Anything[0..*] ordered nonunique;
    }

    datatype Map :> Collection {
        doc
        /*
         * Map is a variable-size Collection of which the elements are KeyValuePairs. 
         * The keys must be unique within the Map. The vals need not be unique.
         */
        
        feature elements: KeyValuePair[0..*] :>> Collection::elements {
            doc
            /* Note: Redefinition of elements is unique by default.*/    
        }
        
        inv { 
            elements->forAll{ in e1 : KeyValuePair; 
                not elements->exists{ in e2 : KeyValuePair; 
                    e1 != e2 and e1.key->equals(e2.key) }
            }
        }
    }

    datatype OrderedMap :> Map, OrderedCollection {
        doc
        /*
         * An OrderedMap is a variable-size Map that maintains an ordering of its elements.
         *
         * The ordering may be by key of the KeyValuePair elements, or by order of construction,
         * or any other method. The essential aspect is that ordering is maintained and guaranteed across 
         * accesses to the OrderedMap. 
         */

        feature elements: KeyValuePair[0..*] ordered :>> Map::elements, OrderedCollection::elements {
            doc
            /* Note: Redefinition of elements is unique by default. */
        }
    }
}