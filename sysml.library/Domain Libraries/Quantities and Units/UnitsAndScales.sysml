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
	 * The measurement reference concept is defined in [VIM] "quantity" NOTE 2 as "A reference can be a measurement unit,
	 * a measurement procedure, a reference material, or a combination of such.", see https://jcgm.bipm.org/vim/en/1.1.html .
	 * Although [VIM] "quantity" NOTE 5 states that "A quantity as defined here is a scalar. However, a vector or a tensor,
	 * the components of which are quantities, is also considered to be a quantity", the rest of [VIM] does not explicitly
	 * define how tensor and vector quantities should be supported or integrated.
	 *
	 * In this package, in line with TensorQuantityValue in package Quantities, the most general kind of measurement reference
	 * is TensorMeasurementReference, which is an AttributeDefinition that forms the basis for any kind of measurement reference
	 * for multi-dimensional quantities. In this type hierarchy, ScalarMeasurementReference is defined as a specialization down
	 * to a single dimensional measurement reference for a scalar quantity. The measurement references for all dimensions of a
	 * quantity are specified through the mRefs attribute. Each element of mRefs is a ScalarMeasurementReference.
	 *
	 * The longName of a TensorMeasurementReference is the spelled-out human readable name of the measurement reference.
	 * For example, typical measurement units for the speed quantity would have the longName "metre per second", "kilometre per hour",
	 * "mile per hour".
	 *
	 * A measurement reference can have zero or more definitionalQuantityValues that allows to specify
	 * quantity values that carry a particular meaning or relevance for the measurement reference.
     *
	 * To stress the generality of the TensorMeasurementReference the alias MeasurementReference is defined.
	 */
	attribute def TensorMeasurementReference :> Array {
		attribute longName: String[1];
		attribute isBound: Boolean[1] default false;
		attribute order :>> rank;
		attribute mRefs: ScalarMeasurementReference[1..*] :>> elements;
		attribute definitionalQuantityValues: DefinitionalQuantityValue[0..*];
	}
	alias MeasurementReference for TensorMeasurementReference;

	/**
	 * A VectorMeasurementReference is a specialization of TensorMeasurementReference for vector quantities that are
	 * typed by a VectorQuantityValue. Its order is one. Implicitly, it defines a vector space of dimension `n` = dimensions[1].
	 * The `n` basis unit vectors that span the vector space are defined by the mRefs which each are
	 * a ScalarMeasurementReference, typically a MeasurementUnit or an IntervalScale.
	 *
	 * Pairwise VectorQuantityValue and VectorMeasurementReference specializations can also be used to define a vector space
	 * for state vectors as used in state-space representation models.
	 *
	 * Attribute isOrthogonal declares whether the basis vectors of the vector space are orthogonal, i.e. whether the
	 * inner products of any pair of basis vectors yield zero.
	 *
	 * Attribute placement enables the location and orientation of a dependent (nested) coordinate system (that is
	 * a VectorMeasurementReference) w.r.t. another (independent or reference) coordinate system.
	 */
	attribute def VectorMeasurementReference :> TensorMeasurementReference {
		attribute :>> dimensions: Positive[1];
		attribute isOrthogonal: Boolean[1] default true;
		attribute placement: CoordinateTransformation[0..1];
	}

	/**
	 * A ScalarMeasurementReference is a specialization of VectorMeasurementReference for scalar quantities
	 * that are typed by a ScalarQuantityValue and for components of tensor or vector quantities.
	 * Its order is zero. A ScalarMeasurementReference is also a generalization of MeasurementUnit and MeasurementScale.
	 * It establishes how to interpret the numerical value (num) of a ScalarQuantityValue or a component of
	 * a tensor or vector quantity value, and establishes its actual quantity dimension.
	 *
	 * Attribute mRefs is bound to self for a ScalarMeasurementReference, as the dimension or component of a scalar quantity is itself,
	 * and for consistency with tensor and vector measurement references.
	 */
	abstract attribute def ScalarMeasurementReference :> VectorMeasurementReference {
		attribute :>> dimensions = 1;
		attribute :>> order = 0;
		attribute :>> isOrthogonal = true;
		attribute :>> mRefs = self;
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
	 * 1. Directly as the mRef in a ScalarQuantityValue, which implies that the effective measurement reference is a ratio scale defined by the unit.
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
		attribute conversionFactor redefines UnitConversion::conversionFactor = prefix.conversionFactor;		
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
	 * Note: A ratio scale is implied by direct use of a MeasurementUnit as the mRef in a ScalarQuantityValue.
	 */
	abstract attribute def MeasurementScale :> ScalarMeasurementReference {
		attribute unit: MeasurementUnit;
		attribute quantityValueMapping: QuantityValueMapping[0..1];
	}

	/**
	 * Representation of an ordinal measurement scale.
	 */
	attribute def OrdinalScale :> MeasurementScale;

	/**
	 * Representation of an interval measurement scale.
	 *
	 * The offset of one interval measurement scale w.r.t. another interval or ratio scale is defined through a quantityValueMapping, see MeasurementReference.
	 */
	attribute def IntervalScale :> MeasurementScale {
		attribute :>> isBound = true;
	}

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
	 * Representation of the mapping of equivalent quantity values expressed on two different MeasurementReferences
	 *
	 * A QuantityValueMapping specifies a mapping from a given mappedQuantityValue owned by the MeasurementReference
	 * that owns the QuantityValueMapping to a referenceQuantityValue owned by another MeasurementReference.
	 *
	 * Example: The mapping between the temperature value of 0.01 degree Celsius on the celsius temperature scale
	 * to the equivalent temperature value of 273.16 K on the kelvin temperature scale,
	 * would specify a mappedQuantityValue referencing the
	 * the DefinitionalQuantityValue (0.01, "absolute thermodynamic temperature of the triple point of water")
	 * of the celsius interval scale, and a referenceQuantityValue referencing the
	 * DefinitionalQuantityValue (273.16, "absolute thermodynamic temperature of the triple point of water")
	 * of the kelvin ratio scale.
	 */
	attribute def QuantityValueMapping {
		attribute mappedQuantityValue: DefinitionalQuantityValue;
		attribute referenceQuantityValue: DefinitionalQuantityValue;
	}

	/**
	 * Representation of a particular quantity value that is used in the definition of a MeasurementReference
	 *
	 * Typically such a particular value is defined by convention. It can be used to define a selected reference value,
	 * such as the meaning of zero on a measurement scale or the origin of a top-level coordinate system.
	 *
	 * Example: The 'kelvin' MeasurementReference for thermodynamic temperature could have a
	 * DefinitionalQuantityValue {
	 *     :>> num = 273.16;
	 *     :>> definition = "thermodynamic temperature of the triple point of Vienna Standard Mean Ocean Water in kelvin";
	 * }
	 * that is value of the definition of the scale.
	 */
	attribute def DefinitionalQuantityValue {
		attribute num: Number[1..*];
		attribute definition: String;
	}

	/**
	 * Explicit definitions of "unit of dimension one" also known as "dimensionless unit" as well as the value and quantity of dimension one.
	 */
	attribute def DimensionOneUnit :> DerivedUnit {
		attribute :>> longName = "unit of dimension one";
		attribute :>> unitPowerFactors = ();
	}
	attribute def DimensionOneValue :> ScalarQuantityValue {
		attribute :>> num: Real;
		attribute :>> mRef: DimensionOneUnit;
	}
	attribute dimensionOneQuantities : DimensionOneValue[*] nonunique :> scalarQuantities;

	attribute one = DimensionOneUnit();

	/**
	 * Explicit definitions of generic "count" quantity.
	 */
	attribute def CountValue :> DimensionOneValue;
	attribute countQuantities : CountValue[*] nonunique :> dimensionOneQuantities;

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
