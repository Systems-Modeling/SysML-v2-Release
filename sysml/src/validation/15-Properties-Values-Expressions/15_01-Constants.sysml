package '15_01-Constants' {
	import UnitsAndScales::*;
    import SI::*;
    import RealFunctions::*;

    /* TODO: Move mathematical and fundamental physical constants to model library package(s) */
    /* TODO: Add concept of precision for Real values */
    
    /* Note: Value properties that are bound to specific values are constants and have the specified
     * values in all contexts. It is not legal to redefine them.
     */    
    
    /**
     * Standard mathematical constants
     * 
     * Irrational constants cannot be represented exactly with finite precision.
     * However, they can be required to be implemented with a attribute that is accurate
     * to at least a certain precision.
     * 
     * (The decimal literals here should be interpreted as being fixed point and exact.)
     */
    package 'Mathematical Constants' {
        attribute e: Real {
        	assert constraint { Round(e * 1E20) == 271828182845904523536.0 }
        }
        attribute pi: Real {
        	assert constraint { Round(pi * 1E20) == 314159265358979323846.0 }
        }
    }

    /**
     * Standard fundamental physical constants
     * 
     * Physical constants have a standard measured attribute to a finite precision.
     * TODO: Represent physical constant attribute error bounds.
     *
     * The reference source is:
     * CODATA - Task Group on Fundamental Physical Constants (TGFC) - 2018 CODATA recommended values
     * See https://codata.org/initiatives/strategic-programme/fundamental-physical-constants/
     * For the actual values see https://pml.nist.gov/cuu/Constants/ 
     */
    package 'Fundamental Physical Constants' {
        attribute 'fine structure constant'      : DimensionOneValue = 7.2973525693E-3[one];  // 2018 CODATA attribute 7.2973525693E-3;  uncertainty = 0.0000000011E-3
        attribute 'electron to proton mass ratio': DimensionOneValue = 5.44617021487E-4[one]; // 2018 CODATA attribute 5.44617021487E-4; uncertainty = 0.00000000033E-4 
        attribute 'speed of light in vacuum'     : SpeedValue = 299792458[m/s];               // 2018 CODATA attribute 299792458 m s^-1; (exact)
     }

    package 'Global Context' {
        attribute 'nominal earth gravitational acceleration': AccelerationValue = 9.80665['m/s²'];
    }

    package 'Model X Context' {
        attribute 'amplifier gain': DimensionOneValue = 3.5[one];
    }
}
