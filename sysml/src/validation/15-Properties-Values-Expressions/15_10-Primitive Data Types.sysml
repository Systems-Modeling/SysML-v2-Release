package '15.10-Primitive Data Types' {
	/*
	 * Primitive data types are defined in normative model libraries.
	 * Any more specialized data types can be declared in user-defined 
	 * model libraries or models as needed.
	 */
	 
	import ScalarValues::Integer {
	doc
	/*
	 * The unqualified Integer is signed, in line with integer numbers in mathematics.
	 */
	}
	
	import ScalarValues::Natural;
	attribute def UnsignedInteger :> Natural {
		doc /* Mathematically, unsigned integers are just natural numbers (non-negative integers). */		
	}
	
	import ScalarValues::Real {
	doc
	/*
	 * The unqualified Real is signed, in line with real numbers in mathematics.
	 */
	}
	
	attribute def UnsignedReal :> Real {
		doc
		/* TODO: Move this to the model library.
		 * (To be discussed whether Unsigned attribute defs should really be part of the primitive 
		 * data / attribute defs. These are more a computer data type concern.)
		 */
		attribute x: Real :>> self;
		assert constraint { x >= 0.0 }
	}
	
	import ScalarValues::String {
		doc
		/*
		 * String attributes are sequences of characters.
		 * TODO: Specify any requirements on character encoding.
		 */
	}
	
	import ScalarValues::Boolean {
		doc
		/*
		 * Boolean type has two legal attributes: true, false.
		 */
	}
	
	/* TODO: Specify standardized string encodings. */
	import Time::DateTime;
	
	enum def ConditionColor {
		doc
		/*
		 * Enumerations are defined as an implicit restriction of the extent of the
		 * enumeration type to the listed enumeration values.
		 * Note: Enumerations are currently limited to attributes.
		 */
	
		enum red;
		enum yellow;
		enum green;
	}
	
	attribute def ConditionLevel {
		attribute associatedColor : ConditionColor;
	}
	
	enum def SeverityEnum :> ConditionLevel {
		danger { 
			:>> associatedColor = ConditionColor::red;
		}
		warning { 
			:>> associatedColor = ConditionColor::yellow;
		}
		normal { 
			:>> associatedColor = ConditionColor::green;
		}
	}
	
	attribute def Diameter :> ISQ::LengthValue;	
	enum def DiameterChoice :> Diameter {
		small = 60 [SI::mm];
		medium = 70 [SI::mm];
		large = 80 [SI::mm];
	}	
	attribute aperatureDiameter: DiameterChoice = DiameterChoice::small;
	
}