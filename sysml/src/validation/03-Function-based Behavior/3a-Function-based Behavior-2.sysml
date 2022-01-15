package '3a-Function-based Behavior-2' {
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
	
		action 'provide power': 'Provide Power'(
			in fuelCmd: FuelCmd, 
			out wheelTorque1: Torque, 
			out wheelTorque2: Torque
		) {
			// ITEM FLOW PART
			
			/**
			 * The binding connector shorthand can be used on action parameters.
			 */
			action 'generate torque': 'Generate Torque'(
				in fuelCmd = 'provide power'::fuelCmd,
				out engineTorque: Torque
			);
			
			/**
			 * There is also a shorthand for flowing into an input parameter.
			 */
			action 'amplify torque': 'Amplify Torque'(
				in engineTorque flow from 'generate torque'.engineTorque, 
				out transmissionTorque
			);
			
			action 'transfer torque': 'Transfer Torque'(
				in transmissionTorque flow from 'amplify torque'.transmissionTorque, 
				out driveshaftTorque
			);
						
			action 'distribute torque': 'Distribute Torque'(
				in driveshaftTorque flow from 'transfer torque'.driveshaftTorque, 
				out wheelTorque1 = 'provide power'::wheelTorque1, 
				out wheelTorque2 = 'provide power'::wheelTorque2
			);
			
			// CONTROL FLOW PART

			/*
			 * The following uses a shorthand for a sequence of successions.
			 * The source of the first first is given by "first start",
			 * and the target of each succeeding first is indicated by
			 * using the "then" keyword.
			 */
			first start;
			then merge continue;	
			then action engineStarted accept engineStart: EngineStart;			
			then action engineStopped accept engineOff: EngineOff;	
			then continue;
			
			/* Enable torque generation. */
			first engineStarted then 'generate torque';
			first engineStarted then 'amplify torque';
			first engineStarted then 'transfer torque';
			first engineStarted then 'distribute torque';
			
			/* Disable torque generation. */
			first 'generate torque' then engineStopped;		
			first 'amplify torque' then engineStopped;		
			first 'transfer torque' then engineStopped;		
			first 'distribute torque' then engineStopped;		
		}
	
	}
}