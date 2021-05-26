/**
 * This package defines the base types for ports and related structural elements 
 * in the SysML language.
 */
package Ports {
	private import Parts::Part;
	private import Parts::parts;
	
	/**
	 * Port is the most general class of objects that represent connection points
	 * for interacting with a Part. Port is the base type of all PortDefinitions.
	 */
	abstract port def Port :> Part;
	
	/**
	 * ports is the base feature of all PortUsages.
	 */
	abstract port ports : Port[0..*] nonunique :> parts;
}