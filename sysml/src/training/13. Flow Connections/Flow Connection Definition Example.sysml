package 'Flow Connection Definition Example' {
	import 'Port Example'::*;
	
	part def Vehicle;
	
	flow def FuelFlow {
		end part supplierPort : FuelTankAssembly;
		end part consumerPort : Engine;
	}
	
	part vehicle : Vehicle {
		part tankAssy : FuelTankAssembly;
		part eng : Engine;
		
		flow : FuelFlow of Fuel
		  from tankAssy.fuelTankPort.fuelSupply
			to eng.engineFuelPort.fuelSupply;
			
	} 
}