package 'Streaming Example' {
	import 'Port Example'::*;
	
	part def Vehicle;
	
	interface def FuelInterface {
		end supplierPort : FuelOutPort;
		end consumerPort : FuelInPort;
	}
	
	part vehicle : Vehicle {
		part tankAssy : FuelTankAssembly {
			port redefines fuelTankPort {
				out item redefines fuelSupply;
				in item redefines fuelReturn;
			}
		}
		
		part eng : Engine {
			port redefines engineFuelPort {
				in item redefines fuelSupply;
				out item redefines fuelReturn;
			}
		}
		
		stream of Fuel
		  from tankAssy::fuelTankPort::fuelSupply
			to eng::engineFuelPort::fuelSupply;
			
		stream of Fuel
		  from eng::engineFuelPort::fuelReturn
			to tankAssy::fuelTankPort::fuelReturn;
	} 
}