package VehicleIndividuals {
	import VehicleUsages::*;
	import Time::DateTime;
	
	package IndividualDefinitions {

		individual part def Vehicle1 :> Vehicle {
			doc
			/*
			 * This is an individual Vehicle with a mass of 1800 kg.
			 */
			
			attribute redefines mass = 1800 [kg];
		}
		
		individual part def Vehicle2 :> Vehicle {
			doc
			/*
			 * This is an individual Vehicle with a mass of 1700 kg.
			 */
		
			attribute redefines mass = 1700 [kg];
		}
		
		individual part def AxleAssembly1 :> AxleAssembly;
		
		individual part def Wheel1 :> Wheel;
		individual part def Wheel2 :> Wheel;
	}
	
	package IndividualSnapshots {
		import IndividualDefinitions::*;
	
		attribute t0: DateTime;
		attribute t1: DateTime;
		
		snapshot part vehicle1_t0: Vehicle1 {
			doc
			/*
			 * This is a snapshot of Vehicle1 at time t0;
			 */
		
			// Note: Timestamping of snapshots is not yet formalized.
			attribute t = t0;
		}
		
		timeslice part vehicle1_t0_t1: Vehicle1 {
			doc
			/*
			 * This is a time slice of Vehicle1 starting at snapshot vehicle1_t0 
			 * (time t0) and ending at time t1.
			 */
		
			snapshot :>> start = vehicle1_t0;
			snapshot :>> done {
				attribute t = t1;
			}
		}	
	}
	
	package IndividualConfigurations {
		import IndividualSnapshots::*;
	
		individual part vehicle1_C2: Vehicle1 :> vehicle_C2 {
			doc
			/*
			 * This asserts that for some portion of its lifetime, Vehicle1 conforms
			 * to the configuration vehicle_C2;
			 */
		}	
			
		snapshot part vehicle1_C2_t0 : Vehicle1 :> vehicle1_C2, vehicle1_t0 {
			doc
			/*
			 * This is a snapshot of Vehicle1 in configuration vehicle1_C2 at time t0.
			 */
		
			snapshot axleAssembly1_t0: AxleAssembly1 :>> frontAxleAssembly {
				doc
				/*
				 * frontAxleAssembly is a feature of vehicle1_C2.
				 */
			
				snapshot leftFrontWheel_t0: Wheel1 :>> leftFrontWheel {
					doc
					/*
					 * This asserts that Wheel1 is the leftFrontWheel of vehicle_C2_t0
					 * (leftFrontWheel is a feature of vehicle_C2::frontAxleAssembly).
					 */
				}
			}
		}
		
		snapshot part vehicle1_C2_t1 : Vehicle1 :> vehicle1_C2, vehicle1_t0_t1.done {
			doc
			/*
			 * This is a snapshot of Vehicle1 in configuration vehicle_C2 at time t1.
			 */
		
			snapshot axleAssembly1_t1: AxleAssembly1 :>> frontAxleAssembly {
				snapshot rightFrontWheel_t1: Wheel1 :>> rightFrontWheel {
					doc
					/*
					 * This asserts that Wheel1 is the rightFrontWheel of vehicle_C2_t1.
					 */
				}
			}
		}	
	}
}