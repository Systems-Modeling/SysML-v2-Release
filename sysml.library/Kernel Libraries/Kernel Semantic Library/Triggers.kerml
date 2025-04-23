standard library package Triggers {
	doc
	/*
	 * This package contains functions that return ChangeSignals for triggering
	 * when a Boolean condition changes from false to true, at a specific time
	 * or after a specific time delay.
	 */

	private import ScalarValues::Boolean;
	private import ScalarValues::NumericalValue;
	private import Occurrences::Occurrence;
	
	public import Clocks::*;
	public import Observation::*;
	
	struct TimeSignal :> ChangeSignal {
		doc
		/*
		 * A TimeSignal is a ChangeSignal whose condition is the currentTime
		 * of a given Clock reaching a specific signalTime.
		 */
	
		feature signalTime : NumericalValue[1] {
			doc
			/*
			 * The time at which the TimeSignal should be sent.
			 */
		}
		
		feature signalClock : Clock[1] {
			doc
			/*
			 * The Clock whose currentTime is being monitored.
			 */
		}
		
		private bool :>> signalCondition {
			doc
			/*
			 * The Boolean condition of the currentTime of the signalClock being
			 * equal to the signalTime.
			 */
		
			signalClock.currentTime == signalTime
		}
	}
	
	function TriggerWhen {
		doc
		/*
		 * TriggerWhen returns a monitored ChangeSignal for a given condition,
		 * to be sent to a given receiver when the condition occurs.
		 */
	
		in bool condition[1] {
			doc
			/*
			 * The BooleanExpression to be monitored for changing from 
			 * false to true.
		 */
		}
		
		in feature receiver : Occurrence [1] {
			doc
			/*
			 * The Occurrence to which the ChangeSignal is to be sent.
			 */
		}
		
		in feature monitor : ChangeMonitor[1] default defaultMonitor {
			doc
			/*
			 * The ChangeMonitor to be used to monitor the ChangeSignal condition.
			 * The default is the Observation::defaultMonitor.
			 */
		}
		
		return feature changeSignal : ChangeSignal[1] = new ChangeSignal(condition, monitor) {
			doc
			/*
			 * The ChangeSignal for the condition, as monitored by the monitor.
			 */
		}
		
		step :> monitor.startObservation {
			in observer = receiver;
			in signal = changeSignal;
		}		
	}
	
	function TriggerAt {
		doc
		/*
		 * TriggerAt returns a monitored TimeSignal to be sent to a receiver when
		 * the currentTime of a given Clock reaches a specific timeInstant. 
		 */
	
		in feature timeInstant : NumericalValue[1] {
			doc
			/*
			 * The time instant, relative to the clock, at which the TimeSignal should be sent. 
			 */
		}
		
		in feature receiver : Occurrence[1] {
			doc
			/*
			 * The Occurrence to which the TimeSignal is to be sent.
			 */
		}
		
		in feature clock : Clock[1] default localClock {
			doc
			/*
			 * The Clock to be used as the reference for the timeInstant. The default is
			 * the localClock, which will be bound when the function is invoked. 
			 */
		}
		
		in feature monitor : ChangeMonitor[1] default defaultMonitor {
			doc
			/*
			 * The ChangeMonitor to be used to monitor the TimeSignal condition.
			 * The default is the Observation::defaultMonitor.
			 */
		}
		
		return feature timeSignal : TimeSignal[1] = new TimeSignal(timeInstant, clock, monitor) {
			doc
			/*
			 * The TimeSignal for the given timeInstant, as monitored by the monitor.
			 */
		}
		
		step :> monitor.startObservation {
			in observer = receiver;
			in signal = timeSignal;
		}
	}
	
	function TriggerAfter {
		doc
		/*
		 * TriggerAfter returns a monitored TimeSignal to be sent to a receiver after
		 * a certain time delay relative to a given Clock.
		 */
	
		in feature delay : NumericalValue[1] {
			doc
			/*
			 * The time duration, relative to the clock, after which the TimeSignal is sent.
			 */
		}
		
		in feature receiver : Occurrence[1] {
			doc
			/*
			 * The Occurrence to which the TimeSignal is to be sent.
			 */
		}
		
		in feature clock : Clock[1] default localClock {
			doc
			/*
			 * The Clock to be used as the reference for the time delay. The default is
			 * the localClock, which will be bound when the function is invoked. 
			 */
		}
		
		in feature monitor : ChangeMonitor[1] default defaultMonitor {
			doc
			/*
			 * The ChangeMonitor to be used to monitor the TimeSignal condition.
			 * The default is the Observation::defaultMonitor.
			 */
		}
		
		return signal : TimeSignal[1] = 
			TriggerAt(clock.currentTime + delay, receiver, clock, monitor) {
			doc
			/*
			 * The TimeSignal for the currentTime of the clock when the function is invoked
			 * plus the given time delay, as monitored by the monitor.
			 */
		}
	}	
	
}