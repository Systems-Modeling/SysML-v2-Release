package CarWithShapeAndCSG {
	import SpatialItems::*;
    import ShapeItems::*;
    import Objects::Point;
	import Quantities::VectorQuantityValue;

	item def Car :> CompoundSpatialItem {
		item :>> shape : Cuboid [1] {
			/* Quantify height, etc, by redefining nested features. */
		}
		part powerSource : Engine [1] :> componentItems;
	}

	part def Engine :> SpatialItem {
		item :>> shape [1];
		
		/* Specify relative positions of c1 and c2 here.  */
		private attribute c1Position : VectorQuantityValue;
		private attribute c2Position : VectorQuantityValue;
		
		private item c1 : SpatialItem [1] {
			item :>> shape : Cylinder [1] {
				 /* Quantify radius, etc, by redefining nested features. */
			}
			attribute :>> coordinateFrame {
				attribute origin = c1Position;
			}
		}
		
		private item c2 : SpatialItem [1] {
			item :>> shape : Cylinder [1] {
				 /* Quantify radius, etc, by redefining nested features. */
			}
			attribute :>> coordinateFrame {
				attribute origin = c2Position;
			}
		}
		
		/* CSG intersection of c1 and c2. */
		attribute :> intersectionsOf[1] {
			item :>> elements = (c1, c2);
		}

	}
}