package NaturalFunctions {
	import ScalarValues::*;
	
	function '+' specializes IntegerFunctions::'+' (x: Natural[1], y: Natural[0..1]): Natural[1];
	function '*' specializes IntegerFunctions::'*' (x: Natural[1], y: Natural[1]): Natural[1];
	function '/' specializes IntegerFunctions::'/' (x: Natural[1], y: Natural[1]): Natural[1];
	function '%' specializes IntegerFunctions::'%' (x: Natural[1], y: Natural[1]): Natural[1];
	
	function '<' specializes IntegerFunctions::'<', UnlimitedNaturalFunctions::'<' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '>' specializes IntegerFunctions::'>', UnlimitedNaturalFunctions::'>' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '<=' specializes IntegerFunctions::'<=', UnlimitedNaturalFunctions::'<=' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '>=' specializes IntegerFunctions::'>=', UnlimitedNaturalFunctions::'>=' (x: Natural[1], y: Natural[1]): Boolean[1];	

	function Max specializes IntegerFunctions::Max, UnlimitedNaturalFunctions::Max (x: Natural[1], y: Natural[1]): Natural[1];

	function '==' specializes IntegerFunctions::'==', UnlimitedNaturalFunctions::'==' (x: Natural[0..1], y: Natural[0..1]): Boolean[1];
	
	function ToString specializes IntegerFunctions::ToString, UnlimitedNaturalFunctions::ToString (x: Natural[1]): String[1];
	function ToNatural(x: String[1]): Natural[1];
}	
