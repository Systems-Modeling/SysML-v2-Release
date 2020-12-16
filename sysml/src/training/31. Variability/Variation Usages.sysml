package 'Variation Usages' {
	import 'Variation Definitions'::*;
	
	part def Vehicle;
	part def Transmission;
	part manualTransmission;
	part automaticTransmission;
	
	abstract part vehicleFamily : Vehicle {
		part engine : EngineChoices[1];
		
		variation part transmission : Transmission[1] {
			variant manualTransmission;
			variant automaticTransmission;
		}
		
		assert constraint {
			(engine == engine::'4cylEngine' &
			 transmission == transmission::manualTransmission) ^
			(engine == engine::'6cylEngine' & 
			 transmission == transmission::automaticTransmission)
		}	
	}
	
}