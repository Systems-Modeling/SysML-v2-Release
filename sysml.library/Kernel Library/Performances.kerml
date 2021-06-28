/**
 * This package defines classifiers and features that related to the typing of performances and evaluations.
 */
package Performances {
	private import Base::Anything;
	private import Base::things;
	private import Occurrences::Occurrence;
	private import Objects::Object;
	private import Objects::BinaryLinkObject;
	
	/**
	 * Performance is the most general class of behavioral occurrences that may be performed over time.
	 */
	abstract behavior Performance specializes Occurrence () {
		feature self: Performance redefines Occurrence::self;
		
		/**
		 * Objects that are involved in this performance.
		 */
		feature involvedObjects: Object[0..*];
		
		/**
		 * Objects that enact this performance.
		 */
		feature performers: Object[0..*] subsets involvedObjects;
		
		/**
		 * Suboccurrences of this performance that are also performances.
		 */
		step subperformances: Performance[0..*] nonunique subsets performances, suboccurrences;
		
		/**
		 * Subperformances of this performance that are evaluations.
		 */
		expr subevaluations: Evaluation[0..*] nonunique subsets evaluations, subperformances;
		
		/**
		 * Subevaluations of this performance that are boolean evaluations.
		 */
		expr subBooleanEvaluations: BooleanEvaluation[0..*] nonunique subsets booleanEvaluations, subevaluations;
		
		/**
		 * Subperformances of this performance that are transfers.
		 */
		step subtransfers: Transfers::Transfer[0..*] nonunique subsets Transfers::transfers, subperformances;
		
		/**
		 * Subtransfers of this performance that are transfers-before.
		 */
		step subtransfersBefore: Transfers::TransferBefore[0..*] nonunique subsets Transfers::transfersBefore, subtransfers;
	}
	
	/**
	 * Evaluation is the most general class of functions that may be evaluated to compute
	 * a result.
	 */
	abstract function Evaluation specializes Performance () result: Anything[0..*];
	
	/**
	 * BooleanEvaluation is a specialization of Evaluation that is the most general class of
	 * predicates that may be evaluated to produce a Boolean truth value.
	 */
	abstract predicate BooleanEvaluation specializes Evaluation (): ScalarValues::Boolean[1];
	
	/**
	 * LiteralEvaluation is a specialization of Evaluation for the case of literal expressions.
	 */				
	abstract function LiteralEvaluation specializes Evaluation (): ScalarValues::ScalarValue[1];
	
	/**
	 * NullEvaluation is a specialization of Evaluation for the case of null expressions.
	 */
	function NullEvaluation specializes Evaluation (): Anything[0..0];

	/** 
	 * Involves asserts that the behavior carried out by the involvingPerformance involves the
	 * involvedObject.
	 */
	assoc Involves specializes BinaryLinkObject {
		end feature involvingPerformance: Performance[0..*] redefines Object::involvingPerformances, BinaryLinkObject::source;
		end feature involvedObject: Object[0..*] redefines Performance::involvedObjects, BinaryLinkObject::target;
	}
	
	/**
	 * Performance asserts that the performer enacts the behavior carried out by the performance.
	 */
	 assoc Performs specializes Involves {
	 	end feature performer: Object[0..*] redefines Involves::involvedObject, Performance::performers;
	 	end feature performance: Performance[0..*] redefines Involves::involvingPerformance subsets Object::enactedPerformances;
	 }
	
	/**
	 * performances is the most general feature for performances of behaviors.
	 */
	abstract step performances: Performance[0..*] nonunique subsets things;
	
	/**
	 * evaluations is a specialization of performances for evaluations of functions.
	 */
	abstract expr evaluations: Evaluation[0..*] nonunique subsets performances;
	
	/**
	 * booleanEvaluations is a specialization of evaluations for restricted to type BooleanEvaluation.
	 */
	abstract expr booleanEvaluations: BooleanEvaluation[0..*] nonunique subsets evaluations;
	
	/**
	 * literalEvaluations is a specialization of evaluations restricted to type LiteralEvaluation.
	 */
	abstract expr literalEvaluations: LiteralEvaluation[0..*] nonunique subsets evaluations;
	
	/**
	 * nullEvaluations is a specialization of evaluations restricted to type NullEvaluation.
	 */
	abstract expr nullEvaluations: NullEvaluation[0..*] nonunique subsets evaluations;
	
}