/**
 * This package defines the base types for states and related behavioral elements in the
 * SysML language.
 */
package States {
	private import Actions::Action;
	private import Actions::TransferAction;
	private import Actions::actions;
	private import StatePerformances::StatePerformance;
	private import StatePerformances::StateTransitionPerformance;
	
	/**
	 * A State is an Action that is also a StatePerformance.
	 */
	abstract state def State :> Action, StatePerformance {
		entry action entryAction :>> 'entry';
		do action doAction: Action :>> 'do' :> subactions;
		exit action exitAction: Action :>> 'exit';
		
		attribute :>> isTriggerDuring = true;
		attribute :>> isAcceptFirst = true;
		
		ref state self: State :>> Action::self, StatePerformance::self;
		
		/**
		 * The subperformances of this StateAction that are Actions, other than the entry and exit Actions. 
		 * These <code>subactions</code> all take place in the "middle" of the StatePerformance, that is, 
		 * after the entry Action and before the exit Action. 
		 */
		action :>> subactions :> middle;
		
		/**
		 * The subactions of this state that are states.
		 */
		abstract state substates: State[0..*] :> states, subactions;
	}
	
	/**
	 * A Transition is a StateTransitionPerformance whose transitionLinkSource is an Action.
	 */
	action def Transition :> Action, StateTransitionPerformance {
		ref action :>> trigger: TransferAction;
		ref action :>> effect: Action;
		ref action :>> transitionLinkSource: Action;
	}
	
	/**
	 * states is the base feature for all StateUsages.
	 */
	abstract state states: State[0..*] nonunique :> actions;
	
	/**
	 * transitions is the base feature for all TransitionUsages.
	 */
	abstract action transitions: Transition[0..*] nonunique :> actions;
}