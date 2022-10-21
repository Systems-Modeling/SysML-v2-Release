standard library package TransitionPerformances {
	doc
	/*
	 * This package contains a library model of the semantics of conditional transitions between occurrences, 
	 * including the performance of specified Behaviors when the transition occurs.
	 */

	private import ScalarValues::Boolean;
	private import ScalarValues::Natural;
	private import SequenceFunctions::isEmpty;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensBefore;
	private import Performances::Performance;
	private import Performances::Evaluation;
	private import Transfers::MessageTransfer;
	private import Transfers::AcceptPerformance;
	private import Transfers::acceptPerformances;
	private import ControlFunctions::allTrue;
	private import SequenceFunctions::size;
	
	abstract behavior TransitionPerformance {
		in feature transitionLinkSource: Performance[1];
		
		feature trigger: MessageTransfer[*];
		bool guard[*] subsets enclosedPerformances;
		step effect[*] subsets enclosedPerformances;

		feature triggerTarget : Occurrence [1] default this;
		feature transitionLink: HappensBefore[0..1];
		
		private binding transitionLink.earlierOccurrence[0..1] = transitionLinkSource[1];
		private succession transitionLinkSource[1] then effect[*]; 
		private succession effect[*] then transitionLink.laterOccurrence[1];
		
		private connector transitionLink[0..1] to trigger[1..*];
		private connector all guardConstraint: TPCGuardConstraint[*] 
			from transitionLink[0..1] to guard[*];
			
		private succession all trigger[*] then guard[*];
		private succession all guard[*] then effect[*];

		feature accNum: Natural [1] = if isEmpty(trigger) ? 0 else 1;
		step accept: AcceptPerformance[accNum] subsets timeEnclosedOccurrences, acceptPerformances {
			feature redefines receiver = triggerTarget;
			feature redefines acceptedTransfer = trigger;
		}

		private succession guard[*] then accept[accNum];
	}
	
	behavior NonStateTransitionPerformance specializes TransitionPerformance {
		feature isTriggerAfter: Boolean default true;
		private succession transitionLinkSource[1] then Performance::self[1];
		private feature taNum: Natural [1] = if isTriggerAfter ? size(trigger) else 0;
		private succession triggerAfter [taNum] first transitionLinkSource[0..1] then trigger.endShot[*];
				
		private succession all guard[*] then transitionLink.laterOccurrence[0..1];
	}
	
	assoc struct TPCGuardConstraint {
		end feature constrainedHBLink: HappensBefore[0..1];
		end bool constrainedGuard;
		
		private inv { allTrue(constrainedGuard()) }
	}	
}