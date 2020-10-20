package StatePerformances {
	private import ScalarValues::Boolean;
	private import TransitionPerformances::*;
	private import BaseFunctions::*;
	private import Occurrences::*;
	private import Transfers::*;
	
	behavior StatePerformance specializes ControlPerformances::DecisionPerformance {
		feature isTriggerDuring: Boolean;
		feature isAcceptFirst: Boolean;

		/**
		 * All modeler-defined steps must subset this.
		 */
		abstract step middle[1..*] {
			feature startShot redefines Occurrence::startShot;
			feature endShot redefines Occurrence::endShot;
		}
		
		// Note: All steps are implicitly considered to be subperformances,
		// and hence happening during the state performance.
		
		step entry[1];
		step do[1] subsets middle;
		step exit[1];
		
		succession entry[1] then middle[*];
		succession do::startShot[1] then middle::startShot[*];
		succession middle::endShot[*] then do::endShot[1];
		succession middle[*] then exit[1];

		inv { isEmpty(accepted) == isEmpty(acceptable) }

		abstract feature acceptable: Transfer[*] {
			feature startShot redefines Occurrence::startShot;
			feature endShot redefines Occurrence::endShot;			
		}
		feature accepted: Transfer[0..1] subsets acceptable;
		
		succession do[1] then accepted::endShot[0..1];
		succession accepted::endShot[0..1] then acceptable::endShot[*] {
			inv { !isAcceptFirst | size(self) == size(acceptable) }
		}
		succession acceptable::endShot[*] then exit[1];
		connector :HappensDuring from acceptable::endShot[*] to self[1] {
			inv { !isTriggerDuring | !isEmpty(self) }
		}
	}
	
	behavior StateTransitionPerformance specializes TransitionPerformance {
		feature isTriggerDuring: Boolean;
		
		feature transitionLinkSource: StatePerformance 
			redefines TransitionPerformance::transitionLinkSource {
			feature accepted[1] redefines StatePerformance::accepted;
			feature middle redefines StatePerformance::middle;
			feature exit redefines StatePerformance::exit;
		}
		
		feature trigger redefines TransitionPerformance::trigger {
			feature endShot redefines Occurrence::endShot;
		}
		
		binding transitionLinkSource::accepted[0..1] = trigger[1];
		connector :HappensDuring from transitionLinkSource[0..1] to trigger::endShot[*] {
			inv { !transitionLinkSource::isAcceptFirst | size(self) == size(trigger) }
		}
		
		succession all transitionLinkSource::middle[1..*] then guard[*];
		succession guard[*] then transitionLinkSource::exit[1];		
	}
}