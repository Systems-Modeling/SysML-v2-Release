
/*
 * This package models a framework for monitoring Boolean conditions and notifying
 * registered observers when they change from false to true.
 */
package Observation {
	private import ScalarValues::Boolean;
	private import Occurrences::Occurrence;
	private import SequenceFunctions::including;
	private import SequenceFunctions::excluding;
	private import ControlFunctions::select;
	private import ControlPerformances::DecisionPerformance;
	private import ControlPerformances::IfThenPerformance;
	private import FeatureReferencingPerformances::FeatureWritePerformance;
	private import FeatureReferencingPerformances::BooleanEvaluationResultToMonitorPerformance;
	private import Transfers::TransferBefore;

	/**
	 * defaultMonitor is a single ChangeMonitor that can be used as a default.
	 */
	readonly feature defaultMonitor[1] : ChangeMonitor;

	/**
	 * A ChangeSignal is a signal to be sent when the Boolean result of its
	 * changeCondition Expression changes from false to true.
	 */
	struct ChangeSignal {
		/**
		 * A BooleanExpression whose result is being monitored.
		 */
		bool signalCondition;
		
		/**
		 * The ChangeMonitor responsible for monitoring the signalCondition.
		 */
		feature signalMonitor : ChangeMonitor;
	}
	
	/**
	 * Each Performance of ObserveChange waits for the result of the Boolean 
	 * condition of a given ChangeSignal to change from false to true, and, when 
	 * it does, sends the ChangeSignal to a given observer Occurrence.
	 */
	private behavior ObserveChange {
		in feature changeObserver : Occurrence[1];
		in feature changeSignal : ChangeSignal[1];
		
		/**
		 * If the result of the changeSignal.signalCondition is false, then wait for 
		 * it to become true.
		 */
		composite step wait : IfThenPerformance {
			in bool redefines ifTest {
				not changeSignal.signalCondition()
			}
			in step redefines thenClause : BooleanEvaluationResultToMonitorPerformance {
				in bool onOccurrence = changeSignal.signalCondition;
			}
		}		
		
		succession wait then transfer;
		
		/**
		 * Then send changeSignal to changeObserver.
		 */
	    step transfer : TransferBefore[1] 
	    	redefines outgoingTransfersFromSelf 
	    	subsets changeObserver.incomingTransfers {
	    	feature redefines source {
	    		feature redefines sourceOutput = changeSignal;
	    	}
	    }
	}
	
	/**
	 * A ChangeMonitor is a collection of ongoing ChangeSignal observations 
	 * for various observer Occurrences. It provides convenient operations for 
	 * starting and canceling the observations it manages.
	 */
	struct ChangeMonitor {
		private thisMonitor : ChangeMonitor redefines self;
		private composite feature observations[0..*] : ObserveChange;
		
		/**
		 * Assign a replacement set of observations as those being managed by a
		 * given ChangeMonitor.
		 */
		private behavior AssignObservations specializes FeatureWritePerformance {
			in feature monitor : ChangeMonitor redefines onOccurrence {
				feature redefines startingAt {
					feature redefines accessedFeature, observations;
				}
			}
			inout feature redefines replacementValues[0..*] : ObserveChange;
		}
		
		/**
		 * Start an observation of a given ChangeSignal for a given Occurrence.
		 */
		step startObservation(in observer : Occurrence[1], in signal : ChangeSignal[1]) {
			private composite step observation : ObserveChange {
				in changeObserver = observer;
				in changeSignal = signal;
			}
			private composite step addObservation : AssignObservations[1] {
				in monitor = thisMonitor; 
				inout replacementValues = observations->including(observation);	
			}
		}
		
		/**
		 * Cancel all observations of a given ChangeSignal for a given Occurrence. 
		 */
		step cancelObservation(in observer : Occurrence[1], in signal : ChangeSignal[1]) {
			private feature observations[0..*] : ObserveChange = 
				observations->select{in observation : ObserveChange; 
					observation.changeObserver == observer and observation.changeSignal == signal
				};
			private composite step removeObservation : AssignObservations[1] {
				in monitor = thisMonitor; 
				inout replacementValues = observations->excluding(observations);
			}
		}
	}	
}