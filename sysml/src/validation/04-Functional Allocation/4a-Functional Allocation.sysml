package '4a-Functional Allocation' {
	import '2a-Parts Interconnection'::*;
	import '3a-Function-based Behavior-1'::*;
	import '3a-Function-based Behavior-1'::'provide power'::*;
		
	part vehicle1_c1_functional_allocation :> vehicle1_c1 {
		// Note: The definitions of the port types in '2a-Parts Interconnection' do not include 
		// flow properties.
		port fuelCmdPort :>> vehicle1_c1::fuelCmdPort {
			in fuelCmd: FuelCmd;
		}

		/**
		 * This allocates the action '3a-Function-based Behavior-1'::'provide power' as an enacted 
		 * performance of 'vehicle_c1_functional_allocation'.
		 */
		perform 'provide power' {
			// This assigns the fuelCmdPort to provide the input to 'provide power'.
			in fuelCmd = fuelCmdPort::fuelCmd;
		}
		
		//*
		// The above is semantically equivalent to:
		
		ref action 'provide power' (in fuelCmd = fuelCmdPort::fuelCmd) 
		   :> '3a-Function-based Behavior'::'provide power', enactedPerformances;		
			
		// For a composite enacted performance within the vehicle, replace the above with:
		
		action 'provide power' (in fuelCmd = fuelCmdPort::fuelCmd) 
		   :>> '3a-Function-based Behavior'::'provide power';
		*/
		
		part engine :>> vehicle1_c1::engine {
			port fuelCmdPort :>> vehicle1_c1::engine::fuelCmdPort {
				in fuelCmd: FuelCmd;
			}
			
			/**
			 *  This allocates one of the sub-steps of 'provide power' to a sub-part of vehicle_c1. 
			 */ 
			perform 'generate torque' {
				in fuelCmd = fuelCmdPort::fuelCmd;
				out engineTorque = drivePwrPort::engineTorque;
			}
			
			port drivePwrPort :>> vehicle1_c1::engine::drivePwrPort {
				out engineTorque: Torque;
			}
		}
		
		part transmission :>> vehicle1_c1::transmission {
			port clutchPort :>> vehicle1_c1::transmission::clutchPort {
				in attribute engineTorque: Torque;
			}
			
			perform 'amplify torque' {
				in engineTorque = clutchPort::engineTorque; 
				out transmissionTorque = shaftPort_a::transmissionTorque;
			}

			port shaftPort_a :>> vehicle1_c1::transmission::shaftPort_a {
				out transmissionTorque: Torque;
			}
		}
		
		part driveshaft :>> vehicle1_c1::driveshaft {
			port shaftPort_b :>> Driveshaft::shaftPort_b {
				in transmissionTorque: Torque;
			}

			perform 'transfer torque' {
				in transmissionTorque = shaftPort_b::transmissionTorque; 
				out driveshaftTorque = shaftPort_c::driveshaftTorque;
			}

			port shaftPort_c :>> Driveshaft::shaftPort_c {
				out driveshaftTorque: Torque;
			}			
		}
		
		part rearAxleAssembly :>> vehicle1_c1::rearAxleAssembly {
			port shaftPort_d :>> vehicle1_c1::rearAxleAssembly::shaftPort_d {
				in driveshaftTorque: Torque;
			}
				
			perform 'distribute torque' {
				in driveshaftTorque = shaftPort_d::driveshaftTorque; 
				out wheelTorque1 = rearAxle::leftHalfAxle::axleToWheelPort::wheelTorque; 
				out wheelTorque2 = rearAxle::rightHalfAxle::axleToWheelPort::wheelTorque;
			}
			
			part rearAxle :>> vehicle1_c1::rearAxleAssembly::rearAxle {
				part leftHalfAxle :>> vehicle1_c1::rearAxleAssembly::rearAxle::leftHalfAxle {
					port axleToWheelPort :>> vehicle1_c1::rearAxleAssembly::rearAxle::leftHalfAxle::leftAxleToWheelPort {
						out wheelTorque: Torque;
					}
				}
				part rightHalfAxle :>> vehicle1_c1::rearAxleAssembly::rearAxle::rightHalfAxle {
					port axleToWheelPort :>> vehicle1_c1::rearAxleAssembly::rearAxle::rightHalfAxle::rightAxleToWheelPort {
						out wheelTorque: Torque;
					}
				}
			}
		}
	}
}