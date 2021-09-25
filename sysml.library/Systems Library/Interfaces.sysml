package Interfaces {
	private import Connections::Connection;
	private import Connections::connections;
	private import Connections::BinaryConnection;
	private import Connections::binaryConnections;
	private import Ports::Port;
	
	/**
	 * Interface is the most general class of links between Ports on Parts 
	 * within some containing structure. Interface is the base type of all
	 * InterfaceDefinitions.
	 */
	abstract interface def Interface :> Connection;
	
	/**
	 * BinaryInterface is the most general class of links between two Ports 
	 * on Parts within some containing structure. BinaryInterface is the base 
	 * type of all binary InterfaceDefinitions with exactly two ends.
	 */
	abstract interface def BinaryInterface :> Interface, BinaryConnection { 
		end source: Port[0..*] :>> BinaryConnection::source; 
		end target: Port[0..*] :>> BinaryConnection::target;
	}
	
	/**
	 * interfaces is the base feature of all InterfaceUsages.
	 */
	abstract interface interfaces: Interface[0..*] nonunique :> connections;
	
	/**
	 * interfaces is the base feature of all binary InterfaceUsages.
	 */
	abstract interface binaryInterfaces: BinaryInterface[0..*] nonunique :> interfaces, binaryConnections;
	
}