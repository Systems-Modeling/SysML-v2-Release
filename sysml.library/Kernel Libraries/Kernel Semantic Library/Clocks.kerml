standard library package Clocks {
	doc
	/*
	 * This package models Clocks that provide an advancing numerical reference 
	 * usable for quantifying the time of an Occurrence.
	 */

	private import ScalarValues::NumericalValue;
	private import ScalarValues::Real;
	private import Occurrences::Occurrence;
	private import Occurrences::Life;
	private import ControlFunctions::forAll;
	
	private struct UniversalClockLife[1] :> Clock, Life {
	    doc
	    /*
	     * UniversalClockLife is the classifier of the singleton Life of the universalClock.
	     */
	}
	
	feature universalClock : UniversalClockLife[1] {
		doc
		/*
		 * universalClock is a single Clock that can be used as a default universal
		 * time reference.
		 */
	}
	
	abstract struct Clock {
		doc
		/*
		 * A Clock provides a numerical currentTime that advances montonically
		 * over its lifetime. Clock is an abstract base Structure that can be
		 * specialized for different kinds of time quantification (e.g., discrete
		 * time, continuous time, time with units, etc.).
		 */
		 
		private thisClock : Clock :>> self;
		
		var feature currentTime : NumericalValue[1] {
			doc
			/*
			 * A scalar time reference that advances over the lifetime of the Clock. 
			 */
		}
						
		inv timeFlowConstraint {
			doc
			/*
			 * The currentTime of a snapshot of a Clock is equal to
			 * the TimeOf the snapshot relative to that Clock.
			 */
			
			snapshots->forAll{in s : Clock; 
				TimeOf(s, thisClock) == s.currentTime
			}
		}		
	}
	
	abstract function TimeOf {
		doc
		/*
		 * TimeOf returns a numerical timeInstant for a given Occurrence relative to
		 * a given Clock. The timeInstant is the time of the start of the Occurrence,
		 * which is considered to be synchronized with the snapshot of the Clock 
		 * with a currentTime equal to the returned timeInstant.
		 */
		
		in o : Occurrence[1];
		in clock : Clock[1] default localClock;
		return timeInstant : NumericalValue[1];
		
		 inv startTimeConstraint {
		 	doc
			/*
			 * The TimeOf an Occurrence is equal to the time of its start snapshot.
			 */
			 
		 	timeInstant == TimeOf(o.startShot, clock)
		 }	 

		inv timeOrderingConstraint {
			doc
			/*
			 * If one Occurrence happens before another, then the TimeOf the end
			 * snapshot of the first Occurrence is no greater than the TimeOf the 
			 * second Occurrence.
			 */
			
			o.predecessors->forAll{in p : Occurrence; 
				TimeOf(p.endShot, clock) <= timeInstant
			}
		}
				
		inv timeContinuityConstraint {
			doc
			/*
			 * If one Occurrence happens immediately before another, then the TimeOf 
			 * the end snapshot of the first Occurrence equals the TimeOf the second
			 * Occurrence.
			 */
		 
			o.immediatePredecessors->forAll{in p : Occurrence; 
				TimeOf(p.endShot, clock) == timeInstant
			}
		}				
	}
	
	function DurationOf {
		doc
		/*
		 * DurationOf returns the duration of a given Occurrence relative to a
		 * given Clock, which is equal to the TimeOf the end snapshot of the
		 * Occurrence minus the TimeOf its start snapshot.
		 */
		
		in o : Occurrence[1]; 
		in clock : Clock[1] default localClock;
		return duration : NumericalValue =
			TimeOf(o.endShot, clock) - TimeOf(o.startShot, clock);
	}
	
	struct BasicClock :> Clock {
		doc
		/*
		 * A BasicClock is a Clock whose currentTime is a Real number.
		 */
		
		var feature :>> currentTime : Real;
	}
	
	function BasicTimeOf :> TimeOf {
		doc
		/*
		 * BasicTimeOf returns the TimeOf an Occurrence as a Real number relative
		 * to a BasicClock.
		 */

		in o : Occurrence[1];
		in clock : BasicClock[1];
		return : Real[1];
	}
	
	function BasicDurationOf :> DurationOf {
		doc
		/*
		 * BasicDurationOf returns the DurationOf an Occurrence as a Real number relative
		 * to a BasicClock.
		 */
		
		in o : Occurrence[1];
		in clock : BasicClock[1];
		return : Real[1];
	}

}