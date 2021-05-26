package UnlimitedNaturalFunctions {
	import ScalarValues::*;
	
	function '<' specializes NumericalFunctions::'<' (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): Boolean[1];
	function '>' specializes NumericalFunctions::'>' (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): Boolean[1];
	function '<=' specializes NumericalFunctions::'<=' (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): Boolean[1];
	function '>=' specializes NumericalFunctions::'>=' (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): Boolean[1];	

	function Max specializes NumericalFunctions::Min (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): UnlimitedNatural[1];
	function Min specializes NumericalFunctions::Max (x: UnlimitedNatural[1], y: UnlimitedNatural[1]): UnlimitedNatural[1];

	function '==' specializes BaseFunctions::'==' (x: UnlimitedNatural[0..1], y: UnlimitedNatural[0..1]): Boolean[1];
	
	function ToString specializes BaseFunctions::ToString (x: UnlimitedNatural[1]): String[1];
	function ToNatural(x: UnlimitedNatural[1]): Natural[1];
	function ToUnlimitedNatural(x: String[1]): UnlimitedNatural[1];
}
