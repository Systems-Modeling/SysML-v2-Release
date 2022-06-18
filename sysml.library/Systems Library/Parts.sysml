/**
 * This package defines the base types for parts and related structural elements in the
 * SysML language.
 */
package Parts {
	private import Objects::Object;
	private import Objects::objects;
	private import Items::Item;
	private import Items::items;
	private import Ports::Port;
	private import Ports::ports;
	private import Actions::Action;
	private import Actions::actions;
	private import States::StateAction;
	private import States::stateActions;
	
	/**
	 * Part is the most general class of objects that represent all or a part of a system.
	 * Part is the base type of all PartDefinitions.
	 */
	abstract part def Part :> Item {
		ref self: Part :>> Item::self;
		
		part start: Part :>> Item::start;
		part done: Part :>> Item::done;
		
		/**
		 * Ports that are owned by this Part.
		 */
		abstract port ownedPorts: Port[0..*] :> ports, timeEnclosedOccurrences;
		
		/**
		 * Actions that are performed by this Part.
		 */
		abstract ref action performedActions: Action[0..*] :> actions, enactedPerformances;
		
		/**
		 * Actions that are owned by this Part.
		 */
		abstract action ownedActions: Action[0..*] :> actions, ownedPerformances {
			/**
			 * The "this" reference of an ownedAction is always its owning Part.
			 */
		 	ref part :>> this : Part = that as Part;
		}
		
		/**
		 * StateActions that are exhibited by this Part.
		 */
		abstract ref state exhibitedStates: StateAction[0..*] :> stateActions, performedActions;
		
		/**
		 * StateActions that are owned by this Part.
		 */
		abstract state ownedStates: StateAction[0..*] :> stateActions, ownedActions;
	}
	
	/** 
	 * parts is the base feature of all part properties.
	 */
	abstract part parts: Part[0..*] nonunique :> items;
	
}