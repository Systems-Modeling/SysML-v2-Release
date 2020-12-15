/**
 * This package defines the base types for constraints and related elements in the
 * SysML language.
 */
package Constraints {
	private import Performances::BooleanEvaluation;
	private import Performances::booleanEvaluations;
	private import Parts::Part;
	private import Parts::parts;
	
	/**
	 * ConstraintCheck is the most general class for constraint checking. ConstraintCheck is the base
	 * type of all ConstraintDefinitions.
	 */
	abstract constraint def ConstraintCheck :> BooleanEvaluation, Part {
		ref constraint thisConstraint: ConstraintCheck :>> BooleanEvaluation::self, Part::self;
	}
	
	/**
	 * constraintChecks is the base feature of all ConstraintUsages.
	 */
	abstract constraint constraintChecks: ConstraintCheck[0..*] :> booleanEvaluations, parts;
		
}