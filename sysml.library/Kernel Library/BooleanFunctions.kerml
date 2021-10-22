/**
 * This package defines functions on Boolean values, including those corresponding to 
 * (non-conditional) logical operators in the KerML expression notation.
 */
package BooleanFunctions {
	import ScalarValues::*;
	
	function '!' specializes ScalarFunctions::'!' (x: Boolean[1]): Boolean[1];
	function 'not' specializes ScalarFunctions::'!' (x: Boolean[1]): Boolean[1];
	
	function '|' specializes ScalarFunctions::'|' (x: Boolean[1], y: Boolean[1]): Boolean[1];
	function '^^' specializes ScalarFunctions::'^^' (x: Boolean[1], y: Boolean[1]): Boolean[1];
	function 'xor' specializes ScalarFunctions::'xor' (x: Boolean[1], y: Boolean[1]): Boolean[1];
	function '&' specializes ScalarFunctions::'&' (x: Boolean[1], y: Boolean[1]): Boolean[1];
	
	function '==' specializes DataFunctions::'==' (x: Boolean[0..1], y: Boolean[0..1]): Boolean[1];
	
	function ToString specializes BaseFunctions::ToString (x: Boolean[1]): String[1];
	function ToBoolean(x: String[1]): Boolean[1];
	
}
	
