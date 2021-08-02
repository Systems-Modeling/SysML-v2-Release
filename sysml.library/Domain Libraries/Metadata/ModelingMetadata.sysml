package ModelingMetadata {
	private import Base::Anything;
	private import ScalarValues::String;
	private import RiskMetadata::Risk;
		
	enum def StatusKind {
		open;
		tbd; // To be done
		tbr; // To be resolved
		tbc; // To be confirmed
		done;
		closed;
	}
	
	attribute def StatusInfo {
		attribute originator : String [0..1];
		attribute owner : String [0..1];
		attribute status : StatusKind;
		attribute risk : Risk;
	}
	
	attribute def Rationale {
		attribute text : String;
		ref explanation : Anything [0..1];
	}
	
	attribute def Issue {
		attribute text : String;
	}
	
}