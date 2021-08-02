/**
 * This package defines the base types for cases and related behavioral elements 
 * in the SysML language.
 */
package Cases {
	private import Base::Anything;
	private import Requirements::RequirementCheck;
	private import Calculations::Calculation;
	private import Calculations::calculations;
	private import Parts::Part;
	private import Parts::parts;
	
	/**
	 * Case is the most general class of performances of CaseDefinitions. 
	 * Case is the base class of all CaseDefinitions.
	 */
	abstract case def Case :> Calculation {
		ref case self : Case :>> Calculation::self;
		
		/**
		 * The subject that was investigated by this Case.
		 */
		subject subj : Anything[1];
		
		/**
		 * The Parts that fill the role of actors for this Case.
		 * (Note: This is not itself an actor parameter, because specific actor
		 * parameters will be added for specific Cases.)
		 */
		ref part actors : Part[0..*] :> parts;
		
		/**
		 * A check of whether the objective RequirementUsage was satisfied for this Case.
		 */
		objective obj : RequirementCheck[1] {
			subject = Case::result;
		}
		
		/**
		 * The result determined by the case, which should satisfy the case objective.
		 */
		return ref result[0..*];
		
		/**
		 * Other Cases carried out as part of the performance of this Case.
		 */
		abstract ref case subcases : Case[0..*] :> cases, subcalculations;
	
	}
	
	/**
	 * cases is the base Feature of all CaseUsages.
	 */
	abstract case cases : Case[0..*] nonunique :> calculations;
}