package 'Interaction Realization-1' {
	import 'Interaction Example-1'::*;
	
	part driver_a : Driver {
		perform action driverBehavior {
			action sendSetSpeed send SetSpeed() to vehicle_a;
		}
	}
	
	part vehicle_a : Vehicle {
		part cruiseController_a : CruiseController {
			perform action controllerBehavior {
				action receiveSetSpeed accept SetSpeed via vehicle_a;
				then action receiveSensedSpeed accept SensedSpeed via cruiseController_a;
				then action sendFuelCommand send FuelCommand() to engine_a;
			}
		}
		
		part speedometer_a : Speedometer {
			perform action speedometerBehavior {
				action sendSensedSpeed send SensedSpeed() to cruiseController_a;
			}
		}
		
		part engine_a : Engine {
			perform action engineBehavior {
				action receiveFuelCommand accept FuelCommand via engine_a;
			}
		}
	}
	
	occurrence cruiseControlInteraction_a : CruiseControlInteraction {
		part :>> driver :>> driver_a {
			event driverBehavior.sendSetSpeed[1] :>> setSpeedSent;
		}
		
		part :>> vehicle :>> vehicle_a {
			part :>> cruiseController :>> cruiseController_a {
				event controllerBehavior.receiveSetSpeed[1] :>> setSpeedReceived;
				event controllerBehavior.receiveSensedSpeed[1] :>> sensedSpeedReceived;
				event controllerBehavior.sendFuelCommand[1] :>> fuelCommandSent;
			}
			part :>> speedometer :>> speedometer_a {
				event speedometerBehavior.sendSensedSpeed[1] :>> sensedSpeedSent;
			}
			part :>> engine :>> engine_a {
				event engineBehavior.receiveFuelCommand[1] :>> fuelCommandReceived;
			}
		}
		
		message :> driver_a.driverBehavior.sendSetSpeed.outgoingTransfer :>> setSpeedMessage;
		message :> vehicle_a.speedometer_a.speedometerBehavior.sendSensedSpeed.outgoingTransfer :>> sensedSpeedMessage;
		message :> vehicle_a.cruiseController_a.controllerBehavior.sendFuelCommand.outgoingTransfer :>> fuelCommandMessage;
	}
}