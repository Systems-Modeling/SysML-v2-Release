
package OneToOneConnectorsModelToBeExecuted {
	doc
	/* 
	 */

    public import WithoutConnectorsModelToBeExecuted::Wheel;
    public import WithoutConnectorsModelToBeExecuted::BikeFork;

	classifier Bicycle {
		feature rollsOn : Wheel [2];
		feature holdsWheel : BikeFork [*];
		connector fixWheel : BikeWheelFixed from [1] rollsOn to [1] holdsWheel;
	}
	assoc BikeWheelFixed {
		end feature wheel : Wheel;
		end feature fixedTo : BikeFork;
	}
}

package OneToOneConnectorsExecution {
	doc
	/* 
	 */

	private import Atoms::*;
	public import OneToOneConnectorsModelToBeExecuted::*;
	public import WithoutConnectorsExecution::MyWheel1;
	public import WithoutConnectorsExecution::MyWheel2;
	public import WithoutConnectorsExecution::MyWheel;

	#atom
	classifier MyBikeFork1 specializes BikeFork;
	#atom
	classifier MyBikeFork2 specializes BikeFork;

	classifier MyBikeFork unions MyBikeFork1, MyBikeFork2;

	#atom
 	assoc MyBikeWheel1_Fork1_BWF_Link specializes BikeWheelFixed {
		end feature redefines wheel : MyWheel1;
		end feature redefines fixedTo : MyBikeFork1;
	}
	#atom
	assoc MyBikeWheel2_Fork2_BWF_Link specializes BikeWheelFixed {
		end feature redefines wheel : MyWheel2;
		end feature redefines fixedTo : MyBikeFork2;
	}

	classifier MyBikeWheel_Fork_BWF_Link unions MyBikeWheel1_Fork1_BWF_Link, MyBikeWheel2_Fork2_BWF_Link;

	#atom
	classifier MyBike specializes Bicycle {
		feature redefines rollsOn : MyWheel;
		feature redefines holdsWheel : MyBikeFork;
		connector redefines fixWheel : MyBikeWheel_Fork_BWF_Link [2] from [1] rollsOn to [1] holdsWheel;
	}
}
