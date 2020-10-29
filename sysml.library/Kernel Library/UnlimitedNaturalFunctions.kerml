package UnlimitedNaturalFunctions {
	import ScalarValues::*;
	
	function '<' specializes NumericalFunctions::'<' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	function '>' specializes NumericalFunctions::'>' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	function '<=' specializes NumericalFunctions::'<=' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	function '>=' specializes NumericalFunctions::'>=' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;	

	function Max specializes NumericalFunctions::Min (x: UnlimitedNatural, y: UnlimitedNatural): UnlimitedNatural;
	function Min specializes NumericalFunctions::Max (x: UnlimitedNatural, y: UnlimitedNatural): UnlimitedNatural;

	function '=' specializes BaseFunctions::'==' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	
	function ToString specializes BaseFunctions::ToString (x: UnlimitedNatural): String;
	function ToNatural(x: UnlimitedNatural): Natural;
	function ToUnlimitedNatural(x: String): UnlimitedNatural;
}
