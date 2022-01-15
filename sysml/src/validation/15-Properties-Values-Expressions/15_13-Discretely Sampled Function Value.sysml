package '15_13-Discretely Sampled Function Value' {
	import SampledFunctions::SampledFunction;
	import SampledFunctions::SamplePair;
	import Collections::Array;
	import ISQ::*;
	import SI::*;
	import UnitsAndScales::*;
	import Time::*;

	attribute def MissionElapsedTimeScale :> TimeScale {
		:>> unit = s;
		attribute :>> definitionalEpoch {
			:>> num = 0;
			:>> definition = "time instant zero at launch";
		}
		attribute definitionalEpochInUTC : Iso8601DateTime;
		
		// Map the definitional epoch (t = 0) of this scale to a reference epoch expressed in UTC
		// This modeled as a 1D coordinate transformation (translation only)
		attribute :>> placement : CoordinateTransformation {
			:>> source = UTC;
			:>> target = self;
			:>> origin = definitionalEpochInUTC;
		}
  }

	/** 
	 * Define mission elapsed time scale starting at given UTC date time (in microsecond resolution)
	 */
	attribute mets: MissionElapsedTimeScale { 
		:>> definitionalEpochInUTC { :>> val = "2020-08-23T22:42:32.924534Z";}		
	}

	/**
	 * Define scalar quantity value type for mission elapsed time
	 */
	attribute def MissionElapsedTimeValue :> TimeInstantValue { :>> mRef = mets; }

	/**
	 * Define Cartesian 3D coordinate systems for position and velocity
	 * Create a velocity coordinate system from the spatial coordinate system through division by second
	 */
	attribute spatialCS: Cartesian3dSpatialCoordinateSystem[1] { :>> mRefs = (m, m, m); }
	attribute velocityCS: Cartesian3dVelocityCoordinateSystem[1] = spatialCS/s { :>> isBound = false; }

	attribute def PositionAndVelocity {
		attribute position : Cartesian3dPositionVector[1];
		attribute velocity : Cartesian3dVelocityVector[1];
	}

	attribute def AscentProfile :> SampledFunction {
		attribute def AscentSample :> SamplePair {
			attribute :>> domainValue: MissionElapsedTimeValue[1];
			attribute :>> rangeValue: PositionAndVelocity[1];
		}
		attribute :>> samples: AscentSample[*] ordered;
	}

	/** Example ascent profile */
	attribute ascentProfile1: AscentProfile {
		attribute sample1: AscentSample { :>> domainValue = 0.0 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0, 0, 0) [spatialCS]; :>> velocity = (0, 0, 0) [velocityCS]; } }
		attribute sample2: AscentSample { :>> domainValue = 2.5 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0.01, 0.03, 8.6) [spatialCS]; :>> velocity = (0, 0, 5.5) [velocityCS]; } }
		attribute sample3: AscentSample { :>> domainValue = 5.1 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0.04, 0.12, 18.6) [spatialCS]; :>> velocity = (0.05, 0.03, 25.3) [velocityCS]; } }
		attribute :>> samples = (sample1, sample2, sample3);
	}
}
