standard library package States {
	doc
	/*
	 * This package defines the base types for states and related behavioral elements in the
	 * SysML language.
	 */

	private import Occurrences::Occurrence;
	private import StatePerformances::StatePerformance;
	private import StatePerformances::StateTransitionPerformance;
	private import Actions::Action;
	private import Actions::TransitionAction;
	private import Actions::transitionActions;
	private import Actions::AcceptAction;
	private import Actions::actions;
	private import SequenceFunctions::notEmpty;
	private import SequenceFunctions::size;
	
	abstract state def StateAction :> Action, StatePerformance {
		doc
		/*
		 * A StateAction is a kind of Action that is also a StatePerformance. It is the base type for all
		 * StateDefinitions.
		 */
	
		entry action entryAction :>> 'entry';
		do action doAction: Action :>> 'do';
		exit action exitAction: Action :>> 'exit';
		
		attribute :>> isTriggerDuring;
		
		ref state self: StateAction :>> Action::self, StatePerformance::self;
		ref state start: StateAction :>> Action::start, StatePerformance::startShot;
		ref state done: StateAction :>> Action::done, StatePerformance::endShot;
		
		action :>> subactions :> middle {
			doc
			/*
			 * The subperformances of this StateAction that are Actions, other than the entry and exit Actions. 
			 * These subactions all take place in the "middle" of the StatePerformance, that is, after the 
			 * entry Action and before the exit Action. 
			 */
		}
		
		action substates: StateAction[0..*] :> stateActions, subactions {
			doc
			/*
			 * The subactions of this state that are states.
			 * 
			 * NOTE: This feature is declared as an ActionUsage, not a StateUsage, so that the constraint 
 			 * checkStateUsageExclusiveStateSpecialization does not apply to it, since this constraint 
			 * would otherwise incorrectly require that "substates" subset "exclusiveStates".
			 */
		}
		
		abstract state exclusiveStates: StateAction[0..*] :> substates {
			doc
			/*
			 * The substates of this state that are mutually exclusive, that is, whose performances do not
			 * overlap in time.
			 */
		}
		
		abstract action stateTransitions: StateTransitionAction[0..*] :> transitions {
			doc
			/*
			 * The transitions of this state that are state transitions.
			 */
		}
		
		succession stateSequencing first [0..1] exclusiveStates then [0..1] exclusiveStates {
			doc
			/*
			 * Exclusive states cannot overlap, so it must be possible to strictly sequence them in time.
			 */
		}
		assert constraint {notEmpty(exclusiveStates) implies size(stateSequencing) == size(exclusiveStates) - 1}
	}
	
	action def StateTransitionAction :> TransitionAction, StateTransitionPerformance {
		doc
		/*
		 * A StateTransitionAction is a TransitionAction and a StateTransitionPerformance whose transitionLinkSource 
		 * is a State. It is the base type of TransitionUsages used transitions in state models.
		 */
	
		in transitionLinkSource[1]: StateAction :>> 
			TransitionAction::transitionLinkSource, StateTransitionPerformance::transitionLinkSource;
			
		out payload[0..*];
		in :>> receiver;
		
		bind payload = accepter.payload;
		bind receiver = accepter.receiver;
	}
	
	abstract state stateActions: StateAction[0..*] nonunique :> actions {
		doc
		/*
		 * stateActions is the base feature for all StateUsages.
		 */
	}
}