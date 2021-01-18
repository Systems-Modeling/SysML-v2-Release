package 'Fork Join Example' {
	import ScalarValues::*;
	
	attribute def TurnKeyToOn;
	attribute def BrakePressure;
	
	action def MonitorBrakePedal(out brakePressure : BrakePressure);
	action def MonitorTraction(out modulationFrequency : Real);
	action def Braking(in brakePressure : BrakePressure, in modulationFrequency : Real);
	
	action def Brake {
		accept TurnKeyToOn;
		
		then fork;
			then monitorBrakePedal;
			then monitorTraction;
			then braking;
		
		action monitorBrakePedal : MonitorBrakePedal (
			out brakePressure
		);
		then joinNode;
		
		action monitorTraction : MonitorTraction (
			out modulationFrequency);
		then joinNode;
		
		action braking : Braking(
			in stream from monitorBrakePedal::brakePressure, 
			in stream from monitorTraction::modulationFrequency);
		then joinNode;
		
		join joinNode;
		then done;
	}
}