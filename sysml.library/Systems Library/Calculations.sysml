/**
 * This package defines the base types for calculations and related behavioral elements in the
 * SysML language.
 */
package Calculations {
	private import Performances::Evaluation;
	private import Performances::evaluations;
	private import Actions::Action;
	private import Actions::actions;
	
	/**
	 * Calculation is the most general class of evaluations of CalculationDefinitions in a
	 * system or part of a system. Calculation is the base class of all CalculationDefinitions.
	 */
	abstract calc def Calculation :> Action, Evaluation {
		ref calc self: Calculation :>> Action::self, Evaluation::self;
		
		/**
		 * The subactions of this Calculation that are Calculations.
		 */
		abstract calc subcalculations: Calculation :> calculations, subactions;
		
	}
	
	/**
	 * calculations is the base Feature for all CalculationUsages.
	 */
	abstract calc calculations: Calculation[0..*] nonunique :> actions, evaluations;
}