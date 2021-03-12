package 'Trade Study Analysis Example' {
	import ScalarValues::Real;
	import TradeStudies::*;
	
	part def Engine;
	part engine4cyl : Engine;
	part engine6cyl : Engine;
	
	calc def PowerRollup(engine : Engine) : ISQ::PowerValue;
	calc def MassRollup(engine : Engine) : ISQ::PowerValue;
	calc def EfficiencyRollup(engine : Engine): ISQ::PowerValue;
	calc def CostRollup(engine : Engine) : ISQ::PowerValue;
	
	calc def EngineEvaluation 
		(power : ISQ::PowerValue, mass : ISQ::MassValue, efficiency : Real, cost : Real) 
		evaluation : Real {
			// Compute evaluation...
		}
		
	analysis engineTradeStudy : TradeStudy {
		subject : Engine = {engine4cyl, engine6cyl};
		objective : MaximizeObjective;

		calc :>> objectiveFunction {
			in part engine :>> alternative : Engine;
			
			calc powerRollup: PowerRollup (engine) return power : ISQ::PowerValue;
			calc massRollup: MassRollup (engine) return mass : ISQ::MassValue;
			calc efficiencyRollup: EfficiencyRollup (engine) return efficiency : Real;
			calc costRollup: CostRollup (engine) return cost : Real;
			
			return :>> result : Real = EngineEvaluation(
				powerRollup::power, massRollup::mass, efficiencyRollup::efficiency, costRollup::cost
			);
		}
		
		return part :>> selectedAlternative : Engine;
	}
	
}