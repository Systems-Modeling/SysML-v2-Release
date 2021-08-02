package QuantityCalculations {
	import ScalarValues::*;
    import Quantities::*;
    import UnitsAndScales::ScalarMeasurementReference;
    import UnitsAndScales::MeasurementReference;
    import UnitsAndScales::DimensionOneValue;
    
    calc def '[' specializes BaseFunctions::'[' (x: NumericalValue, y: ScalarMeasurementReference): QuantityValue;

	calc def Abs specializes NumericalFunctions::Abs (x: ScalarQuantityValue): ScalarQuantityValue;

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

	calc def Max specializes NumericalFunctions::Max (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;
	calc def Min specializes NumericalFunctions::Min (x: ScalarQuantityValue, y: ScalarQuantityValue): ScalarQuantityValue;

	calc def '==' specializes BaseFunctions::'==' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
	calc def '!=' specializes BaseFunctions::'!=' (x: ScalarQuantityValue, y: ScalarQuantityValue): Boolean;
		
	calc def Sqrt(x: ScalarQuantityValue): ScalarQuantityValue;

	calc def Floor(x: ScalarQuantityValue): ScalarQuantityValue;
	calc def Round(x: ScalarQuantityValue): ScalarQuantityValue;
	
	calc def ToString specializes BaseFunctions::ToString (x: ScalarQuantityValue): String;
	calc def ToInteger(x: ScalarQuantityValue): Integer;
	calc def ToRational(x: ScalarQuantityValue): Rational;
	calc def ToReal(x: ScalarQuantityValue): Real;
	calc def ToDimensionOneValue(x: Real): DimensionOneValue;
	
	calc def sum specializes ScalarFunctions::sum (collection: ScalarQuantityValue[0..*]): ScalarQuantityValue {
		ScalarFunctions::sum0(collection, 0.0)
	}
	
	calc def product specializes ScalarFunctions::product (collection: ScalarQuantityValue[0..*]): ScalarQuantityValue {
		ScalarFunctions::product1(collection, 1.0)
	}

    calc def ConvertQuantity(x: ScalarQuantityValue, targetMRef: ScalarMeasurementReference): ScalarQuantityValue;
}
