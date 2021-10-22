/**
 * This package defines the base types for connections and related structural elements 
 * in the SysML language.
 */
package Connections {
	private import Base::Anything;
	private import Occurrences::Occurrence;
	private import Objects::LinkObject;
	private import Objects::linkObjects;
	private import Objects::BinaryLinkObject;
	private import Objects::binaryLinkObjects;
	private import Transfers::Transfer;
	private import Transfers::transfers;
	private import Transfers::TransferBefore;
	private import Transfers::transfersBefore;
	private import Parts::Part;
	private import Parts::parts;
	private import Actions::Action;
	private import Actions::actions;

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
	 * FlowConnection is the class of binary connections that represent a transfer 
	 * of objects or values between two occurrences. It is the base type of all
	 * FlowConnectionUsages.
	 */
	abstract connection def FlowConnection :> BinaryConnection, Transfer {
		end source: Occurrence[0..*] :>> BinaryConnection::source, Transfer::source;
		end target: Occurrence[0..*] :>> BinaryConnection::target, Transfer::target;
	}
	
	/**
	 * SuccessionFlowConnection is the subclass of flow connections that represent 
	 * temporally ordered transfers. It is the base type of all SuccessionFlowConnectionUsages.
	 */
	abstract connection def SuccessionFlowConnection :> FlowConnection, TransferBefore {
		end source: Occurrence[0..*] :>> FlowConnection::source, TransferBefore::source;
		end target: Occurrence[0..*] :>> FlowConnection::target, TransferBefore::target;
	}
	
	/**
	 * connections is the base feature of all ConnectionUsages.
	 */
	abstract connection connections: Connection[0..*] nonunique :> linkObjects, parts;
	
	/**
	 * binaryConnections is the base feature of all binary ConnectionUsages.
	 */
	abstract connection binaryConnections: Connection[0..*] nonunique :> connections, binaryLinkObjects;
	
	/**
	 * flowConnections is the base feature of all FlowConnectionUsages.
	 */
	abstract connection flowConnections: FlowConnection[0..*] nonunique :> binaryConnections, transfers {
		end source: Occurrence[0..*] :>> FlowConnection::source, binaryConnections::source, transfers::source;
		end target: Occurrence[0..*] :>> FlowConnection::target, binaryConnections::target, transfers::target;
	}
	
	/**
	 * successionFlowConnections is the base feature of all SuccessionFlowConnectionUsages.
	 */
	abstract connection successionFlowConnections: SuccessionFlowConnection[0..*] nonunique :> flowConnections, transfersBefore {
		end source: Occurrence[0..*] :>> SuccessionFlowConnection::source, flowConnections::source, transfersBefore::source;
		end target: Occurrence[0..*] :>> SuccessionFlowConnection::target, flowConnections::target, transfersBefore::target;
	}
}