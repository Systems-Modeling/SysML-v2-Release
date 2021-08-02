/**
 * This package defines classifiers and features that related to the typing of performances and evaluations.
 */
package Performances {
	private import Base::Anything;
	private import Base::things;
	private import Occurrences::Occurrence;
	private import Occurrences::occurrences;
	private import Objects::Object;
	private import Objects::BinaryLinkObject;
	private import Transfers::transfers;
	private import Transfers::transfersBefore;
	private import ScalarValues::*;
	
	/**
	 * Performance is the most general class of behavioral Occurrences that may be performed over time.
	 */
	abstract behavior Performance specializes Occurrence () {
		feature self: Performance redefines Occurrence::self;
		
		/**
		 * Objects that are involved in this Performance.
		 */
		feature involvedObjects: Object[0..*];
		
		/**
		 * Objects that enact this Performance.
		 */
		feature performers: Object[0..*] subsets involvedObjects;
		
		/**
		 * suboccurrences of this Performance that are also Performances.
		 */
		step subperformances: Performance[0..*] subsets performances, suboccurrences;
		
		/**
		 * subperformances of this Performance that are Evaluations.
		 */
		expr subevaluations: Evaluation[0..*] subsets evaluations, subperformances;
		
		/**
		 * subperformances of this performance that are transfers.
		 */
		step subtransfers: Transfers::Transfer[0..*] subsets transfers, subperformances;
		
		/**
		 * subtransfers of this performance that are transfers-before.
		 */	
		step subtransfersBefore: Transfers::TransferBefore[0..*] subsets transfersBefore, subtransfers;
	}
	
	/**
	 * Evaluation is the most general class of functions that may be evaluated to compute
	 * a result.
	 */
	abstract function Evaluation specializes Performance () result: Anything[0..*] nonunique;
	
	/**
	 * BooleanEvaluation is a specialization of Evaluation that is the most general class of
	 * Predicates that may be evaluated to produce a Boolean truth value.
	 */
	abstract predicate BooleanEvaluation specializes Evaluation (): Boolean[1];
	
	/**
	 * LiteralEvaluation is a specialization of Evaluation for the case of LiteralExpressions.
	 */				
	abstract function LiteralEvaluation specializes Evaluation (): ScalarValue[1];
	
	/**
	 * LiteralBooleanEvaluation is a specialization of LiteralEvaluation for the case of LiteralBooleans.
	 * It is also a predicate and thus a specialization of BooleanEvaluation. 
	 */
	abstract predicate LiteralBooleanEvaluation specializes LiteralEvaluation, BooleanEvaluation (): Boolean[1];

	/**
	 * LiteralIntegerEvaluation is a specialization of LiteralEvaluation for the case of LiteralIntegers.
	 */
	abstract function LiteralIntegerEvaluation specializes LiteralEvaluation (): Integer[1];

	/**
	 * LiteralRationalEvaluation is a specialization of LiteralEvaluation for the case of LiteralRationals.
	 * (Note: Return type is Real to allow easy type conformance of LiteralRationals when a Real result is expected.)
	 */
	abstract function LiteralRationalEvaluation specializes LiteralEvaluation (): Real[1];
	
	/**
	 * LiteralStringEvaluation is a specialization of LiteralEvaluation for the case of LiteralStrings.
	 */
	abstract function LiteralStringEvaluation specializes LiteralEvaluation (): String[1];
	
	/**
	 * NullEvaluation is a specialization of Evaluation for the case of NullExpressions.
	 */
	function NullEvaluation specializes Evaluation (): Anything[0..0];

	/** 
	 * Involves asserts that the Behavior carried out by the involvingPerformance involves the
	 * involvedObject.
	 */
	assoc Involves specializes BinaryLinkObject {
		end feature involvingPerformance: Performance[0..*] redefines source subsets involvedObject.involvingPerformances;
		end feature involvedObject: Object[0..*] redefines target subsets involvingPerformance.involvedObjects;
	}
	
	/**
	 * Performance asserts that the performer enacts the Behavior carried out by the performance.
	 */
	 assoc Performs specializes Involves {
	 	end feature performerObject: Object[0..*] redefines involvedObject subsets performance.performers;
	 	end feature performance: Performance[0..*] redefines involvingPerformance subsets performerObject.enactedPerformances;
	 }
	
	/**
	 * performances is the most general feature for performances of Behaviors.
	 */
	abstract step performances: Performance[0..*] nonunique subsets occurrences;
	
	/**
	 * evaluations is a specialization of performances for evaluations of Functions.
	 */
	abstract expr evaluations: Evaluation[0..*] nonunique subsets performances;
	
	/**
	 * booleanEvaluations is a specialization of evaluations restricted to type BooleanEvaluation.
	 */
	abstract expr booleanEvaluations: BooleanEvaluation[0..*] nonunique subsets evaluations;
	
	/**
	 * trueEvaluations is a subset of booleanEvaluations that result in true. It is the most general
	 * feature of invariants that are not negated. 
	 */
	abstract expr trueEvaluations :> booleanEvaluations {
		true
	}
	
	/**
	 * falseEvaluations is a subset of booleanEvaluations that result in true. It is the most general
	 * feature of invariants that are negated.
	 */
	abstract expr falseEvaluations :> booleanEvaluations {
		false
	}
	
	/**
	 * literalEvaluations is a specialization of evaluations restricted to type LiteralEvaluation.
	 */
	abstract expr literalEvaluations: LiteralEvaluation[0..*] nonunique subsets evaluations;
	
	/**
	 * literaBooleanlEvaluations is a specialization of literalEvaluations and booleanEvaluations restricted 
	 * to type LiteralBooleanEvaluation.
	 */
	abstract expr literalBooleanEvaluations: LiteralBooleanEvaluation[0..*] nonunique subsets literalEvaluations, booleanEvaluations;
	
	/**
	 * literalEvaluations is a specialization of evaluations restricted to type LiteralEvaluation.
	 */
	abstract expr literalIntegerEvaluations: LiteralIntegerEvaluation[0..*] nonunique subsets literalEvaluations;
	
	/**
	 * literalRationalEvaluations is a specialization of literalEvaluations restricted to type LiteralRationalEvaluation.
	 */
	abstract expr literalRationalEvaluations: LiteralRationalEvaluation[0..*] nonunique subsets literalEvaluations;
	
	/**
	 * literalStringEvaluations is a specialization of literalEvaluations restricted to type LiteralStringEvaluation.
	 */
	abstract expr literalStringEvaluations: LiteralStringEvaluation[0..*] nonunique subsets literalEvaluations;
	
	/**
	 * nullEvaluations is a specialization of evaluations restricted to type NullEvaluation.
	 */
	abstract expr nullEvaluations: NullEvaluation[0..*] nonunique subsets evaluations;
	
}