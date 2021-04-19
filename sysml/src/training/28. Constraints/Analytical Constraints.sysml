package 'Analytical Constraints' {
	import 'Calculation Definitions'::*;
	
	constraint def StraightLineDynamicsEquations(
		p : PowerValue,
		m : MassValue,
		dt : TimeValue,
		x_i : LengthValue,
		v_i : SpeedValue,
		x_f : LengthValue,
		v_f : SpeedValue,
		a : AccelerationValue
	) {
		attribute v_avg : SpeedValue = (v_i + v_f)/2;
		
		a == Acceleration(p, m, v_avg) &
		v_f == Velocity(dt, v_i, a) &
		x_f == Position(dt, x_i, v_avg)
	}
	
	action def StraightLineDynamics (
		in power : PowerValue,
		in mass : MassValue,
		in delta_t : TimeValue,
		in x_in : LengthValue,
		in v_in : SpeedValue,
		out x_out : LengthValue,
		out v_out : SpeedValue,
		out a_out : AccelerationValue
	) {
	    assert constraint dynamics : StraightLineDynamicsEquations (
			p = power,
			m = mass,
			dt = delta_t,
			x_i = x_in,
			v_i = v_in,
			x_f = x_out,
			v_f = v_out,
			a = a_out
	    );
	}
}