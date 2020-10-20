package StringFunctions {
	import ScalarValues::*;
	
	function '+' specializes ScalarFunctions::'+' (x: String, y:String): String;
	
	function Size(x: String): Natural;
	function Substring(x: String, lower: Integer, upper: Integer): String;
	
	function '<' specializes ScalarFunctions::'<' (x: String, y: String): Boolean;
	function '>' specializes ScalarFunctions::'>' (x: String, y: String): Boolean;
	function '<=' specializes ScalarFunctions::'<=' (x: String, y: String): Boolean;
	function '>=' specializes ScalarFunctions::'>=' (x: String, y: String): Boolean;

	function '=' specializes BaseFunctions::'==' (x: String, y: String): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: String, y: String): Boolean;
	
	function ToString specializes BaseFunctions::ToString (x: String): String;	
}
