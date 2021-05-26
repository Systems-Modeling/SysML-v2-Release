/**
 * Example usages of elements from the vehicle definitions model.
 **/
package VehicleUsages {
	import SI::N;
	import SI::m;
	import VehicleDefinitions::*;
	import ScalarFunctions::*;

	/* VALUES */	 
	T1 = 10.0 [N * m];
	T2 = 20.0 [N * m];
	
	/* PARTS */	
	/** Narrow-rim wheel configuration with 4 to 5 lugbolts. **/
	part narrowRimWheel: Wheel {
		part lugbolt: Lugbolt[4..5];
	}
	
	/** Wide-rim wheel configuration with 4 to 6 lugbolts. **/	
	part wideRimWheel: Wheel {
		part lugbolt: Lugbolt[4..6];
	}

	/** Basic Vehicle configuration showing a part hierarchy. **/
	part vehicle_C1: Vehicle {
		part frontAxleAssembly: AxleAssembly {
			part frontWheel[2] redefines narrowRimWheel {
				part lugbolt[4] redefines narrowRimWheel::lugbolt {
					attribute tighteningTorque redefines Lugbolt::tighteningTorque = T1;
				}
			}
			part frontAxle: Axle;
		}		
		part rearAxleAssembly: VehicleDefinitions::AxleAssembly {
			part rearWheel[2] redefines wideRimWheel {
				part lugbolt[6] redefines wideRimWheel::lugbolt {
					attribute tighteningTorque redefines Lugbolt::tighteningTorque = T2;
				}
			}
			part rearAxle: Axle;			
		}
	}
	
	/** Specialized configuration with part-specific ports. **/
	part vehicle_C2 subsets vehicle_C1 {
		part frontAxleAssembly redefines vehicle_C1::frontAxleAssembly {
			part leftFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel[1] {
				port hub: VehicleDefinitions::WheelHubIF;
			}
			part rightFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel[2] {
				port hub: VehicleDefinitions::WheelHubIF;
			}
			
			part frontAxle redefines vehicle_C1::frontAxleAssembly::frontAxle {
				port leftMountingPoint: AxleMountIF;
				port rightMountingPoint: AxleMountIF;
			}
		
			interface leftFrontMount: Mounting connect 
				frontAxle::leftMountingPoint to leftFrontWheel::hub;
				
			interface rightFrontMount: Mounting connect 
				frontAxle::rightMountingPoint to rightFrontWheel::hub;
		}
		
		part rearAxleAssembly redefines vehicle_C1::rearAxleAssembly {
			part leftRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel[1] {
				port hub: WheelHubIF;
			}
			part rightRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel[2] {
				port hub: WheelHubIF;
			}

			part rearAxle redefines vehicle_C1::rearAxleAssembly::rearAxle {
				port leftMountingPoint: AxleMountIF;
				port rightMountingPoint: AxleMountIF;
			}
			
			interface leftRearMount: Mounting connect 
				rearAxle::leftMountingPoint to leftRearWheel::hub;
				
			interface rightRearMount: Mounting connect 
				rearAxle::rightMountingPoint to rightRearWheel::hub;
		}		
	}
	
	/** Further specialized configuration with a connector to a deeply-nested port. **/
	part vehicle_C3 subsets vehicle_C2 {
		
		part transmission: Transmission {
			port drive: DriveIF;
		}
		
		part rearAxleAssembly redefines vehicle_C2::rearAxleAssembly {
			part rearAxle redefines vehicle_C2::rearAxleAssembly::rearAxle {
				port drive: DriveIF;
			}
		}
		
		interface driveShaft connect 
			transmission::drive to rearAxleAssembly::rearAxle::drive;			
	}
}