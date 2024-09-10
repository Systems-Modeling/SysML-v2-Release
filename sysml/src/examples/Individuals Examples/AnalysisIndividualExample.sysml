package AnalysisIndividualExample {
    private import ScalarValues::*;
    private import Quantities::*;
    private import ISQ::*;
    private import USCustomaryUnits::*;
    
	package VehicleQuantities {
	    private import MeasurementReferences::*;
	    
	    attribute def DistancePerVolumeUnit :> DerivedUnit {
	    	private attribute distancePF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
	        private attribute volumePF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
	        attribute :>> quantityDimension { :>> quantityPowerFactors = (distancePF, volumePF); }
	    }

	    attribute def DistancePerVolumeValue :> ScalarQuantityValue {
	        :>> num : Real;
	        :>> mRef : DistancePerVolumeUnit;
	    }
	    
	    attribute gallon : VolumeUnit = 231.0 * 'in' ** 3;
	    attribute mpg : DistancePerVolumeUnit = 'mi' / gallon;
	    attribute hp : PowerUnit = 745.7[SI::W];
	}
	
	package VehicleModel {
	    public import VehicleQuantities::*;
	    
	    part def Vehicle {
	    	attribute power :> ISQ::power;
	    }
	    
	    part def Engine {
	    	attribute peakPower :> ISQ::power;
	    	attribute fuelEfficiency : Real;
	    }
	    
	    part vehicle_c1 : Vehicle {
	    	attribute :>> power = engine.peakPower;
	    	part engine : Engine[1];
	    }
	}
	
	package FuelEconomyAnalysisModel {
	    private import VehicleModel::*;
	    private import SequenceFunctions::size;
	    private import SampledFunctions::SampledFunction;
	    private import SampledFunctions::SamplePair;
	    private import ControlFunctions::forAll;
	    
	    action def FuelConsumption {
			in power : PowerValue[*];
			out fuelEconomy : DistancePerVolumeValue;
		}
		
		analysis def FuelEconomyAnalysis {
			subject vehicle: Vehicle;

		    action fuelConsumption : FuelConsumption {
		    	in power = vehicle.power;
		        out fuelEconomy : DistancePerVolumeValue;
	        }
	        
			return calculatedFuelEconomy : DistancePerVolumeValue =
				fuelConsumption.fuelEconomy;	        
	    }
	}
	
	package IndividualAnalysisModel {
		private import VehicleModel::*;
		private import FuelEconomyAnalysisModel::*;
		
		individual part def Vehicle_1 :> Vehicle;
		individual part def Engine_1 :> Engine;
		
		individual analysis def FuelEconomyAnalysis_1 :> FuelEconomyAnalysis;
		individual action def FuelConsumption_1 :> FuelConsumption;
		
		individual analysis fuelEconomyAnalysis_1 : FuelEconomyAnalysis_1 {
			subject vehicle : Vehicle_1 :> vehicle_c1 {
				individual part :>> engine : Engine_1 {
					attribute :>> peakPower = 200[hp];
					attribute :>> fuelEfficiency = 0.4;
				}
			}
			individual action :>> fuelConsumption : FuelEconomyAnalysis_1 {
				snapshot :>> done :> fuelConsumption {
					out :>> fuelEconomy = 35[mph];
				}
			}
		}
		
	}
	
}