/**
 * This package defines the base types for actions and related behavioral elements in the
 * SysML language.
 */
package Actions {
	private import Base::Anything;
	private import ScalarValues::Positive;
	private import SequenceFunctions::size;
	private import Occurrences::Occurrence;
	private import Performances::Performance;
	private import Performances::performances;
	private import FeatureReferencingPerformances::FeatureWritePerformance;
	private import Transfers::TransferBefore;
	private import ControlPerformances::MergePerformance;
	private import ControlPerformances::DecisionPerformance;
	private import ControlPerformances::IfThenPerformance;
	private import ControlPerformances::IfThenElsePerformance;
	private import ControlPerformances::LoopPerformance;
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
		action subactions: Action[0..*] :> actions, subperformances {
			/**
			 * The "this" reference of a subaction is always the same as that of
			 * its owning Action.
			 */
			ref occurrence :>> this = (that as Action).this;
		}
	
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
		abstract action joins : JoinAction :> controls;
		
		/**
		 * The controls of this Action that are ForkActions.
		 */
		abstract action forks : ForkAction :> controls;
		
		/**
		 * The subactions of this Action that are TransitionActions. 
		 */
		abstract action transitions : TransitionAction[0..*] :> subactions, transitionActions;
		
		/**
		 * The subactions of this Action that are AssignmentActions.
		 */
		abstract action assignments : AssignmentAction[0..*] :> subactions, assignmentActions;
		
		/**
		 * The subactions of this Action that are IfThenActions (including IfThenElseActions).
		 */
		abstract action ifSubactions : IfThenAction[0..*] :> subactions, ifThenActions;
		
		/**
		 * The subactions of this Action that are LoopActions.
		 */
		abstract action loops : LoopAction[0..*] :> subactions, loopActions;
		
		/**
		 * The subactions of this Action that are LoopActions.
		 */
		abstract action whileLoops : WhileLoopAction[0..*] :> loops, whileLoopActions;
		
		/**
		 * The subactions of this Action that are LoopActions.
		 */
		abstract action forLoops : ForLoopAction[0..*] :> loops, forLoopActions;
	}
	
	/**
	 * actions is the base feature for all ActionUsages.
	 */
	abstract action actions: Action[0..*] nonunique :> performances;
	
	/**
	 * A SendAction is an Action used to type a SendActionUsage. It initiates an outgoingTransferFromSelf 
	 * to a designated receiver Occurrence with a given payload.
	 */
	action def SendAction {
		in payload[0..*];
		in receiver: Occurrence[1];
		
	    ref outgoingTransfer: TransferBefore[1] :>> outgoingTransfersFromSelf :> receiver.incomingTransfers {
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
	action def AcceptAction {
		inout payload[0..*];
		in receiver: Occurrence[1] default this;
		
		ref incomingTransfer: TransferBefore[1] :>> incomingTransfersToSelf :> receiver.incomingTransfers {
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
	 * Note: Incoming succession connectors to a MergeAction must have source multiplicity 
	 * 0..1 and subset the incomingHBLink feature inherited from MergePerformance.
	 */
	action def MergeAction :> ControlAction, MergePerformance;
	
	/** 
	 * A DecisionAction is the ControlAction for a decision node.
	 * 
	 * Note: Outgoing succession connectors from a DecisionAction must have target multiplicity
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
	 * guard, but no trigger or effects. It is the base type of TransitionUsages used as 
	 * conditional successions in action models.
	 */
	action def DecisionTransitionAction :> TransitionAction, NonStateTransitionPerformance {
		ref action :>> accepter[0..0];
		ref action :>> effect[0..0];
	}

	/**
	 * transitionActions is the base feature for all TransitionUsages.
	 */
	abstract action transitionActions: TransitionAction[0..*] nonunique :> actions;
	
	/**
	 * An AssignmentAction is an Action, used to type an AssignmentActionUsage. It is also a
	 * FeatureWritePerformance that updates the accessedFeature of its target Occurrence with
	 * the given replacementValues.
	 */
	action def AssignmentAction :> FeatureWritePerformance, Action {
		in target : Occurrence[1];
		inout replacementValues : Anything[0..*] nonunique;
	}
	
	/**
	 * assignmentActions is the base feature for all AssignmentActionsUsages.
	 */
	abstract action assignmentActions : AssignmentAction[0..*] nonunique :> actions;
	
	/**
	 * An IfThenAction is a Kernel IfThenPerformance that is also an Action. 
	 * It is the base type for all IfActionUsages.
	 */
	action def IfThenAction :> Action, IfThenPerformance {
		in :>> ifTest[1];
		in action :>> thenClause[0..1];
	}
	
	/**
	 * An IfThenElseAction is a Kernel IfThenElsePeformance that is also an IfThenAction. 
	 * It is the base type for all IfActionUsages that have an elseAction.
	 */
	action def IfThenElseAction :> IfThenAction, IfThenElsePerformance {
		in :>> ifTest[1];
		in action :>> thenClause[0..1];
		in action :>> elseClause[0..1];
	}
	
	/**
	 * ifThenActions is the base feature for all IfActionUsages.
	 */
	abstract action ifThenActions : IfThenAction[0..*] nonunique :> actions;
	
	/**
	 * ifThenElseActions is the base feature for all IfActionUsages that have an elseAction.
	 */
	abstract action ifThenElseActions : IfThenElseAction[0..*] nonunique :> actions;
	
	/**
	 * A LoopAction is the base type for all LoopActionUsages.
	 */
	abstract action def LoopAction :> Action {
		
		/**
		 * The action that is performed repeatedly in the loop.
		 */
		in action body[0..*];		
	}
	
	/**
	 * A WhileLoopAction is a Kernel LoopPerformance that is also a LoopAction.
	 * It is the base type for all WhileLoopActionUsages.
	 */
	action def WhileLoopAction :> LoopAction, LoopPerformance {
		/**
		 * A Boolean expression that must be true for the loop to continue.
		 * It is evaluated before the body is performed and is always evaluated at 
		 * least once.
		 */
		in :>> whileTest default {true};
		
		/**
		 * The action that is performed while the whileTest is true and the
		 * untilTest is false.
		 */
		in action body :>> LoopAction::body, LoopPerformance::body;
		
		/**
		 * A Boolean expression that must be false for the loop to continue.
		 * It is evaluated after the body is performed.
		 */
		in :>> untilTest default {false};
	}
	
	private abstract action def ForLoopActionBase :> LoopAction {
		in action body;
		in ref seq[0..*] ordered nonunique;
	}
	
	/**
	 * A ForLoopAction is a LoopAction that iterates over an ordered sequence of values.
	 * It is the base type for all ForLoopActionUsages.
	 */
	action def ForLoopAction :> ForLoopActionBase {
		/**
		 * The loop variable that is assigned successive elements of seq on each
		 * iteration of the loop.
		 */
		protected ref var[0..1] :> seq;
		
		/**
		 * The sequence of values over which the loop iterates.
		 */
		in ref :>> seq;
		
		/**
		 * The action that is performed on each iteration of the loop.
		 */
		in action :>> body;
		
		/**
		 * The index of the element of seq assigned to var on the current iteration
		 * of the loop.
		 */
		private attribute index : Positive;
		
		private action initialization
			assign index := 1;
		then private action whileLoop
			while index <= size(seq) {
				assign var := seq[index];
				then perform body;
				then assign index := index + 1;
			}
	}
	
	/**
	 * loopActions is the base feature for all LoopActionUsages.
	 */
	abstract action loopActions : LoopAction[0..*] nonunique :> actions;
	
	/**
	 * whileLoopActions is the base feature for all WhileLoopActionUsages.
	 */
	abstract action whileLoopActions : WhileLoopAction[0..*] nonunique :> loopActions;
	
	/**
	 * forLoopActions is the base feature for all ForLoopActionUsages.
	 */
	abstract action forLoopActions : ForLoopAction[0..*] nonunique :> loopActions;
}