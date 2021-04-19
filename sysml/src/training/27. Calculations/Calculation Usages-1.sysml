package 'Calculation Usages-1' {
	import 'Calculation Definitions'::*;
	
	part def VehicleDynamics {
		attribute C_d : Real;
		attribute C_f : Real;
		attribute wheelPower : PowerValue;
		attribute mass : MassValue;
		
		action straightLineDynamics(
			in delta_t : TimeValue,
			in v_in : SpeedValue,
			in x_in : LengthValue,
			out v_out : SpeedValue,
			out x_out : LengthValue
		) {
			calc acc : Acceleration (
				tp = Power(wheelPower, C_d, C_f, mass, v_in),
				tm = mass,
				v = v_in
			) return a;
			
			calc vel : Velocity (
				dt = delta_t, 
				v0 = v_in, 
				a = acc::a
			) return v = v_out;
			
			calc pos : Position (
				dt = delta_t, 
				x0 = x_in, 
				v0 = vel::v
			) return x = x_out;		
		}
	} 
	
}