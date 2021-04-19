package '15_13-Discretely Sampled Function Value' {
	import Collections::SampledFunction;
	import Collections::SamplePair;
	import Collections::Array;
	import ISQ::*;
	import SI::*;
	import UnitsAndScales::*;
	
    /*
     * Coordinated Universal Time scale (UTC)
     * TODO: Create a vector quantity that captures all ISO 8601 components: year, month, day, hour, minute, second
     */
    attribute UTC: IntervalScale {
    	:>> longName = "Coordinated Universal Time scale (UTC) as specified in Rec. ITU-R TF.460-6";
        :>> unit = s;
        attribute referenceInstantOfTime: ScaleValueDefinition {
            :>> num = 0;
            :>> description = "Approximate agreement with International Atomic Time (TAI) on 1958-01-01";
        }
        attribute :>> scaleValueDefinitions = {referenceInstantOfTime};
    }
	
	attribute def MissionElapsedTimeScale :> IntervalScale {
    	:>> longName = "mission elapsed time starting at launch";
		:>> unit = s;
		attribute launchTimeStamp: ScaleValueDefinition {
			:>> num = 0;
			:>> description = "zero instant of time at launch";
		}
        attribute :>> scaleValueDefinitions = {launchTimeStamp};
        private attribute launchTimestampMapping: ScaleValueMapping {
            :>> mappedScaleValue = launchTimeStamp;
            :>> referenceScaleValue = UTC::referenceInstantOfTime;        	
        }
        attribute :>> scaleValueMapping = launchTimestampMapping;
        
        // TODO: Add proper ISO 8601 attribute def in Time.sysml. Temporarily represented by String in ISO 8601 format.
        attribute zeroReferenceTimestamp: String;  
    }
	
	// Define mission elapsed time scale
	attribute mets: MissionElapsedTimeScale { :>> zeroReferenceTimestamp = "2020-08-23T22:42:32.924534Z"; }
	
	attribute def MissionElapsedTimeValue :> TimeValue { :>> mRef = mets; }
		
	/*
	 * Define Cartesian 3D coordinate systems for position and velocity
	 * Create a velocity coordinate system from the spatial coordinate system through division by second
	 */
	attribute spatialCS: Cartesian3dSpatialCoordinateSystem[1] { :>> mRefs = {m, m, m}; }
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

	/* Example ascent profile */
	attribute ascentProfile1: AscentProfile {
		attribute sample1: AscentSample { :>> domainValue = 0.0@[mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = {0, 0, 0}@[spatialCS]; :>> velocity = {0, 0, 0}@[velocityCS]; } }
		attribute sample2: AscentSample { :>> domainValue = 2.5@[mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = {0.01, 0.03, 8.6}@[spatialCS]; :>> velocity = {0, 0, 5.5}@[velocityCS]; } }
		attribute sample3: AscentSample { :>> domainValue = 5.1@[mets]; :>> rangeValue = pv1;
			attribute pv1: PositionAndVelocity {:>> position = {0.04, 0.12, 18.6}@[spatialCS]; :>> velocity = {0.05, 0.03, 25.3}@[velocityCS]; } }
		attribute :>> samples = {sample1, sample2, sample3};
	}
}