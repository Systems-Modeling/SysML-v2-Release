package '15.10-Primitive Data Types' {
	/*
	 * Primitive data types are defined in normative model libraries.
	 * Any more specialized data types can be declared in user-defined 
	 * model libraries or models as needed.
	 */
	 
	/**
	 * The unqualified Integer is signed, in line with integer numbers in mathematics.
	 */
	import ScalarValues::Integer;
	
	import ScalarValues::Natural;
	/** Mathematically, unsigned integers are just natural numbers (non-negative integers). */
	attribute def UnsignedInteger :> Natural;
	
	/**
	 * The unqualified Real is signed, in line with real numbers in mathematics.
	 */
	import ScalarValues::Real;
	
	/** TODO: Move this to the model library.
	 * (To be discussed whether Unsigned attribute defs should really be part of the primitive 
	 * data / attribute defs. These are more a computer data type concern.)
	 */
	attribute def UnsignedReal :> Real {
		attribute x: Real :>> self;
		assert constraint { x >= 0.0 }
	}
	
	/**
	 * String attributes are sequences of characters.
	 * TODO: Specify any requirements on character encoding.
	 */
	import ScalarValues::String;
	
	/**
	 * Boolean type has two legal attributes: true, false.
	 */
	import ScalarValues::Boolean;
	
	/* TODO: Specify standardized string encodings. */
	import Time::DateTime;
	
	/* TODO: Define support for enumeration types. */
}