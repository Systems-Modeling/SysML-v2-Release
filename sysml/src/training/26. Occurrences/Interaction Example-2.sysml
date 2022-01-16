package 'Interaction Example-2' {
	import 'Event Occurrence Example'::*;
	
	attribute def SetSpeed;
	attribute def SensedSpeed;
	attribute def FuelCommand;
	
	occurrence def CruiseControlInteraction {
		
		ref part driver : Driver {
			event setSpeedMessage.source;
		}
		
		ref part vehicle : Vehicle {
			part cruiseController : CruiseController {
				event setSpeedMessage.target;		
				then event sensedSpeedMessage.target;		
				then event fuelCommandMessage.source;
			}
			
			part speedometer : Speedometer {
				event sensedSpeedMessage.source;
			}
			
			part engine : Engine {
				event fuelCommandMessage.target;
			}
		}
		
		message setSpeedMessage of SetSpeed;	
		then message sensedSpeedMessage of SensedSpeed;
		message fuelCommandMessage of FuelCommand;
	}
}