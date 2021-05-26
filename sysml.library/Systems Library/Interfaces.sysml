package Interfaces {
	private import Connections::Connection;
	private import Connections::connections;
	private import Ports::Port;
	
	/**
	 * Interface is the most general class of links between two Ports on Parts 
	 * within some containing structure. Interface is the base type of all
	 * InterfaceDefinitions.
	 */
	abstract interface def Interface :> Connection { 
		end source: Port[0..*] :>> Connection::source;
		end target: Port[0..*] :>> Connection::target;
	}
	
	/**
	 * interfaces is the base feature of all InterfaceUsages.
	 */
	abstract interface interfaces: Interface[0..*] nonunique :> connections;
	
}