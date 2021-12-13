package '14c-Language-Extensions' {
	import ScalarValues::*;
	
	package FMEALibrary {
		
		abstract occurrence def Situation;
		
		occurrence def Cause :> Situation {
			attribute 'occurrence'[0..1]: Real;
		}
		
		occurrence def FailureMode :> Situation {
			attribute detectibility[0..1]: Real;
		}
		
		occurrence def Effect :> Situation {
			attribute severity[0..1]: String;
		}
		
		item def FMEAItem :> Situation {
			attribute RPN: Real;
			
			occurrence causes[*]: Cause;
			occurrence failureModes[*]: FailureMode;
			occurrence effects[*]: Effect;
		}
				
		requirement def FMEARequirement;
		
		requirement def RequirementWithSIL :> FMEARequirement {
			attribute sil: SIL;
		}
		
		enum def SIL {
			A;
			B;
			C;
		}
		
		connection def Causes :> Occurrences::HappensBefore {
			end cause[*]: Situation;
			end effect[*]: Situation;
		}
		
		connection def Violates {
			end sit[*]: Situation;
			end req[*]: FMEARequirement;
		}
		
		abstract connection def ControllingMeasure {
			end sit[*]: Situation;
			end req[*]: FMEARequirement;
		}
		
		connection def Prevents :> ControllingMeasure;
		connection def Mitigates :> ControllingMeasure;
		
	}
	
	package Annotations {

		enum def Status {
			Approved;
			NotApproved;
		}
		
		attribute def StatusHolder {
			status: Status;
		}
		
	}
	
	package UserModel {
		import FMEALibrary::*;
		import Annotations::*;
		
		requirement req1: FMEARequirement {
			doc /* Meter designed according to ISO00124 */
		}
		
		requirement req2: FMEARequirement {
			doc /* Device working for 1 week without the need to replace batteries */
		}
		
		requirement req3: RequirementWithSIL {
			@StatusHolder { status = Status::Approved; }
			
			doc /* Alarm when battery has sank */
			
			:>> sil = SIL::A;
		}
		
		connection :Violates connect 'Glucose FMEA Item' to req2;
		connection :Mitigates connect 'Glucose FMEA Item' to req3;
			
		item 'Glucose FMEA Item': FMEAItem {

			connection :Prevents connect 'battery depleted' to req1;
			
			occurrence 'battery depleted' :> causes {
				:>> 'occurrence' = 0.005;
			}
			
			connection :Causes connect 'battery depleted' to 'battery cannot be charged';
			
			occurrence 'battery cannot be charged' :> failureModes {
				:>> detectibility = 0.013;
			}
			
			connection :Causes connect 'battery cannot be charged' to 'glucose level undetected';
			
			occurrence 'glucose level undetected' :> effects;
			
			connection :Causes connect 'glucose level undetected' to 'therapy delay';
			
			occurrence 'therapy delay' :> effects {
				:>> severity = "High";
			}

		}
		
		item 'Glucose Meter in Use' :> 'Glucose FMEA Item' {
			
			part 'glucose meter' {
				event 'glucose level undetected'[*];
				part battery {
					event 'battery depleted'[*];
					event 'battery cannot be charged'[*];
				}
				part pump;
				part reservoir;
			}
			
			part patient {
				event 'therapy delay'[*];
			}
		}
		
	}
}