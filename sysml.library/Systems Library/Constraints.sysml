/**
 * This package defines the base types for constraints and related elements in the
 * SysML language.
 */
package Constraints {
	private import Performances::BooleanEvaluation;
	private import Performances::booleanEvaluations;
	private import Performances::trueEvaluations;
	private import Performances::falseEvaluations;
	
	/**
	 * ConstraintCheck is the most general class for constraint checking. ConstraintCheck is the base
	 * type of all ConstraintDefinitions.
	 */
	abstract constraint def ConstraintCheck :> BooleanEvaluation {
		ref constraint thisConstraint: ConstraintCheck :>> BooleanEvaluation::self;
	}
	
	/**
	 * constraintChecks is the base feature of all ConstraintUsages.
	 */
	abstract constraint constraintChecks: ConstraintCheck[0..*] nonunique :> booleanEvaluations;
	
	/**
	 * assertedConstraintChecks is the subset of constraintChecks for Constraints asserted to be true.
	 */
	abstract constraint assertedConstraintChecks :> constraintChecks, trueEvaluations;
		
	/**
	 * negatedConstraintChecks is the subset of constraintChecks for Constraints asserted to be false.
	 */
	abstract constraint negatedConstraintChecks :> constraintChecks, falseEvaluations;
		
}