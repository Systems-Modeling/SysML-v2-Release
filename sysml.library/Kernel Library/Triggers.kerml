/**
 * This package contains functions that return ChangeSignals for triggering
 * when a Boolean condition changes from false to true, at a specific time
 * or after a specific time delay.
 */
package Triggers {
	private import ScalarValues::Boolean;
	private import ScalarValues::NumericalValue;
	private import Occurrences::Occurrence;
	
	import Clocks::*;
	import Observation::*;
	
	/**
	 * A TimeSignal is a ChangeSignal whose condition is the currentTime
	 * of a given Clock reaching a specific signalTime.
	 */
	struct TimeSignal :> ChangeSignal {
		/**
		 * The time at which the TimeSignal should be sent.
		 */
		feature signalTime : NumericalValue[1];
		
		/**
		 * The Clock whose currentTime is being monitored.
		 */
		feature signalClock : Clock[1];
		
		/**
		 * The Boolean condition of the currentTime of the signalClock being
		 * equal to the signalTime.
		 */
		private bool :>> signalCondition {
			signalClock.currentTime == signalTime
		}
	}
	
	/**
	 * TriggerWhen returns a monitored ChangeSignal for a given condition,
	 * to be sent to a given receiver when the condition occurs.
	 */
	function TriggerWhen {
		/**
		 * The BooleanExpression to be monitored for changing from 
		 * false to true.
		 */
		in bool condition[1];
		
		/**
		 * The Occurrence to which the ChangeSignal is to be sent.
		 */
		in feature receiver : Occurrence [1];
		
		/**
		 * The ChangeMonitor to be used to monitor the ChangeSignal condition.
		 * The default is the Observation::defaultMonitor.
		 */
		in feature monitor : ChangeMonitor[1] default defaultMonitor;
		
		/**
		 * The ChangeSignal for the condition, as monitored by the monitor.
		 */
		return feature signal : ChangeSignal[1] = ChangeSignal(condition, monitor);
		
		step :> monitor.startObservation(receiver, signal);			
	}
	
	/**
	 * TriggerAt returns a monitored TimeSignal to be sent to a receiver when
	 * the currentTime of a given Clock reaches a specific timeInstant. 
	 */
	function TriggerAt {
		/**
		 * The time instant, relative to the clock, at which the TimeSignal should be sent. 
		 */
		in feature timeInstant : NumericalValue[1];
		
		/**
		 * The Occurrence to which the TimeSignal is to be sent.
		 */
		in feature receiver : Occurrence[1];
		
		/**
		 * The Clock to be used as the reference for the timeInstant. The default is
		 * the Clocks::defaultClock. 
		 */
		in feature clock : Clock[1] default defaultClock;
		
		/**
		 * The ChangeMonitor to be used to monitor the TimeSignal condition.
		 * The default is the Observation::defaultMonitor.
		 */		
		in feature monitor : ChangeMonitor[1] default defaultMonitor;
		
		/**
		 * The TimeSignal for the given timeInstant, as monitored by the monitor.
		 */
		return feature signal : TimeSignal[1] = TimeSignal(timeInstant, clock, monitor);
		
		step :> monitor.startObservation(receiver, signal);
	}
	
	/**
	 * TriggerAfter returns a monitored TimeSignal to be sent to a receiver after
	 * a certain time delay relative to a given Clock.
	 */
	function TriggerAfter {
		/**
		 * The time duration, relative to the clock, after which the TimeSignal is sent.
		 */
		in feature delay : NumericalValue[1];
		
		/**
		 * The Occurrence to which the TimeSignal is to be sent.
		 */
		in feature receiver : Occurrence[1];
		
		/**
		 * The Clock to be used as the reference for the time delay. The default is
		 * the Clocks::defaultClock.
		 */
		in feature clock : Clock[1] default defaultClock;
		
		/**
		 * The ChangeMonitor to be used to monitor the TimeSignal condition.
		 * The default is the Observation::defaultMonitor.
		 */
		in feature monitor : ChangeMonitor[1] default defaultMonitor;
		
		/**
		 * The TimeSignal for the currentTime of the clock when the function is invoked
		 * plus the given time delay, as monitored by the monitor.
		 */
		return signal : TimeSignal[1] = 
			TriggerAt(clock.currentTime + delay, receiver, clock, monitor);
	}	
	
}