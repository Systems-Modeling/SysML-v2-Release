package VehicleDefinitions {
	doc
	/*
	 * Example vehicle definitions model.
	 */

	import ScalarValues::*;
	import Quantities::*;
	import MeasurementReferences::*;
	import ISQ::*;
	import SI::*;
	
	/* PART DEFINITIONS */
	
	part def Vehicle;	
	part def Transmission;	
	part def AxleAssembly;
	part def Axle {
		port leftMountingPoint: AxleMountIF;
		port rightMountingPoint: AxleMountIF;
	}
	part def Wheel {
		port hub: WheelHubIF;
	}
	part def Lugbolt {
		attribute tighteningTorque :> ISQ::torque;
	}
	
	/* PORT DEFINITIONS */
	
	port def DriveIF { 
		in driveTorque :> ISQ::torque;
	}
	
	port def AxleMountIF { 
		out transferredTorque :> ISQ::torque;
	}
	
	port def WheelHubIF { 
		in appliedTorque :> ISQ::torque;
	}
	
	/* INTERFACE DEFINITIONS */
	
	interface def Mounting {
		doc /* The definition of the interface for mounting a Wheel to an Axle. */
		end axleMount: AxleMountIF;
		end hub: WheelHubIF;
		
		flow axleMount.transferredTorque to hub.appliedTorque;
	}
}