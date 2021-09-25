/**
 * This package defines metadata for annotating model elements with assessments of risk.
 */
package RiskMetadata {
	import ScalarValues::Real;
	
	/**
	 * A Level is a Real number in the interval 0.0 to 1.0, inclusive.
	 */
	attribute def Level :> Real {
		private attribute level : Level :>> self;
		assert constraint { level >= 0.0 and level <= 1.0 }
	}
	
	/**
	 * LevelEnum provides standard probability Levels for low, medium and high risks.
	 */
	enum def LevelEnum :> Level {
		L = 0.25;
		M = 0.50;
		H = 0.75;
	}

	/**
	 * RiskLevel gives the probability of a risk occurring and, optionally, the impact
	 * if the risk occurs.
	 */
	attribute def RiskLevel {
		/**
		 * The probability that a risk will occur.
		 */
		attribute probability : Level;
		
		/*
		 * The impact of the risk if it occurs (with 0.0 being no impact and 1.0 being 
		 * the most severe impact).
		 */
		attribute impact : Level [0..1];
	}
	
	/*
	 * RiskLevelEnum enumerates standard RiskLevels for low, medium and high risks
	 * (without including impact).
	 */
	enum def RiskLevelEnum :> RiskLevel {
		L = RiskLevel(probability = LevelEnum::L);
		M = RiskLevel(probability = LevelEnum::M);
		H = RiskLevel(probability = LevelEnum::H);
	}
	
	/**
	 * Risk is used to annotate a model element with an assessment of the risk related to it
	 * in some typical risk areas.
	 */
	attribute def Risk {
		/**
		 * The total risk associated with the annotated element.
		 */
		attribute totalRisk : RiskLevel [0..1];
		
		/**
		 * The risk of unresolved technical issues regarding the annotated element.
		 */
		attribute technicalRisk : RiskLevel [0..1];
		
		/**
		 * The risk that work on the annotated element will not be completed on schedule.
		 */
		attribute scheduleRisk : RiskLevel [0..1];
		
		/**
		 * The risk that work on the annotated element will exceed its planned cost.
		 */
		attribute costRisk : RiskLevel [0..1];
	}
	
}