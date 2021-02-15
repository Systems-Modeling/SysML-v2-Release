package QuantityCalculations {
	import ScalarValues::*;
    import Quantities::*;
    import UnitsAndScales::MeasurementReference;
    import UnitsAndScales::DimensionOneValue;
    
    calc def '@[' specializes ScalarFunctions::'@[' (x: NumericalValue, y: MeasurementReference): QuantityValue;
	
	calc def Abs specializes NumericalFunctions::Abs (x: QuantityValue): QuantityValue;

	calc def '+' specializes NumericalFunctions::'+' (x: QuantityValue, y: QuantityValue[0..1]): QuantityValue;
	calc def '-' specializes NumericalFunctions::'-' (x: QuantityValue, y: QuantityValue[0..1]): QuantityValue;
	calc def '*' specializes NumericalFunctions::'*' (x: QuantityValue, y: QuantityValue): QuantityValue;
	calc def '/' specializes NumericalFunctions::'/' (x: QuantityValue, y: QuantityValue): QuantityValue;
	calc def '**' specializes NumericalFunctions::'**' (x: QuantityValue, y: Real): QuantityValue;
	
	calc def '<' specializes NumericalFunctions::'<' (x: QuantityValue, y: QuantityValue): Boolean;
	calc def '>' specializes NumericalFunctions::'>' (x: QuantityValue, y: QuantityValue): Boolean;
	calc def '<=' specializes NumericalFunctions::'<=' (x: QuantityValue, y: QuantityValue): Boolean;
	calc def '>=' specializes NumericalFunctions::'>=' (x: QuantityValue, y: QuantityValue): Boolean;

	calc def Max specializes NumericalFunctions::Max (x: QuantityValue, y: QuantityValue): QuantityValue;
	calc def Min specializes NumericalFunctions::Min (x: QuantityValue, y: QuantityValue): QuantityValue;

	calc def '==' specializes BaseFunctions::'==' (x: QuantityValue, y: QuantityValue): Boolean;
	calc def '!=' specializes BaseFunctions::'!=' (x: QuantityValue, y: QuantityValue): Boolean;
		
	calc def Sqrt(x: QuantityValue): QuantityValue;

	calc def Floor(x: QuantityValue): QuantityValue;
	calc def Round(x: QuantityValue): QuantityValue;
	
	calc def ToString specializes BaseFunctions::ToString (x: QuantityValue): String;
	calc def ToInteger(x: QuantityValue): Integer;
	calc def ToRational(x: QuantityValue): Rational;
	calc def ToReal(x: QuantityValue): Real;
	calc def ToDimensionOneValue(x: Real): DimensionOneValue;
	
	calc def sum specializes ScalarFunctions::sum (collection: QuantityValue[0..*]): QuantityValue {
		ScalarFunctions::sum0(collection, 0.0)
	}
	
	calc def product specializes ScalarFunctions::product (collection: QuantityValue[0..*]): QuantityValue {
		ScalarFunctions::product1(collection, 1.0)
	}

    calc def ConvertQuantity(x: QuantityValue, targetMRef: MeasurementReference): QuantityValue;
}
