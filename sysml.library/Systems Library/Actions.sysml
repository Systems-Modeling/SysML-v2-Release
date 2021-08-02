/**
 * This package defines the base types for actions and related behavioral elements in the
 * SysML language.
 */
package Actions {
	private import Occurrences::Occurrence;
	private import Performances::Performance;
	private import Performances::performances;
	private import Transfers::TransferBefore;
	private import ControlPerformances::MergePerformance;
	private import ControlPerformances::DecisionPerformance;
	private import TransitionPerformances::TransitionPerformance;
	private import TransitionPerformances::NonStateTransitionPerformance;
	
	/**
	 * Action is the most general class of Performances of ActionDefinitions in a system or 
	 * part of a system. Action is the base class of all ActionDefinitions.
	 */
	abstract action def Action :> Performance {
		ref action self: Action :>> Performance::self;
		ref action incomingTransfers :>> Performance::incomingTransfers;
			
		/**
		 * The starting snapshot of an Action. 
		 */
		action start: Action :>> startShot;
		
		/**
		 * The ending snapshot of an Action.
		 */
		action done: Action :>> endShot;

		/**
		 * The subperformances of this Action that are Actions. 
		 */
		action subactions: Action[0..*] :> actions, subperformances;
	
		/**
		 * The subactions of this Action that are SendActions. 
		 */
		action sendSubactions: SendAction[0..*] :> subactions;
	
		/**
		 * The subactions of this Action that are AcceptActions. 
		 */
		action acceptSubactions: AcceptAction[0..*] :> subactions;
	
		/**
		 * The subactions of this Action that are ControlActions.
		 */
		abstract action controls : ControlAction[0..*] :> subactions;
		
		/**
		 * The controls of this Action that are MergeActions.
		 */
		abstract action merges : MergeAction[0..*] :> controls;
		
		/**
		 * The controls of this Action that are DecisionActions.
		 */
		abstract action decisions : DecisionAction :> controls;
		
		/**
		 * The controls of this Action that are JoinActions.
		 */
		abstract action joins: JoinAction :> controls;
		
		/**
		 * The controls of this Action that are ForkActions.
		 */
		abstract action forks: ForkAction :> controls;
		
		/**
		 * The subactions of this Action that are TransitionActions. 
		 */
		abstract action transitions: TransitionAction[0..*] :> subactions, transitionActions;
	}
	
	/**
	 * actions is the base feature for all ActionUsages.
	 */
	abstract action actions: Action[0..*] nonunique :> performances;
	
	/**
	 * A SendAction is an Action used to type a SendActionUsage. It initiates an outgoingTransferFromSelf 
	 * to a designated receiver Occurrence with a given payload.
	 */
	action def SendAction(in payload[0..*], in receiver: Occurrence[1]) {
	    ref outgoingTransfer: TransferBefore[1] :>> outgoingTransfersFromSelf :> receiver::incomingTransfers {
	    	ref :>> source: SendAction {
	    		ref :>> sourceOutput = payload;
	    	}
	    }
	}
	
	/**
	 * sendActions is the base feature for all SendActionUsages.
	 */
	abstract action sendActions: SendAction[0..*] nonunique :> actions;
	
	/**
	 * An AcceptAction is an Action used to type an AcceptActionUsage. It completes an 
	 * incomingTransferFromSelf that is one of the incomingTransfers of a given receiver Occurrence, 
	 * outputting the payload from the Transfer.
	 */
	action def AcceptAction(out payload[0..*], in receiver: Occurrence[1]) {
		ref incomingTransfer: TransferBefore[1] :>> incomingTransfersToSelf :> receiver::incomingTransfers {
			ref :>> target: AcceptAction {
				ref :>> targetInput = payload;
			}
		}
	}
	
	/**
	 * acceptActions is the base feature for all AcceptActionUsages.
	 */
	abstract action acceptActions: AcceptAction[0..*] nonunique :> actions;
	
	/**
	 * A ControlAction is the Action of a control node, which has no inherent behavior.
	 */
	abstract action def ControlAction :> Action {
		/**
		 * A ControlAction is instantaneous.
		 */
		bind start = done;
	}
	
	/**
	 * A MergeAction is the ControlAction for a merge node.
	 * 
	 * Note: Incoming sucession connectors to a MergeAction must have source multiplicity 
	 * 0..1 and subset the incomingHBLink feature inherited from MergePerformance.
	 */
	action def MergeAction :> ControlAction, MergePerformance;
	
	/** 
	 * A DecisionAction is the ControlAction for a decision node.
	 * 
	 * Note: Outgoing succession connectors to a MergeAction must have target multiplicity
	 * 0..1 and subset the outgoingHBLink feature inherited from DecisionPerformance.
	 * If an outgoing succession has a guard, it should have a transitionStep typed by 
	 * DecisionTransition.
	 */
	action def DecisionAction :> ControlAction, DecisionPerformance;
	
	/**
	 * A JoinAction is the ControlAction for a JoinNode.
	 * 
	 * Note: Join behavior results from requiring that the source multiplicity of all
	 * incoming succession connectors be 1..1.
	 */
	action def JoinAction :> ControlAction;
	
	/**
	 * A ForkAction is the ControlAction for a ForkNode.
	 * 
	 * Note: Fork behavior results from requiring that the target multiplicity of all
	 * outgoing succession connectors be 1..1.
	 */
	action def ForkAction :> ControlAction;
	
	/**
	 * A TransitionAction is a TransitionPerformance whose transitionLinkSource is an Action.
	 * It is the base type of all TransitionUsages.
	 */
	abstract action def TransitionAction :> Action, TransitionPerformance {
		in transitionLinkSource : Action :>> TransitionPerformance::transitionLinkSource;

		action accepter: AcceptAction[0..1];
		bind trigger = accepter.incomingTransfer;
		
		action effect: Action :>> TransitionPerformance::effect;		
	}
	
	/**
	 * A DecisionTransitionAction is a TransitionAction and NonStateTransitionPerformance that has a 
	 * single guard, but no trigger or effects. It is the base type of TransitionUsages used as 
	 * conditional successions in action models.
	 */
	action def DecisionTransitionAction :> TransitionAction, NonStateTransitionPerformance {
		ref action :>> accepter[0..0];
		ref action :>> guard[1];
		ref action :>> effect[0..0];
	}

	/**
	 * transitionActions is the base feature for all TransitionUsages.
	 */
	abstract action transitionActions: TransitionAction[0..*] nonunique :> actions;
}