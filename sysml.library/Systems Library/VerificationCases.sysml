/**
 * This package defines the base types for verification cases and related behavioral elements 
 * in the SysML language.
 */
package VerificationCases {
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
		ref requirement requirementVerifications[0..*] = obj.requirementVerifications;
		
		/**
		 * The subcases of this VerificationCase that are VerificationCaseUsages.
		 */
		abstract ref verification subVerificationCases : Case[0..*] :> verificationCases, subcases;
		
	}
	
	/**
	 * verificationCases is the base feature of all VerificationCaseUsages.
	 */
	abstract verification verificationCases : VerificationCase[0..*] nonunique  :> cases;
	
	/**
	 * VerdictKind is an enumeration of the possible results of a VerificationCase.
	 */
	enum def VerdictKind {
		pass;
		fail;
		inconclusive;
		error;
	}
	
	calc def PassIf(in isPassing : Boolean) {
		return verdict : VerdictKind = isPassing? VerdictKind::pass : VerdictKind::fail;
	}
	
	/**
	 * VerificationMethod can be used as metadata annotating a verification case or action.
	 */
	attribute def VerificationMethod {
		attribute kind : VerificationMethodKind[1..*];
	}
	
	/**
	 * VerificationMethodKind is an enumeration of the standard methods by which verification
	 * can be carried out.
	 */
	enum def VerificationMethodKind {
		inspect;
		analyze;
		demo;
		test;
	}
	
}