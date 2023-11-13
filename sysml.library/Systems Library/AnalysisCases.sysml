standard library package AnalysisCases {
	doc
	/*
	 * This package defines the base types for analysis cases and related behavioral elements 
	 * in the SysML language.
	 */

	private import Performances::Evaluation;
	private import Performances::evaluations;
	private import Calculations::Calculation;
	private import Cases::Case;
	private import Cases::cases;
	
	abstract analysis def AnalysisCase :> Case {
		doc
		/*
		 * AnalysisCase is the most general class of performances of AnalysisCaseDefinitions. 
		 * AnalysisCase is the base class of all AnalysisCaseDefinitions.
		 */
	
		ref analysis self : AnalysisCase :>> Case::self;		
		subject subj :>> Case::subj;
		
		abstract analysis subAnalysisCases : AnalysisCase[0..*] :> analysisCases, subcases {
			doc
			/*
			 * Other AnalysisCases carried out as part of the performance of this AnalysisCase.
			 */
		}
	
		action analysisSteps : AnalysisAction[0..*] :> subactions {
			doc
			/*
			 * The subactions of this AnalysisCase that are AnalysisActions.
			 */
		}		
	}
	
	abstract analysis analysisCases : AnalysisCase[0..*] nonunique :> cases {
		doc
		/*
		 * analysisCases is the base feature of all AnalysisCaseUsages.
		 */
	}
	
	action def AnalysisAction {
		doc
		/*
		 * An AnalysisAction is a specialized kind of Action intended to be used as a step in an AnalysisCase.
		 */
	}
	
	calc def AnalysisCalculation :> Calculation, AnalysisAction {
		doc
		/*
		 * An AnalysisCalculation is a specialized kind of Calculation inteded to be used in a step of an AnalysisCase.
		 */
	}
	
}