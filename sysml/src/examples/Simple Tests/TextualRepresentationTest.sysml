package TextualRepresentationTest {
	import ScalarValues::Real;
	
	item def C {
	    attribute x: Real;
	    assert constraint x_constraint;
	    rep inOCL about x_constraint language "ocl" 
	        /* self.x > 0.0 */
	}
	
	action def setX(c : C, newX : Real) {
	    language "alf" 
	        /* c.x = newX;
	         * WriteLine("Set new x");
	         */
	}
	
}