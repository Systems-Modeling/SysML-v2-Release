/**
 * This package contains a library model of the semantics of conditional transitions between occurrences, 
 * including the performance of specified Behaviors when the transition occurs.
 */
package TransitionPerformances {
	private import ScalarValues::Boolean;
	private import Occurrences::HappensBefore;
	private import Performances::Performance;
	private import Performances::Evaluation;
	private import Transfers::Transfer;
	private import ControlFunctions::allTrue;
	
	abstract behavior TransitionPerformance(in step transitionLinkSource: Performance[1]) {
		feature trigger: Transfer[*];
		expr guard[*];
		step effect[*];

		feature transitionLink: HappensBefore[0..1];
		
		private binding transitionLink.earlierOccurrence[0..1] = transitionLinkSource[1];
		private succession transitionLinkSource[1] then effect[*]; 
		private succession effect[*] then transitionLink.laterOccurrence[1];
		
		private connector transitionLink[0..1] to trigger[1..*];
		private connector all guardConstraint: TPCGuardConstraint[*] 
			from transitionLink[0..1] to guard[*];
			
		private succession all trigger[*] then guard[*];
		private succession all guard[*] then effect[*];
	}
	
	behavior NonStateTransitionPerformance specializes TransitionPerformance {
		private succession transitionLinkSource[1] then trigger[*];
		private succession transitionLinkSource[1] then guard[*];
		
		private succession all guard[*] then transitionLink.laterOccurrence[0..1];
	}
	
	assoc struct TPCGuardConstraint {
		end feature constrainedHBLink: HappensBefore[0..1];
		end expr constrainedGuard: Evaluation[*] () result: Boolean;
		
		private inv { allTrue(constrainedGuard()) }
	}	
}