package BooleanFunctions {
	import ScalarValues::*;
	
	function '!' specializes ScalarFunctions::'!' (x: Boolean): Boolean;
	
	function '|' specializes ScalarFunctions::'|' (x: Boolean, y: Boolean): Boolean;
	function '^' specializes ScalarFunctions::'^' (x: Boolean, y: Boolean): Boolean;
	function '&' specializes ScalarFunctions::'&' (x: Boolean, y: Boolean): Boolean;
	
	function '==' specializes BaseFunctions::'==' (x: Boolean, y: Boolean): Boolean;
	function '!=' specializes BaseFunctions::'!=' (x: Boolean, y: Boolean): Boolean;
	
	function ToString specializes BaseFunctions::ToString (x: Boolean): String;
	function ToBoolean(x: String): Boolean;
	
}
	
