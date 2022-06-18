package QuantityCalculations {
	import ScalarValues::*;
    import Quantities::ScalarQuantityValue;
    import MeasurementReferences::ScalarMeasurementReference;
    import MeasurementReferences::DimensionOneValue;
    
    calc def isZero specializes NumericalFunctions::isZero(x: ScalarQuantityValue): Boolean {
    	NumericalFunctions::isZero(x.num)
    }
    calc def isUnit specializes NumericalFunctions::isUnit(x: ScalarQuantityValue): Boolean {
    	NumericalFunctions::isUnit(x.num)
    }
    
    calc def '[' specializes BaseFunctions::'[' (x: Number, y: ScalarMeasurementReference): ScalarQuantityValue;

	calc def abs specializes NumericalFunctions::abs (x: ScalarQuantityValue): ScalarQuantityValue;

	calc def '+' specializes NumericalFunctions::'+' (x: ScalarQuantityValue, y: ScalarQuantityValue[0..1]): ScalarQuantityValue;
	calc def '-' specializes NumericalFunctions::'-' (x: ScalarQuantityValue, y: ScalarQuantityValue[0..1]): ScalarQuantityValue;
	calc def '*' specializes NumericalFunctions::'*' (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;
	calc def '/' specializes NumericalFunctions::'/' (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;
	calc def '**' specializes NumericalFunctions::'**' (x: ScalarQuantityValue, y: Real): ScalarQuantityValue;
	calc def '^' specializes NumericalFunctions::'^' (x: ScalarQuantityValue, y: Real): ScalarQuantityValue;
	
	calc def '<' specializes NumericalFunctions::'<' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
	calc def '>' specializes NumericalFunctions::'>' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
	calc def '<=' specializes NumericalFunctions::'<=' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
	calc def '>=' specializes NumericalFunctions::'>=' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;

	calc def max specializes NumericalFunctions::max (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;
	calc def min specializes NumericalFunctions::min (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;

	calc def '==' specializes DataFunctions::'==' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
		
	calc def sqrt(x: ScalarQuantityValue): ScalarQuantityValue;

	calc def floor (x: ScalarQuantityValue): ScalarQuantityValue;
	calc def round (x: ScalarQuantityValue): ScalarQuantityValue;
	
	calc def ToString specializes BaseFunctions::ToString (x: ScalarQuantityValue): String;
	calc def ToInteger(x: ScalarQuantityValue): Integer;
	calc def ToRational(x: ScalarQuantityValue): Rational;
	calc def ToReal(x: ScalarQuantityValue): Real;
	calc def ToDimensionOneValue(x: Real): DimensionOneValue;
	
	calc def sum specializes NumericalFunctions::sum (collection: ScalarQuantityValue[0..*]): ScalarQuantityValue {
		private attribute zero : ScalarQuantityValue;
		assert constraint { isZero(zero) }
		NumericalFunctions::sum0(collection, zero)
	}
	
	calc def product specializes NumericalFunctions::product (collection: ScalarQuantityValue[0..*]): ScalarQuantityValue {
		private attribute one : ScalarQuantityValue;
		assert constraint { isUnit(one) }
		NumericalFunctions::product1(collection, one)
	}

    calc def ConvertQuantity(x: ScalarQuantityValue, targetMRef: ScalarMeasurementReference): ScalarQuantityValue;
}
