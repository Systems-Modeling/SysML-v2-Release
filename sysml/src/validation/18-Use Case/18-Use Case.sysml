package '18-Use Case' {
	
	part def Vehicle;
	part def Person;
	part def Environment;
	part def 'Fuel Station';
	
	use case 'provide transportation' {
		subject vehicle : Vehicle;
		
		actor driver : Person;
		actor passengers : Person[0..4];
		actor environment : Environment;
		
		objective {
			doc 
			/* Satisfy mission requirements to transport driver and passengers 
			 * from starting location to ending location in conformance with 
			 * the driving profile and meet the mission requirements for safety, 
			 * reliability, comfort, and affordability.
			 */
		}
		
		ref :>> start {
			doc /* Mock-up of a pre-condition. */
			assert constraint {
				doc /* Vehicle at starting location */
			}
		}
		
		first start;
		
		then include 'enter vehicle' {
			actor :>> driver = 'provide transportation'::driver;
			actor :>> passengers = 'provide transportation'::passengers;
		}
		
		then use case 'drive vehicle' {
			include 'add fuel'[0..*] {
				doc
				/*
				 * Mock-up of an extension point.
				 * (But reference to 'add fuel' is in the wrong direction, and it doesn't
				 * make the extension condition sufficient to trigger the behavior.)
				 */
			 
				actor :>> fueler = driver;
				ref :>> start {
					doc /* Fuel level < 10% max fuel */
				}
			}
		}
		
		then include 'exit vehicle' {
			actor :>> driver = 'provide transportation'::driver;
			actor :>> passengers = 'provide transportation'::passengers;
		}
		
		then done;
		
		ref :>> done {
			doc /* Mock-up of a post-condition. */
			assert constraint {
				doc /* Vehicle at ending location */
			}
		}
		
	}
	
	use case 'enter vehicle' {
		subject vehicle : Vehicle;
		actor driver : Person;
		actor passengers : Person[0..4];
	}
	
	use case 'exit vehicle' {
		subject vehicle : Vehicle;
		actor driver : Person;
		actor passengers : Person[0..4];
	}
		
	use case 'add fuel' {
		subject vehicle : Vehicle;
		actor fueler : Person;
		actor 'fuel station' : 'Fuel Station';
	}
}