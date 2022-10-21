standard library package Interfaces {
	doc
	/*
	 * This package defines the base types for interfaces and related structural elements in the SysML language.
	 */
	 
	private import Connections::Connection;
	private import Connections::connections;
	private import Connections::BinaryConnection;
	private import Connections::binaryConnections;
	private import Ports::Port;
	
	abstract interface def Interface :> Connection {
		doc
		/*
		 * Interface is the most general class of links between Ports on Parts 
		 * within some containing structure. Interface is the base type of all
		 * InterfaceDefinitions.
		 */
	}
	
	abstract interface def BinaryInterface :> Interface, BinaryConnection {
		doc
		/*
		 * BinaryInterface is the most general class of links between two Ports 
		 * on Parts within some containing structure. BinaryInterface is the base 
		 * type of all binary InterfaceDefinitions with exactly two ends.
		 */
	 
		end source: Port[0..*] :>> BinaryConnection::source; 
		end target: Port[0..*] :>> BinaryConnection::target;
	}
	
	abstract interface interfaces: Interface[0..*] nonunique :> connections {
		doc
		/*
		 * interfaces is the base feature of all InterfaceUsages.
		 */
	}
	
	abstract interface binaryInterfaces: BinaryInterface[0..*] nonunique :> interfaces, binaryConnections {
		doc
		/*
		 * interfaces is the base feature of all binary InterfaceUsages.
		 */
	}
	
}