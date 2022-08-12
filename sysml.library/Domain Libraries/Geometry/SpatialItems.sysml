package SpatialItems {
	doc
	/*
	 * This package models physical items that have a spatial extent and act as a spatial frame of reference
	 * for obtaining position and displacement vectors of points within them.
	 */

	private import Objects::Point;
	private import SpatialFrames::SpatialFrame;
	private import Quantities::VectorQuantityValue;
	private import MeasurementReferences::CoordinateFrame;
	private import Time::Clock;
	private import Time::TimeInstantValue;
	private import ISQ::Cartesian3dSpatialCoordinateFrame;
	private import VectorFunctions::isZeroVector;
	private import ControlFunctions::forAll;
	
	item def SpatialItem :> SpatialFrame {
		doc
		/*
		 * A SpatialItem is an Item with a three-dimensional spatial extent that also acts as a SpatialFrame of reference.
		 */
	
		ref item :>> self : SpatialItem;

		ref item :>> localClock : Clock[1] default Time::universalClock {
			doc
			/*
			 * A local Clock to be used as the corresponding time reference within this SpatialItem. 
			 * By default this is the singleton universalClock.
			 */
			}
		
		attribute coordinateFrame : CoordinateFrame[1] default Cartesian3dSpatialCoordinateFrame() {
			doc
			/*
			 * The three-dimensional CoordinateFrame to be used as the measurement reference for position 
			 * and displacement vector values relative to this SpatialItem.
			 */
		
			attribute :>> dimensions = 3;
		}
		
		item originPoint : Point[1] :> spaceShots {
			doc
			/*
			 * The Point at the origin of the coordinateFrame of this SpatialItem.
			 */
		}
		
		assert constraint originPointConstraint {
			doc
			/*
			 * The CurrentPositionOf the originPoint must always be a zero vector.
			 */
		
			isZeroVector(CurrentPositionOf(originPoint, that))
		}
	}

	item def CompoundSpatialItem :> SpatialItem {
		doc
		/*
		 * A CompoundSpatialItem is a SpatialItem that is a spatial union of a collection of component SpatialItems.
		 */	
		
		item componentItems : SpatialItem[1..*] ordered :> subitems {
			doc
			/*
			 * The composite SpatialItems that together make up this CompoundSpatialItem. 
			 * The coordinateFrames of the compositeItems are nested in the coordinateFrame of the CompoundSpatialItem, 
			 * and, by default, they have the same localClock as the CompoundSpatialItem.
			 */
		
			item :>> localClock default (that as SpatialItem).localClock;
			attribute :>> coordinateFrame {
				attribute :>> transformation[1] {
				 	attribute :>> source default (that.that.that as SpatialItem).coordinateFrame;
				 	attribute :>> target default that;
				}
			}
		}
		
		attribute componentUnion[1] :> unionsOf {
			doc
			/*
			 * A CompoundSpatialItem is a spatial union of its componentItems.
			 */
		
			item :>> elements = componentItems;
		}
		
	}
	
	calc def PositionOf :> SpatialFrames::PositionOf {
		doc
		/*
		 * The PositionOf a Point relative to a SpatialItem, at a specific TimeInstantValue relative to a given Clock,
		 * is a positionVector that is a VectorQuantityValue in the coordinateFrame of the SpatialItem.
		 * The default Clock is the localClock of the SpatialItem.
		 */
	
		in point : Point[1];
		in timeInstant : TimeInstantValue[1];
		in enclosingItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default enclosingItem.localClock;
		return positionVector : VectorQuantityValue[1] {
			attribute :>> mRef = enclosingItem.coordinateFrame;
			attribute :>> isBound = true;
		}
	}

	calc def CurrentPositionOf :> SpatialFrames::CurrentPositionOf {
		doc
		/*
		 * The CurrentPositionOf a Point relative to a SpatialItem and a Clock is the PositionOf
		 * the Point relative to the SpatialItem at the currentTime of the Clock.
		 */
	
		in point : Point[1];
		in enclosingItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default enclosingItem.localClock;
		return positionVector : VectorQuantityValue[1] {
			attribute :>> mRef = enclosingItem.coordinateFrame;
			attribute :>> isBound = true;
		}
	}

	calc def DisplacementOf :> SpatialFrames::DisplacementOf {
		doc
		/*
		 * The DisplacementOf two Points relative to a SpatialItem, at a specific TimeInstantValue relative to a
		 * given Clock, is the displacementVector computed as the difference between the PositionOf the 
		 * first Point and PositionOf the second Point, relative to that SpatialItem, at that timeInstant.
		 */
	
		in point1 : Point[1];
		in point2 : Point[1];
		in timeInstant : TimeInstantValue[1];
		in spatialItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default spatialItem.localClock;
		return displacementVector : VectorQuantityValue[1] {
			attribute :>> mRef = spatialItem.coordinateFrame;
			attribute :>> isBound = false;
		}
	}

	calc def CurrentDisplacementOf :> SpatialFrames::CurrentDisplacementOf {
		doc
		/*
		 * The CurrentDisplacementOf two Points relative to a SpatialItem and a Clock is the DisplacementOf
		 * the Points relative to the SpatialItem, at the currentTime of the Clock.
		 */
	
		in point1 : Point[1];
		in point2 : Point[1];
		in spatialItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default spatialItem.localClock;
		return displacementVector : VectorQuantityValue[1] {
			attribute :>> mRef = spatialItem.coordinateFrame;
			attribute :>> isBound = false;
		}
	}

}