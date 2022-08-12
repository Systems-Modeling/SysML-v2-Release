package 'Transition Actions' {
	
	attribute def VehicleStartSignal;
	attribute def VehicleOnSignal;
	attribute def VehicleOffSignal;
	
	attribute def ControllerStartSignal;
	
	part def Vehicle {
		brakePedalDepressed : ScalarValues::Boolean;
	}
	part def VehicleController;
	
	action performSelfTest { in vehicle : Vehicle; }
	
	state def VehicleStates;
		
	state vehicleStates : VehicleStates {
		in operatingVehicle : Vehicle;
		in controller : VehicleController;

		entry; then off;
		
		state off;
		accept VehicleStartSignal 
			then starting;
			
		state starting;
		accept VehicleOnSignal
			if operatingVehicle.brakePedalDepressed
			do send ControllerStartSignal() to controller
			then on;
			
		state on {
			entry performSelfTest{ in vehicle = operatingVehicle; }
			do action providePower { /* ... */ }
			exit action applyParkingBrake { /* ... */ }
		}
		accept VehicleOffSignal
			then off;

	}
	
}