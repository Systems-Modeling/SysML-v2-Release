/**
 * This package defines Behaviors used to read and write values of a referenced Feature of an Occurrence 
 * as of the time the Performance of the Behavior ends.
 */
package FeatureAccessPerformances {
	private import Base::Anything;
	private import Base::things;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensWhile;
	private import Occurrences::SelfSameLifeLink;
	private import Performances::Performance;
	private import Performances::Evaluation;

	/**
	 * A FeatureReferencingPerformance is the base Performance for specialized behaviors related 
	 * to values of one more more referenced Features, as identified in specializations of this 
	 * Behavior.
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
}