package Features {
	classifier A;
	classifier B;
	
	feature f;
	feature g;
	
	feature x typed by A, B subsets f subsets g;
	
	// Equivalent declaration:
	feature x1 subsets g typed by A subsets f typed by B;
	
	classifier C;
	
	feature y;
	featuring F of y by C;
	
	feature y1 : A :> x featured by C;
	
	classifier Person;
	
	abstract feature person : Person; // Default subsets Base::things.
	feature child subsets person;
	
	classifier Fuel;
	
	classifier Tanks {
	    feature fuelInPort {
	        in feature fuelFlow : Fuel;
	    }
	    feature fuelOutPort ~ fuelInPort;
	}
	
	feature parent[1..2] : Person;
	feature mother : Person[1] :> parent;
	
	specialization t1 typing f typed by B;
	specialization t2 typing g : A;
	
	specialization Sub subset parent subsets person;
	specialization subset mother subsets parent;
	
	classifier LegalRecord {
		feature guardian[1];
	}
	
	classifier RegisteredAsset {
		feature identifier[0..1];
	}
	
	classifier Vehicle :> RegisteredAsset {
		feature vin[1];	
	}
	
	feature legalIdentification;
	
	specialization Redef redefinition LegalRecord::guardian redefines parent;
	specialization redefinition Vehicle::vin redefines RegisteredAsset::identifier; 
	
	redefinition Vehicle::vin redefines legalIdentification; 
}