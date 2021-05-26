/**
 * This package provides a simple framework for defining trade-off study analysis cases.
 */
package TradeStudies {
	private import Base::Anything;
	private import ScalarValues::*;
	private import ScalarFunctions::*;
	private import ControlFunctions::*;
	
	/**
	 * An ObjectiveFunction is a calculation that evaluates a TradeStudy alternative,
	 * producing a ScalarValue that can be comparted with the evaluation of other
	 * alternatives.
	 */
	abstract calc def ObjectiveFunction {
		/** The alternative to be evaluated. */
		in ref alternative : Anything; 
		
		/** A ScalarValue representing the evaluation of the given alternative. */
		return attribute result : ScalarValue[1]; 
	}
	
	/**
	 * A TradeStudyObjective is the base definition for the objective of a TradeStudy.
	 * The requirement is to choose from a given set of alternatives the selectedAlternative
	 * for that has the best evaluation according to a given ObjectiveFunction. What
	 * value is considered "best" is not defined in the abstract base definition but must be
	 * computed in any concrete specialization.
	 */
	abstract requirement def TradeStudyObjective {
		/**
		 * The alternative that should be selected, as evaluated using the given 
		 * ObjectiveFunction.
		 */
		subject selectedAlternative : Anything;
		
		/**
		 * The alternatives being considered in the TradeStudy for which this TradeStudyObjective 
		 * is the objective.
		 */
		in ref alternatives : Anything[1..*];
		
		/**
		 * The ObjectiveFunction to be used in evaluating the given alternatives.
		 */
		in calc fn : ObjectiveFunction;
		
		/**
		 * Out of the evaluation results of all the given alternatives, the one that is considered 
		 * "best", in the sense that it is the value the selectedAlternative should have. This 
		 * value must be computed in any concrete specialization of TradeStudyObjective.
		 */
		out attribute best : ScalarValue;
				
		require constraint { fn(selectedAlternative) == best }
	}
	
	/**
	 * A MinimizeObjective is a TradeStudyObjective that requires that the 
	 * selectedAlternative have the minimum ObjectiveFunction value of all the
	 * given alternatives.
	 */
	requirement def MinimizeObjective :> TradeStudyObjective {
		/** For a MinimizeObjective, the best value is the minimum one. */
		out attribute :>> best = alternatives->minimize {in x; fn(x)};
	}
	
	/**
	 * A MaximizeObjective is a TradeStudyObjective that requires that the 
	 * selectedAlternative have the maximum ObjectiveFunction value of all the
	 * given alternatives.
	 */
	requirement def MaximizeObjective :> TradeStudyObjective {
		/** For a MinimizeObjective, the best value is the maximum one. */
		out attribute :>> best = alternatives->maximize {in x; fn(x)};
	}
	
	/**
	 * A TradeStudy is an analysis case whose subject is a set of alternatives
	 * (at least one) and whose result is a selection of one of those alternatives.
	 * The alternatives are evaluated based on a given ObjectiveFunction and the
	 * selection is made such that it satisfies the objective of the TradeStudy
	 * (which must be a TradeStudyObjective).
	 */
	abstract analysis def TradeStudy {
		/**
		 * The set of alternatives being considered in this TradeStudy. 
		 * 
		 * In a TradeStudy usage, bind this feature to the actual collection of
		 * alternatives to be considered.
		 */
		subject studyAlternatives : Anything[1..*];
		
		/**
		 * The ObjectiveFunction to be used to evaluate the alternatives.
		 * 
		 * In a TradeStudy usage, redefine this feature to provide the desired
		 * calculation (or bind it to a calculation usage that does so).
		 */
		abstract calc objectiveFunction : ObjectiveFunction;
		
		/**
		 * The objective of this TradeStudy.
		 * 
		 * Redefine this feature to give it a definition that is a concrete
		 * specialization of TradeStudyObjective. That can either be one of the
		 * specializations provided in this package, or a more specific user-
		 * defined one.
		 */
		objective tradeStudyObjective : TradeStudyObjective {
			in ref :>> alternatives = studyAlternatives;
			in calc :>> fn = objectiveFunction;
		}
		
		/**
		 * The alternative selected by this TradeStudy, which is the one that meets the
		 * requirement of the tradeStudyObjective.
		 */
		return ref selectedAlternative = studyAlternatives->selectOne {in ref a; tradeStudyObjective(a)};
	}
	
}