package NaturalFunctions {
	import ScalarValues::*;
	
	function '+' specializes IntegerFunctions::'+' (x: Natural, y: Natural[0..1]): Natural;
	function '*' specializes IntegerFunctions::'*' (x: Natural, y: Natural): Natural;
	function '/' specializes IntegerFunctions::'/' (x: Natural, y: Natural): Natural;
	function '%' specializes IntegerFunctions::'%' (x: Natural, y: Natural): Natural;
	
	function '<' specializes IntegerFunctions::'<', UnlimitedNaturalFunctions::'<' (x: Natural, y: Natural): Boolean;
	function '>' specializes IntegerFunctions::'>', UnlimitedNaturalFunctions::'>' (x: Natural, y: Natural): Boolean;
	function '<=' specializes IntegerFunctions::'<=', UnlimitedNaturalFunctions::'<=' (x: Natural, y: Natural): Boolean;
	function '>=' specializes IntegerFunctions::'>=', UnlimitedNaturalFunctions::'>=' (x: Natural, y: Natural): Boolean;	

	function Max specializes IntegerFunctions::Max, UnlimitedNaturalFunctions::Max (x: Natural, y: Natural): Natural;

	function '==' specializes IntegerFunctions::'==', UnlimitedNaturalFunctions::'=' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	function '/=' specializes IntegerFunctions::'!=', UnlimitedNaturalFunctions::'!=' (x: UnlimitedNatural, y: UnlimitedNatural): Boolean;
	
	function ToString specializes IntegerFunctions::ToString, UnlimitedNaturalFunctions::ToString (x: Natural): String;
	function ToNatural(x: String): Natural;
}	
