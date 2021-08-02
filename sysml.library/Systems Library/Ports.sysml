/**
 * This package defines the base types for ports and related structural elements 
 * in the SysML language.
 */
package Ports {
	private import Objects::Object;
	private import Objects::objects;
	
	/**
	 * Port is the most general class of objects that represent connection points
	 * for interacting with a Part. Port is the base type of all PortDefinitions.
	 */
	abstract port def Port :> Object {
		ref self: Port :>> Object::self;
		
		/**
		 * The Ports that are subports of this Port.
		 */
		port subports: Port :> suboccurrences;
	}
	
	/**
	 * ports is the base feature of all PortUsages.
	 */
	abstract port ports : Port[0..*] nonunique :> objects;
}