package ControlPerformances {
	private import Occurrences::HappensBefore;
	
	behavior DecisionPerformance {
		/**
		 * Specializations subset this (via SelfLink) by all
		 * successions going out of a decision step.
		 */
		feature outgoingHBLink: HappensBefore[1];
	}
	
	behavior MergePerformance {
		/**
		 * Specializations subset this (via SelfLink) by all
		 * successions coming into a merge step.
		 */
		feature incomingHBLink: HappensBefore[1];
	}
}