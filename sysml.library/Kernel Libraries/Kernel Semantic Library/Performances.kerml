standard library package Performances {
	doc
	/*
	 * This package defines classifiers and features that related to the typing of performances and evaluations.
	 */

	private import Base::Anything;
	private import Base::things;
	private import Occurrences::Occurrence;
	private import Occurrences::occurrences;
	private import Occurrences::HappensDuring;
	private import Objects::Object;
	private import Links::BinaryLink;
	private import Metaobjects::Metaobject;
	private import Transfers::Transfer;
	private import Transfers::transfers;
	private import Transfers::TransferBefore;
	private import Transfers::transfersBefore;
	private import ScalarValues::*;
	private import SequenceFunctions::includes;
	
	abstract behavior Performance specializes Occurrence disjoint from Object {
		doc
		/*
		 * Performance is the most general class of behavioral Occurrences that may be performed over time.
		 */

		feature self: Performance redefines Occurrence::self;
		
		feature involvedObjects: Object[0..*] {
			doc
			/*
			 * Objects that are involved in this Performance.
			 */
		}
		
		feature performers: Object[0..*] subsets involvedObjects {
			doc
			/*
			 * Objects that enact this Performance.
			 */
		}
		
		feature redefines isDispatch default true;
  		feature redefines dispatchScope default thisPerformance;
  		
		step enclosedPerformances: Performance[0..*] subsets performances, timeEnclosedOccurrences
			intersects performances, timeEnclosedOccurrences {
			doc
			/*
			 * timeEnclosedOccurrences of this Performance that are also Performances.
			 */
		}
		
		feature thisPerformance: Performance [1] default self {
			doc
			/*
			 * Defaults to the root of the subperformance composition tree.
			 */
		}
		connector :HappensDuring from [1] self to [1] thisPerformance; 
		
		composite step subperformances: Performance[0..*] subsets enclosedPerformances, suboccurrences
			intersects enclosedPerformances, suboccurrences {
			doc
			/*
			 * enclosedPerformances that are composite. 
			 */
		
			feature redefines this default (that as Performance).this {
				doc
				/*
				 * The default "this" context of a subperformance is the same as that of its owning Performance.
				 * This means that the context for any Performance that is in a composition tree rooted
				 * in a Performance that is not itself owned by an Object is the root Performance. If the
				 * root Performance is an ownedPerformance of an Object, then that Object is the context.
				 */
			}
		
			feature redefines thisPerformance default (that as Performance).thisPerformance;
		}		
	}
	
	abstract function Evaluation specializes Performance {
		doc
		/*
		 * Evaluation is the most general class of functions that may be evaluated to compute
		 * a result.
		 */
	 
		return result: Anything[0..*] nonunique;
	}
	
	abstract predicate BooleanEvaluation specializes Evaluation {
		doc
		/*
		 * BooleanEvaluation is a specialization of Evaluation that is the most general class of
		 * Predicates that may be evaluated to produce a Boolean truth value.
		 */
	 
		return : Boolean[1];
	}
	
	abstract function MetadataAccessEvaluation specializes Evaluation {
		doc
		/*
		 * MetadataAccessEvaluation is a specialization of Evaluation for the case of MetadataAccessExpressions.
		 */
		
		return : Metaobject[1..*];
	}
	
	abstract function LiteralEvaluation specializes Evaluation {
		doc
		/*
		 * LiteralEvaluation is a specialization of Evaluation for the case of LiteralExpressions.
		 */
	 
		return : ScalarValue[1];
	}
	
	abstract predicate LiteralBooleanEvaluation specializes LiteralEvaluation, BooleanEvaluation
		intersects LiteralEvaluation, BooleanEvaluation {
		doc
		/*
		 * LiteralBooleanEvaluation is a specialization of LiteralEvaluation for the case of LiteralBooleans.
		 * It is also a predicate and thus a specialization of BooleanEvaluation. 
		 */
	 
		return : Boolean[1];
	}
	abstract function LiteralIntegerEvaluation specializes LiteralEvaluation {
		doc
		/*
		 * LiteralIntegerEvaluation is a specialization of LiteralEvaluation for the case of LiteralIntegers.
		 */
	 
		return : Integer[1];
	}

	abstract function LiteralRationalEvaluation specializes LiteralEvaluation {
		doc
		/*
		 * LiteralRationalEvaluation is a specialization of LiteralEvaluation for the case of LiteralRationals.
		 * (Note: Return type is Real to allow easy type conformance of LiteralRationals when a Real result is expected.)
		 */
	 
		return : Real[1];
	}
	
	abstract function LiteralStringEvaluation specializes LiteralEvaluation {
		doc
		/*
		 * LiteralStringEvaluation is a specialization of LiteralEvaluation for the case of LiteralStrings.
		 */
	 
		return : String[1];
	}
	
	function NullEvaluation specializes Evaluation {
		doc
		/*
		 * NullEvaluation is a specialization of Evaluation for the case of NullExpressions.
		 */
	 
		return : Anything[0..0];
	}

	assoc all InvolvedIn specializes BinaryLink { 
		doc
		/*
		 * InvolvedIn asserts that the involvedObject is involved in the Behavior carried out by the 
		 * involvingPerformance.
		 */
		 
		end feature involvedObject: Object redefines source crosses involvingPerformance.involvedObjects;
		end feature involvingPerformance: Performance redefines target crosses involvedObject.involvingPerformances;
	}
	
	assoc all Performs specializes InvolvedIn {
		doc
		/*
		 * Performs asserts that the performer enacts the Behavior carried out by the performance.
		 */
	
	 	end feature performerObject: Object redefines involvedObject crosses performance.performers;
	 	end feature performance: Performance redefines involvingPerformance crosses performerObject.enactedPerformances;
	 }

	abstract step performances: Performance[0..*] nonunique subsets occurrences {
		doc
		/*
		 * performances is the most general feature for performances of Behaviors.
		 */
	}
	
	abstract expr evaluations: Evaluation[0..*] nonunique subsets performances {
		doc
		/*
		 * evaluations is a specialization of performances for evaluations of Functions.
		 */
	}
	
	abstract expr constructorEvaluations [0..*] nonunique subsets evaluations  {
	    doc
	    /*
	     * constructorEvaluations is a specialization of evaluations that restricts the multiplicity 
	     * of its result parameter to 1..1, requiring a constructorEvaluation to result in a single value.
	     */
	     
	     return result [1..1];
	}
	
	abstract expr booleanEvaluations: BooleanEvaluation[0..*] nonunique subsets evaluations {
		doc
		/*
		 * booleanEvaluations is a specialization of evaluations restricted to type BooleanEvaluation.
		 */
	}
	
	abstract expr trueEvaluations subsets booleanEvaluations {
		doc
		/*
		 * trueEvaluations is a subset of booleanEvaluations that result in true. It is the most general
		 * feature of invariants that are not negated. 
		 */
	
		private feature trueValue = true;
		binding result = trueValue;
	}
	
	abstract expr falseEvaluations subsets booleanEvaluations {
		doc
		/*
		 * falseEvaluations is a subset of booleanEvaluations that result in false. It is the most general
		 * feature of invariants that are negated.
		 */
	
        private feature falseValue = false;
        binding result = falseValue;
	}
	
	abstract expr metadataAccessEvaluations: MetadataAccessEvaluation[0..*] nonunique subsets evaluations {
		doc
		/*
		 * metadataAccessEvaluations is a specialization of evaluations restricted to type MetadataAccessEvaluation. 
		 */
	}
	
	abstract expr literalEvaluations: LiteralEvaluation[0..*] nonunique subsets evaluations {
		doc
		/*
		 * literalEvaluations is a specialization of evaluations restricted to type LiteralEvaluation.
		 */
	}
	
	abstract expr literalBooleanEvaluations: LiteralBooleanEvaluation[0..*] nonunique subsets literalEvaluations, booleanEvaluations
		intersects literalEvaluations, booleanEvaluations {
		doc
		/*
		 * literaBooleanlEvaluations is a specialization of literalEvaluations and booleanEvaluations restricted 
		 * to type LiteralBooleanEvaluation.
		 */
	}
	
	abstract expr literalIntegerEvaluations: LiteralIntegerEvaluation[0..*] nonunique subsets literalEvaluations {
		doc
		/*
		 * literalEvaluations is a specialization of evaluations restricted to type LiteralEvaluation.
		 */
	}
	
	abstract expr literalRationalEvaluations: LiteralRationalEvaluation[0..*] nonunique subsets literalEvaluations {
		doc
		/*
		 * literalRationalEvaluations is a specialization of literalEvaluations restricted to type LiteralRationalEvaluation.
		 */
	}
	
	abstract expr literalStringEvaluations: LiteralStringEvaluation[0..*] nonunique subsets literalEvaluations {
		doc
		/*
		 * literalStringEvaluations is a specialization of literalEvaluations restricted to type LiteralStringEvaluation.
		 */
	}
	
	abstract expr nullEvaluations: NullEvaluation[0..*] nonunique subsets evaluations {
		doc
		/*
		 * nullEvaluations is a specialization of evaluations restricted to type NullEvaluation.
		 */
	}
}