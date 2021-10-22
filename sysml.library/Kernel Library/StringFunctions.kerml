/**
 * This package defines functions on String values, including those corresponding to string concatenation 
 * and comparison operators in the KerML expression notation.
 */
package StringFunctions {
	import ScalarValues::*;
	
	function '+' specializes ScalarFunctions::'+' (x: String[1], y:String[1]): String[1];
	
	function Length(x: String[1]): Natural[1];
	function Substring(x: String[1], lower: Integer[1], upper: Integer[1]): String[1];
	
	function '<' specializes ScalarFunctions::'<' (x: String[1], y: String[1]): Boolean[1];
	function '>' specializes ScalarFunctions::'>' (x: String[1], y: String[1]): Boolean[1];
	function '<=' specializes ScalarFunctions::'<=' (x: String[1], y: String[1]): Boolean[1];
	function '>=' specializes ScalarFunctions::'>=' (x: String[1], y: String[1]): Boolean[1];

	function '==' specializes DataFunctions::'==' (x: String[0..1], y: String[0..1]): Boolean[1];
	
	function ToString specializes BaseFunctions::ToString (x: String[1]): String[1] {
		x
	}
}
