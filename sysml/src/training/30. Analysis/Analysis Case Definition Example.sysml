package 'Analysis Case Definition Example' {
	import 'Calculation Definitions'::*;
	import 'Analytical Constraints'::*;
	import USCustomaryUnits::*;
	import BaseFunctions::size;
	import Quantities::ScalarQuantityValue;
	
	attribute def DistancePerVolumeValue :> ScalarQuantityValue;
    attribute gallon = 231.0 * 'in' ** 3;

	part def Vehicle {
        attribute mass : MassValue;
        attribute cargoMass : MassValue;
        
        attribute wheelDiameter : LengthValue;
        attribute driveTrainEfficiency : Real;
        
        attribute fuelEconomy_city : DistancePerVolumeValue;
        attribute fuelEconomy_highway : DistancePerVolumeValue;
    }
    
	analysis def FuelEconomyAnalysis {
		subject vehicle : Vehicle;
		return fuelEconomyResult : DistancePerVolumeValue;
		
		objective fuelEconomyAnalysisObjective {
			/*
			 * The objective of this analysis is to determine whether the
			 * subject vehicle can satisfy the fuel economy requirement.
			 */
			
			assume constraint {
				vehicle::wheelDiameter == 33@['in'] &
				vehicle::driveTrainEfficiency == 0.4
			}
			
			require constraint {
				fuelEconomyResult > 30@[mi / gallon]
			}
		}
	    
		in attribute scenario[*] {
			time : TimeValue;
			position : LengthValue;
			velocity : SpeedValue;
		}
	
		action solveForPower {
			out power : PowerValue[*];
			out acceleration : AccelerationValue[*];
		
			/*
			 * Solve for the required engine power as a function of time
			 * to support the scenario.
			 */
			assert constraint {
				{1..size(scenario)-1}->forAll i (
					StraightLineDynamicsEquations (
						power[i],
						vehicle::mass,
						scenario::time[i+1] - scenario::time[i],
						scenario::position[i],
						scenario::velocity[i],
						scenario::position[i+1],
						scenario::velocity[i+1],
						acceleration[i+1]                    
					)
				)
			}
		}
		
		then action solveForFuelConsumption {
			in power : PowerValue[*] = solveForPower::power;
			out fuelEconomy : DistancePerVolumeValue = fuelEconomyResult;
		
			/*
			 * Solve the engine equations to determine how much fuel is
			 * consumed.
			 */
		}
	}
}