/**
 * This package defines the base types for verification cases and related behavioral elements 
 * in the SysML language.
 */
package Verifications {
	private import Cases::Case;
	private import Cases::cases;
	private import Requirements::RequirementCheck;
	private import ScalarValues::Boolean;
	
	/**
	 * VerificationCase is the most general class of performances of VerificationCaseDefinitions. 
	 * VericationCase is the base class of all VerificationCaseDefinitions.
	 */
	abstract verification def VerificationCase :> Case {
		ref verification self : VerificationCase :>> Case::self;		
		subject subj :>> Case::subj;
		return verdict : VerdictKind :>> result;
		
		objective obj :>> Case::obj {
			subject subj = VerificationCase::subj;
			
			/**
			 * A record of the evaluations of the RequirementChecks of requirements being verified.
			 */
			requirement requirementVerifications[0..*];
		}
		
		/**
		 * Checks on whether the verifiedRequirements of the VerificationCase have been satisfied.
		 */
		ref requirement requirementVerifications[0..*] = obj::requirementVerifications;
		
		/**
		 * The subcases of this VerificationCase that are VerificationCaseUsages.
		 */
		abstract ref verification subVerificationCases : Case[0..*] :> verificationCases, subcases;
		
	}
	
	/**
	 * verificationCases is the base feature of all VerificationCaseUsages.
	 */
	abstract verification verificationCases : VerificationCase[0..*] :> cases;
	
	/**
	 * VerdictKind is an enumeration of the possible results of a VerificationCase.
	 * (NOTE: A variation is being used to mock up an enumeration until true
	 * enumeration notation is introduced.)
	 */
	variation attribute def VerdictKind {
		variant attribute pass;
		variant attribute fail;
		variant attribute inconclusive;
		variant attribute error;
	}
	
	calc def PassIf(in isPassing : Boolean) {
		return verdict : VerdictKind = isPassing? VerdictKind::pass : VerdictKind::fail;
	}
	
}