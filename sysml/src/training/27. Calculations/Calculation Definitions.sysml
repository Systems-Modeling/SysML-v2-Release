package 'Calculation Definitions' {
	import ScalarValues::Real;
	import RealFunctions::Sqrt;
	import ISQ::*;
	
	calc def Power (whlpwr : PowerValue, Cd : Real, Cf : Real, tm : MassValue, v : SpeedValue ) : PowerValue {
		attribute drag = Cd * v;
		attribute friction = Cf * tm * v;
		
		whlpwr - drag - friction
	}
	
	calc def Acceleration (tp: PowerValue, tm : MassValue, v : SpeedValue) : AccelerationValue { 
		tp / (tm * v)
	}
	
	calc def Velocity (dt : TimeValue, v0 : SpeedValue, a : AccelerationValue) : SpeedValue = v0 + a * dt;
 	
	calc def Position (dt : TimeValue, x0 : LengthValue, v : SpeedValue) : LengthValue = x0 + v * dt;
}