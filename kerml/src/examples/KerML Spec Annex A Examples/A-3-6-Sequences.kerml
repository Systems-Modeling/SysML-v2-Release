
package SequencesModelToBeExecuted {
	doc
	/* 
	 */

	behavior Manufacture {
		step paint : Paint [1];
		step dry : Dry [*];
		succession p_before_d first paint [1] then dry [1];
		step ship : Ship [*];
		succession d_before_s first dry [1] then ship [1];
	}
	behavior Paint;
	behavior Dry;
	behavior Ship;
}

package SequencesExecution {
	doc
	/* 
	 */

	import Atoms::*;
	import SequencesModelToBeExecuted::*;
	import Occurrences::Occurrence;
	import Occurrences::HappensBefore;

	#atom
	behavior MyPaint specializes Paint;
	#atom
	behavior MyDry specializes Dry;

	#atom
	assoc MyPaint_Before_Dry_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyPaint;
		end feature redefines laterOccurrence : MyDry;
	}

	behavior MyManufactureStepsPD unions MyPaint, MyDry;

	#atom
	behavior MyShip specializes Ship;

	#atom
	assoc MyDry_Before_Ship_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyDry;
		end feature redefines laterOccurrence : MyShip;
	}

	behavior MyManufactureStepsPDS unions MyManufactureStepsPD, MyShip;

	#atom
	behavior MyManufacture specializes Manufacture {
		feature redefines timeEnclosedOccurrences : MyManufactureStepsPDS [3];
		step redefines paint : MyPaint;
		step redefines dry : MyDry [1];
		succession redefines p_before_d : MyPaint_Before_Dry_Link [1] first paint then dry;
		step redefines ship : MyShip [1];
		succession redefines d_before_s : MyDry_Before_Ship_Link [1] first dry then ship;
	}
}