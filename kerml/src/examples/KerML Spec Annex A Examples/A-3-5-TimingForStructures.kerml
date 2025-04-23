
package TimingForStructuresModelToBeExecuted1 {
	doc
	/* 
	 */

	private import WithoutConnectorsModelToBeExecuted::Wheel;
	private import WithoutConnectorsModelToBeExecuted::BikeFork;
	private import Occurrences::Occurrence;

	struct Bicycle {
		feature rollsOn : Wheel [2] subsets timeCoincidentOccurrences;
		feature holdsWheel : BikeFork [2] subsets timeCoincidentOccurrences;
	}
}

package TimingForStructuresExecution1 {
	doc
	/* 
	 */

	private import Atoms::*;
	private import TimingForStructuresModelToBeExecuted1::*;
	private import OneToOneConnectorsExecution::MyWheel;
	private import OneToOneConnectorsExecution::MyBikeFork;

	struct MyBikeTimeCoincident unions MyWheel, MyBikeFork, MyBike;

	#atom
	struct MyBike specializes Bicycle {
		feature redefines self : MyBike;
		feature redefines timeCoincidentOccurrences : MyBikeTimeCoincident [5];
		feature redefines rollsOn : MyWheel;
		feature redefines holdsWheel : MyBikeFork;
	}
}


package TimingForStructuresModelToBeExecuted2 {
	doc
	/* 
	 */

	private import WithoutConnectorsModelToBeExecuted::Wheel;
	private import WithoutConnectorsModelToBeExecuted::BikeFork;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensDuring;

	struct Bicycle {
		feature rollsOn : Wheel [2];
		feature holdsWheel : BikeFork [2];
		feature allParts : Occurrence unions rollsOn, holdsWheel;
		connector b_during_ap : HappensDuring from [1] self to [*] allParts;
	}
}

package TimingForStructuresExecution2 {
	doc
	/* 
	 */

	private import Atoms::*;
	private import TimingForStructuresModelToBeExecuted2::*;
	private import Occurrences::HappensDuring;
	private import OneToOneConnectorsExecution::MyWheel;
	private import OneToOneConnectorsExecution::MyBikeFork;
	
	struct MyWheel1 specializes OneToOneConnectorsExecution::MyWheel1;
	struct MyWheel2 specializes OneToOneConnectorsExecution::MyWheel2;
    struct MyBikeFork1 specializes OneToOneConnectorsExecution::MyBikeFork1;
    struct MyBikeFork2 specializes OneToOneConnectorsExecution::MyBikeFork2;

	#atom
	assoc MyBike_During_Wheel1_Link specializes HappensDuring {
		end feature redefines shorterOccurrence : MyBike;
		end feature redefines longerOccurrence : MyWheel1;
	}
	#atom
	assoc MyBike_During_Wheel2_Link specializes HappensDuring {
		end feature redefines shorterOccurrence : MyBike;
		end feature redefines longerOccurrence : MyWheel2;
	}
	#atom
	assoc MyBike_During_Fork1_Link specializes HappensDuring {
		end feature redefines shorterOccurrence : MyBike;
		end feature redefines longerOccurrence : MyBikeFork1;
	}
	#atom
	assoc MyBike_During_Fork2_Link specializes HappensDuring {
		end feature redefines shorterOccurrence : MyBike;
		end feature redefines longerOccurrence : MyBikeFork2;
	}

	assoc MyBike_During_Parts_Link specializes HappensDuring
		unions MyBike_During_Wheel1_Link, MyBike_During_Fork1_Link,
		       MyBike_During_Wheel2_Link, MyBike_During_Fork2_Link;

	struct MyBikeParts unions MyWheel, MyBikeFork;

	#atom
	struct MyBike specializes Bicycle {
		feature redefines rollsOn : MyWheel;
		feature redefines holdsWheel : MyBikeFork;
		feature redefines allParts : MyBikeParts [4];

		feature redefines self : MyBike;
		connector redefines b_during_ap : MyBike_During_Parts_Link [4]
			from [1] self to [*] allParts;
	}
}

package TimingForStructuresModelToBeExecuted3 {
	doc
	/* 
	 */

	private import WithoutConnectorsModelToBeExecuted::Wheel;
	private import WithoutConnectorsModelToBeExecuted::BikeFork;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensWhile;

	struct Bicycle {
		feature rollsOn : Wheel [2];
		feature holdsWheel : BikeFork [2];
		feature allParts : Occurrence unions rollsOn, holdsWheel;
		feature redefines endShot : Bicycle;
		connector be_while_pe : HappensWhile from [1] endShot to [*] endShot.allParts.endShot;
	}
}

package TimingForStructuresExecution3 {
	doc
	/* 
	 */

	private import Atoms::*;
	private import TimingForStructuresModelToBeExecuted3::*;
	private import Occurrences::Occurrence;
	private import Occurrences::HappensWhile;
	private import WithoutConnectorsModelToBeExecuted::Wheel;
	private import WithoutConnectorsModelToBeExecuted::BikeFork;

	  /* End atoms */
	#atom
	struct MyWheel1End specializes Wheel;
	#atom
	struct MyWheel1 specializes Wheel {
		feature redefines endShot : MyWheel1End;
	}
	#atom
	struct MyWheel2End specializes Wheel;
	#atom
	struct MyWheel2 specializes Wheel {
		feature redefines endShot : MyWheel2End;
	}
	struct MyBikeFork1End specializes BikeFork;
	#atom
	struct MyBikeFork1 specializes BikeFork {
		feature redefines endShot : MyBikeFork1End;
	}
	struct MyBikeFork2End specializes BikeFork;
	#atom
	struct MyBikeFork2 specializes BikeFork {
		feature redefines endShot : MyBikeFork2End;
	}
	#atom
	struct MyBikeEnd specializes Bicycle;

	  /* HappensWhile atoms */
	#atom
	assoc MyBikeEnd_While_Wheel1End_Link specializes HappensWhile {
		end feature redefines thisOccurrence : MyBikeEnd;
		end feature redefines thatOccurrence : MyWheel1End;
	}
	#atom
	assoc MyBikeEnd_While_Wheel2End_Link specializes HappensWhile {
		end feature redefines thisOccurrence : MyBikeEnd;
		end feature redefines thatOccurrence : MyWheel2End;
	}
	#atom
	assoc MyBikeEnd_While_Fork1End_Link specializes HappensWhile {
		end feature redefines thisOccurrence : MyBikeEnd;
		end feature redefines thatOccurrence : MyBikeFork1End;
	}
	#atom
	assoc MyBikeEnd_While_Fork2End_Link specializes HappensWhile {
		end feature redefines thisOccurrence : MyBikeEnd;
		end feature redefines thatOccurrence : MyBikeFork2End;
	}

	assoc MyBikeEnd_While_PartsEnd_Link specializes HappensWhile
		unions MyBikeEnd_While_Wheel1End_Link, MyBikeEnd_While_Fork1End_Link,
		       MyBikeEnd_While_Wheel2End_Link, MyBikeEnd_While_Fork2End_Link;

	#atom
	struct MyBike specializes Bicycle {
		feature redefines endShot : MyBikeEnd;
		connector redefines be_while_pe : MyBikeEnd_While_PartsEnd_Link [4]
			from [1] endShot to [*] endShot.allParts.endShot;  
	}
}