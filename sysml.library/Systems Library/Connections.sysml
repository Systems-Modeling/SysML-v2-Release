/**
 * This package defines the base types for connections and related structural elements 
 * in the SysML language.
 */
package Connections {
	private import Base::Anything;
	private import Objects::LinkObject;
	private import Objects::linkObjects;
	private import Objects::BinaryLinkObject;
	private import Objects::binaryLinkObjects;
	private import Parts::Part;
	private import Parts::parts;

	/**
	 * Connection is the most general class of links between things within some 
	 * containing structure. Connection is the base type of all ConnectionDefinitions.
	 */
	abstract connection def Connection :> LinkObject, Part;
	 
	/**
	 * BinaryConnection is the most general class of binary links between two things 
	 * within some containing structure. BinaryConnection is the base type of all 
	 * ConnectionDefinitions with exactly two ends.
	 */
	abstract connection def BinaryConnection :> Connection, BinaryLinkObject {
		end source: Anything[0..*] :>> BinaryLinkObject::source;
		end target: Anything[0..*] :>> BinaryLinkObject::target;
	}
	
	/**
	 * connections is the base feature of all ConnectionUsages.
	 */
	abstract connection connections: Connection[0..*] nonunique :> linkObjects, parts;
	
	/**
	 * binaryConnections is the base feature of all binary ConnectionUsages.
	 */
	abstract connection binaryConnections: Connection[0..*] nonunique :> connections, binaryLinkObjects;
}