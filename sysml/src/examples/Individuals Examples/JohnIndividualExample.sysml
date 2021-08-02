package JohnIndividualExample {
	
	/**
	  This is the definition of the class of persons, each of whom has an age.
	*/
	item def Person {		
		attribute age : ScalarValues::Natural;		
		
		/**
		 * These are the periods during which a Person is president.
		 */
		timeslice asPresident : Person [0..*];
	}
	
	/**
	  This the definition of the individual Person who is John.
	  There is at most one such person.
	*/
	individual item def John :> Person;
	
	/**
	  This is the definition of the class of countries, each of which may have 
	  at most one president (at any point in time).
	*/
	item def Country {
		ref presidentOfCountry[0..1] : Person :> presidentOfCountry.asPresident;
	}
	
	/**
	  This is the definition of the individual country that is the
	  United States. It contains a single instance. The United States
	  always has a president who must be at least 35 years old.
	*/
	individual item def UnitedStates :> Country {
	  	ref presidentOfUS[1] :>> presidentOfCountry {
	   		assert constraint { age >= 35 } 
	  	}
	}
	
	/**
	  These are the time slices of the United States during
	  which John is president of the United States.
	*/
	timeslice item UnitedStatesWithJohnAsPresident[*] : UnitedStates {
	  ref :>> presidentOfUS : John;
	}
}