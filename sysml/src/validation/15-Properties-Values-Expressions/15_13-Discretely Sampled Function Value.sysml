package '15_13-Discretely Sampled Function Value' {
	private import SampledFunctions::SampledFunction;
	private import SampledFunctions::SamplePair;
	private import Collections::Array;
	private import ISQ::*;
	private import SI::*;
	private import MeasurementReferences::*;
	private import Time::*;

	attribute def MissionElapsedTimeScale :> TimeScale {
		:>> unit = s;
		attribute :>> definitionalEpoch {
			:>> num = 0;
			:>> definition = "time instant zero at launch";
		}
		attribute definitionalEpochInUTC : Iso8601DateTime;
		
		// Map the definitional epoch (t = 0) of this scale to a reference epoch expressed in UTC
		// This modeled as a 1D coordinate transformation (translation only)
		attribute :>> transformation : CoordinateFramePlacement {
			:>> source = UTC;
			:>> origin = definitionalEpochInUTC;
			:>> basisDirections = 1 [UTC];
		}
  }

	attribute mets: MissionElapsedTimeScale { 
		doc
		/*
		 * Define mission elapsed time scale starting at given UTC date time (in microsecond resolution)
		 */
		:>> definitionalEpochInUTC { :>> val = "2020-08-23T22:42:32.924534Z";}		
	}

	attribute def MissionElapsedTimeValue :> TimeInstantValue {
		doc
		/*
		 * Define scalar quantity value type for mission elapsed time
		 */
	 	:>> mRef = mets; 
	}

	attribute spatialCF: CartesianSpatial3dCoordinateFrame[1] {
		doc
		/*
		 * Define Cartesian 3D coordinate systems for position and velocity
		 * Create a velocity coordinate system from the spatial coordinate system through division by second
		 */
	   :>> mRefs = (m, m, m);
	}
	attribute velocityCF: CartesianVelocity3dCoordinateFrame[1] = spatialCF/s;

	attribute def PositionAndVelocity {
		attribute position : CartesianPosition3dVector[1];
		attribute velocity : CartesianVelocity3dVector[1];
	}

	attribute def AscentProfile :> SampledFunction {
		attribute def AscentSample :> SamplePair {
			attribute :>> domainValue: MissionElapsedTimeValue[1];
			attribute :>> rangeValue: PositionAndVelocity[1];
		}
		attribute :>> samples: AscentSample[*] ordered;
	}

	attribute ascentProfile1: AscentProfile {
		doc /* Example ascent profile */
		attribute sample1: AscentSample { :>> domainValue = 0.0 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0, 0, 0) [spatialCF]; :>> velocity = (0, 0, 0) [velocityCF]; } }
		attribute sample2: AscentSample { :>> domainValue = 2.5 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0.01, 0.03, 8.6) [spatialCF]; :>> velocity = (0, 0, 5.5) [velocityCF]; } }
		attribute sample3: AscentSample { :>> domainValue = 5.1 [mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = (0.04, 0.12, 18.6) [spatialCF]; :>> velocity = (0.05, 0.03, 25.3) [velocityCF]; } }
		attribute :>> samples = (sample1, sample2, sample3);
	}
}
