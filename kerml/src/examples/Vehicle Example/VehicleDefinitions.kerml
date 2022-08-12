package VehicleDefinitions {
	doc
	/*
	 * Example vehicle definitions model.
	 */

	
	/* BLOCKS */
	
	class Vehicle;	
	class Transmission;	
	class AxleAssembly;
	class Axle;	
	class Wheel;
	class Lugbolt {
		tighteningTorque[1] subsets ISQ::torque;
	}
	
	/* INTERFACE BLOCKS */
	
	class DriveIF { 
		in driveTorque :> ISQ::torque;
	}
	
	class AxleMountIF { 
		out transferredTorque :> ISQ::torque;
	}
	
	class WheelHubIF { 
		in appliedTorque :> ISQ::torque;
	}
	
	/* ASSOCIATION BLOCKS */
	
	assoc Mounting {
		doc
		/*
		 *  mounting a Wheel to an Axle.
		 */
	
		end axleMount: AxleMountIF;
		end hub: WheelHubIF;
	}
}