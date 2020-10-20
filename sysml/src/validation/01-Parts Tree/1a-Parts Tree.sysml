package '1a-Parts Tree' {
	import SI::kg;
	
	package Definitions {	
		part def Vehicle {
			/**
			 * The 'mass' attribute property is declared here to be a 
			 * specialization (subset) of the general 'mass' quantity 
			 * from the 'ISQ' (International System of Quantities) 
			 * library model.
			 */
			attribute mass :> ISQ::mass;
		}		
		part def AxleAssembly;		
		part def Axle { 
			attribute mass :> ISQ::mass;
		}	
		part def FrontAxle :> Axle { 
			attribute steeringAngle: ScalarValues::Real;
		}	
		part def Wheel;	
	}
	
	package Usages {
		/**
		 * A "private" import makes the imported names private to the
		 * imported package.
		 */
		private import Definitions::*;
	
		/** 
		 * 'vehicle1' is a package-owned part of type Vehicle.
		 */
		part vehicle1: Vehicle {
			/**
			 * This redefines the 'mass' attribute property from 'Vehicle' to 
			 * give it a fixed attribute.
			 */		
			attribute mass redefines Vehicle::mass = 1750@[kg];
			
			/**
			 * 'frontAxleAssembly' is a nested part of part 'vehicle1'.
			 * It is a composite part of the containing part.
			 * 
			 * (And similarly for 'rearAxleAssembly'.)
			 */
			part frontAxleAssembly: AxleAssembly {
				part frontAxle: Axle;
				
				/** 
				 * 'frontWheel' is a nested part of type 'Wheel' with
				 * multiplicity "2". This means that this axle assembly
				 * must have exactly two wheels. However, there is still
				 * only one 'frontWheel' part. The part is "ordered",
				 * so that the first wheel can be distinguished from the
				 * second.
				 */
				part frontWheel: Wheel[2] ordered;
			}
			
			part rearAxleAssembly: AxleAssembly {
				part rearAxle: Axle;
				part rearWheel: Wheel[2] ordered;
			}
			
		}
	
		/**
		 * 'vehicle1_c1' is a modified copy of 'vehicle1'. There is no
		 * connection between this copy and the original version in the
		 * model.
		 */
		part vehicle1_c1: Vehicle {	
			
			/**
			 * The mass attribute has been modified.
			 */
			attribute mass redefines Vehicle::mass = 2000@[kg];
	
			part frontAxleAssembly: AxleAssembly {
				
				/**
				 * The part 'frontAxle' has been modified to have type 'FrontAxle'.
				 */
				part frontAxle: FrontAxle;
				
				/**
				 * The parts 'frontWheel_1' and 'frontWheel_2' have been added
				 * as subsets of 'frontWheel'. These are separate parts from
				 * 'frontWheel', but essentially provide alternate names for
				 * each of the two wheels, as given by their defining expressions.
				 */
				part frontWheel: Wheel[2] ordered;
				part frontWheel_1 subsets frontWheel = frontWheel[1];
				part frontWheel_2 subsets frontWheel = frontWheel[2];
			}
			
			/**
			 * 'rearAxleAssembly' has also been modified to add subsetting parts
			 * for 'rearWheel'.
			 */
			part rearAxleAssembly: AxleAssembly {			
				part rearAxle: Axle;
				
				part rearWheel: Wheel[2] ordered;
				part rearWheel_1 subsets rearWheel = rearWheel[1];
				part rearWheel_2 subsets rearWheel = rearWheel[2];
			}
			
		}
	
	}
	
}