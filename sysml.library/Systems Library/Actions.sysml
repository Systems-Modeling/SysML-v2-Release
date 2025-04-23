standard library package Actions {
	doc
	/*
	 * This package defines the base types for actions and related behavioral elements in the
	 * SysML language.
	 */

	private import Base::Anything;
	private import ScalarValues::Positive;
	private import ScalarValues::Natural;
	private import SequenceFunctions::size;
	private import SequenceFunctions::isEmpty;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensWhile;
	private import Performances::Performance;
	private import Performances::performances;
	private import Transfers::SendPerformance;
	private import Transfers::sendPerformances;
	private import Transfers::AcceptPerformance;
	private import Transfers::acceptPerformances;
	private import FeatureReferencingPerformances::FeatureWritePerformance;
	private import ControlPerformances::MergePerformance;
	private import ControlPerformances::DecisionPerformance;
	private import ControlPerformances::IfThenPerformance;
	private import ControlPerformances::IfThenElsePerformance;
	private import ControlPerformances::LoopPerformance;
	private import TransitionPerformances::TransitionPerformance;
	private import TransitionPerformances::NonStateTransitionPerformance;
	private import Transfers::MessageTransfer;
	private import Flows::MessageAction;
	private import OccurrenceFunctions::destroy;
	
	abstract action def Action :> Performance {
		doc
		/*
		 * Action is the most general class of Performances of ActionDefinitions in a system or 
		 * part of a system. Action is the base class of all ActionDefinitions.
		 */
	
		ref action self: Action :>> Performance::self;
		ref action incomingTransfers :>> Performance::incomingTransfers;
		
		action start: Action :>> startShot {
			doc
			/*
			 * The starting snapshot of an Action. 
			 */
		}
		
		action done: Action :>> endShot {
			doc
			/*
			 * The ending snapshot of an Action.
			 */
		}

		action subactions: Action[0..*] :> actions, subperformances {
			doc
			/*
			 * The subperformances of this Action that are Actions. 
			 */
		
			ref occurrence :>> this = (that as Action).this {
				doc
				/*
				 * The "this" reference of a subaction is always the same as that of
				 * its owning Action.
				 */
			}
		}
	
		action sendSubactions: SendAction[0..*] :> subactions, sendActions {
			doc
			/*
			 * The subactions of this Action that are SendActions. 
			 */
		}
	
		action acceptSubactions: AcceptAction[0..*] :> subactions, acceptActions {
			doc
			/*
			 * The subactions of this Action that are AcceptActions. 
			 */
		}
		
		abstract action terminateSubactions : TerminateAction[0..*] :> subactions, terminateActions {
			doc
			/*
			 * The subactions of this Action that are TerminateActions.
			 */
		}
		
		abstract action controls : ControlAction[0..*] :> subactions {
			doc
			/*
			 * The subactions of this Action that are ControlActions.
			 */
		}
		
		abstract action merges : MergeAction[0..*] :> controls {
			doc
			/*
			 * The controls of this Action that are MergeActions.
			 */
		}
		
		abstract action decisions : DecisionAction :> controls {
			doc
			/*
			 * The controls of this Action that are DecisionActions.
			 */
		}
		
		abstract action joins : JoinAction :> controls {
			doc
			/*
			 * The controls of this Action that are JoinActions.
			 */
		}
		
		abstract action forks : ForkAction :> controls {
			doc
			/*
			 * The controls of this Action that are ForkActions.
			 */
		}
		
		abstract action transitions : TransitionAction[0..*] :> subactions, transitionActions {
			doc
			/*
			 * The subactions of this Action that are TransitionActions. 
			 */
		}
		
		abstract action decisionTransitions : DecisionTransitionAction[0..*] :> transitions {
			doc
			/*
			 * The subactions of this Action that are DecisionTransitionActions. 
			 */
		}
		
		abstract action assignments : AssignmentAction[0..*] :> subactions, assignmentActions {
			doc
			/*
			 * The subactions of this Action that are AssignmentActions.
			 */
		}
		
		abstract action ifSubactions : IfThenAction[0..*] :> subactions, ifThenActions {
			doc
			/*
			 * The subactions of this Action that are IfThenActions (including IfThenElseActions).
			 */
		}
		
		abstract action loops : LoopAction[0..*] :> subactions, loopActions {
			doc
			/*
			 * The subactions of this Action that are LoopActions.
			 */
		}
		
		abstract action whileLoops : WhileLoopAction[0..*] :> loops, whileLoopActions {
			doc
			/*
			 * The loops of this Action that are WhileLoopActions.
			 */
		}
		
		abstract action forLoops : ForLoopAction[0..*] :> loops, forLoopActions {
			doc
			/*
			 * The loops of this Action that are ForLoopActions.
			 */
		}
	}
	
	abstract action actions: Action[0..*] nonunique :> performances {
		doc
		/*
		 * actions is the base feature for all ActionUsages.
		 */
	}
	
	action def SendAction :> Action, SendPerformance {
		doc
		/*
		 * A SendAction is an Action used to type SendActionUsages. It initiates an outgoingTransferFromSelf 
		 * from a designated sender Occurrence with a given payload, optionally to a designated receiver.
		 */
	
		in :>> payload [0..*];
	    ref sentMessage :>> sentTransfer: MessageTransfer, MessageAction;
	}
	
	abstract action sendActions: SendAction[0..*] nonunique :> actions, sendPerformances {
		doc
		/*
		 * sendActions is the base feature for all SendActionUsages.
		 */
	}
	
	action def AcceptMessageAction :> Action, AcceptPerformance {
		doc
		/*
		 * An AcceptMessageAction is an Action that identifies an incomingTransferToSelf
		 * of a designated receiver Occurrence, providing its payload as output.
		 */
		inout :>> payload;
		ref acceptedMessage :>> acceptedTransfer: MessageTransfer, MessageAction;
	}
	
	action def AcceptAction :> AcceptMessageAction {
		doc
		/*
		 * An AcceptAction is an AcceptMessageAction used to type AcceptActionUsages that are
		 * not accepters for TransitionActions. It waits for a payload or message of the specified 
		 * kind to be accepted by a nested state transition.
		 */
		ref :>> acceptedMessage = aState.aTransition.accepter.acceptedMessage;
		state aState  {
			transition aTransition first start accept apayload: Anything via receiver then done;
		}
		bind payload = aState.aTransition.apayload;
	}
	
	abstract action acceptActions: AcceptAction[0..*] nonunique :> actions, acceptPerformances {
		doc
		/*
		 * acceptActions is the base feature for standalone AcceptActionUsages.
		 */
	}
	
	abstract action def TerminateAction :> Action {
		doc
		/*
		 * A TerminateAction is an Action that terminates a given Occurrence, meaning 
		 * that the Occurrence ends during the performance of this Action. TerminateAction
		 * is the base type for all TerminateActionUsages.
		 */
		 
		in occurrence terminatedOccurrence[1] {
			doc
			/*
			 * The Occurrence to be terminated.
			 */
		}
		
		action terminateOccurrence : destroy[1] {
			in occ = terminatedOccurrence;
		}
	}
	
	abstract action terminateActions : TerminateAction[0..*] nonunique :> actions {
		doc
		/*
		 * terminateActions is the base feature for all TerminateActionUsages.
		 */
		 
		in occurrence terminatedOccurrence default that as Occurrence {
			doc
			/*
			 * The default terminatedOccurrence for a terminateAction is its
			 * featuring occurrence (which will generally be a containing Action).
			 */
		}
	}
	
	abstract action def ControlAction :> Action {
		doc
		/*
		 * A ControlAction is the Action of a control node, which has no inherent behavior.
		 */
	
		bind start = done {
			doc
			/*
			 * A ControlAction is instantaneous.
			 */
		}
	}
	
	action def MergeAction :> ControlAction, MergePerformance {
		doc
		/*
		 * A MergeAction is the ControlAction for a merge node.
		 * 
		 * Note: Incoming succession connectors to a MergeAction must have source multiplicity 
		 * 0..1 and subset the incomingHBLink feature inherited from MergePerformance.
		 */
	}
	
	action def DecisionAction :> ControlAction, DecisionPerformance {
		doc
		/*
		 * A DecisionAction is the ControlAction for a decision node.
		 * 
		 * Note: Outgoing succession connectors from a DecisionAction must have target multiplicity
		 * 0..1 and subset the outgoingHBLink feature inherited from DecisionPerformance.
		 * If an outgoing succession has a guard, it should have a transitionStep typed by 
		 * DecisionTransition.
		 */
	}
	
	action def JoinAction :> ControlAction {
		doc
		/*
		 * A JoinAction is the ControlAction for a JoinNode.
		 * 
		 * Note: Join behavior results from requiring that the source multiplicity of all
		 * incoming succession connectors be 1..1.
		 */
	}
	
	action def ForkAction :> ControlAction {
		doc
		/*
		 * A ForkAction is the ControlAction for a ForkNode.
		 * 
		 * Note: Fork behavior results from requiring that the target multiplicity of all
		 * outgoing succession connectors be 1..1.
		 */
	}
	
	abstract action def TransitionAction :> Action, TransitionPerformance {
		doc
		/*
		 * A TransitionAction is a TransitionPerformance with an Action as transitionLinkSource.
		 * It is the base type of all TransitionUsages.
		 */
	
		in transitionLinkSource : Action :>> TransitionPerformance::transitionLinkSource;
		ref acceptedMessage : MessageTransfer, MessageAction :>> trigger;
		
		ref receiver :>> triggerTarget;

		action accepter : AcceptMessageAction :>> 'accept';
		
		bind receiver = accepter.receiver;
		bind acceptedMessage = accepter.acceptedMessage;
		
		action effect: Action :>> TransitionPerformance::effect;		
	}
	
	action def DecisionTransitionAction :> TransitionAction, NonStateTransitionPerformance {
		doc
		/*
		 * A DecisionTransitionAction is a TransitionAction and NonStateTransitionPerformance that has a 
		 * guard, but no trigger or effects. It is the base type of TransitionUsages used as 
		 * conditional successions in action models.
		 */
	
		ref action :>> accepter[0..0];
		ref action :>> effect[0..0];
	}

	abstract action transitionActions: TransitionAction[0..*] nonunique :> actions {
		doc
		/*
		 * transitionActions is the base feature for all TransitionUsages.
		 */
	}
	
	action def AssignmentAction :> FeatureWritePerformance, Action {
		doc
		/*
		 * An AssignmentAction is an Action, used to type an AssignmentActionUsage. It is also a
		 * FeatureWritePerformance that updates the accessedFeature of its target Occurrence with
		 * the given replacementValues.
		 */
	
		in target : Occurrence[1];
		inout replacementValues : Anything[0..*] nonunique;
	}
	
	abstract action assignmentActions : AssignmentAction[0..*] nonunique :> actions {
		doc
		/*
		 * assignmentActions is the base feature for all AssignmentActionsUsages.
		 */
		 
        in target : Occurrence[1] default that as Occurrence {
            doc
            /*
             * The default target for assignmentActions is its featuring instance (if that is 
             * an Occurrence).
             */
        }
	}
	
	action def IfThenAction :> Action, IfThenPerformance {
		doc
		/*
		 * An IfThenAction is a Kernel IfThenPerformance that is also an Action. 
		 * It is the base type for all IfActionUsages.
		 */
	
		in ifTest[1];
		in action thenClause[0..1];
	}
	
	action def IfThenElseAction :> IfThenAction, IfThenElsePerformance {
		doc
		/*
		 * An IfThenElseAction is a Kernel IfThenElsePeformance that is also an IfThenAction. 
		 * It is the base type for all IfActionUsages that have an elseAction.
		 */
	
		in ifTest[1];
		in action thenClause[0..1];
		in action elseClause[0..1];
	}
	
	abstract action ifThenActions : IfThenAction[0..*] nonunique :> actions {
		doc
		/*
		 * ifThenActions is the base feature for all IfActionUsages.
		 */
	}
	
	abstract action ifThenElseActions : IfThenElseAction[0..*] nonunique :> actions {
		doc
		/*
		 * ifThenElseActions is the base feature for all IfActionUsages that have an elseAction.
		 */
	}
	
	abstract action def LoopAction :> Action {
		doc
		/*
		 * A LoopAction is the base type for all LoopActionUsages.
		 */
	
        in ref iterator;
		
		in action body[0..*] {
			doc
			/*
			 * The action that is performed repeatedly in the loop.
			 */
		}		
	}
	
	action def WhileLoopAction :> LoopAction, LoopPerformance {
		doc
		/*
		 * A WhileLoopAction is a Kernel LoopPerformance that is also a LoopAction.
		 * It is the base type for all WhileLoopActionUsages.
		 */
	
		in whileTest default {true} {
			doc
			/*
			 * A Boolean expression that must be true for the loop to continue.
			 * It is evaluated before the body is performed and is always evaluated at 
			 * least once.
			 */
		}
		
		in action body {
			doc
			/*
			 * The action that is performed while the whileTest is true and the
			 * untilTest is false.
			 */
		}
		
		in untilTest default {false} {
			doc
			/*
			 * A Boolean expression that must be false for the loop to continue.
			 * It is evaluated after the body is performed.
			 */
		}
	}
	
	action def ForLoopAction :> LoopAction {
		doc
		/*
		 * A ForLoopAction is a LoopAction that iterates over an ordered sequence of values.
		 * It is the base type for all ForLoopActionUsages.
		 */
	
		protected ref var[0..1] :> seq {
			doc
			/*
			 * The loop variable that is assigned successive elements of seq on each
			 * iteration of the loop.
			 */
		}
		
		in ref seq {
			doc
			/*
			 * The sequence of values over which the loop iterates.
			 */
		}
		
		in action body {
			doc
			/*
			 * The action that is performed on each iteration of the loop.
			 */
		}
		
		private attribute index : Positive {
			doc
			/*
			 * The index of the element of seq assigned to var on the current iteration
			 * of the loop.
			 */
		}
		
		private action initialization
			assign index := 1;
		then private action whileLoop
			while index <= size(seq) {
				assign var := seq#(index);
				then perform body;
				then assign index := index + 1;
			}
	}
	
	abstract action loopActions : LoopAction[0..*] nonunique :> actions {
		doc
		/*
		 * loopActions is the base feature for all LoopActionUsages.
		 */
	}
	
	abstract action whileLoopActions : WhileLoopAction[0..*] nonunique :> loopActions {
		doc
		/*
		 * whileLoopActions is the base feature for all WhileLoopActionUsages.
		 */
	}
	
	abstract action forLoopActions : ForLoopAction[0..*] nonunique :> loopActions {
		doc
		/*
		 * forLoopActions is the base feature for all ForLoopActionUsages.
		 */
	}
}