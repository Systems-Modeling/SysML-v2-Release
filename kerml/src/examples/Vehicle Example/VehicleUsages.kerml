/**
 * Example usages of elements from the vehicle definitions model.
 **/
package VehicleUsages {
	import SI::N;
	import SI::m;
	import VehicleDefinitions::*;
	import ScalarFunctions::*;

	/* VALUES */	 
	feature T1 = 10.0@[N * m];
	feature T2 = 20.0@[N * m];
	
	/* PARTS */	
	/** Narrow-rim wheel configuration with 4 to 5 lugbolts. **/
	feature narrowRimWheel: Wheel {
		composite lugbolt: Lugbolt[4..5];
	}
	
	/** Wide-rim wheel configuration with 4 to 6 lugbolts. **/	
	feature wideRimWheel: Wheel {
		composite lugbolt: Lugbolt[4..6];
	}

	/** Basic Vehicle configuration showing a part hierarchy. **/
	feature vehicle_C1: Vehicle {
		composite frontAxleAssembly: AxleAssembly {
			composite frontWheel[2] redefines narrowRimWheel {
				composite lugbolt[4] redefines narrowRimWheel::lugbolt {
					feature tighteningTorque redefines Lugbolt::tighteningTorque = T1;
				}
			}
			composite frontAxle: Axle;
		}		
		composite rearAxleAssembly: VehicleDefinitions::AxleAssembly {
			composite rearWheel[2] redefines wideRimWheel {
				composite lugbolt[6] redefines wideRimWheel::lugbolt {
					feature tighteningTorque redefines Lugbolt::tighteningTorque = T2;
				}
			}
			composite rearAxle: Axle;			
		}
	}
	
	/** Specialized configuration with part-specific ports. **/
	feature vehicle_C2 redefines vehicle_C1 {
		composite frontAxleAssembly redefines vehicle_C1::frontAxleAssembly {
			composite leftFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel[1] {
				composite hub: VehicleDefinitions::WheelHubIF;
			}
			composite rightFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel[2] {
				port hub: VehicleDefinitions::WheelHubIF;
			}
			
			composite frontAxle redefines vehicle_C1::frontAxleAssembly::frontAxle {
				composite leftMountingPoint: AxleMountIF;
				composite rightMountingPoint: AxleMountIF;
			}
		
			connector leftFrontMount: Mounting from 
				frontAxle::leftMountingPoint to leftFrontWheel::hub;
				
			connector rightFrontMount: Mounting from 
				frontAxle::rightMountingPoint to rightFrontWheel::hub;
		}
		
		composite rearAxleAssembly redefines vehicle_C1::rearAxleAssembly {
			composite leftRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel[1] {
				port hub: WheelHubIF;
			}
			composite rightRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel[2] {
				port hub: WheelHubIF;
			}

			composite rearAxle redefines vehicle_C1::rearAxleAssembly::rearAxle {
				port leftMountingPoint: AxleMountIF;
				port rightMountingPoint: AxleMountIF;
			}
			
			connector leftRearMount: Mounting from 
				rearAxle::leftMountingPoint to leftRearWheel::hub;
				
			connector rightRearMount: Mounting from 
				rearAxle::rightMountingPoint to rightRearWheel::hub;
		}		
	}
	
	/** Further specialized configuration with a connector to a deeply-nested port. **/
	feature vehicle_C3 redefines vehicle_C2 {
		composite transmission: Transmission {
			out port drive: DriveIF;
		}
		
		composite rearAxleAssembly redefines vehicle_C2::rearAxleAssembly {
			composite rearAxle redefines vehicle_C2::rearAxleAssembly::rearAxle {
				in port drive: DriveIF;
			}
		}
		
		connector driveShaft from 
			transmission::drive to rearAxleAssembly::rearAxle::drive;			
	}
}