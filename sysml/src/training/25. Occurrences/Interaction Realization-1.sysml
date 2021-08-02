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
			event occurrence :>> setSpeedSent = driverBehavior.sendSetSpeed;
		}
		
		part :>> vehicle :>> vehicle_a {
			part :>> cruiseController :>> cruiseController_a {
				event occurrence :>> setSpeedReceived = controllerBehavior.receiveSetSpeed;
				event occurrence :>> sensedSpeedReceived = controllerBehavior.receiveSensedSpeed;
				event occurrence :>> fuelCommandSent = controllerBehavior.sendFuelCommand;
			}
			part :>> speedometer :>> speedometer_a {
				event occurrence :>> sensedSpeedSent = speedometerBehavior.sendSensedSpeed;
			}
			part :>> engine :>> engine_a {
				event occurrence :>> fuelCommandReceived = engineBehavior.receiveFuelCommand;
			}
		}
		
		message :>> setSpeedMessage = driver_a.driverBehavior.sendSetSpeed.outgoingTransfer;
		message :>> sensedSpeedMessage = vehicle_a.speedometer_a.speedometerBehavior.sendSensedSpeed.outgoingTransfer;
		message :>> fuelCommandMessage = vehicle_a.cruiseController_a.controllerBehavior.sendFuelCommand.outgoingTransfer;
	}
}