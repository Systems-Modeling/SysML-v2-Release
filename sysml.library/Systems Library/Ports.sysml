standard library package Ports {
	doc
	/*
	 * This package defines the base types for ports and related structural elements 
	 * in the SysML language.
	 */

	private import Objects::Object;
	private import Objects::objects;
	
	abstract port def Port :> Object {
		doc
		/*
		 * Port is the most general class of objects that represent connection points
		 * for interacting with a Part. Port is the base type of all PortDefinitions.
		 */
	
		ref self: Port :>> Object::self;
		
		port subports: Port :> timeEnclosedOccurrences {
			doc
			/*
			 * The Ports that are subports of this Port.
			 */
		}
	}
	
	abstract port ports : Port[0..*] nonunique :> objects {
		doc
		/*
		 * ports is the base feature of all PortUsages.
		 */
	}
}