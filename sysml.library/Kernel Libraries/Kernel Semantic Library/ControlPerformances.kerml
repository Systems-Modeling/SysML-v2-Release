standard library package ControlPerformances {
	doc
	/*
	 * This package defines Behaviors to be used to type Steps that control the sequencing of performance
	 * of other Steps. 
	 */

	private import ScalarValues::Boolean;
	private import SequenceFunctions::size;
	private import SequenceFunctions::notEmpty;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensBefore;
	private import Occurrences::SelfSameLifeLink;
	private import Performances::Performance;
	private import Performances::BooleanEvaluation;
	
	behavior DecisionPerformance specializes Performance {
		doc
		/*
		 * A DecisionPerformance is a Performance that represents the selection of one of the Successions
		 * that have the DecisionPerforance behavior as their source. All such Successions must subset the 
		 * outgoingHBLink feature of the source DecisionPerformance. For each instance of DecisionPerformance, 
		 * the outgoingHBLink is an instance of exactly one of the Successions, ordering the DecisionPerformance
		 * as happening before an instance of the target of that Succcession.
		 */
		
		feature outgoingHBLink: HappensBefore[1] {
			doc
			/*
			 * Specializations subset this by all
			 * successions going out of a decision step.
			 */

			 end feature redefines earlierOccurrence subsets that;
		}
	}
	
	behavior MergePerformance specializes Performance {
		doc
		/*
		 * A MergePerformance is a Performance that represents the merging of all Successions that
		 * target the MergePerforance behavior. All such Successions must subset the incomingHBLink
		 * feature of the target MergePerformance. For each instance of MergePerformance, the
		 * incomingHBLink is an instance of exactly one of the Successions, ordering the
		 * MergePerformance as happening after an instance of the source of that Succession.
		 */

		feature incomingHBLink: HappensBefore[1] {
			doc
			/*
			 * Specializations subset this by all
			 * successions coming into a merge step.
			 */

			 end feature redefines laterOccurrence subsets that;
		}
	}

	abstract behavior IfPerformance specializes Performance {
		doc
		/*
		 * An IfPerformance is a Performance that determines whether the ifTest evaluation result is true 
		 * (by whether ifTrue has a value).
		 */	
		 
		in ifTest : BooleanEvaluation[1];
	}
	
	behavior IfThenPerformance specializes IfPerformance {
		doc
		/*
		 * An IfThenPerformance is an IfPerformance where the thenClause occurs after and only after the 
		 * ifTest evaluation result is true.
		 */
		
		in redefines ifTest;
		in thenClause : Occurrence[0..1];
		succession [1] ifTest then [0..1] thenClause;
		inv { ifTest() == thenClause->notEmpty() }
	}
	
	behavior IfElsePerformance specializes IfPerformance {
		doc
		/*
		 * An IfElsePerformance is an IfPerformance where the elseClause occurs after and only 
		 * after the ifTest evaluation result is not true.
		 */

		in redefines ifTest;
		in elseClause : Occurrence[0..1];
		succession [1] ifTest then [0..1] elseClause;
		inv { not ifTest() == elseClause->notEmpty() }
	}
	
	behavior IfThenElsePerformance specializes IfThenPerformance {
		doc
		/*
		 * An IfThenElsePerformance is an IfThenPerformance with an additional elseClause that
		 * occurs after and only after the ifTest evaluation is false.
		 */
		 
		in redefines ifTest;
		in redefines thenClause;
        in elseClause : Occurrence[0..1];
        succession [1] ifTest then [0..1] elseClause;
        inv { not ifTest() == elseClause->notEmpty() }
	}
	
	behavior LoopPerformance specializes Performance {
		doc
		/*
		 * A LoopPerformance is a Performance where the body occurs repeatedly in sequence (iterates) 
		 * as long as the whileTest evaluation result is true before each iteration (and after the 
		 * previous one, except the first time) and the untilTest evaluation result is not true after 
		 * each iteration and before the next one (except the last one).
		 */
		 
		in whileTest : BooleanEvaluation[1..*];
		in body : Occurrence[0..*];
        in untilTest : BooleanEvaluation[0..*];
		
		step whileDecision : IfThenPerformance[1..*];
		step untilDecision : IfElsePerformance[0..*];
		
		binding [1] whileDecision.ifTest = [1] whileTest;
		binding [1] whileDecision.thenClause = [1] body;
		
		succession body then untilDecision;
		
		binding [1] untilDecision.ifTest = [1] untilTest;
		binding loopBack of [0..1] untilDecision.elseClause = [1] whileDecision;
		
		inv { loopBack->size() == whileDecision->size() - 1 }
	}
}