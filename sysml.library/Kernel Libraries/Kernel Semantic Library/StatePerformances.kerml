standard library package StatePerformances {
	doc
	/*
	 * This package contains a library model of the semantics of state-based behavior,
	 * including the performance of (behavioral) states and the transitions between them.
	 */

	private import ScalarValues::Boolean;
	private import ScalarValues::Natural;
	private import TransitionPerformances::TransitionPerformance;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensDuring;
	private import Transfers::Transfer;
	private import Transfers::MessageTransfer;
	private import Performances::Performance;
	private import ControlPerformances::DecisionPerformance;
	private import ControlFunctions::forAll;
	private import ControlFunctions::select;
	private import ControlFunctions::collect;
	private import SequenceFunctions::*;
	
	behavior StatePerformance specializes DecisionPerformance {
		feature isTriggerDuring: Boolean default true;

		abstract step middle[1..*] {
			doc
			/*
			 * All modeler-defined steps must subset this.
			 */
		}
		
		/* 
		 * Note: All steps are implicitly considered to be enclosedPerformances,
		 * and hence happening during the state performance.
		 */
		
		step entry[1];
		step do[1] subsets middle;
		step exit[1];
		
		step nonDoMiddle[*] subsets middle = middle->excluding(do);

		private succession [1] entry then [*] middle;
		private succession [1] do.startShot then [*] nonDoMiddle.startShot;
		private succession [*] middle then [1] exit;


		feature incomingTransitionTrigger : MessageTransfer [0..1] default null {
			doc
			/*
			 * Transfer that triggered a transition into this state performance. 
			 */
		}

		private inv { isEmpty(accepted) == isEmpty(acceptable) }
		feature accepted: Transfer[0..1] subsets acceptable {
			doc
			/* A transfer to the trigger target of an outgoing transition performance
			 * for an outgoing successon that is taken for this state occurrence.
			 */
		}
		feature deferrable: Transfer[0..*] subsets acceptable {
			doc
			/* Transfers to trigger targets of outgoing transition performances can be
			 * considered for acceptance more than once.
			 */
		}
		abstract feature acceptable: Transfer[*] {
			doc
			/*
			 * Transfers that might be accepted. 
			 */
			feature thatSP : StatePerformance [1] = that as StatePerformance;
			feature accableT : Transfer redefines self;
			feature accT : Transfer = thatSP.accepted;
			inv { accableT == accT | incomingTransferSort(accT, accableT) }  
			inv { isDispatch implies
				     allSubstatePerformances(dispatchScope)->forAll{in oSP : StatePerformance;						
						  oSP == thatSP | isEmpty(oSP.accepted) |
	   					  includes(thatSP.exit.startShot.successors, oSP.exit.startShot) |
						  ( oSP.accepted != accableT & 
							( incomingTransferSort(oSP.accepted, accableT) |
							  includes(oSP.deferrable, accableT) ) ) } }
		}
		
		function allSubstatePerformances {
			in p : Performance [1];
			feature substatePerformances: StatePerformance [*] =
				p.subperformances->select{in subp:Performance; subp istype StatePerformance};
			return  : StatePerformance [*] =
				union(substatePerformances,  
					  substatePerformances->collect{in sp:StatePerformance; allSubstatePerformances(sp) } );
		}
		
		private succession [*] acceptable then [1] exit;
		
		feature redefines isRunToCompletion default this.isRunToCompletion;
		feature redefines runToCompletionScope default this.runToCompletionScope; 
		inv { isRunToCompletion implies
			     allSubtransitionPerformances(runToCompletionScope)->forAll{in tp : TransitionPerformance;
				    includes(tp.successors, entry) | includes(tp.predecessors, entry) }
		}
		
		function allSubtransitionPerformances {
			in p : Performance [1];
			feature subtransitionPerformances: TransitionPerformance [*] =
	 			 p.subperformances->select{in subp:Performance;
		 			   subp istype StateTransitionPerformance };
			return  : TransitionPerformance [*] =
				union(subtransitionPerformances,  
		      		subtransitionPerformances->collect{in sp:TransitionPerformance; 
							 		allSubtransitionPerformances(sp) } ); 
 		}
	}
	
	behavior StateTransitionPerformance specializes TransitionPerformance {
		feature isTriggerDuring: Boolean[1];
		inv { not transitionLinkSource.isTriggerDuring | isTriggerDuring  }

		in feature transitionLinkSource: StatePerformance redefines TransitionPerformance::transitionLinkSource {
			feature redefines accepted;
			feature redefines StatePerformance::acceptable;
		}
		private succession [*] transitionLinkSource.nonDoMiddle then [1] Performance::self;

		private feature transitionLinkTarget [0..1] : Occurrence = transitionLink.laterOccurrence {
			inv { (that istype StatePerformance) implies
			      (that as StatePerformance).incomingTransitionTrigger == trigger }
		}
		
		feature acceptable: Transfer [*] subsets transitionLinkSource.acceptable, triggerTarget.incomingTransfersToSelf;

		feature trigger redefines TransitionPerformance::trigger subsets acceptable, transitionLinkSource.accepted {
			feature redefines endShot;
		}
		
		private feature tdNum: Natural [1] = if not isTriggerDuring ? 0 else size(trigger);
		private connector linkTriggerDuring: HappensDuring[tdNum] from [*] trigger.endShot to [0..1] transitionLinkSource;
		
		private succession all [*] acceptable then [*] guard;
		private succession [*] guard then [1] transitionLinkSource.exit;

		private succession [accNum] accept then [1] transitionLinkSource.exit;
	}
}