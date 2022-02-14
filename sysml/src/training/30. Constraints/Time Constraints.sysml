package 'Time Constraints' {
	import ISQ::TemperatureValue;
	import ISQ::DurationValue;
	import Time::TimeInstantValue;
	import Time::TimeOf;
	import Time::DurationOf;
	import SI::h;
	import SI::s;

	attribute def MaintenanceDone;
	
	part def Vehicle {
		attribute maintenanceTime : TimeInstantValue;
		attribute maintenanceInterval : DurationValue;
		attribute maxTemperature : TemperatureValue;
	}
	
	state healthStates {
		in vehicle : Vehicle;
		
		entry; then normal;
		
		state normal;
		accept at vehicle.maintenanceTime
			then maintenance;
		
		state maintenance {
			assert constraint { TimeOf(maintenance) > vehicle.maintenanceTime }
			assert constraint { TimeOf(maintenance) - TimeOf(normal.done) < 2 [s] }
			entry assign vehicle.maintenanceTime := vehicle.maintenanceTime + vehicle.maintenanceInterval;
		}
		accept MaintenanceDone
			then normal;
		
		constraint { DurationOf(maintenance) <= 48 [h] }
	}
}