package '7b-Variant Configurations' {
	private import RequirementsModel::*;
	private import DesignModel::*;
	private import VariantDefinitions::*;
	private import ControlFunctions::forAll;
	
	package RequirementsModel {
		requirement def EnginePerformanceRequirement;
		requirement highPerformanceRequirement : EnginePerformanceRequirement;
		requirement normalPerformanceRequirement : EnginePerformanceRequirement;
	}
	
	package DesignModel {
		part def Vehicle;
		part def Engine;
		part def Transmission;
		part def Clutch;
		part def Driveshaft;
		part def RearAxleAssembly;
		part def Wheel;
		
		port def FuelCmdPort;
		port def ClutchPort;
		port def ShaftPort_b;
		port def ShaftPort_c;
		port def ShaftPort_d;
		port def VehicleToRoadPort;
		port def WheelToRoadPort;
		
		part vehicle : Vehicle {
			port fuelCmdPort;
			
			bind fuelCmdPort = engine.fuelCmdPort;
			
			part engine : Engine[1] {
				port fuelCmdPort : FuelCmdPort;
			}
			
			part transmission : Transmission[1] {
				part clutch: Clutch[1] {
					port clutchPort : ClutchPort;
				}
			}
			
			part driveshaft : Driveshaft[1] {
				port shaftPort_b : ShaftPort_b;
				port shaftPort_c : ShaftPort_c;
			}
			
			part rearAxleAssembly : RearAxleAssembly {
				part rearWheels : Wheel[2] {
					port wheelToRoadPort : WheelToRoadPort;
				}
			}
			
			port vehicleToRoadPort : VehicleToRoadPort {
				port wheelToRoadPort : WheelToRoadPort[2];
			}
		}
	}
	
	package VariantDefinitions {
		part def '4CylEngine' :> Engine;
		part def '6CylEngine' :> Engine;
		
		part def ManualTransmission :> Transmission;
		part def AutomaticTransmission :> Transmission;
		
		part def ManualClutch :> Clutch;
		part def AutomaticClutch :> Clutch;
		
		port def ManualClutchPort :> ClutchPort;
		port def AutomaticClutchPort :> ClutchPort;
		
		part def NarrowRimWheel :> Wheel;
		part def WideRimWheel :> Wheel;		
	}
	
	package VariabilityModel {
		part anyVehicleConfig :> vehicle {
			
			variation requirement engineRqtChoice : EnginePerformanceRequirement {
				variant highPerformanceRequirement;
				variant normalPerformanceRequirement;
			}
			
			variation part engineChoice :>> engine {
				variant part '4cylEngine' : '4CylEngine';
				variant part '6cylEngine' : '6CylEngine';
			}
			
			satisfy engineRqtChoice by engineChoice;
			
			assert constraint 'engine choice constraint' {
				if engineRqtChoice == engineRqtChoice::highPerformanceRequirement? 
					engineChoice == engineChoice::'6cylEngine' 
				else
					engineChoice == engineChoice::'4cylEngine'
			}
			
			variation part transmissionChoice :>> transmission {
				variant part manualTransmission : ManualTransmission {
					part :>> clutch : ManualClutch {
						port :>> clutchPort : ManualClutchPort;
					}
				}
				variant part automaticTransmission : AutomaticTransmission {
					part :>> clutch : AutomaticClutch {
						port :>> clutchPort : AutomaticClutchPort;
					}
				}
			}
			
			assert constraint 'engine-transmission selection constraint' {
				(engineChoice == engineChoice::'4cylEngine' and transmissionChoice == transmissionChoice::manualTransmission) xor
				(engineChoice == engineChoice::'6cylEngine' and transmissionChoice == transmissionChoice::automaticTransmission)
			}
			
			part :>> rearAxleAssembly {
				variation part rearWheelChoice :>> rearWheels {
					variant part narrowRimWheel : NarrowRimWheel;
					variant part wideRimWheel : WideRimWheel;
				}
			
    			assert constraint 'engine-wheel selection constraint' {
    				(engineChoice == engineChoice::'4cylEngine' and 
    					rearWheelChoice->forAll {in ref w; w == rearWheelChoice::narrowRimWheel}) xor
    				(engineChoice == engineChoice::'6cylEngine' and 
    					rearWheelChoice->forAll {in ref w; w == rearWheelChoice::wideRimWheel})
    			}
            }
			
		}
		
		variation part vehicleChoice :> anyVehicleConfig {
			variant part vehicle_c1;
			variant part vehicle_c2;
		}	
	}
}