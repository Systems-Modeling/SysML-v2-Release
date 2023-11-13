
package DecisionsAndMergesModelToBeExecuted {
	doc
	/* 
	 */

	import ControlPerformances::DecisionPerformance;
	import ControlPerformances::MergePerformance;
	import Occurrences::HappensBefore;
	import Links::SelfLink;

	behavior Manufacture {
		  /* Before decision. */
		step admit : Admit [1];
		succession a_before_i first admit [1] then inspect [1];

		  /* Decision. */
		step inspect : DecisionPerformance [*];

		  /* Two decision branches. */
		succession i_before_f first inspect [1] then finish [0..1];
		step finish : Touchup [*];
		succession i_before_r first inspect [1] then recycle [0..1];
		step recycle : MarkForRecycling [*];

		  /* Two merge branches. */
		succession f_before_ms first finish [0..1] then mShip [1];
		succession r_before_ms first recycle [0..1] then mShip [1];

		  /* Merge */
		step mShip : MergePerformance [*];

		  /* After merge */
		succession ms_before_s first mShip [1] then ship [1];
		step ship : Ship [*];

		  /* Decision and merge timing constraints. */
		feature inspectOutgoingHBLinks : HappensBefore [*] unions i_before_f, i_before_r;
		connector bindIOHBL : SelfLink from inspectOutgoingHBLinks [1] to inspect.outgoingHBLink [1];
		feature mShipIncomingHBLinks : HappensBefore [*] unions f_before_ms, r_before_ms;
		connector bindmSIHBL : SelfLink from mShipIncomingHBLinks [1] to mShip.incomingHBLink [1];
	}
	behavior Admit;
	behavior Touchup;
	behavior MarkForRecycling;
	behavior Ship;
}

package DecisionsAndMergesExecution {
	doc
	/* 
	 */

	import Atoms::*;
	import DecisionsAndMergesModelToBeExecuted::*;
	import Occurrences::Occurrence;
	import Occurrences::HappensBefore;

	  /* Before decision. */
	#atom
	behavior MyAdmit specializes Admit;

	  /* Decision. */
	#atom
	behavior MyInspect specializes DecisionPerformance;
	#atom
	assoc MyAdmit_Before_Inspect_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyAdmit;
		end feature redefines laterOccurrence : MyInspect;
	}

	  /* One decision branch taken. */
	#atom
	behavior MyTouchup specializes Touchup;
	#atom
	assoc MyInspect_Before_Touchup_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyInspect;
		end feature redefines laterOccurrence : MyTouchup;
	}

	  /* One merge branch taken. Merge. */
	#atom
	behavior MyMergeToShip specializes MergePerformance;
	#atom
	assoc MyTouchup_Before_Merge_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyTouchup;
		end feature redefines laterOccurrence : MyMergeToShip;
	}

	  /* After merge. */
	#atom
	behavior MyShip specializes Ship;
	#atom
	assoc MyMerge_Before_Ship_Link specializes HappensBefore {
		end feature redefines earlierOccurrence : MyMergeToShip;
		end feature redefines laterOccurrence : Ship;
	}

	behavior MyManufactureSteps unions MyAdmit, MyInspect, MyTouchup, MyMergeToShip, MyShip;

	#atom
	behavior MyManufacture specializes Manufacture {
		feature redefines timeEnclosedOccurrences : MyManufactureSteps [5];

	  	    /* Before decision. */
		step redefines admit : MyAdmit [1];

		  /* Decision. */
		step redefines inspect : MyInspect [1];
		succession redefines a_before_i : MyAdmit_Before_Inspect_Link [1] first admit then inspect;

		  /* One decision branch taken. */
		step redefines finish : MyTouchup [1];
		succession redefines i_before_f : MyInspect_Before_Touchup_Link [1] first inspect then finish;

		  /* One merge branch taken. */
		succession redefines f_before_ms : MyTouchup_Before_Merge_Link [1] first finish then mShip;

		  /* Merge. */        
		step redefines mShip: MyMergeToShip [1];

		   /* After merge */
		step redefines ship : MyShip [1];
		succession redefines ms_before_s : MyMerge_Before_Ship_Link [1] first mShip then ship;

		  /* Decision and merge timing constraints. */  
		feature redefines inspectOutgoingHBLinks : MyInspect_Before_Touchup_Link;
		feature redefines mShipIncomingHBLinks : MyTouchup_Before_Merge_Link;
	}
}