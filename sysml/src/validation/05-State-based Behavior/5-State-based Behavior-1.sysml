package '5-State-based Behavior-1' {
	private import ScalarValues::*;
	private import ISQ::*;
	private import '3a-Function-based Behavior-1'::*;
	
	package Definitions {
		part def VehicleA {
			/*
			 * The following declare that 'VehicleA' performs a
			 * 'provide power' action and exhibits some 'vehicle states',
			 * without giving details about these behaviors.
			 */
			perform action 'provide power': 'Provide Power';
			exhibit state 'vehicle states': 'Vehicle States';
		}
		
		part def VehicleController {
			exhibit state 'controller states': 'Controller States';
		}

		/*
		 * Black box specifications for state definitions may also have
		 * input and output parameters, like activities, though none
		 * are used here.
		 */

		state def 'Vehicle States';
		state def 'Controller States';	

		action def 'Perform Self Test';
		action def 'Apply Parking Brake';
		action def 'Sense Temperature' { out temp: TemperatureValue; }
		
		attribute def 'Vehicle Start Signal';
		attribute def 'Vehicle On Signal';
		attribute def 'Vehicle Off Signal';
		
		attribute def 'Start Signal';
		attribute def 'Off Signal';
		attribute def 'Over Temp';
		attribute def 'Return to Normal';
	}
	
	package Usages {
		private import Definitions::*;
		
		/*
		 * These actions are used enabled in the state usage 
		 * 'vehicle states', in addition to 'provide power'.
		 */
		 
		action 'perform self test': 'Perform Self Test';
		action 'apply parking brake': 'Apply Parking Brake';
		action 'sense temperature': 'Sense Temperature';
		
		state 'vehicle states': 'Vehicle States' parallel {
			/*
			 * This is a usage of the state definition 'Vehicle States'.
			 * Note that it depends specifically on on the part 'vehicle1_c1'.
			 */
		
			ref vehicle : VehicleA;

			state 'operational states' {
			doc
			/*
			 * The state definition for this usage is implicit.
			 */
			
				entry action initial {
				doc
				/*
				 * This empty entry action acts like a start pseudo state.
				 */
				}
				
				transition initial then off;
			    
				state off;
				
				transition 'off-starting'
					first off
					accept 'Vehicle Start Signal' 
					if vehicle1_c1.'brake pedal depressed'
					do send new 'Start Signal'() to vehicle1_c1.vehicleController
					then starting {
					/*
					 * The transition definition for a transition usage is always implicit.
					 * "accept" marks the trigger, "if" the guard and "do" the effect.
					 * 
					 * The notation "new 'Start Signal'()" constructs a specific instance of the
					 * 'Start Signal' attribute def to be sent to the 'vehicleController'. If the
					 * attribute def had properties, their values would be given as arguments
					 * inside the parentheses.
					 */						
					}
					
				state starting;
				
				transition 'starting-on'
					first starting
					accept 'Vehicle On Signal'
					then on;
				
				state on {
					/*
					 * A state may have a "entry" action that is performed on entry into
					 * the state, a "do" action that is performed while in the state
					 * and an "exit" action that is performed on exit from the state.
					 */
				
					entry 'perform self test';
					do 'provide power';
					exit 'apply parking brake';
				}
				
				transition 'on-off'
					first on
					accept 'Vehicle Off Signal'
					then off;
			}
			
			state 'health states' {
				/*
				 * 'health states' is concurrent with 'operational states', because the
				 * containing state usage is "parallel".
				 */
			
				entry action initial;
				do 'sense temperature' { out temp; 
					/*
					 * State-behavior actions may have input and output parameters.
					 */
				 }
				
				transition initial then normal;
				
				state normal;
				
				transition 'normal-maintenance'
					first normal
					accept at vehicle1_c1.maintenanceTime
					then maintenance;
				
				transition 'normal-degraded'
					first normal
					accept when 'sense temperature'.temp > vehicle1_c1.Tmax
					do send new 'Over Temp'() to vehicle1_c1.vehicleController 
					then degraded;
				
				state maintenance;
				
				transition 'maintenance-normal'
					first maintenance
					accept 'Return to Normal'
					then normal;
				
				state degraded;
				
				transition 'degraded-normal'
					first degraded
					accept 'Return to Normal'
					then normal;
			}
		}
		
		state 'controller states': 'Controller States' parallel {
			state 'operational controller states' {
				entry action initial; 
				
				transition initial then off;
				
				state off;
				
				transition 'off-on'
					first off
					accept 'Start Signal'
					then on;
				
				state on;
				
				transition 'on-off'
					first on
					accept 'Off Signal'
					then off;
			}
		}		

		part vehicle1_c1: VehicleA {
			port fuelCmdPort {
				in fuelCmd: FuelCmd;
			}
			
			/*
			 * These attribute properties are used in the specification for
			 * 'vehicle states'.
			 */
			attribute 'brake pedal depressed': Boolean;		
			attribute maintenanceTime: Time::DateTime;
			attribute Tmax: TemperatureValue;
			
			perform 'provide power' :>> VehicleA::'provide power' {
				/*
				 * In the context of the 'vehicle1_c1' part, the 'provide power' action
				 * that is enabled in 'vehicle states' gets its input from the 'fuelCmdPort'.
				 */
			
				in fuelCmd = fuelCmdPort.fuelCmd;
			}
			
			exhibit 'vehicle states' :>> VehicleA::'vehicle states' {
				/*
				 * This allocates the state usage 'vehicle states' as the detailed
				 * state-based behavior for 'vehicle1_c1' that fills in the generic
				 * declaration in 'VehicleA'.
				 */
			}
				
			//*
			// The above is semantically equivalent to:
			
			ref state 'vehicle states' :> Usages::'vehicle states', exhibitedStates
				:>> VehicleA::'vehicle states';		
				
			// For a composite state performance within the vehicle, replace the above with:
			
			state 'vehicle states' :>> Usages::'vehicle states', VehicleA::'vehicle states';
			*/

			part vehicleController: VehicleController {
				exhibit 'controller states' :>> VehicleController::'controller states';
			}			
		}
	}
	
}