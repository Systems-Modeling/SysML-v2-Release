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
		 * The source of a SelfLink of this thing to itself. self is thus a feature that
		 * relates everything to itself. It is also the value of the nested "that" feature
		 * of all other things featured by this thing.
		 */
		feature self: Anything[1] subsets things chains things.that;
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
	abstract feature things: Anything [0..*] nonunique {
		/**
		 * For each value of things, the "featuring instance" of that value. 
		 * This is enforced by declaring Anything::self to be the chaining of things.that, 
		 * restricting it the single value of self.
		 */
		feature that : Anything[1];
	}
	
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
	
	/**
	 * exactlyOne is a multiplicity range requiring a cardinality of exactly one.
	 */
	multiplicity exactlyOne [1..1];
	
	/**
	 * zeroOrOne is a multiplicity range requiring a cardinality of zero or one.
	 */
	multiplicity zeroOrOne [0..1];
	
	/**
	 * oneToMany is a multiplicity range allowing any cardinality of one or more.
	 */
	multiplicity oneToMany [1..*];
	
	/**
	 * oneToMany is a multiplicity range allowing any cardinality of ozero or more
	 * (that is, no restriction).
	 */
	multiplicity zeroToMany [0..*];
	
}