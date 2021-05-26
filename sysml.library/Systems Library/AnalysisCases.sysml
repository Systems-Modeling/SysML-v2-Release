/**
 * This package defines the base types for analysis cases and related behavioral elements 
 * in the SysML language.
 */
package AnalysisCases {
	private import Performances::Evaluation;
	private import Performances::evaluations;
	private import Calculations::Calculation;
	private import Cases::Case;
	private import Cases::cases;
	
	/**
	 * AnalysisCase is the most general class of performances of AnalysisCaseDefinitions. 
	 * AnalysisCase is the base class of all AnalysisCaseDefinitions.
	 */
	abstract analysis def AnalysisCase :> Case {
		ref analysis self : AnalysisCase :>> Case::self;		
		subject subj :>> Case::subj;
		objective obj :>> Case::obj;
		
		/**
		 * Other AnalysisCases carried out as part of the performance of this AnalysisCase.
		 */
		abstract ref analysis subAnalysisCases : AnalysisCase[0..*] :> analysisCases, subcases;
	
		/**
		 * The subactions of this AnalysisCase that are AnalysisActions.
		 */
		action analysisSteps : AnalysisAction[0..*] :> subactions;
		
		/**
		 * The Evaluation of the resultExpression from the definition of this AnalysisCase.
		 */
		calc resultEvaluation : Evaluation[0..1] :> evaluations;
		
		/**
		 * The result of this AnalysisCase is bound to the result of the resultEvaluation.
		 */
		return ref result = resultEvaluation();
	}
	
	/**
	 * analysisCases is the base feature of all AnalysisCaseUsages.
	 */
	abstract analysis analysisCases : AnalysisCase[0..*] nonunique :> cases;
	
	/**
	 * An AnalysisAction is a specialized kind of Action intended to be used as a step in an AnalysisCase.
	 */
	action def AnalysisAction;
	
	/**
	 * An AnalysisCalculation is a specialized kind of Calculation inteded to be used in a step of an AnalysisCase.
	 */
	calc def AnalysisCalculation :> Calculation, AnalysisAction;
	
}