/**
 * This package defines Behaviors to be used to type Steps that control the sequencing of performance
 * of other Steps. 
 */
package ControlPerformances {
	private import ScalarValues::Boolean;
	private import SequenceFunctions::size;
	private import SequenceFunctions::notEmpty;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensBefore;
	private import Occurrences::SelfSameLifeLink;
	private import Performances::Performance;
	private import Performances::BooleanEvaluation;
	
	/**
	 * A DecisionPerformance is a Performance that represents the selection of one of the Successions
	 * that have the DecisionPerforance behavior as their source. All such Successions must subset the 
	 * outgoingHBLink feature of the source DecisionPerformance. For each instance of DecisionPerformance, 
	 * the outgoingHBLink is an instance of exactly one of the Successions, ordering the DecisionPerformance
	 * as happening before an instance of the target of that Succcession.
	 */
	behavior DecisionPerformance specializes Performance {
		/**
		 * Specializations subset this by all
		 * successions going out of a decision step.
		 */
		feature outgoingHBLink: HappensBefore[1];
	}
	
	/**
	 * A MergePerformance is a Performance that represents the merging of all Successions that
	 * target the MergePerforance behavior. All such Successions must subset the incomingHBLink
	 * feature of the target MergePerformance. For each instance of MergePerformance, the
	 * incomingHBLink is an instance of exactly one of the Successions, ordering the
	 * MergePerformance as happening after an instance of the source of that Succession.
	 */
	behavior MergePerformance specializes Performance {
		/**
		 * Specializations subset this by all
		 * successions coming into a merge step.
		 */
		feature incomingHBLink: HappensBefore[1];
	}

	/**
	 * An IfPerformance is a Performance that determines whether the ifTest evaluation result is true 
	 * (by whether ifTrue has a value).
	 */	
	abstract behavior IfPerformance specializes Performance {
		in ifTest : BooleanEvaluation[1];
	}
	
	/**
	 * An IfThenPerformance is an IfPerformance where the thenClause occurs after and only after the 
	 * ifTest evaluation result is true.
	 */
	behavior IfThenPerformance specializes IfPerformance {
		in redefines ifTest;
		in thenClause : Occurrence[0..1];
		succession ifTest[1] then thenClause[0..1];
		inv { ifTest() == thenClause->notEmpty() }
	}
	
	/**
	 * An IfElsePerformance is an IfPerformance where the elseClause occurs after and only 
	 * after the ifTest evaluation result is not true.
	 */
	behavior IfElsePerformance specializes IfPerformance {
		in redefines ifTest;
		in elseClause : Occurrence[0..1];
		succession ifTest[1] then elseClause[0..1];
		inv { !ifTest() == elseClause->notEmpty() }
	}
	
	/**
	 * An IfThenElsePerformance is an IfThenPerformance and an IfElsePerformance.
	 */
	behavior IfThenElsePerformance specializes IfThenPerformance, IfElsePerformance;
	
	/**
	 * A LoopPerformance is a Performance where the body occurs repeatedly in sequence (iterates) 
	 * as long as the whileTest evaluation result is true before each iteration (and after the 
	 * previous one, except the first time) and the untilTest evaluation result is not true after 
	 * each iteration and before the next one (except the last one).
	 */
	behavior LoopPerformance specializes Performance {
		in whileTest : BooleanEvaluation[1..*];
		in untilTest : BooleanEvaluation[0..*];
		in body : Occurrence[0..*];
		
		step whileDecision : IfThenPerformance[1..*];
		step untilDecision : IfElsePerformance[0..*];
		
		binding whileDecision.ifTest[1] = whileTest[1];
		binding whileDecision.thenClause[1] = body[1];
		
		succession body then untilDecision;
		
		binding untilDecision.ifTest[1] = untilTest[1];
		binding loopBack of untilDecision.elseClause[0..1] = whileDecision[1];
		
		inv { loopBack->size() == whileDecision->size() - 1 }
	}
}