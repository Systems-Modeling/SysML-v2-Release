/**
 * This pacakge defines the base types for allocations and related structural elements
 * in the SysML language.
 */
package Allocations {
	private import Base::Anything;
	private import Connections::*;

	/**
	 * Allocation is the most general class of allocation, represented as a connection 
	 * between the source of the allocation and the target. Allocation is the base type 
	 * of all AllocationDefinitions.
	 */	
	allocation def Allocation :> BinaryConnection {
		end source: Anything[0..*] :>> BinaryConnection::source;
		end target: Anything[0..*] :>> BinaryConnection::target;
	}
	
	/**
	 * allocations is the base feature of all AllocationUsages.
	 */
	abstract allocation allocations: Allocation[0..*] nonunique :> binaryConnections;
}