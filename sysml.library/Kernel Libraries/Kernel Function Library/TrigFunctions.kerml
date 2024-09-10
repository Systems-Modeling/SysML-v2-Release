standard library package TrigFunctions {
	doc
	/*
	 * This package defines basic trigonometric functions on real numbers.
	 */

	public import ScalarValues::Real;
	
	feature pi : Real;
	inv piPrecision { RealFunctions::round(pi * 1E20) == 314159265358979323846.0 }
	
	function deg { in theta_rad : Real[1];
		return : Real[1] = theta_rad * 180 / pi;
	}
	function rad { in theta_deg : Real;
		return : Real[1] = theta_deg * pi / 180;
	}
	
	datatype UnitBoundedReal :> Real {
		inv unitBound { -1.0 <= that & that <= 1.0 }
	}
	
	function sin { in theta : Real[1]; return : UnitBoundedReal[1]; }
	function cos { in theta : Real[1]; return : UnitBoundedReal[1]; }
	function tan { in theta : Real[1]; 
        return : Real = sin(theta) / cos(theta);
	}
	function cot { in theta : Real; 
        return : Real = cos(theta) / sin(theta);
	}
	
	function arcsin { in x : UnitBoundedReal[1]; return : Real[1]; }
	function arccos { in x : UnitBoundedReal[1]; return : Real[1]; }
	function arctan { in x : Real[1]; return : Real[1]; }
}