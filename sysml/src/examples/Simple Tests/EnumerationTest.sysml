package EnumerationTest {
	
	attribute def Color {
		attribute val : ScalarValues::Natural;
	}
	
	/**
	 * An EnumerationDefinition can contain only EnumerationUsages. However,
	 * it can specialize an AttributeDefinition in order to inherit
	 * common features for its enumeration values.
	 */
	enum def ColorKind :> Color {
		enum red {
			:>> val = 0;
		}
		enum blue {
			:>> val = 1;
		}
		enum green {
			:>> val = 2;
		}
	}
	
	enum color : ColorKind;
	attribute color1 : ColorKind = ColorKind::blue;
	
	/** 
	 * Note that "blue" can be used without qualification here because,
	 * currently, names in the expression on the right-hand side are
	 * resolved in the scope of the feature being declared, which inherits
	 * the members of its type.
	 */
	attribute color2 : ColorKind = blue;
	
	/**
	 * The "enum" keyword is optional for EnumerationUsages used to define the
	 * enumerated values of an EnumerationDefinition.
	 */
	enum def E1 { a; b; c; }
	
	enum def E2;
	
	/**
	 * An EnumerationDefinition can also be used to restrict a supertype to
	 * specific values.
	 */
	attribute def Size :> ScalarValues::Real;		
	enum def SizeChoice :> Size {
		= 60.0;
		= 70.0;
		= 80.0;
	}	
	enum size: SizeChoice = 60.0;
	
}