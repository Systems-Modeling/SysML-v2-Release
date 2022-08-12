package StatePerformances {
	doc
	/*
	 * This package contains a library model of the semantics of state-based behavior,
	 * including the performance of (behavioral) states and the transitions between them.
	 */

	private import ScalarValues::Boolean;
	private import ScalarValues::Natural;
	private import TransitionPerformances::TransitionPerformance;
	private import Occurrences::HappensDuring;
	private import Transfers::Transfer;
	private import Performances::Performance;
	private import ControlPerformances::DecisionPerformance;
	private import SequenceFunctions::*;
	
	behavior StatePerformance specializes DecisionPerformance {
		feature isTriggerDuring: Boolean default true;
		feature isAcceptFirst: Boolean default true;

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

		private succession entry[1] then middle[*];
		private succession do.startShot[1] then nonDoMiddle.startShot[*];
		private succession nonDoMiddle.endShot[*] then do.endShot[1];
		private succession middle[*] then exit[1];

		private inv { isEmpty(accepted) == isEmpty(acceptable) }

		abstract feature acceptable: Transfer[*];
		feature accepted: Transfer[0..1] subsets acceptable;
		
		private succession do[1] then accepted.endShot[0..1];
		private feature afNum: Natural [1] =
			if ( not isAcceptFirst | isEmpty(acceptable)) ? 0 else size(acceptable)-1;
		private succession acceptFirst[afNum] first accepted.endShot[0..1] then acceptable.endShot[*];
		
		private succession acceptable[*] then exit[1];
	}
	
	behavior StateTransitionPerformance specializes TransitionPerformance {
		feature isTriggerDuring: Boolean[1];
		inv { not transitionLinkSource.isTriggerDuring | isTriggerDuring  }

		in feature transitionLinkSource: StatePerformance redefines TransitionPerformance::transitionLinkSource {
			feature redefines accepted;
			feature redefines StatePerformance::acceptable;
		}
		private succession transitionLinkSource.nonDoMiddle[*] then Performance::self[1];
		
		feature acceptable: Transfer [*] subsets transitionLinkSource.acceptable;

		feature trigger redefines TransitionPerformance::trigger subsets acceptable, transitionLinkSource.accepted {
			feature redefines endShot;
		}
		
		private feature tdNum: Natural [1] = if not isTriggerDuring ? 0 else size(trigger);
		private connector linkTriggerDuring: HappensDuring[tdNum] from trigger.endShot[*] to transitionLinkSource[0..1];
		
		private succession all transitionLinkSource.middle[1..*] then guard[*];
		private succession guard[*] then transitionLinkSource.exit[1];
	}
}