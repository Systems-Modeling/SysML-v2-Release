package VehicleUsages {
	doc
	/*
	 * Example usages of elements from the vehicle definitions model.
	 */
	 
	private import VehicleDefinitions::*;

	/* VALUES */
		 
	feature T1 = 10.0;
	feature T2 = 20.0;
	
	/* PARTS */	
	
	feature narrowRimWheel: Wheel {
		doc /* Narrow-rim wheel configuration with 4 to 5 lugbolts. */
		composite lugbolt: Lugbolt[4..5];
	}
		
	feature wideRimWheel: Wheel {
		doc /* Wide-rim wheel configuration with 4 to 6 lugbolts. */
		composite lugbolt: Lugbolt[4..6];
	}

	feature vehicle_C1: Vehicle {
		doc /* Basic Vehicle configuration showing a part hierarchy. */
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
	
	feature vehicle_C2 subsets vehicle_C1 {
		doc /* Specialized configuration with part-specific ports. */
		composite frontAxleAssembly redefines vehicle_C1::frontAxleAssembly {
			composite leftFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel#(1) {
				composite hub: VehicleDefinitions::WheelHubIF;
			}
			composite rightFrontWheel subsets vehicle_C1::frontAxleAssembly::frontWheel = vehicle_C1::frontAxleAssembly::frontWheel#(2) {
				feature hub: VehicleDefinitions::WheelHubIF;
			}
			
			composite frontAxle redefines vehicle_C1::frontAxleAssembly::frontAxle {
				composite leftMountingPoint: AxleMountIF;
				composite rightMountingPoint: AxleMountIF;
			}
		
			connector leftFrontMount: Mounting from 
				frontAxle.leftMountingPoint to leftFrontWheel.hub;
				
			connector rightFrontMount: Mounting from 
				frontAxle.rightMountingPoint to rightFrontWheel.hub;
		}
		
		composite rearAxleAssembly redefines vehicle_C1::rearAxleAssembly {
			composite leftRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel#(1) {
				feature hub: WheelHubIF;
			}
			composite rightRearWheel subsets vehicle_C1::rearAxleAssembly::rearWheel = vehicle_C1::rearAxleAssembly::rearWheel#(2) {
				feature hub: WheelHubIF;
			}

			composite rearAxle redefines vehicle_C1::rearAxleAssembly::rearAxle {
				feature leftMountingPoint: AxleMountIF;
				feature rightMountingPoint: AxleMountIF;
			}
			
			connector leftRearMount: Mounting from 
				rearAxle.leftMountingPoint to leftRearWheel.hub;
				
			connector rightRearMount: Mounting from 
				rearAxle.rightMountingPoint to rightRearWheel.hub;
		}		
	}
	
	feature vehicle_C3 subsets vehicle_C2 {
		doc /* Further specialized configuration with a connector to a deeply-nested feature. */
		composite transmission: Transmission {
			out feature drive: DriveIF;
		}
		
		composite rearAxleAssembly redefines vehicle_C2::rearAxleAssembly {
			composite rearAxle redefines vehicle_C2::rearAxleAssembly::rearAxle {
				in feature drive: DriveIF;
			}
		}
		
		connector driveShaft from 
			transmission.drive to rearAxleAssembly.rearAxle.drive;			
	}
}