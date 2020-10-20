package 'Streaming Interface Example' {
	import 'Port Example'::*;
	
	part def Vehicle;
	
	interface def FuelInterface {
		end supplierPort : FuelOutPort {
			out item redefines fuelSupply;
			in item redefines fuelReturn;			
		}
		end consumerPort : FuelInPort {
			in item redefines fuelSupply;
			out item redefines fuelReturn;
		}
		
		stream supplierPort::fuelSupply to consumerPort::fuelSupply;			
		stream consumerPort::fuelReturn to supplierPort::fuelReturn;
	}
	
	part vehicle : Vehicle {	
		part tankAssy : FuelTankAssembly {
			port redefines fuelTankPort;
		}
		
		part eng : Engine {
			port redefines engineFuelPort;
		}
		
		interface : FuelInterface connect 
			supplierPort => tankAssy::fuelTankPort to 
			consumerPort => eng::engineFuelPort;
	} 
}