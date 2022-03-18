package ExternalShapeRefExample {
	import ScalarValues::String;
	import ShapeItems::*;
	import ISQ::mass;
	import SI::mm;

	/**
	 * Metadata to reference an externally defined shape.
	 */
	attribute def ExternalShapeRef {
		attribute purpose : String[1];
		attribute shapeIri : String[1];
	}
	
	part myBatteryUnit {
	    item :>> shape : Shell {
			metadata ExternalShapeRef {
				purpose = "highLoD";
				shapeIri = "file:/detailed-geometry/LEMS-250W_BatteryHousing_Example.step";
			}
		}		

		private item envelopingBoxBatteryUnit : Box :> envelopingShapes {
			:>> length = 140[mm];
			:>> width = 148[mm];
			:>> height = 90[mm];
		}
	}
}