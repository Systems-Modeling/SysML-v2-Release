package 'Decision Example' {
	import ScalarValues::*;
	
	attribute def BatteryCharged;
	
	part battery;
	part powerSystem;
	
	action def AddCharge (in charge : Real);
	
	action def ChargeBattery {
		first start;

		then merge continueCharging;
		
		then action monitor accept batteryCharge : Real;
		
		then decide;
			if monitor::batteryCharge < 100 then addCharge;
			if monitor::batteryCharge >= 100 then signalCharged;
			
		action addCharge : AddCharge (batteryCharge);
		then continueCharging;
		
		action signalCharged send BatteryCharged() to powerSystem;
		then done;
	}
}