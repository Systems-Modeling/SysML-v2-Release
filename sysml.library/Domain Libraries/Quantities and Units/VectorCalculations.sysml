package VectorCalculations {
	import ScalarValues::*;
    import Quantities::*;

    /* Vector addition and subtraction */
	calc def '+' specializes NumericalFunctions::'+' (x: VectorQuantityValue, y: VectorQuantityValue): VectorQuantityValue;
	calc def '-' specializes NumericalFunctions::'-' (x: VectorQuantityValue, y: VectorQuantityValue): VectorQuantityValue;

    /* Scalar-vector multiplication */
	calc def scalarVectorMult specializes NumericalFunctions::'*' (x: Real, y: VectorQuantityValue): VectorQuantityValue;
	calc def vectorScalarMult specializes NumericalFunctions::'*' (x: VectorQuantityValue, y: Real): VectorQuantityValue;

    alias '*' for scalarVectorMult;
}
