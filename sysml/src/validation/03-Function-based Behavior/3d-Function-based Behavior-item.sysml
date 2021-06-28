package '3d-Function-based Behavior-item' {
	import ScalarValues::Real;
	import Definitions::*;
	import Usages::*;
	
	package Definitions {
		
		item def Fuel;
		
		port def FuelPort {
			out item fuel: Fuel;
		}
				
		part def Pump {
			port fuelInPort : ~FuelPort;
			port fuelOutPort : FuelPort;
		}
		
		part def StorageTank {
			port fuelOutPort : FuelPort;
		}
		
		part def FuelTank {
			port fuelInPort : ~FuelPort;
		}
		
		part def Vehicle {
			port fuelInPort : ~FuelPort;
		}
		
		action def PumpFuel (
			in fuelIn : Fuel,
			out fuelOut : Fuel
		);
		
	}
	
	package Usages {
		
		part context {
			
			/* Storage Element */
			part storageTank : StorageTank;
			
			/**
			 * Note: Explicitly notating that the stream is "of fuel : Fuel" is optional.
			 */
			stream of  fuel : Fuel
				from storageTank.fuelOutPort.fuel to pump.fuelInPort.fuel;
			
			part pump : Pump {
				perform action pumpFuel : PumpFuel (
					in fuelIn = fuelInPort.fuel,
					out fuelOut = fuelOutPort.fuel
				);
			}
			
			stream of fuel : Fuel
				from pump.fuelOutPort.fuel to vehicle.fuelInPort.fuel;
			
			part vehicle : Vehicle {
				/** 
				 * Note: The semantics of flowing to a "stored item" is tentative.
				 */
				stream fuelInPort.fuel to fuelTank.fuel;
				
				/* Storage Element */
				part fuelTank : FuelTank {
					attribute volumeMax : Real;
					attribute fuelLevel : Real = fuel.volume / volumeMax;
					
					 /* Stored Item */
					item fuel : Fuel {
						attribute volume : Real;
						/* isConserved = true */
					}
				}
			}
		}
	}
}