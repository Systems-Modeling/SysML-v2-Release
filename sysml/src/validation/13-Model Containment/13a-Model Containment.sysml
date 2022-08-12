package '13a-Model Containment' {
	import '2a-Parts Interconnection'::*;
	import '8-Requirements'::*;
	
	requirement BodyAndInteriorRequirements {
		import MassLimitationRequirement; 
	}
	
	requirement PowerTrainRequirements;
	
	package 'Vehicle Model' {
		doc
		/*
		 * This package is used to represent a top-level "model".
		 * There is no specific syntax for identifying a package
		 * used in this way.
		 */
	
		
		package 'Vehicle1-Configuration' {			
			alias 'Sport Sedan' for vehicle1_c1;
			
			import 'vehicle1_c1 Specification Context'::'vehicle1-c1 Specification';		
		}
		
		package 'Vehicle Reference Model' {
			doc
			/*
			 * This package is used to represent a "model library".
			 * There is no specific syntax for identifying a package
			 * used in this way.
			 */
		
			import VehicleA;			
			import VehicleSubsystems;
			
			//*
			// The following would transitively import all the
			// members of the VehicleSubsystems package, rather
			// then importing the package itself.
			 
			   import VehicleSubsystems::*;
			*/
		}
		
		package VehicleSubsystems {
			import 'Body&Interior';
			import 'PowerTrain';
		}
		
		package 'Body&Interior' {
			import BodyAndInteriorRequirements;			
		}
		
		package PowerTrain {
			import Engine;
			import Transmission;
			import PowerTrainRequirements;			
		}
	}
	
}