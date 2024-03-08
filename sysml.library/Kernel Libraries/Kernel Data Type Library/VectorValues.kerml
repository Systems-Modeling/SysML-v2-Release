standard library package VectorValues {
	doc
	/*
	 * This package provides a basic model of abstract vectors as well as concrete vectors
	 * whose components are numerical values. The package VectorFunctions defines the 
	 * corresponding vector-space functions.
	 */

	private import ScalarValues::NumericalValue;
	private import ScalarValues::Real;
	private import Collections::Array;
	
	abstract datatype VectorValue {
		doc
		/*
		 * A VectorValue is an abstract data type whose values may be operated on using
		 * VectorFunctions.
		 */
	}
	
	datatype NumericalVectorValue :> VectorValue, Array intersects VectorValue, Array {
		doc
		/*
		 * A NumericalVectorValue is a kind of VectorValue that is specifically represented
		 * as a one-dimensional array of NumericalValues. The dimension is allowed to be empty,
		 * permitting a NumericalVectorValue of rank 0, which is essentially isomorphic to a
		 * scalar NumericalValue.
		 */
	
		feature dimension[0..1] :>> dimensions;
		feature :>> elements : NumericalValue;
	}
	
	datatype CartesianVectorValue :> NumericalVectorValue {
		doc
		/*
		 * CartesianVectorValue is a specialization Numerical VectorValue for which there are 
		 * specific implementations in VectorFunctions of the abstract vector-space functions.
		 * 
		 * Note: The restriction of the element type to Real is to facilitate
		 * the complete definition of these functions.
		 */
	
		feature :>> elements : Real;
	}

	datatype ThreeVectorValue :> NumericalVectorValue {
		doc
		/*
		 * A ThreeVectorValue is a NumericalVectorValue that has dimension 3.
		 */
	
		feature :>> dimension = 3;
	}
	
	datatype CartesianThreeVectorValue :> CartesianVectorValue, ThreeVectorValue 
		intersects CartesianVectorValue, ThreeVectorValue {
		doc
		/*
		 * A CartesianThreeVectorValue is a NumericalVectorValue that is both Cartesian and
		 * has dimension 3.
		 */
	}	
}