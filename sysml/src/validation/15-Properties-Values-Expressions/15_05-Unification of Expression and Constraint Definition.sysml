package '15_05-Unification of Expression and Constraint Definition' {
	import '15_03-Value Expression'::*;
	
	constraint def DiscBrakeConstraint(wheelAssy : WheelAssy[4]) {
		wheelAssy->forAll w: WheelAssy ( 
			2 * w::discBrakeAssy::radius < w::wheel::outerDiameter
		)
	}
	
	constraint def DiscBrakeFitConstraint_Alt(
		discBrakeAssy : DiscBrakeAssy[1],
		wheel : Wheel[1]		
	) {		
		2 * discBrakeAssy::radius < wheel::outerDiameter
	}
	
	part def Vehicle_2 {
		attribute mass : MassValue[1] = 1200@[kg];
		attribute length : LengthValue[1] = 4.82@[m];
		
		part wheelAssy : WheelAssy[4];
		
		/** 
		 * This constraint is computed, but not asserted. This means a tool can identify 
		 * when it is violated without the model being inconsistent.
		 */
		constraint discBrakeConstraint : DiscBrakeConstraint(wheelAssy = Vehicle_2::wheelAssy);
	}
	
	part def WheelAssy {
		part wheel : Wheel[1];
		part discBrakeAssy : DiscBrakeAssy[1];
		
		/**
		 * This constraint is asserted to be true, which means that the model
		 * is inconsistent if it the constraint is violated.
		 */
		assert constraint discBrakeFitConstraint_Alt: DiscBrakeFitConstraint_Alt(
			discBrakeAssy = WheelAssy::discBrakeAssy,
			wheel = WheelAssy::wheel
		);
	}
	
	part def DiscBrakeAssy {
		attribute radius : LengthValue[1] = 95@[mm];
	}
}