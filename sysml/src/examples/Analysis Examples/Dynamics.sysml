package Dynamics {
	import ScalarValues::Real;
	import ISQ::*;
	
	// Function definitions
	
	calc def Power
		(in whlpwr : PowerValue, in Cd : Real, in Cf : Real, in tm : MassValue, in v : SpeedValue )
		return tp : PowerValue {
			
		whlpwr - Cd * v - Cf * tm * v
	}
	
	calc def Acceleration (dt : TimeValue, tm : MassValue, tp: PowerValue) a : AccelerationValue { 
		tp * dt * tp
	}
	
	calc def Velocity (dt : TimeValue, v0 : SpeedValue, a : AccelerationValue) v : SpeedValue = v0 + a * dt;
 	
	calc def Position (dt : TimeValue, x0 : LengthValue, v : SpeedValue) : LengthValue = x0 + v * dt;
	

	// Analysis action def
	
	action def StraightLineVehicleDynamics {
		
		in attribute dt : TimeValue;
		in attribute whlpwr : PowerValue;
		in attribute Cd : Real;
		in attribute Cf: Real;
		in attribute tm : MassValue;
		in attribute v_in : SpeedValue;
		in attribute x_in : LengthValue;
		
		out attribute a_out : AccelerationValue;
		out attribute v_out : SpeedValue;
		out attribute x_out : LengthValue;
			
		assert constraint {
			attribute tp : PowerValue;
			
			tp == Power(whlpwr, Cd, Cf, tm, v_in) &
			a_out == Acceleration(dt, tm, tp) &
			v_out == Velocity(dt, v_in, a_out) &
			x_out == Position(dt, x_in, v_in)
		}
	}
	

	// Analysis actions
	
	action dyn1 : StraightLineVehicleDynamics {
		attribute tp : PowerValue = Power(whlpwr, Cd, Cf, tm, v_in);
		
		out attribute :>> a_out : AccelerationValue = Acceleration(dt, tm, tp);
		out attribute :>> v_out : SpeedValue = Velocity(dt, v_in, a_out);
		out attribute :>> x_out : LengthValue = Position(dt, x_in, v_in);
	}	
	
	action dyn2 : StraightLineVehicleDynamics {
		calc acc : Acceleration (
			dt = dyn2::dt, 
			tm = dyn2::tm, 
			tp = Power(whlpwr, Cd, Cf, tm, v_in)
		) return a = a_out;
		
		calc vel : Velocity (
			dt = dyn2::dt, 
			v0 = dyn2::v_in, 
			a = acc::a
		) return v = v_out;
		
		calc pos : Position (
			dt = dyn2::dt, 
			x0 = dyn2::x_in, 
			v0 = vel::v
		) return x = x_out;		
	}
}