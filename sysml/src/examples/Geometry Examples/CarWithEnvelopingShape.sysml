package CarWithEnvelopingShape {
	import ShapeItems::Box;
	import SI::mm;

	/**
	 * Example car with simple enveloping shape that is a solid box
	 */
	part def Car {

		item boundingBox : Box [1] :> boundingShapes {
			:>> length = 4800 [mm];
			:>> width  = 1840 [mm];
			:>> height = 1350 [mm];
		}
	}
}