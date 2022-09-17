package Connections {
	doc
	/*
	 * This package defines the base types for connections and related structural elements 
	 * in the SysML language.
	 */

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

	abstract connection def Connection :> LinkObject, Part {
		doc
		/*
		 * Connection is the most general class of links between things within some 
		 * containing structure. Connection is the base type of all ConnectionDefinitions.
		 */
	}
	 
	abstract connection def BinaryConnection :> Connection, BinaryLinkObject {
		doc
		/*
		 * BinaryConnection is the most general class of binary links between two things 
		 * within some containing structure. BinaryConnection is the base type of all 
		 * ConnectionDefinitions with exactly two ends.
		 */
	
		end source: Anything[0..*] :>> BinaryLinkObject::source;
		end target: Anything[0..*] :>> BinaryLinkObject::target;
	}
	
	abstract flow def FlowConnection :> BinaryConnection, Transfer {
		doc
		/*
		 * FlowConnection is the class of binary connections that represent a transfer 
		 * of objects or values between two occurrences. It is the base type of all
		 * FlowConnectionUsages.
		 */
	
		end source: Occurrence[0..*] :>> BinaryConnection::source, Transfer::source;
		end target: Occurrence[0..*] :>> BinaryConnection::target, Transfer::target;
	}
	
	abstract flow def SuccessionFlowConnection :> FlowConnection, TransferBefore {
		doc
		/*
		 * SuccessionFlowConnection is the subclass of flow connections that represent 
		 * temporally ordered transfers. It is the base type of all SuccessionFlowConnectionUsages.
		 */
	
		end source: Occurrence[0..*] :>> FlowConnection::source, TransferBefore::source;
		end target: Occurrence[0..*] :>> FlowConnection::target, TransferBefore::target;
	}
	
	abstract connection connections: Connection[0..*] nonunique :> linkObjects, parts {
		doc
		/*
		 * connections is the base feature of all ConnectionUsages.
		 */
	}
	
	abstract connection binaryConnections: Connection[0..*] nonunique :> connections, binaryLinkObjects {
		doc
		/*
		 * binaryConnections is the base feature of all binary ConnectionUsages.
		 */
	}
	
	abstract message flowConnections: FlowConnection[0..*] nonunique :> binaryConnections, transfers of Anything {
		doc
		/*
		 * flowConnections is the base feature of all FlowConnectionUsages.
		 */
	
		end source: Occurrence[0..*] :>> FlowConnection::source, binaryConnections::source, transfers::source;
		end target: Occurrence[0..*] :>> FlowConnection::target, binaryConnections::target, transfers::target;
	}
	
	abstract message successionFlowConnections: SuccessionFlowConnection[0..*] nonunique :> flowConnections, transfersBefore of Anything {
		doc
		/*
		 * successionFlowConnections is the base feature of all SuccessionFlowConnectionUsages.
		 */
	
		end source: Occurrence[0..*] :>> SuccessionFlowConnection::source, flowConnections::source, transfersBefore::source;
		end target: Occurrence[0..*] :>> SuccessionFlowConnection::target, flowConnections::target, transfersBefore::target;
	}
}