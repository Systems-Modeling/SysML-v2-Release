package BasicGeometry {
	private import UnitsAndScales::DimensionOneValue;
	private import ISQ::LengthValue;
    private import SI::*;
    private import RealFunctions::*;

    /**
     * Component of Cartesian direction vector with value in interval [-1:1]
     */
    attribute def DirectionValue :> DimensionOneValue {
    	assert constraint { num >= -1.0 & num <= 1.0 }
    }

    attribute def CoordinateValue :> LengthValue;

    attribute def Location3DCartesian {
        attribute x: CoordinateValue[1];
        attribute y: CoordinateValue[1];
        attribute z: CoordinateValue[1];
    }

    attribute def Direction3DCartesian {
        attribute xDir: DirectionValue[1];
        attribute yDir: DirectionValue[1];
        attribute zDir: DirectionValue[1];
        assert constraint { xDir**2 + yDir**2 + zDir**2 == 1.0 }
    }

    attribute def AxisPlacement3DCartesian {
        attribute location: Location3DCartesian[1];
        attribute zAxisDir: Direction3DCartesian[1];
        attribute xAxisDir: Direction3DCartesian[1];
    }
}