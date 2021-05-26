package '15_08-Range Restriction' {
	import UnitsAndScales::*;
	import SI::*;
	import '15_01-Constants'::'Mathematical Constants'::pi;
	
	part def HeadLightsTiltKnob {
		attribute headLightsTile : LightBeamTiltAngleValue[1];
	}
	
	/* TODO: Define a model library for angular units. */
	attribute def PlaneAngleValue :> DimensionOneValue;
	attribute deg: DimensionOneUnit {
		attribute :>> unitConversion = ConversionByConvention(referenceUnit => one, conversionFactor => pi/180.0);
	}
	
	attribute def LightBeamTiltAngleValue :> PlaneAngleValue {
		/**
		 * Tilt angle shall be limited to the range between 50 and 80 degrees (inclusive).
		 */
		attribute angle: LightBeamTiltAngleValue :>> self;
		assert constraint { angle >= 50 [deg] & angle <= 80 [deg] }
	}
}