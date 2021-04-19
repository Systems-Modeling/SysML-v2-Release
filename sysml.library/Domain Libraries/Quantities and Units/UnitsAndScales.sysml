/**
 * This package defines the general representations used to construct measurement scale and unit types.
 * TODO: Propose to rename to MeasurementReferences
 */
package UnitsAndScales {
	private import ScalarValues::*;
	private import Quantities::*;
	private import Collections::*;

	/**
	 * Representation of a measurement reference.
	 * 
	 * The measurement reference concept is defined in VIM "quantity" NOTE 2 as "A reference can be a measurement unit, 
	 * a measurement procedure, a reference material, or a combination of such.", see https://jcgm.bipm.org/vim/en/1.1.html .
	 * 
	 * Similar to TensorQuantityValue, in the most general case a measurement reference is a TensorMeasurementReference, which is 
	 * is an AttributeDefinition that represents the [VIM] concept measurement reference. However it is generalized for 
	 * tensor, vector and scalar quantities. In this generalized definition, the  measurement references for all dimensions of a 
	 * quantity are specified through the mRefs attribute. Each element of mRefs is a ScalarMeasurementReference.
	 * 
	 * The longName of a TensorMeasurementReference is the spelled-out human readable name of the measurement reference. 
	 * For example for typical measurement units for the speed quantity the longName would be "metre per second", "kilometre per hour" 
	 * and "mile per hour".
	 * 
	 * To stress the generality of the TensorMeasurementReference the alias MeasurementReference is defined.
	 */
	attribute def TensorMeasurementReference :> Array {
		attribute longName: String;
		attribute isBound: ScalarValues::Boolean;
		attribute order :>> rank;
		attribute mRefs: ScalarMeasurementReference[1..*] :>> elements;
	}
	alias TensorMeasurementReference as MeasurementReference;
	
	/**
	 * A VectorMeasurementReference is a specialization of MeasurementReference for vector quantities that are 
	 * typed by a VectorQuantityValue. Its order is one. Implicitly a it defines a vector space of dimension N = dimensions[1]. 
	 * The N basis unit vectors that span the vector space are defined by the mRefs which each are a ScalarMeasurementReference, 
	 * typically a MeasurementUnit or an IntervalScale.
	 * 
	 * Pairwise VectorQuantityValue and VectorMeasurementReference specializations can also be used to define a vector space 
	 * for state vectors as used in state-space representation models.
	 */
	attribute def VectorMeasurementReference :> TensorMeasurementReference {
		attribute :>> dimensions: Positive[1];
		attribute isOrthogonal: Boolean[1];
		attribute placement: CoordinateTransformation[0..1];
	}

	/**
	 * A ScalarMeasurementReference is a specialization of VectorMeasurementReference for scalar quantities 
	 * that are typed by a ScalarQuantityValue and for components of tensor or vector quantities. 
	 * Its order is zero. A ScalarMeasurementReference is also a generalization of MeasurementUnit and MeasurementScale. 
	 * It establishes how to interpret the numerical value (num) of a ScalarQuantityValue or a component of
	 * a tensor or vector quantity value, and establishes its actual quantity dimension.
	 * A MeasurementReference can have zero or more scaleValueDefinition that define particular essential 
	 * values on a measurement scale.
	 */
	abstract attribute def ScalarMeasurementReference :> VectorMeasurementReference, ScalarValue {
		attribute :>> dimensions: Positive[1] = 1;
		attribute :>> order = 0;
		attribute :>> isOrthogonal = true;
		attribute scaleValueDefinitions: ScaleValueDefinition[0..*];
		attribute quantityDimension: QuantityDimension[1];
	}
	
	/**
	 * Coordinate system transformation
	 */
	 attribute def CoordinateTransformation {
	 	attribute source: VectorMeasurementReference[1];
	 	attribute target: VectorMeasurementReference[1];
	 	attribute basisDirections: VectorQuantityValue[1..*];
	 	attribute origin: VectorQuantityValue[0..1];
	 }
	
	/**
	 * Representation of a measurement unit.
	 * 
	 * Note: MeasurementUnit directly specializes ScalarMeasurementReference in order to allow for efficient and intuitive definition of a ratio scale.
	 * 
	 * A MeasurementUnit can be used in two ways:
	 * 1. Directly as the mRef in a QuantityValue, which implies that the effective measurement reference is a ratio scale defined by the unit.
	 * 2. As the unit of a MeasurementScale.
	 * 
	 * A MeasurementUnit specifies one or more UnitPowerFactors. 
	 */
	abstract attribute def MeasurementUnit :> ScalarMeasurementReference {
		attribute unitPowerFactors: UnitPowerFactor[0..*] ordered;
		attribute unitConversion: UnitConversion[0..1];
        assert constraint hasValidUnitPowerFactors : VerifyUnitPowerFactors(
        	unitPowerFactors = unitPowerFactors, 
        	quantityDimension = quantityDimension
        );
	}
	

	/**
	 * Representation of a measurement unit that does not depend on any other measurement unit.
	 */
	abstract attribute def SimpleUnit :> MeasurementUnit {
		private attribute simpleUnitSelf: SimpleUnit = self;
	    attribute :>> unitPowerFactors: UnitPowerFactor[1] {
			attribute unit :>> UnitPowerFactor::unit = simpleUnitSelf;
			attribute exponent :>> UnitPowerFactor::exponent = 1;			
		}
	}


	/**
	 * Representation of a derived measurement unit that depends on one or more powers of other measurement units.
	 * 
	 * VIM defines "derived unit" as "measurement unit for a derived quantity", see https://jcgm.bipm.org/vim/en/1.11.html .
	 */
	abstract attribute def DerivedUnit :> MeasurementUnit;
	

	/**
	 * Representation of a measurement unit power factor, which is a tuple 
	 * of a referenced measurement unit and an exponent.
	 */
	attribute def UnitPowerFactor {
		attribute unit: MeasurementUnit;
		attribute exponent: Real;
	}
	
	/**
	 * Representation of the linear conversion relationship between one measurement unit and another measurement unit, that acts as a reference.  
	 */
	abstract attribute def UnitConversion {
		attribute referenceUnit: MeasurementUnit;
		attribute conversionFactor: Real;
	}
	
	/**
	 * Representation of a UnitConversion that is defined according to some convention.
	 */
	attribute def ConversionByConvention :> UnitConversion;
	
	/**
	 * Representation of a UnitConversion that is defined through reference to a named unit prefix,
	 * that in turn represents a decimal or binary multiple or sub-multiple, as defined in ISO/IEC 80000-1.
	 * 
	 * Note: The actual value of the conversion factor is derived from the definition of the unit prefix.
	 * 
	 * Examples: kilometre for conversion factor 1000 with reference unit metre, nanofarad for 1E-9 farad.
	 */
	attribute def ConversionByPrefix :> UnitConversion {
		attribute prefix: UnitPrefix[1];
		attribute conversionFactor redefines UnitConversion::conversionFactor = prefix::conversionFactor;		
	}

	/**
	 * Representation of a multiple or sub-multiple measurement unit prefix as defined in ISO/IEC 80000-1.
	 */	
	attribute def UnitPrefix {
		attribute longName: String;
		attribute symbol: String;
		attribute conversionFactor: Real;
	}
	
		
	/**
	 * Representation of a non-ratio measurement scale as opposed to a ratio measurement scale defined by a MeasurementUnit.
	 * 
	 * Note: A ratio scale is implied by direct use of a MeasurementUnit as the mRef in a QuantityValue.
	 */
	abstract attribute def MeasurementScale :> ScalarMeasurementReference {
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
		attribute referenceQuantity: ScalarQuantityValue[0..1];
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
	 * Explicit definitions of "unit of dimension one" also known as "dimensionless unit" as well as the value and quantity of dimension one.
	 */
	attribute def DimensionOneUnit :> DerivedUnit {
		attribute :>> longName = "unit of dimension one";
		attribute :>> unitPowerFactors = {};
	}
	attribute def DimensionOneValue :> QuantityValue {
		attribute num: Real redefines QuantityValue::num;
		attribute mRef: DimensionOneUnit redefines QuantityValue::mRef;
	}
	attribute dimensionOneQuantities : DimensionOneValue[0..*] nonunique:> scalarQuantities;

	attribute one = DimensionOneUnit();
	
	/**
	 * Explicit definitions of generic "count" quantity.
	 */
	attribute def CountValue :> DimensionOneValue;
	attribute countQuantities : CountValue[*] nonunique:> scalarQuantities;
	
	/**
	 * A SystemOfUnits represents the essentials of [VIM] concept "system of units" (https://jcgm.bipm.org/vim/en/1.13.html), defined as a
	 * "set of base units and derived units, together with their multiples and submultiples, defined in accordance with given rules, 
	 * for a given system of quantities".
	 * The base units are a particular selection of measurement units for each of the base quantities of a system of quantities,
	 * that form the basis on top of which all other (derived) units are defined.
	 */
	attribute def SystemOfUnits {
		attribute longName: String[1];
		attribute baseUnits: SimpleUnit[1..*] ordered;
	}

	/**
	 * Declare a constraint to verify that the given unit power factors comply with the required quantity dimension
	 * 
	 * TODO: The implementation of this constraint requires reflection.
	 */
    constraint def VerifyUnitPowerFactors(unitPowerFactors: UnitPowerFactor[*] ordered, quantityDimension: QuantityDimension[1]);    
}