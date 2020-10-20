/**
 * This package defines the base types for actions and related behavioral elements in the
 * SysML language.
 */
package Actions {
	private import Occurrences::Occurrence;
	private import Performances::Performance;
	private import Performances::performances;
	private import Transfers::Transfer;
	private import Transfers::transfers;
	private import ControlPerformances::MergePerformance;
	private import ControlPerformances::DecisionPerformance;
	private import TransitionPerformances::NonStateTransitionPerformance;
	
	/**
	 * Action is the most general class of performances of action definitions in a system or 
	 * part of a system. Action is the base class of all action definitions.
	 */
	abstract action def Action :> Performance {
		ref action self: Action :>> Performance::self;
		ref action incomingTransfers :>> Performance::incomingTransfers;
			
		/**
		 * The starting snapshot of an action. 
		 */
		action start: Action :>> startShot;
		
		/**
		 * The ending snapshot of an action.
		 */
		action done: Action :>> endShot;

		/**
		 * The subperformances of this action that are actions. 
		 */
		action subactions: Action[0..*] :> actions, subperformances;
	
		/**
		 * The subactions of this actvity that are control actions.
		 */
		abstract action controls : ControlAction[0..*] :> subactions;
		
		/**
		 * The control actions of this action def that are merge actions.
		 */
		abstract action merges : MergeAction[0..*] :> controls;
		
		/**
		 * The control actions of this action def that are decision actions.
		 */
		abstract action decisions : DecisionAction :> controls;
		
		/**
		 * The control actions of this action def that are join actions.
		 */
		abstract action joins: JoinAction :> controls;
		
		/**
		 * The control actions of this action def that are fork actions.
		 */
		abstract action forks: ForkAction :> controls;		
	}
	
	/**
	 * A TransferAction is an Action that is also a Transfer in a given context.
	 */
	abstract action def TransferAction :> Transfer, Action (context: Occurrence);
	
	/**
	 * actions is the base feature for all Action usages.
	 */
	abstract action actions: Action[0..*] nonunique :> performances;
	
	/**
	 * transferActions is the base feature for all TransferAction usages.
	 * transferActions is a subset of the incomingTransfers of its context.
	 */
	abstract action transferActions: TransferAction[0..*] :> 
		transfers, actions, transferActions::context::incomingTransfers
		(context: Occurrence);
	
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
	 * A DecisionTransitionPerformance is a NonStateTransitionPerformance that has a
	 * single guard, but no trigger or effects.
	 */
	action def DecisionTransition :> NonStateTransitionPerformance {
		ref action trigger[0..0] redefines NonStateTransitionPerformance::trigger;
		ref action guard[1] redefines NonStateTransitionPerformance::guard;
		ref action effect[0..0] redefines NonStateTransitionPerformance::effect;
	}

}