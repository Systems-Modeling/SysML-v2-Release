package TextualRepresentation {
	import ScalarValues::Real;
	
	class C {
	    feature x: Real;
	    inv x_constraint;
	    rep inOCL about x_constraint language "ocl" 
	        /* self.x > 0.0 */
	}
	
	behavior setX(c : C, newX : Real) {
	    language "alf" 
	        /* c.x = newX;
	         * WriteLine("Set new x");
	         */
	}
	
}