package 'State Exhibition Example' {
	import 'Transition Actions'::*;
	
	part vehicle : Vehicle {
		
		part vehicleController : VehicleController;
		
		exhibit vehicleStates {
			in ref operatingVehicle = vehicle;
			in ref controller = vehicleController;
		}

	}
	
}