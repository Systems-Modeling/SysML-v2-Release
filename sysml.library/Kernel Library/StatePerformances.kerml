/**
 * This package contains a library model of the semantics of state-based behavior,
 * including the performance of (behavioral) states and the transitions between them.
 */
package StatePerformances {
	private import ScalarValues::Boolean;
	private import TransitionPerformances::TransitionPerformance;
	private import Occurrences::HappensDuring;
	private import Transfers::Transfer;
	private import ControlPerformances::DecisionPerformance;
	private import SequenceFunctions::*;
	
	behavior StatePerformance specializes DecisionPerformance {
		feature isTriggerDuring: Boolean;
		feature isAcceptFirst: Boolean;

		/**
		 * All modeler-defined steps must subset this.
		 */
		abstract step middle[1..*];
		
		// Note: All steps are implicitly considered to be subperformances,
		// and hence happening during the state performance.
		
		step entry[1];
		step do[1] subsets middle;
		step exit[1];
		
		private succession entry[1] then middle[*];
		private succession do.startShot[1] then middle.startShot[*];
		private succession middle.endShot[*] then do.endShot[1];
		private succession middle[*] then exit[1];

		private inv { isEmpty(accepted) == isEmpty(acceptable) }

		abstract feature acceptable: Transfer[*];
		feature accepted: Transfer[0..1] subsets acceptable;
		
		private succession do[1] then accepted.endShot[0..1];
		private succession acceptFirst first accepted.endShot[0..1] then acceptable.endShot[*] {
			inv { !isAcceptFirst | size(acceptFirst) == size(acceptable) }
		}
		private succession acceptable::endShot[*] then exit[1];
		private connector triggerDuring: HappensDuring from acceptable.endShot[*] to self[1] {
			inv { !isTriggerDuring | !isEmpty(triggerDuring) }
		}
	}
	
	behavior StateTransitionPerformance specializes TransitionPerformance {
		feature isTriggerDuring: Boolean;
		
		in feature transitionLinkSource: StatePerformance redefines TransitionPerformance::transitionLinkSource {
			feature redefines accepted[1];
		}
		
		feature trigger redefines TransitionPerformance::trigger {
			feature redefines endShot;
		}
		
		private binding transitionLinkSource.accepted[0..1] = trigger[1];
		private connector linkAcceptFirst: HappensDuring from transitionLinkSource[0..1] to trigger.endShot[*] {
			inv { !transitionLinkSource.isAcceptFirst | size(linkAcceptFirst) == size(trigger) }
		}
		
		private succession all transitionLinkSource.middle[1..*] then guard[*];
		private succession guard[*] then transitionLinkSource.exit[1];		
	}
}