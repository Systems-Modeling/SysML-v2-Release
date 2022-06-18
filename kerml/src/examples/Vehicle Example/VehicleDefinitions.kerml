/**
 * Example vehicle definitions model.
 **/
package VehicleDefinitions {
	
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
	
	/** An association intended to be used as the type of a connector
	 *  mounting a Wheel to an Axle.
	 **/
	assoc Mounting {
		end axleMount: AxleMountIF;
		end hub: WheelHubIF;
	}
}