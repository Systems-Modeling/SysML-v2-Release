package '15_13-Discretely Sampled Function Value' {
	import NonScalarValues::SampledFunctionValue;
	import ISQ::*;
	import BasicGeometry::*;
	
	part def AscentProfile :> SampledFunctionValue {
		/* Note: The multiplicity 0..* and ordering are automatically "inherited"
		 * from the redefined attribute properties. */
		attribute missionElapsedTime : TimeValue :>> domain;
		attribute locationAndVelocity : LocationAndVelocity :>> range;
	}
	
	attribute def LocationAndVelocity {
		attribute location : Location3DCartesian[1];
		attribute velocity : Velocity3DCartesian[1];
	}
	
	attribute def Velocity3DCartesian {
		attribute vX : SpeedValue[1];
		attribute vY : SpeedValue[1];
		attribute vZ : SpeedValue[1];
	}
}