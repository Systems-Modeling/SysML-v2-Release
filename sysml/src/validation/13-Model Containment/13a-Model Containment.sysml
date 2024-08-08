package '13a-Model Containment' {
	private import '2a-Parts Interconnection'::*;
	private import '8-Requirements'::*;
	
	requirement BodyAndInteriorRequirements {
		public import MassLimitationRequirement; 
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
			
			private import 'vehicle1_c1 Specification Context'::'vehicle1-c1 Specification';		
		}
		
		package 'Vehicle Reference Model' {
			doc
			/*
			 * This package is used to represent a "model library".
			 * There is no specific syntax for identifying a package
			 * used in this way.
			 */
		
			private import VehicleA;			
			private import VehicleSubsystems;
			
			//*
			// The following would transitively private import all the
			// members of the VehicleSubsystems package, rather
			// then importing the package itself.
			 
			   private import VehicleSubsystems::*;
			*/
		}
		
		package VehicleSubsystems {
			private import 'Body&Interior';
			private import 'PowerTrain';
		}
		
		package 'Body&Interior' {
			private import BodyAndInteriorRequirements;			
		}
		
		package PowerTrain {
			private import Engine;
			private import Transmission;
			private import PowerTrainRequirements;			
		}
	}
	
}