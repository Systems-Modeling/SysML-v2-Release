/**
 * This package provides a basic model of abstract vectors as well as concrete vectors
 * whose components are numerical values. The package VectorFunctions defines the 
 * corresponding vector-space functions.
 */
package VectorValues {
	private import ScalarValues::NumericalValue;
	private import ScalarValues::Real;
	private import Collections::Array;
	
	/**
	 * A VectorValue is an abstract data type whose values may be operated on using
	 * VectorFunctions.
	 */
	 abstract datatype VectorValue;
	
	/**
	 * A NumericalVectorValue is a kind of VectorValue that is specifically represented
	 * as a one-dimensional array of NumericalValues. The dimension is allowed to be empty,
	 * permitting a NumericalVectorValue of rank 0, which is essentially isomorphic to a
	 * scalar NumericalValue.
	 */
	datatype NumericalVectorValue :> VectorValue, Array {
		feature dimension[0..1] :>> dimensions;
		feature :>> elements : NumericalValue;
	}
	
	/**
	 * CartesianVectorValue is a specialization Numerical VectorValue for which there are 
	 * specific implementations in VectorFunctions of the abstract vector-space functions.
	 * 
	 * Note: The restriction of the element type to Real is to facilitate
	 * the complete definition of these functions.
	 */
	datatype CartesianVectorValue :> NumericalVectorValue {
		feature :>> elements : Real;
	}

	/**
	 * A ThreeVectorValue is a NumericalVectorValue that has dimension 3.
	 */
	datatype ThreeVectorValue :> NumericalVectorValue {
		feature :>> dimension = 3;
	}
	
	/**
	 * A CartesianThreeVectorValue is a NumericalVectorValue that is both Cartesian and
	 * has dimension 3.
	 */	
	datatype CartesianThreeVectorValue :> CartesianVectorValue, ThreeVectorValue;	
}