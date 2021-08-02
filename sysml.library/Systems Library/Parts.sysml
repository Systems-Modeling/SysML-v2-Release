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
	private import States::StateAction;
	
	/**
	 * Part is the most general class of objects that represent all or a part of a system.
	 * Part is the base type of all PartDefinitions.
	 */
	abstract part def Part :> Item {
		ref self: Part :>> Item::self;
		
		part start: Part :>> Item::start;
		part done: Part :>> Item::done;
		
		/**
		 * Ports that are on this Part.
		 */
		abstract port portsOnPart: Port[0..*] :> ports;
		
		/**
		 * Actions that are performed by this Part.
		 */
		abstract ref action performedActions: Action[0..*] :> enactedPerformances;
		
		/**
		 * States that are exhibited by this Part.
		 */
		abstract ref state exhibitedStates: StateAction[0..*] :> performedActions;
	}
	
	/** 
	 * parts is the base feature of all part properties.
	 */
	abstract part parts: Part[0..*] nonunique :> items;
	
}