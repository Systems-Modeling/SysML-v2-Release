package 'Individuals and Roles' {
	import 'Part Definition Example'::*;
	
	part def Wheel;
	
	individual def Vehicle_1 :> Vehicle {
		part leftFrontWheel : Wheel;
		part rightFrontWheel : Wheel;
	}
	
	individual def Wheel_1 :> Wheel;
	
	individual vehicle_1 : Vehicle_1 {
		snapshot vehicle_1_t0 {
			snapshot leftFrontWheel_t0 : Wheel_1 :>> leftFrontWheel;
		}
		
		then snapshot vehicle_1_t1 {
			snapshot rightFrontWheel_t1 : Wheel_1 :>> rightFrontWheel;
		}
	}
}