package NonScalarValues {
	private import ScalarValues::Boolean;
	private import BaseFunctions::size;
	
	abstract datatype Collection {
		feature values[0..*] nonunique;
	}
	
	abstract datatype UnorderedCollection :> Collection;
	
	datatype Bag :> UnorderedCollection;
	
	datatype Set :> UnorderedCollection {
		/** Note: Redefinition of 'values' is unique by default. */
		feature values[0..*] :>> UnorderedCollection::values;
	}
	
	abstract datatype OrderedCollection :> Collection {
		feature values[0..*] ordered :>> Collection::values;
	}
	
	datatype Sequence :> OrderedCollection;
	alias Sequence as List;
	
	datatype OrderedSet :> Collection {
		/** Note: Redefinition of 'values' is unique by default. */
		feature values[0..*] ordered :>> Collection::values;
	}
	
	datatype SampledFunctionValue {
		feature domain[0..*] ordered;
		feature range[0..*] ordered;
		
		/**
		 * Domain and range collections must be the same size.
		 */
		inv { size(domain) == size(range) }
	}
}