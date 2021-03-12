package 'Fork Join Example' {
	import ScalarValues::*;
	
	attribute def TurnKeyToOn;
	attribute def BrakePressure;
	
	action def MonitorBrakePedal(out pressure : BrakePressure);
	action def MonitorTraction(out modFreq : Real);
	action def Braking(in brakePressure : BrakePressure, in modulationFrequency : Real);
	
	action def Brake {
		action TurnOn;
		
		then fork;
			then monitorBrakePedal;
			then monitorTraction;
			then braking;
		
		action monitorBrakePedal : MonitorBrakePedal {
			out brakePressure;
		}
		then joinNode;
		
		action monitorTraction : MonitorTraction {
			out modulationFrequency;
		}
		then joinNode;
		
		action braking : Braking {
			in brakePressure stream from monitorBrakePedal::brakePressure; 
			in modulationFrequency stream from monitorTraction::modulationFrequency;
		}
		then joinNode;
		
		join joinNode;
		then done;
	}
}