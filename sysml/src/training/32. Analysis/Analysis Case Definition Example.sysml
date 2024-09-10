package 'Analysis Case Definition Example' {
	private import ScalarValues::Real;
	private import 'Calculation Definitions'::*;
	private import 'Analytical Constraints'::*;
	private import USCustomaryUnits::*;
	private import SequenceFunctions::size;
	private import Quantities::ScalarQuantityValue;
	private import ControlFunctions::*;
	private import ScalarValues::Positive;
	
	attribute def DistancePerVolumeValue :> ScalarQuantityValue;

	part def Vehicle {
        attribute mass : MassValue;
        attribute cargoMass : MassValue;
        
        attribute wheelDiameter : LengthValue;
        attribute driveTrainEfficiency : Real;
        
        attribute fuelEconomy_city : DistancePerVolumeValue;
        attribute fuelEconomy_highway : DistancePerVolumeValue;
    }
    
    attribute def WayPoint {
		time : TimeValue;
		position : LengthValue;
		speed : SpeedValue;    	
	}
    
	analysis def FuelEconomyAnalysis {
		subject vehicle : Vehicle;
		objective fuelEconomyAnalysisObjective {
			/*
			 * The objective of this analysis is to determine whether the
			 * subject vehicle can satisfy the fuel economy requirement.
			 */
			
			assume constraint {
				vehicle.wheelDiameter == 33 ['in'] &
				vehicle.driveTrainEfficiency == 0.4
			}
			
			require constraint {
				fuelEconomyResult > 30 [mi / gal]
			}
		}
	    
		in attribute scenario : WayPoint[*];
	
		action solveForPower {
			out power : PowerValue[*];
			out acceleration : AccelerationValue[*];
		
			/*
			 * Solve for the required engine power as a function of time
			 * to support the scenario.
			 */
			assert constraint {
				(1..size(scenario)-1)->forAll {in i: Positive;
					StraightLineDynamicsEquations (
						power#(i),
						vehicle.mass,
						scenario.time#(i+1) - scenario.time#(i),
						scenario.position#(i),
						scenario.speed#(i),
						scenario.position#(i+1),
						scenario.speed#(i+1),
						acceleration#(i+1)                    
					)
				}
			}
		}
		
		then action solveForFuelConsumption {
			in power : PowerValue[*] = solveForPower.power;
			out fuelEconomy : DistancePerVolumeValue;
		
			/*
			 * Solve the engine equations to determine how much fuel is
			 * consumed.
			 */
		}
		
        return fuelEconomyResult : DistancePerVolumeValue = solveForFuelConsumption.fuelEconomy;
	}
}