package JohnIndividualExample {
	import Objects::*;
	
	/**
	  This is the class of persons, each of whom has an age.
	  It is NOT restricted to maximal portions.
	  (The specialization of Object would normally be left implicit.)
	*/
	class Person specializes Object {
		class Life specializes Person, Occurrences::Life;
		
		feature age : ScalarValues::Natural;
	  
	  /** 
	    These redefinitions enforce the "rigidity" constraint for Person.
	    They ensure that all portions of a person are also persons and 
	    that a person can only be a portion of another person. This implies
	    that the class Person must also include all the portions of any one 
	    of its instances. The redefinitions for the portion features
	    also implicitly constraint the typing of the time slice and snapshot
	    features, since they are subsets of portioning.
	    (It is currently awkward to have to declare these redefinitions
	    explicitly.)
	  */
	  feature redefines portions : Person;
	  feature redefines portionOf : Person;
	
	}
	
	/**
	  This is the class of presidents, each of which must be a time slice
	  of the life of some individual person.
	  (Note that this class is NOT "rigid".)
	*/
	class President specializes Person {
	  feature redefines timeSliceOf : Person::Life [1];
	}
	
	/**
	  This is the class of the specific (individual) person who is John.
	  There is at most one such person.
	*/
	class John specializes Person {
		class all JohnLife[0..1] specializes John, Occurrences::Life;
	} 
	
	/**
	  This is the class of time slices of John's life in which he is
	  a president.
	*/
	class JohnAsPresident specializes John, President;
	
	/**
	  This is the class of countries, each of which may have at most one
	  president.
	*/
	class Country specializes Object {
		class all Life specializes Country, Occurrences::Life;

		feature presidentOfCountry : President[0..1];
	  
	  	// Rigidity constraint.
	  	feature redefines portions : Country;
	  	feature redefines portionOf : Country;
	}
	
	/**
	  This is the class of the specific country that is the
	  United States. It contains a single instance. The United States
	  always has a president who must be at least 35 years old.
	*/
	class UnitedStates specializes Country {
		class all USLife[1] specializes UnitedStates, Occurrences::Life ;
	  	feature presidentOfUS[1] redefines presidentOfCountry {
	   		inv { age >= 35 } 
	  	}
	}
	
	/**
	  This is the class of time slices of the United States during
	  which John is president of the United States.
	*/
	class UnitedStatesWithJohnAsPresident specializes UnitedStates {
	  feature redefines timeSliceOf : UnitedStates::Life;
	  feature redefines presidentOfUS : JohnAsPresident;
	}
}