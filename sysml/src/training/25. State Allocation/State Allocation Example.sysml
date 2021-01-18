package 'State Allocation Example' {
	import 'Transition Actions'::*;
	
	part vehicle : Vehicle {
		
		part vehicleController : VehicleController;
		
		exhibit vehicleStates (
			operatingVehicle = vehicle,
			controller = vehicleController
		);
	}
	
}