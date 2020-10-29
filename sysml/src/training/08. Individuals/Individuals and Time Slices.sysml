package 'Individuals and Time Slices' {
	import 'Individuals and Snapshots Example'::*;
	
	individual def Alice :> Person;
	individual def Bob :> Person;
	
	individual : Vehicle_1 {
		
		timeslice aliceDriving {
			ref individual :>> driver : Alice;

			snapshot :>> start {
				:>> mass = 2000.0;
			}
			
			snapshot :>> done {
				:>> mass = 1500.0;
			}			
		}
		
		then timeslice bobDriving {
			ref individual :>> driver : Bob;
		}
		
	}
}