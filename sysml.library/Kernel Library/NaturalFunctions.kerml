/**
 * This package defines functions on Natural values, including concrete specialization of the 
 * general arithmetic and comparison operations.
 */
package NaturalFunctions {
	import ScalarValues::*;
	
	function '+' specializes IntegerFunctions::'+' (x: Natural[1], y: Natural[0..1]): Natural[1];
	function '*' specializes IntegerFunctions::'*' (x: Natural[1], y: Natural[1]): Natural[1];
	function '/' specializes IntegerFunctions::'/' (x: Natural[1], y: Natural[1]): Natural[1];
	function '%' specializes IntegerFunctions::'%' (x: Natural[1], y: Natural[1]): Natural[1];
	
	function '<' specializes IntegerFunctions::'<' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '>' specializes IntegerFunctions::'>' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '<=' specializes IntegerFunctions::'<=' (x: Natural[1], y: Natural[1]): Boolean[1];
	function '>=' specializes IntegerFunctions::'>=' (x: Natural[1], y: Natural[1]): Boolean[1];	

	function Max specializes IntegerFunctions::Max (x: Natural[1], y: Natural[1]): Natural[1];

	function '==' specializes IntegerFunctions::'==' (x: Natural[0..1], y: Natural[0..1]): Boolean[1];
	
	function ToString specializes IntegerFunctions::ToString (x: Natural[1]): String[1];
	function ToNatural(x: String[1]): Natural[1];
}	
