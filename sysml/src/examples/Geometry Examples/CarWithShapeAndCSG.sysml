package CarWithShapeAndCSG {
	private import SpatialItems::*;
	private import ShapeItems::*;
	private import Objects::Point;
	private import Quantities::VectorQuantityValue;
	private import MeasurementReferences::CoordinateFrame;
	private import MeasurementReferences::TranslationRotationSequence;
	private import MeasurementReferences::Translation;
	private import MeasurementReferences::Rotation;
	private import SI::*;

	part def Car :> SpatialItem {
		doc
		/*
		 * Car with simple engine
		 */
	
        item :>> shape = new Cuboid(4800 [mm], 1840 [mm], 1350 [mm]);

        attribute datum :>> coordinateFrame {
            :>> mRefs = (mm, mm, mm);
        }

		part powerSource : Engine [1] :> componentItems {
			:>> ecf { 
				:>> mRefs = datum.mRefs;
				:>> transformation : TranslationRotationSequence {
					:>> source = datum;
					:>> elements = ( new Translation((3800, (1840-190)/2, 40)[datum]) );
				}
			}
		}
	}

	part def Engine :> SpatialItem {
		doc
		/*
		 * Simple 2-cylinder engine
		 * 
		 * Note: The engine shape is modeled as a rectangular box with two cylindrical holes, a gross simplification.
		 */
	
		item :>> shape [1];
		
		attribute <ecf> engineCoordinateFrame :>> coordinateFrame;		

		part rawEngineBlock : SpatialItem [1] {
			item :>> shape : Box [1] {
	    		:>> length = 300 [mm];
	    		:>> width = 190 [mm];
	    		:>> height = 330 [mm];
			}
		}
		
		private attribute rearCylinderSpacing = 90 [mm];
		private item cylinder1 : SpatialItem [1] {
			item :>> shape : Cylinder [1] {
	    		:>> radius = 55 [mm];
	    		:>> height = 350 [mm];
			}
			attribute :>> coordinateFrame {
				:>> transformation : TranslationRotationSequence {
					:>> source = ecf;
					:>> elements = (new Translation( (rearCylinderSpacing, rawEngineBlock.shape.width/2, -10)[ecf]));
				}
			}
		}
		
		private attribute cylinderSpacing = 2*cylinder1.shape.radius + 20 [mm];
		private item cylinder2 : SpatialItem [1] {
			item :>> shape : Cylinder [1] {
	    		:>> radius = cylinder1.shape.radius;
	    		:>> height = cylinder1.shape.height;
			}
			attribute :>> coordinateFrame {
				:>> transformation : TranslationRotationSequence {
					:>> source = ecf;
					:>> elements = ( new Translation((rearCylinderSpacing + cylinderSpacing, rawEngineBlock.shape.width/2, -10)[ecf]) );
				}
			}
		}

		/* CSG difference of rawEngineBlock minus cylinder1 minus cylinder2 */
		attribute :> differencesOf[1] {
			item :>> elements = (rawEngineBlock, cylinder1, cylinder2);
		}
	}
}