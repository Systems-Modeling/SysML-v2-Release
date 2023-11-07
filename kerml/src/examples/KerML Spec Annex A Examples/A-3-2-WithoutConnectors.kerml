
package WithoutConnectorsModelToBeExecuted {
	doc
	/* 
	 */

	classifier Bicycle {
		feature rollsOn : Wheel [2];
		feature holdsWheel : BikeFork [*];
	}
	classifier Wheel;
	classifier BikeFork;
}

package WithoutConnectorsExecution {
	doc
	/* 
	 */

	import Atoms::*;
	import WithoutConnectorsModelToBeExecuted::*;

	#atom
	classifier MyWheel1 specializes Wheel;
	#atom
	classifier MyWheel2 specializes Wheel;

	classifier MyWheel unions MyWheel1, MyWheel2;

	#atom
	classifier MyBike specializes Bicycle {
		feature redefines rollsOn : MyWheel;
	}
}



