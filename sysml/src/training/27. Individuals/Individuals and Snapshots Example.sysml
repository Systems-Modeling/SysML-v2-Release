package 'Individuals and Snapshots Example' {
	public import 'Part Definition Example'::*;
	
	individual part def Vehicle_1 :> Vehicle {
		
		snapshot part vehicle_1_t0 {
			:>> mass = 2000.0;
			:>> status {
				:>> gearSetting = 0;
				:>> acceleratorPosition = 0.0;
			}
		}
		
		snapshot part vehicle_1_t1 {
			:>> mass = 1500.0;
			:>> status {
				:>> gearSetting = 2;
				:>> acceleratorPosition = 0.5;
			}
		}
		
		first vehicle_1_t0 then vehicle_1_t1;
	}
}