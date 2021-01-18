package 'Calculation Definitions' {
	import ScalarValues::Real;
	import RealFunctions::Sqrt;
	import Quantities::QuantityValue;
	import ISQ::*;
	
	attribute def PowerValue :> QuantityValue;
	
	calc def Power (whlpwr : PowerValue, Cd : Real, Cf : Real, tm : MassValue, v : VelocityValue ) : PowerValue {
		attribute drag = Cd * v;
		attribute friction = Cf * tm * v;
		
		whlpwr - drag - friction
	}
	
	calc def Acceleration (tp: PowerValue, tm : MassValue, v : VelocityValue) : AccelerationValue { 
		tp / (tm * v)
	}
	
	calc def Velocity (dt : TimeValue, v0 : VelocityValue, a : AccelerationValue) : VelocityValue = v0 + a * dt;
 	
	calc def Position (dt : TimeValue, x0 : LengthValue, v : VelocityValue) : LengthValue = x0 + v * dt;
}