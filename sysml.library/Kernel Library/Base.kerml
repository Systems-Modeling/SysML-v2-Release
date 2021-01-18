/**
 * This package defines the classifiers and features that provide the bases for the typing
 * of all elements in the language.
 */
package Base {
	
    /**
     * Anything is the top level generalized type in the language. 
     */
	abstract classifier Anything {
		/**
		 * self is a feature that relates everything to itself.
		 * (This is enforced by tying this feature to Objects::SelfLink::self.)
		 */
		feature self: Anything[1] subsets things;		
	}
	
	/**
	 * Value is the most general classifier of entities that are values that do not change
	 * over time.
	 */
	abstract datatype DataValue specializes Anything {
		feature self: DataValue redefines Anything::self;
	}
	
	/**
	 * things is the top-level feature in the language.
	 */
	abstract feature things: Anything[0..*] nonunique;
	
	/**
	 * dataValues is a specialization of things restricted to type DataValue.
	 */
	abstract feature dataValues: DataValue[0..*] nonunique subsets things;
		 
	/**
	 * naturals is a specialization of dataValues restricted to type Natural. 
	 * It is the root feature of all multiplicities, which map from a feature to
	 * the set of Natural numbers representing allowable cardinalities of the feature.
	 */
	abstract feature naturals: ScalarValues::Natural[0..*] subsets dataValues;
	
}