package '10b-Trade-off Among Alternative Configurations' {
	import ScalarValues::Real;
	import TradeStudies::*;
	import Definitions::*;
	import Usages::*;
	
	package Definitions {
		
		part def Vehicle;
		
		part def Engine {
			power : ISQ::PowerValue;
			mass : ISQ::MassValue;
			efficiency : Real;
			reliability : Real;
			cost : Real;
		}
		
		part def Piston;
		part def Cylinder;
		part def ConnectingRod;
		part def CrankShaft;
		
		part def '4CylCrankShaft' :> CrankShaft;
		part def '6CylCrankShaft' :> CrankShaft;
		
	}
	
	package Usages {
		
		part engine : Engine {
			part cyl[*] : Cylinder {
				part p[1] : Piston;
				part rod[1] : ConnectingRod;
			}
			
			part cs : CrankShaft;
		}
		
		variation part engineChoice :> engine {
			variant part '4cylEngine' {
				part :>> cyl[4];
				part :>> cs : '4CylCrankShaft';
			}
			
			variant part '6cylEngine' {
				part :>> cyl[6];
				part :>> cs : '6CylCrankShaft';
			}
		}
		
		part vehicle : Vehicle {
			part engine[1] :> engineChoice = '6cylEngine' {
				assert constraint engineSelectionRational { 
					doc /* Selected the best engine based on the 'engineTradeStudy'. */
					engine == Analysis::engineTradeStudy::selectedAlternative
				}
			}
			
		}
	}
	
	package Analysis {

		/** Evaluation function with criteria power, mass, efficency and cost. */
		calc def EngineEvaluation 
			(power : ISQ::PowerValue, mass : ISQ::MassValue, efficiency : Real, cost : Real) 
			evaluation : Real {
				// Compute evaluation...
			}
			
		analysis engineTradeStudy : TradeStudy {
			subject : Engine[1..*] = all engineChoice;
			objective : MaximizeObjective;

			calc :>> objectiveFunction {
				in part engine :>> alternative : Engine;
				
				calc powerRollup (engine) return power:>ISQ::power;
				calc massRollup (engine) return mass:>ISQ::mass;
				calc efficiencyRollup (engine) return efficiency: Real;
				calc costRollup (engine) return cost: Real;
				
				return :>> result : Real = EngineEvaluation(
					powerRollup::power, massRollup::mass, efficiencyRollup::efficiency, costRollup::cost
				);
			}
			
			return part :>> selectedAlternative : Engine;
		}
        
	}
	
}