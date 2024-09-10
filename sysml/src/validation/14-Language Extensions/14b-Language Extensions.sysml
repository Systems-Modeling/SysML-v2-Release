package '14b-Language-Extensions' {
	
	package LibraryModel {
		
		part def ECU;
		
	}
	
	package UserModel {
		
		package Definitions {
			private import LibraryModel::*;
			
			part def VehicleControlUnit :> ECU;
			part def EngineControlUnit :> ECU;
			
			part def Vehicle;
			part def Engine;
			part def CanBus;
			
			port def BusIF;
		}
		
		package Usages {
			private import Definitions::*;
			
			part vehicle1: Vehicle {
				part vehicleControlUnit : VehicleControlUnit {
					port busIF: ~BusIF;
				}
				
				connect vehicleControlUnit.busIF to canBus.vehicleControlIF;
				
				part canBus: CanBus {
					port vehicleControlIF: BusIF;
					port engineControlIF: BusIF;
					port sensorIF: BusIF;					
				}
				
				connect engine.engineControlUnit.busIF to canBus.engineControlIF;
				
				part engine: Engine {
					part engineControlUnit: EngineControlUnit {
						port busIF: ~BusIF;
					}				
				}
			}
		}
				
	}
}