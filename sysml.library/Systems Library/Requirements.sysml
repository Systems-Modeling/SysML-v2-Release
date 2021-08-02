/**
 * This package defines the base types for requirements and related elements in the SysML language.
 */
package Requirements {
	private import Base::Anything;
	private import ScalarValues::String;
	private import ControlFunctions::allTrue;
	private import Constraints::constraintChecks;
	private import Constraints::assertedConstraintChecks;
	private import Constraints::negatedConstraintChecks;
	private import Parts::Part;
	private import Parts::parts;
	private import Actions::Action;
	private import Interfaces::Interface;
	private import Attributes::AttributeValue;
	
	/**
	 * RequirementConstraintCheck is the base ConstraintCheck for RequirementCheck, defining the
	 * separate assumptions and required constraints such that, if all the assumptions are true,
	 * then all the required constraints must be true.
	 */
	private abstract constraint def RequirementConstraintCheck {
		/**
		 * Assumptions that must hold for the required constraints to apply.
		 */
		ref constraint assumptions[0..*] :> constraintChecks;
		
		/**
		 * The required constraints that are to be checked.
		 */
		ref constraint constraints[0..*] :> constraintChecks;
		
		/**
		 * If all the assumptions are true, then all the required constraints must hold.
		 */
		allTrue(assumptions()) implies allTrue(constraints())
	}
	
	/**
	 * RequirementCheck is the most general class for requirements checking. RequirementsCheck is the base
	 * type of all requirement definitions.
	 * 
	 * 
	 */
	abstract requirement def RequirementCheck :> RequirementConstraintCheck {
		ref requirement thisRequirement: RequirementCheck :>> thisConstraint;
		
		/**
		 * The entity that is being checked for satisfaction of the required constraints.
		 */
		subject subj : Anything[1];
		
		/**
		 * The Parts that fill the role of actors for this RequirementCheck.
		 * (Note: This is not itself an actor parameter, because specific actor
		 * parameters will be added for specific RequirementChecks.)
		 */
		ref part actors : Part[0..*];
		
		/**
		 * The Parts that represent stakeholders interested in the concern being checked.
		 * (Note: This is not itself a stakeholder parameter, because specific stakeholder
		 * parameters will be added for specific RequirementChecks.)
		 */
		ref part stakeholders : Part[0..*];

		/* 
		 * Note: assumptions and constraints are redefined here solely to simplify the
		 * resolution of their qualified names as library elements.
		 */
		ref constraint assumptions :>> RequirementConstraintCheck::assumptions;
		ref constraint constraints :>> RequirementConstraintCheck::constraints;
		
		/**
		 * Nested requirements, which are also required constraints.
		 */
		abstract ref requirement subrequirements[0..*] :> requirementChecks, constraints;
		
		/**
		 * The checks of any concerns being addressed (as required constraints).
		 */
		abstract ref concern concerns[0..*] :> concernChecks, constraints;
		
	}
	
	/**
	 * A functional requirement specifies an action that a system, or part of a system, must perform.
	 */
	requirement def FunctionalRequirementCheck :> RequirementCheck {
		subject: Action;
	}
	
	/** 
	 * An interface requirement specifies an interface for connecting systems and system parts, which
	 * optionally may include item flows across the interface and/or interface constraints.
	 */
	requirement def InterfaceRequirementCheck :> RequirementCheck {
		subject: Interface;
	}
	
	/**
	 * A performance requirement quantitavely measures the extent to which a system, or a system part, 
	 * satisfies a required capability or condition.
	 */
	requirement def PerformanceRequirementCheck :> RequirementCheck {
		subject: AttributeValue;
	}
	
	/**
	 * A physical requirement specifies physical characteristics and/or physical constraints of the 
	 * system, or a system part.
	 */
	requirement def PhysicalRequirementCheck :> RequirementCheck {
		subject: Part;
	}
	
	/**
	 * A design constraint specifies a constraint on the implementation of the system or system part, 
	 * such as the system must use a commercial off the shelf component.
	 */
	requirement def DesignConstraintCheck :> RequirementCheck {
		subject: Part;
	}
	
	/**
	 * ConcernCheck is the most general class for concern checking. ConcernCheck is the base type of 
	 * all ConcernDefinitions.
	 */
	concern def ConcernCheck :> RequirementCheck {
		ref concern thisConcern: ConcernCheck :>> RequirementCheck::thisRequirement;
		
	}
	
	/**
	 * requirementChecks is the base feature of all requirement usages.
	 */
	abstract requirement requirementChecks: RequirementCheck[0..*] nonunique :> constraintChecks;
	
	/**
	 * satisfiedRequirementChecks is the subset of requirementChecks for Requirements asserted to be satisfied.
	 */
	abstract requirement satisfiedRequirementChecks :> requirementChecks, assertedConstraintChecks;

	/**
	 * notSatisfiedRequirementChecks is the subset of requirementChecks for Requirements asserted to be not satisfied.
	 */
	abstract requirement notSatisfiedRequirementChecks: RequirementCheck[0..*] :> requirementChecks, negatedConstraintChecks;
	
	/**
	 * concernChecks is the base feature of all ConcernUsages.
	 */
	abstract concern concernChecks: ConcernCheck[0..*] nonunique :> requirementChecks;
	
}