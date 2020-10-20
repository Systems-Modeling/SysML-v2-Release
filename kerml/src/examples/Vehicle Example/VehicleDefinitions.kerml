/**
 * Example vehicle definitions model.
 **/
package VehicleDefinitions {
	import ScalarValues::*;
	import Quantities::*;
	import UnitsAndScales::*;
	import ISQ::*;
	import SI::*;
	
	/* BLOCKS */
	
	class Vehicle;	
	class Transmission;	
	class AxleAssembly;
	class Axle;	
	class Wheel;
	class Lugbolt {
		tighteningTorque is ISQ::torque;
	}
	
	/* INTERFACE BLOCKS */
	
	class DriveIF { 
		in driveTorque is ISQ::torque;
	}
	
	class AxleMountIF { 
		out transferredTorque is ISQ::torque;
	}
	
	class WheelHubIF { 
		in appliedTorque is ISQ::torque;
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