package AliasImport {
	package Definitions {
	    part def Vehicle;
	    
	    alias Car for Vehicle;
	}
	
	package Usages {
	    import Definitions::Car;
	
	    part vehicle : Car;
	}
}