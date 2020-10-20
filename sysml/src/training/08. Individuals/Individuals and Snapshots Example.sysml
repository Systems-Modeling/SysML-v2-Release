package 'Individuals and Snapshots Example' {
	import 'Part Definition Example'::*;
	
	individual def PhysicalContext;
	individual def Vehicle_1 :> Vehicle;
	
	individual context : PhysicalContext {
		
		snapshot vehicle_1_t0 : Vehicle_1 {
			:>> mass = 2000.0;
			:>> status {
				:>> gearSetting = 0;
				:>> acceleratorPosition = 0.0;
			}
		}
		
		snapshot vehicle_1_t1 : Vehicle_1 {
			:>> mass = 1500.0;
			:>> status {
				:>> gearSetting = 2;
				:>> acceleratorPosition = 0.5;
			}
		}
		
		succession vehicle_1_t0 then vehicle_1_t1;	
	}
}