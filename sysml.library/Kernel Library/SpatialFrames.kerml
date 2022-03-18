/**
 * This package models spatial frames of reference for quantifying the position of points 
 * in a three-dimensional space. 
 */
package SpatialFrames {
	private import Clocks::*;
	private import ScalarValues::NumericalValue;
	private import VectorValues::ThreeVectorValue;
	private import VectorValues::CartesianThreeVectorValue;
	private import VectorFunctions::isZeroVector;
	private import Objects::Body;
	private import Objects::Point;
	private import ControlFunctions::forAll;
	private import SequenceFunctions::includes;
	
	/**
	 * defaultFrame is a fixed SpatialFrame used as a universal default.
	 */
	readonly feature defaultFrame : SpatialFrame[1];
	
	/**
	 * A SpatialFrame is a three-dimensional Body that provides a spatial extent that 
	 * acts as a frame of reference for defining the physical position and displacement 
	 * vectors of Points over time.
	 */
	abstract struct SpatialFrame specializes Body;
	
	/**
	 * The PositionOf a Point relative to a SpatialFrame, at a specific time relative to a given
	 * Clock, as a positionVector that is a ThreeVectorValue.
	 */
	abstract function PositionOf {
		in point : Point[1];
		in time : NumericalValue[1];
		in frame : SpatialFrame[1] default defaultFrame;
		in clock : Clock[1] default defaultClock;
		return positionVector : ThreeVectorValue[1];
		
		/**
		 * The given point must exist at the given time.
		 */
		inv positionTimePrecondition {
			TimeOf(point.startShot) <= time and
			time <= TimeOf(point.endShot)
		}
		
		/**
		 * The result positionVector is equal to the PositionOf the Point spaceShot of the
		 * frame that encloses the given point, at the given time.
		 */
		inv spacePositionConstraint {
			(frame.spaceShots as Point)->forAll{in p : Point;
				p.spaceTimeEnclosedOccurrences->includes(point) implies
					positionVector == PositionOf(p, time, frame)
			}
		}
	}
	
	/**
	 * The CurrentPositionOf a Point relative to a SpatialFrame and a Clock is the PositionOf
	 * the Point relative to the SpatialFrame at the currentTime of the Clock.
	 */
	abstract function CurrentPositionOf {
		in point : Point[1];
		in frame : SpatialFrame[1] default defaultFrame;
		in clock : Clock[1] default defaultClock;
		return positionVector : ThreeVectorValue[1] =
			PositionOf(point, clock.currentTime, frame, clock);
	}
		
	/**
	 * The DisplacementOf two Points relative to a SpatialFrame, at a specific time relative to a
	 * given Clock, is the displacementVector computed as the difference between the PositionOf the 
	 * first Point and PositionOf the second Point, relative to that SpatialFrame, at that time.
	 */
	function DisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in time : NumericalValue;
		in frame : SpatialFrame[1] default defaultFrame;
		in clock : Clock[1] default defaultClock;
		return displacementVector : ThreeVectorValue[1] =
			PositionOf(point2, time, frame, clock) - PositionOf(point1, time, frame, clock);
			
		/**
		 * If either point1 or point2 occurs within the other, then the displacementVector is
		 * the zero vector.
		 */
		inv zeroDisplacementConstraint {
			(point1.spaceTimeEnclosedOccurrences->includes(point2) or
			point2.spaceTimeEnclosedOccurrences->includes(point1)) implies
				isZeroVector(displacementVector)
		}
	}
	
	/**
	 * The CurrentDisplacementOf two Points relative to a SpatialFrame and Clock is the DisplacementOf
	 * the Points relative to the SpacialFrame at the currentTime of the Clock.
	 */
	function CurrentDisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in frame : SpatialFrame[1] default defaultFrame;
		in clock : Clock[1] default defaultClock;
		return displacementVector : ThreeVectorValue[1] =
			DisplacementOf(point1, point2, clock.currentTime, frame, clock);
	}
	
	/**
	 * A CartesianSpatialFrame is a SpatialFrame relative to which all position and displacement
	 * vectors can be represented as CartesianThreeVectorValues.
	 */
	abstract struct CartesianSpatialFrame :> SpatialFrame;
	
	/**
	 * The PositionOf a Point relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
	 */
	abstract function CartesianPositionOf :> PositionOf {
		in point : Point[1];
		in time : NumericalValue[1];
		in frame : CartesianSpatialFrame[1];
		in clock : Clock[1] default defaultClock;
		return positionVector : CartesianThreeVectorValue[1];
	}
	
	/**
	 * The CurrentPositionOf a Point relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
	 */
	abstract function CartesianCurrentPositionOf :> CurrentPositionOf {
		in point : Point[1];
		in frame : CartesianSpatialFrame[1];
		in clock : Clock[1] default defaultClock;
		return positionVector : CartesianThreeVectorValue[1];
	}
	
	/**
	 * The DisplacementOf two Points relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
	 */
	function CartesianDisplacementOf :> DisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in time : NumericalValue[1];
		in frame : CartesianSpatialFrame[1];
		in clock : Clock[1] default defaultClock;
		return displacementVector : CartesianThreeVectorValue[1];
	}
		
	/**
	 * The CurrentDisplacementOf two Points relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
	 */
	function CartesianCurrentDisplacementOf :> CurrentDisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in frame : CartesianSpatialFrame[1];
		in clock : Clock[1] default defaultClock;
		return displacementVector : CartesianThreeVectorValue[1];
	}
		
}