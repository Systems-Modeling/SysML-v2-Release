/**
 * This package defines the base types for verification cases and related behavioral elements 
 * in the SysML language.
 */
package Verifications {
	private import Cases::Case;
	private import Cases::cases;
	
	/**
	 * VerificationCase is the most general class of performances of VerificationCaseDefinitions. 
	 * VericationCase is the base class of all VerificationCaseDefinitions.
	 */
	verification def VerificationCase :> Case {
		ref verification :>> self : VerificationCase;		
		subject :>> subj;
		objective :>> obj;
		
		/**
		 * The subcases of this VerificationCase that are VerificationCaseUsages.
		 */
		abstract ref verification subVerificationCases : Case[0..*] :> verificationCases, subcases;
		
	}
	
	/**
	 * verificationCases is the base feature of all VerificationCaseUsages.
	 */
	abstract verification verificationCases : VerificationCase[0..*] :> cases;
	
}