package '3a-Function-based Behavior-5' {
	import Definitions::*;
	import Usages::*;

	package Definitions {
		alias Torque for ISQ::TorqueValue;
		
		// ATTRIBUTE DEFINITIONS
		
		attribute def FuelCmd;
		
		attribute def EngineStart;
		attribute def EngineOff;
		
		// ACTION DEFINITIONS
		
		action def 'Generate Torque'(in fuelCmd: FuelCmd, out engineTorque: Torque);
		action def 'Amplify Torque'(in engineTorque: Torque, out transmissionTorque: Torque);
		action def 'Transfer Torque'(in transmissionTorque: Torque, out driveshaftTorque: Torque);
		action def 'Distribute Torque'(in driveShaftTorque: Torque, out wheelTorque1: Torque, out wheelTorque2: Torque);
		
		action def 'Provide Power'(in fuelCmd: FuelCmd, out wheelTorque1: Torque, out wheelTorque2: Torque);
	
	}
	
	package Usages {
	
		action 'provide power': 'Provide Power' {
			// PARAMETERS
			
			in fuelCmd: FuelCmd; 
			out wheelTorque1: Torque; 
			out wheelTorque2: Torque;
		
			loop {
				accept engineStart : EngineStart;
				then action {
					action 'generate torque': 'Generate Torque' {
						in fuelCmd = 'provide power'::fuelCmd;
						out engineTorque: Torque;
					}
					
					action 'amplify torque': 'Amplify Torque' {
						in engineTorque flow from 'generate torque'.engineTorque; 
						out transmissionTorque;
					}
					
					action 'transfer torque': 'Transfer Torque' {
						in transmissionTorque flow from 'amplify torque'.transmissionTorque; 
						out driveshaftTorque;
					}
								
					action 'distribute torque': 'Distribute Torque' {
						in driveshaftTorque flow from 'transfer torque'.driveshaftTorque; 
						out wheelTorque1 = 'distribute torque'::wheelTorque1;
						out wheelTorque2 = 'distribute torque'::wheelTorque2;
					}
				}
				then action accept engineOff : EngineOff;
			}	
		}
	
	}
}