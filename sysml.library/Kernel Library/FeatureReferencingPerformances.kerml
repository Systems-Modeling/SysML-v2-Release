/**
 * This package defines Behaviors used to read, write and monitor values of a referenced Feature of an 
 * Occurrence.
 */
package FeatureReferencingPerformances {
	private import Base::Anything;
	private import Base::things;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensWhile;
	private import Occurrences::HappensBefore;
	private import Occurrences::HappensJustBefore;
	private import Occurrences::SelfSameLifeLink;
	private import Performances::Performance;
	private import Performances::Evaluation;
	private import ScalarValues::Boolean;
	private import SequenceFunctions::isEmpty;
	private import SequenceFunctions::equals;

	/**
	 * A FeatureReferencingPerformance is the base Performance for specialized behaviors related 
	 * to values of a referenced Feature of a given Occurrence, as identified in specializations 
	 * of this Behavior.
	 */
	abstract behavior FeatureReferencingPerformance specializes Performance {
		
		/**
		 * Occurrence with values for the referenced feature in specializations of this behavior.
		 */
		in abstract feature onOccurrence : Occurrence [1];
		 
		/**
		 * Values of the referenced feature, as specified in specializations of this behavior.
		 */
		inout feature values : Anything [*] nonunique;		
	}

	/**
	 * A FeatureAccessPerformance is a FeatureReferencingPerformance where the result values
	 * are all the values of a feature of onOccurrence at the time the Performance ends. The
	 * feature is specified by restricting accessedFeature in specializations or usages.
	 */
    abstract behavior FeatureAccessPerformance specializes FeatureReferencingPerformance {
     	
		in abstract feature onOccurrence : Occurrence {
			abstract feature startingAt : Occurrence [1] subsets timeSlices {
				abstract feature accessedFeature : Anything [*] nonunique;
			}
		}

		/**
		 * Requires some time slice of onOccurrence to start when this performance
		 * ends (this connector), with particular feature values (following connector).
		 * The feature is specified by restricting the onOccurrence::accessedFeature 
		 * on usages of this behavior.
		 */
	  	 connector :HappensWhile from onOccurrence.startingAt.startShot to endShot;
	  	 connector :SelfSameLifeLink from onOccurrence.startingAt.accessedFeature to values;
	}

	/**
	 * A FeatureReadEvaluation is a FeatureAccessPerformance that is a function providing as
	 * its result the values of a feature on an occurrence at the time its evaluation ends.
	 */
	abstract function FeatureReadEvaluation specializes FeatureAccessPerformance, Evaluation 
		(onOccurrence: Occurrence [1]) 
		resultValues : Anything [*] nonunique redefines result redefines values;

	/**
	 * A FeatureWritePerformance is a FeatureAccessPerformance that assigns the values of a 
	 * feature on an occurrence to the given replacementValues at time its performance ends.
	 */
	abstract behavior FeatureWritePerformance specializes FeatureAccessPerformance {
		in feature onOccurrence : Occurrence[1] redefines onOccurrence;
		inout feature replacementValues : Anything redefines values [*] nonunique;
	}
	
	/**
	 * A FeatureMonitorPerformance is a FeatureReferencingPerformance that waits for values
	 * of monitoredFeature to change on onOccurrence from what they were when the performance 
	 * started. The values before and after the change are given by beforeValues and afterValues.
	 */	
	abstract behavior FeatureMonitorPerformance specializes FeatureReferencingPerformance {
		in feature redefines onOccurrence {
	    	feature monitoredOccurrence : Occurrence [1] subsets timeSlices {
	      		abstract feature monitoredFeature : Anything[*] nonunique;
	      		feature beforeTimeSlice : Occurrence [1] subsets timeSlices {
	        		feature redefines monitoredFeature;
	        	}
	      		feature afterSnapshot : Occurrence [1] subsets snapshots {
	        		feature redefines monitoredFeature;
	        	}
	      		connector :HappensJustBefore from beforeTimeSlice to afterSnapshot;
	        }
	  	}
	  	out feature afterValues redefines values;
	  	out feature beforeValues : Anything[*] nonunique;
	  	inv { not beforeValues->equals(afterValues) }
	
	  	private connector : HappensWhile 
	  		from onOccurrence.monitoredOccurrence.beforeTimeSlice.startShot[1] to startShot[1];
	  	private connector : SelfSameLifeLink 
	  		from onOccurrence.monitoredOccurrence.beforeTimeSlice.monitoredFeature[1] to beforeValues[1];
	  	private connector : SelfSameLifeLink 
	  		from onOccurrence.monitoredOccurrence.afterSnapshot.monitoredFeature[1] to afterValues[1];
	  	protected connector endWhen : HappensBefore 
	  		from onOccurrence.monitoredOccurrence.afterSnapshot[1] to endShot[1];
	}
	
	/**
	 * An EvaluationResultMonitorPerformance is a FeatureMonitorPerformance that waits for changes 
	 * in the result of an Evaluation identified by onOccurrence. The Predicate being evaluated must 
	 * be able to produce multiple results over time, for example by only using BindingConnectors 
	 * between Steps, rather than Successions or ItemFlows, including in its Step behaviors.
	 */
	
	behavior EvaluationResultMonitorPerformance specializes FeatureMonitorPerformance {
		in feature onOccurrence : Evaluation redefines onOccurrence {
	    	protected monitoredOccurrence : Evaluation [1] redefines monitoredOccurrence {
				out result : Anything[*] redefines result, monitoredFeature; 
			} 
		} 
	}
	
	/**
	 * A BooleanEvaluationResultMonitorPerformance is a EvaluationResultMonitorPerformance
	 * that waits for changes in the result of a BooleanEvaluation identified by onOccurrence.
	 */	
	behavior BooleanEvaluationResultMonitorPerformance specializes EvaluationResultMonitorPerformance {
	  	in bool redefines onOccurrence {
	    	protected bool redefines monitoredOccurrence[1];
		}
		out redefines afterValues : Boolean [1]; 
		out redefines beforeValues : Boolean [1];	 
	}
	
	/**
	 * A BooleanEvaluationResultToMonitorPerformance is a FeatureReferencingPerformance that waits 
	 * for the result of a BooleanEvaluation (identified by onOccurrence) to change to either true 
	 * or false, as indicated by isToTrue (defaulting to true). If the result is already true (or false), 
	 * the performance waits for the result to become false (or true) before waiting again for it to 
	 * change back.
	 */	
	behavior BooleanEvaluationResultToMonitorPerformance specializes FeatureReferencingPerformance {
		  in bool redefines onOccurrence;
  		  feature isToTrue : Boolean [1] default true;
		  out afterValues: Boolean[1] redefines values  = isToTrue;
		  private feature monitor1 : BooleanEvaluationResultMonitorPerformance [1] {
		    	feature redefines endWhen : HappensJustBefore;
		  }
		  private feature monitor2 : BooleanEvaluationResultMonitorPerformance [1] {
		    	feature redefines endWhen : HappensJustBefore;
		  }
		
		  private connector : HappensJustBefore from monitor1 [1] to monitor2 [0..1];
		  inv { isEmpty(monitor2) == (monitor1.afterValues == isToTrue) }
		
		  private binding monitor1.onOccurrence[1] = onOccurrence[1];
		  private binding monitor2.onOccurrence[1] = onOccurrence[1];
	}
}