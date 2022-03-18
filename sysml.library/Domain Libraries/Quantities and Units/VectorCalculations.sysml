package VectorCalculations {
	private import ScalarValues::Boolean;
	private import ScalarValues::Number;
    private import Quantities::VectorQuantityValue;
    
    calc def isZeroVectorQuantity :> VectorFunctions::isZeroVector(: VectorQuantityValue[1]): Boolean;

    /* Addition and subtraction */
	calc def '+' :> VectorFunctions::'+' (: VectorQuantityValue[1], : VectorQuantityValue[1]): VectorQuantityValue[1];
	calc def '-' :> VectorFunctions::'-' (: VectorQuantityValue[1], : VectorQuantityValue[1]): VectorQuantityValue[1];

    /* Multiplication and division */
	calc def scalarVectorMult :> VectorFunctions::scalarVectorMult (: Number[1], : VectorQuantityValue[1]): VectorQuantityValue[1];
	calc def vectorScalarMult :> VectorFunctions::vectorScalarMult (: VectorQuantityValue[1], : Number[1]): VectorQuantityValue[1];
	calc def vectorScalarDiv :> VectorFunctions::vectorScalarDiv (: Number[1], : VectorQuantityValue[1]): Number[1];
	calc def inner :> VectorFunctions::inner (: VectorQuantityValue, : VectorQuantityValue[1]): Number[1];
	
    alias '*' for scalarVectorMult;
    
    /* Norm and angle */
	calc def norm :> VectorFunctions::norm (: VectorQuantityValue[1]): Number[1];
	calc def angle :> VectorFunctions::angle (: VectorQuantityValue[1], : VectorQuantityValue[1]): Number[1];
}
