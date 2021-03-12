/**
 * This package defines the base types for states and related behavioral elements in the
 * SysML language.
 */
package States {
	private import Actions::Action;
	private import Actions::AcceptAction;
	private import Actions::actions;
	private import StatePerformances::StatePerformance;
	private import StatePerformances::StateTransitionPerformance;
	
	/**
	 * A StateAction is a kind of Action that is also a StatePerformance. It is the base type for all
	 * StateDefinitions.
	 */
	abstract state def StateAction :> Action, StatePerformance {
		entry action entryAction :>> 'entry';
		do action doAction: Action :>> 'do' :> subactions;
		exit action exitAction: Action :>> 'exit';
		
		attribute :>> isTriggerDuring = true;
		attribute :>> isAcceptFirst = true;
		
		ref state self: StateAction :>> Action::self, StatePerformance::self;
		
		/**
		 * The subperformances of this StateAction that are Actions, other than the entry and exit Actions. 
		 * These <code>subactions</code> all take place in the "middle" of the StatePerformance, that is, 
		 * after the entry Action and before the exit Action. 
		 */
		action :>> subactions :> middle;
		
		/**
		 * The subactions of this state that are states.
		 */
		abstract state substates: StateAction[0..*] :> stateActions, subactions;
	}
	
	/**
	 * A TransitionAction is a StateTransitionPerformance whose transitionLinkSource is an Action.
	 * It is the base type of all TransitionUsages.
	 */
	action def TransitionAction :> Action, StateTransitionPerformance {
		ref action transitionLinkSource: Action :>> StateTransitionPerformance::transitionLinkSource;
		action effect: Action :>> StateTransitionPerformance::effect;		
		action accepter: AcceptAction {
			ref incomingTransfersToSelf :>> AcceptAction::incomingTransfer;
		}
		bind trigger = accepter.incomingTransfersToSelf;
	}
	
	/**
	 * stateActions is the base feature for all StateUsages.
	 */
	abstract state stateActions: StateAction[0..*] nonunique :> actions;
	
	/**
	 * transitionActions is the base feature for all TransitionUsages.
	 */
	abstract action transitionActions: TransitionAction[0..*] nonunique :> actions;
}