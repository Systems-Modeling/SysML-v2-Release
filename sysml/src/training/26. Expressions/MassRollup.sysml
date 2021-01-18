package MassRollup {
	import ScalarFunctions::*;
	
	part def MassedThing {
		attribute mass :> ISQ::mass; 
		attribute totalMass :> ISQ::mass;
	}
	
	part simpleThing : MassedThing {
		attribute totalMass redefines MassedThing::totalMass = mass;
	}
	
	part compositeThing : MassedThing {
		part subcomponents: MassedThing[*];
		
		attribute totalMass redefines MassedThing::totalMass =
			mass + sum(subcomponents->collect p:MassedThing (p::totalMass)); 
	}
	
	part filteredMassThing :> compositeThing {
		abstract attribute minMass :> ISQ::mass;
		
		attribute totalMass redefines MassedThing::totalMass =
			sum(./subcomponents/totalMass[p (p >= minMass)]);
	}

}