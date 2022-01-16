package 'Individuals and Snapshots Example' {
	import 'Part Definition Example'::*;
	
	individual item def PhysicalContext;
	individual part def Vehicle_1 :> Vehicle;
	
	individual item context : PhysicalContext {
		
		snapshot part vehicle_1_t0 : Vehicle_1 {
			:>> mass = 2000.0;
			:>> status {
				:>> gearSetting = 0;
				:>> acceleratorPosition = 0.0;
			}
		}
		
		snapshot part vehicle_1_t1 : Vehicle_1 {
			:>> mass = 1500.0;
			:>> status {
				:>> gearSetting = 2;
				:>> acceleratorPosition = 0.5;
			}
		}
		
		first vehicle_1_t0 then vehicle_1_t1;	
	}
}