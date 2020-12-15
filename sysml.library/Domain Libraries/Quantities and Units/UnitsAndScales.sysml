/**
 * This package defines the general representations used to construct measurement scale and unit types.
 */
package UnitsAndScales {
	private import ScalarValues::*;
	private import Quantities::QuantityValue;
	private import Quantities::quantity;

	/**
	 * Representation of a measurement reference.
	 * 
	 * The measurement reference concept is defined in VIM "quantity" (see https://jcgm.bipm.org/vim/en/1.1.html) NOTE 2 as 
	 * "A reference can be a measurement unit, a measurement procedure, a reference material, or a combination of such." 
	 * 
	 * A MeasurementReference can have zero or more scaleValueDefinition that define particular essential 
	 * values on a measurement scale.
	 */
	abstract attribute def MeasurementReference :> ScalarValue {
		attribute name: String; 
		attribute scaleValueDefinition: ScaleValueDefinition[0..*];
	}
	
	/**
	 * Representation of a measurement unit.
	 * 
	 * Note: MeasurementUnit directly specializes MeasurementReference in order to allow for efficient and intuitive definition of a ratio scale.
	 * 
	 * A MeasurementUnit can be used in two ways:
	 * 1. Directly as the mRef in a QuantityValue, which implies that the effective measurement reference is a ratio scale defined by the unit.
	 * 2. As the unit of a MeasurementScale.
	 * 
	 * A MeasurementUnit specifies one or more UnitPowerFactors. 
	 */
	abstract attribute def MeasurementUnit :> MeasurementReference { 
		attribute unitPowerFactor: UnitPowerFactor[1..*] ordered;
		attribute unitConversion: UnitConversion[0..1];
	}
	
	/**
	 * Representation of a measurement unit that does not depend on any other measurement unit.
	 */
	abstract attribute def SimpleUnit :> MeasurementUnit {
		attribute unitPowerFactor: UnitPowerFactor redefines MeasurementUnit::unitPowerFactor {
			attribute unit redefines UnitPowerFactor::unit = SimpleUnit::self;
			attribute exponent redefines UnitPowerFactor::exponent = 1;			
		}
	}
	
	/**
	 * Representation of a derived measurement unit that depends on one or more powers of other measurement units.
	 * 
	 * VIM defines "derived unit" as "measurement unit for a derived quantity", see https://jcgm.bipm.org/vim/en/1.11.html .
	 */
	abstract attribute def DerivedUnit :> MeasurementUnit;
	
	/**
	 * Representation of a measurement unit power factor
	 * 
	 * Specifies a tuple of a referenced measurement unit and an exponent.
	 */
	attribute def UnitPowerFactor {
		attribute unit: MeasurementUnit;
		attribute exponent: Number;
	}
	
	/**
	 * Representation of the linear conversion relationship between one measurement unit and another measurement unit, that acts as a reference.  
	 */
	abstract attribute def UnitConversion {
		attribute referenceUnit: MeasurementUnit;
		attribute conversionFactor: Number;
	}
	
	/**
	 * Representation of a UnitConversion that is defined according to some convention.
	 */
	attribute def ConversionByConvention :> UnitConversion;
	
	/**
	 * Representation of a UnitConversion that is defined through reference to a named unit prefix associated to a conversion factor 
	 * that is a decimal or binary multiple or sub-multiple, as defined in ISO/IEC 80000-1.
	 * 
	 * Note: The actual value of the conversion factor is derived from the definition of the unit prefix.
	 * 
	 * Examples: kilometre for conversion factor 1000 with reference unit metre, nanofarad for 1E-9 farad.
	 */
	attribute def ConversionByPrefix :> UnitConversion {
		attribute prefix: UnitPrefix {
			attribute conversionFactor: Real redefines UnitPrefix::conversionFactor;
		}
		attribute conversionFactor redefines UnitConversion::conversionFactor = prefix::conversionFactor;		
	}

	/**
	 * Representation of a multiple or sub-multiple measurement unit prefix as defined in ISO/IEC 80000-1.
	 */	
	attribute def UnitPrefix {
		attribute name: String;
		attribute symbol: String;
		attribute conversionFactor: Integer;
	}
	
		
	/**
	 * Representation of a non-ratio measurement scale as opposed to a ratio measurement scale defined by a MeasurementUnit.
	 * 
	 * Note: A ratio scale is implied by direct use of a MeasurementUnit as the mRef in a QuantityValue.
	 */
	abstract attribute def MeasurementScale :> MeasurementReference {
		attribute unit: MeasurementUnit;
		attribute scaleValueMapping: ScaleValueMapping[0..1];	
	}
	
	/**
	 * Representation of an ordinal measurement scale.
	 */
	attribute def OrdinalScale :> MeasurementScale;
	
	/**
	 * Representation of an interval measurement scale.
	 * 
	 * The offset of one interval measurement scale w.r.t. another interval or ratio scale is defined through a scaleValueMapping, see MeasurementReference.
	 */
	attribute def IntervalScale :> MeasurementScale;
	
	/**
	 * Representation of a ratio measurement scale with a periodic cycle.
	 * 
	 * Note: The magnitude of the periodic cycle is defined by the modulus of the scale.
	 * Example: Planar angle with modulus 360 degrees, therefore on such a cyclic ratio scale, 
	 * an angle of 450 degrees is equivalent to an angle of 90 degrees, and -60 degrees is equivalent to 300 degrees.
	 */
	attribute def CyclicRatioScale :> MeasurementScale { 
		attribute modulus: Number;
	}

	/**
	 * Representation of a logarithmic measurement scale
	 * 
	 * The magnitude v of a ratio quantity value expressed on a logarithmic scale 
	 * for a magnitude x of a quantity value expressed on a ratio scale is computed as follows:
	 *   v = f * log_base( (x / x_ref )^a )
     * where:
	 *   f is a multiplication factor,
     *   log_base is the log function for the given logarithm base,
     *   x is the actual quantity,
     *   x_ref is a reference quantity,
     *   a is an exponent.
	 */
	attribute def LogarithmicScale :> MeasurementScale {
		attribute logarithmBase: Number;
		attribute factor: Number;
		attribute exponent: Number;
		attribute referenceQuantity: Quantities::QuantityValue[0..1];
	}
	
	/**
	 * Representation of the mapping of equivalent quantity values expressed on two different measurement scales
	 * 
	 * Example: The mapping between the equivalent temperature quantity values of 273.16 K on kelvin ratio scale 
	 * and 0.01 degree Celsius on the celsius interval scale would specify a referenceScaleValue referencing the 
	 * ScaleValueDefinition (273.16, "absolute thermodynamic temperature of the triple point of water") of the kelvin ratio scale
	 * and specify a mappedScaleValue referencing the 
	 * ScaleValueDefinition (0.01, "absolute thermodynamic temperature of the triple point of water") of the celsius interval scale.
	 */
	attribute def ScaleValueMapping {
		attribute referenceScaleValue: ScaleValueDefinition;	
		attribute mappedScaleValue: ScaleValueDefinition;
	}
	
	/**
	 * Representation of a particular value on a measurement scale
	 * 
	 * Typically such a particular value is defined by convention.
	 * Example: The 'kelvin' ratio scale for temperature could have a 
	 * ScaleValueDefinition(num => 273.16, description => "absolute temperature of the triple point of pure water")
	 * that is value of the definition of the scale.
	 */
	attribute def ScaleValueDefinition {
		attribute num: Number;
		attribute description: String;
	}
	
	/**
	 * Representation of a quantity dimension, which is a product of powers of the set of base quantities defined for a particular system of quantities, scales and units.
	 */
	attribute def QuantityDimension {
		attribute baseUnitPowerFactor: UnitPowerFactor[0..*] ordered;
	}

	/**
	 * Explicit definitions of "unit of dimension one" also known as "dimensionless unit" as well as the value and quantity of dimension one.
	 */
	attribute def DimensionOneUnit :> DerivedUnit {
		attribute name: String redefines MeasurementScale::name = "unit of dimension one";
	}
	attribute def DimensionOneValue :> QuantityValue {
		attribute num: Real redefines QuantityValue::num;
		attribute mRef: DimensionOneUnit redefines QuantityValue::mRef;
	}
	attribute dimensionOneQuantity : DimensionOneValue :> quantity;

	attribute one = DimensionOneUnit();
}