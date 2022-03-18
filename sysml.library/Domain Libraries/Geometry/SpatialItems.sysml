/**
 * This package models physical items that have a spatial extent and act as a spatial frame of reference
 * for obtaining position and displacement vectors of points within them.
 */
package SpatialItems {
	private import Objects::Point;
	private import SpatialFrames::SpatialFrame;
	private import Quantities::VectorQuantityValue;
	private import UnitsAndScales::VectorMeasurementReference;
	private import Time::Clock;
	private import Time::TimeInstantValue;
	private import ISQ::Cartesian3dSpatialCoordinateSystem;
	private import VectorFunctions::isZeroVector;
	private import ControlFunctions::forAll;
	
	/**
	 * A SpatialItem is an Item with a three-dimensional spatial extent that also acts as a SpatialFrame of reference.
	 */
	item def SpatialItem :> SpatialFrame {
		ref item :>> self : SpatialItem;
		
		/**
		 * A local Clock to be used as the corresponding time reference within this SpatialItem. 
		 * By default this is the global defaultClock.
		 */
		ref item localClock : Clock[1] default Time::defaultClock;
		
		/**
		 * The three-dimensional VectorMeasurementReference to be used as the measurement reference for position 
		 * and displacement vector values relative to this SpatialItem.
		 */
		attribute coordinateFrame : VectorMeasurementReference[1] default Cartesian3dSpatialCoordinateSystem() {
			attribute :>> dimensions = 3;
		}
		
		/**
		 * The Point at the origin of the coordinateFrame of this SpatialItem.
		 */
		item originPoint : Point[1] :> spaceShots;
		
		/**
		 * The CurrentPositionOf the originPoint must always be a zero vector.
		 */
		assert constraint originPointConstraint {
			isZeroVector(CurrentPositionOf(originPoint, SpatialItem::self))
		}
	}
	
	/**
	 * A CompoundSpatialItem is a SpatialItem that is a spacial union of a collection of component SpatialItems.
	 */
	item def CompoundSpatialItem :> SpatialItem {
		
		/**
		 * The composite SpatialItems that together make up this CompoundSpatialItem. 
		 * The coordinateFrames of the compositeItems are nested in the coordinateFrame of the CompoundSpatialItem, 
		 * and, by default, they have the same localClock as the CompoundSpacialItem.
		 */
		item componentItems : SpatialItem[0..*] ordered :> subitems {
			item nestedLocalClock :>> localClock default localClock;
			attribute nestedBasisDirections : VectorQuantityValue[3];
			attribute nestedOrigin : VectorQuantityValue[0..1];
			attribute nestedCoordinateFrame :>> coordinateFrame {
				attribute :>> placement[1] {
				 	attribute :>> source = coordinateFrame;
				 	attribute :>> target = nestedCoordinateFrame;
				 	attribute :>> basisDirections = nestedBasisDirections;
				 	attribute :>> origin = nestedOrigin;
				}
			}
		}
		
		/**
		 * A CompoundSpatialItem is a spatial union of its componentItems.
		 */
		attribute componentUnion[1] :> unionsOf {
			item :>> elements = componentItems;
		}
		
	}
	
	/**
	 * The PositionOf a Point relative to a SpatialItem, at a specific TimeInstantValue relative to a given Clock,
	 * is a positionVector that is a VectorQuantityValue in the coordinateFrame of the SpatialItem.
	 * The default Clock is the localClock of the SpatialItem.
	 */
	calc def PositionOf :> SpatialFrames::PositionOf {
		in point : Point[1];
		in timeInstant : TimeInstantValue[1];
		in enclosingItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default enclosingItem.localClock;
		return positionVector : VectorQuantityValue[1] {
			attribute :>> mRef = enclosingItem.coordinateFrame;
			attribute :>> isBound = true;
		}
	}

	/**
	 * The CurrentPositionOf a Point relative to a SpatialItem and a Clock is the PositionOf
	 * the Point relative to the SpatialItem at the currentTime of the Clock.
	 */
	calc def CurrentPositionOf :> SpatialFrames::CurrentPositionOf {
		in point : Point[1];
		in enclosingItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default enclosingItem.localClock;
		return positionVector : VectorQuantityValue[1] {
			attribute :>> mRef = enclosingItem.coordinateFrame;
			attribute :>> isBound = true;
		}
	}

	/**
	 * The DisplacementOf two Points relative to a SpatialItem, at a specific TimeInstantValue relative to a
	 * given Clock, is the displacementVector computed as the difference between the PositionOf the 
	 * first Point and PositionOf the second Point, relative to that SpatialItem, at that timeInstant.
	 */
	calc def DisplacementOf :> SpatialFrames::DisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in timeInstant : TimeInstantValue[1];
		in spacialItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default spacialItem.localClock;
		return displacementVector : VectorQuantityValue[1] {
			attribute :>> mRef = spacialItem.coordinateFrame;
			attribute :>> isBound = false;
		}
	}

	/**
	 * The CurrentDisplacementOf two Points relative to a SpatialItem and a Clock is the DisplacementOf
	 * the Points relative to the SpacialItem, at the currentTime of the Clock.
	 */
	calc def CurrentDisplacementOf :> SpatialFrames::CurrentDisplacementOf {
		in point1 : Point[1];
		in point2 : Point[1];
		in spacialItem :>> 'frame' : SpatialItem[1];
		in clock : Clock[1] default spacialItem.localClock;
		return displacementVector : VectorQuantityValue[1] {
			attribute :>> mRef = spacialItem.coordinateFrame;
			attribute :>> isBound = false;
		}
	}

}