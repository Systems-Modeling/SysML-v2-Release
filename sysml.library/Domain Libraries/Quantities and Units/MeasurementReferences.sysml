/**
 * This package defines the representations for measurement references.
 */
package MeasurementReferences {
	private import Collections::Array;
	private import Collections::List;
	private import ScalarValues::*;
	private import VectorValues::ThreeVectorValue;

	private import SequenceFunctions::size;
	private import ControlFunctions::forAll;
	private import Quantities::QuantityDimension;
	private import Quantities::VectorQuantityValue;
	private import Quantities::scalarQuantities;
	private import Quantities::ScalarQuantityValue;
	private import Quantities::SystemOfQuantities;
	private import ISQSpaceTime::angularMeasure;

	/**
	 * TensorMeasurementReference is the most general AttributeDefinition to represent measurement references.
	 *
	 * The concept "measurement reference" is defined in [VIM] "quantity" NOTE 2 as "A reference can be a measurement unit,
	 * a measurement procedure, a reference material, or a combination of such.", see https://jcgm.bipm.org/vim/en/1.1.html .
	 * In addition [VIM] "quantity" NOTE 5 states that "A quantity as defined here is a scalar. However, a vector or a tensor, 
	 * the components of which are quantities, is also considered to be a quantity". However, the rest of [VIM] does not explicitly 
	 * define how tensor and vector quantities can be or should be supported.
	 *
	 * In this package, in line with TensorQuantityValue in package Quantities, the most general kind of measurement reference
	 * is TensorMeasurementReference that represents a measurement reference for any order of tensor quantity. Since the order can 
	 * also be one or zero, this includes vector and scalar quantities. The specializations VectorMeasurementReference and 
	 * ScalarMeasurementReference are defined to specifically represent measurement references for vector and scalar quantities.
	 * 
	 * TensorMeasurementReference specializes Array, which provides its multi-dimensional structure. The order of a tensor is equivalent
	 * to the rank of an Array.
	 * 
	 * Attribute isBound specifies whether the vector space product is bound (isBound is true) or free (isBound is false).
	 * 
	 * Attribute mRefs specifies the scalar measurement references for all dimensions of a tensor quantity.
	 *
	 * The humanId of a TensorMeasurementReference is the unique symbol by which the measurement reference is known.
	 * The name of a TensorMeasurementReference is spelled-out human readable name of the measurement reference.
	 *
	 * For example, typical measurement references for (scalar) quantity speed are declared with the following humanId and name:
	 * <'m/s'> and 'metre per second',
	 * <'km/h'> and 'kilometre per hour',
	 * <'mi/h'> and 'mile per hour'.
	 *
	 * A measurement reference can have zero or more definitionalQuantityValues that allow to specify
	 * quantity values that carry a particular meaning or relevance for the measurement reference.
	 */
	attribute def TensorMeasurementReference :> Array {
		attribute isBound: Boolean[1] default false;
		attribute order :>> rank;
		attribute mRefs: ScalarMeasurementReference[1..*] :>> elements;
		attribute definitionalQuantityValues: DefinitionalQuantityValue[0..*];
	}

	/**
	 * A VectorMeasurementReference is a specialization of TensorMeasurementReference for vector quantities that are
	 * typed by a VectorQuantityValue. Its order is one. Implicitly, it defines a vector space of dimension `n` = dimensions[1].
	 * The magnitudes of the `n` basis unit vectors that span the vector space are defined by the mRefs which each are
	 * a ScalarMeasurementReference, typically a MeasurementUnit or an IntervalScale.
	 * 
	 * Attribute isOrthogonal declares whether the basis vectors of the vector space are orthogonal, i.e., whether all
	 * inner products of any pair of basis vectors are equal to zero.
	 * 
	 * A pair of a specialization of VectorQuantityValue and a specialization of VectorMeasurementReference can also be used to
	 * define a vector space for state vectors as used in state-space representation models.
	 */
	attribute def VectorMeasurementReference :> TensorMeasurementReference {
		attribute :>> dimensions: Positive[0..1];
		attribute isOrthogonal: Boolean[1] default true;
	}

	/**
	 * A ScalarMeasurementReference is a specialization of VectorMeasurementReference for scalar quantities
	 * that are typed by a ScalarQuantityValue and for components of tensor or vector quantities.
	 * Its order is zero. A ScalarMeasurementReference is also a generalization of MeasurementUnit and MeasurementScale.
	 * It establishes how to interpret the numerical value (num) of a ScalarQuantityValue or a component of
	 * a tensor or vector quantity value, and establishes its actual quantity dimension.
	 *
	 * Attribute mRefs is bound to self for a ScalarMeasurementReference, for consistency with tensor and vector measurement references,
	 * as the dimension or component of a scalar quantity is itself.
	 */
	abstract attribute def ScalarMeasurementReference :> VectorMeasurementReference {
		attribute :>> dimensions = ();
		attribute :>> isOrthogonal = true;
		attribute :>> mRefs = self;
		attribute quantityDimension: QuantityDimension[1];
	}
	
	/**
	 * CoordinateFrame is a VectorMeasurementReference with the specific purpose to quantify (i.e., coordinatize) a vector space, 
	 * and locate and orient it with respect to another CoordinateFrame.
	 * 
	 * Optional attribute transformation enables specification of the location and orientation of this CoordinateFrame as dependent
	 * and nested with respect to another (reference) coordinate frame. Typically the other CoordinateFrame is the frame of 
	 * the next higher element (Object, Item or Part) in a composite structure.
	 */
	attribute def CoordinateFrame :> VectorMeasurementReference {
		attribute transformation: CoordinateTransformation[0..1] {
			attribute :>> target = that;
		}
	}

	/**
	 * CoordinateTransformation is the most general representation of the transformation of a target coordinate frame 
	 * with respect to a source coordinate frame.
	 */
    abstract attribute def CoordinateTransformation {
	 	attribute source: VectorMeasurementReference[1];
	 	attribute target: VectorMeasurementReference[1];
	 	assert constraint { source.dimensions == target.dimensions }
    }

	/**
	 * CoordinateFramePlacement is a CoordinateTransformation by placement of the target frame in the source frame.
	 *  
	 * Attribute origin specifies the location of the origin of the target frame through a vector in the source frame.
	 * 
	 * Attribute basisDirections specifies the orientation of the target frame by specifying the directions of 
	 * the respective basis vectors of the target frame via direction vectors in the source frame. An empty sequence of
	 * basisDirections signifies no change of orientation of the target coordinate frame.
	 */
	 attribute def CoordinateFramePlacement :> CoordinateTransformation {
	 	attribute origin : VectorQuantityValue[1];
	 	attribute basisDirections : VectorQuantityValue[0..*] ordered;
	 	assert constraint { origin.dimensions == source.dimensions }
	 	assert constraint { size(basisDirections) == 0 or size(basisDirections) == source.dimensions[1]}
	 	assert constraint { 1..size(basisDirections)->forAll { in i : Natural; 
	 		(basisDirections[i] as VectorQuantityValue).dimensions == source.dimensions } 
	 	}
	 }

	/**
	 * TranslationOrRotation is an abstract union of Translation and Rotation
	 */
	abstract attribute def TranslationOrRotation;

	/**
	 * Representation of a translation with respect to a coordinate frame
	 * 
	 * Attribute translationVector specifies the displacement vector that constitutes the translation.
	 */
	attribute def Translation :> TranslationOrRotation {
		attribute translationVector : VectorQuantityValue[1];
	}

	/**
	 * Representation of a rotation about an axis over an angle
	 * 
	 * Attribute axisDirection specifies the direction of the rotation axis.
	 * Attribute angle specifies the angle of rotation, where a positive value implies right-handed rotation.
	 * Attribute isIntrinsic asserts whether the intermediate coordinate frame moves with the rotation or not, 
	 * i.e. whether an instrinsic or extrinsic rotation is specified.
	 * 
	 * See https://en.wikipedia.org/wiki/Davenport_chained_rotations for details.
	 */
	attribute def Rotation :> TranslationOrRotation {
		attribute axisDirection : VectorQuantityValue[1];
		attribute angle :>> angularMeasure;
		attribute isIntrinsic : Boolean[1] default true;
	}

	/**
	 * Coordinate frame transformation specified by a sequence of translations and/or rotations
	 *
	 * Note: This is a coordinate transformation that is convenient for interpretation by humans.
	 * In particular a sequence of rotations about the principal axes of a coordinate frame is much more easy understandable 
	 * than a rotation about an arbitrary axis.
	 * Any sequence can be reduced to a single combination of a translation and a rotation about a particular axis, but in general 
	 * the original sequence cannot be retrieved as there are infinitely many sequences representing the reduced transformation.
	 */
	attribute def TranslationRotationSequence :> CoordinateTransformation, List {
		attribute :>> elements : TranslationOrRotation[1..*];
	}

	/**
	 * AffineTransformationMatrix3d is a three dimensional CoordinateTransformation specified via an affine transformation matrix
	 *
	 * The interpretation of the matrix is as follows:
	 * - the upper left 3x3 matrix represents the rotation matrix
	 * - the uper right 3x1 column vector represents the translation vector
	 * - the bottom row must be the row vector (0, 0, 0, 1).
	 *
	 * I.e. the matrix has the following form:
	 * ( R, R, R, T,
	 *   R, R, R, T,
	 *   R, R, R, T,
	 *   0, 0, 0, 1 )
	 * where the cells marked R form the rotation matrix and the cells marked T form the translation vector.
	 * 
	 * Note: See https://en.wikipedia.org/wiki/Transformation_matrix, under affine transformations for a general explanation.
	 */
	attribute def AffineTransformationMatrix3d :> CoordinateTransformation, Array {
		    attribute rotationMatrix : Array {
				attribute :>> elements : Real[9] ordered nonunique;
				attribute :>> dimensions = (3, 3);
		    }
			attribute translationVector : ThreeVectorValue[1] { :>> elements : Real[3]; }
			attribute :>> dimensions = (4, 4);
			attribute :>> elements : Real[16] ordered nonunique = (
				rotationMatrix.elements[1], rotationMatrix.elements[2], rotationMatrix.elements[3], translationVector[1],
				rotationMatrix.elements[4], rotationMatrix.elements[5], rotationMatrix.elements[6], translationVector[2],
				rotationMatrix.elements[7], rotationMatrix.elements[8], rotationMatrix.elements[9], translationVector[3],
				0, 0, 0, 1);
			assert constraint { source.dimensions == 3 }
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
		attribute :>> isBound = false;
		attribute unitPowerFactors: UnitPowerFactor[0..*] ordered;
		attribute unitConversion: UnitConversion[0..1];
        assert constraint hasValidUnitPowerFactors : VerifyUnitPowerFactors(unitPowerFactors, quantityDimension);
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
	 *
	 * Attribute isExact asserts whether the conversionFactor is exact or not. By default it is set true.
	 */
	abstract attribute def UnitConversion {
		attribute referenceUnit: MeasurementUnit;
		attribute conversionFactor: Real;
		attribute isExact: Boolean default true;
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
	 * An IntervalScale is also a CoordinateFrame
	 * The offset of one interval measurement scale w.r.t. another interval or ratio scale is defined through a quantityValueMapping, see MeasurementReference.
	 */
	attribute def IntervalScale :> MeasurementScale, CoordinateFrame {
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
	 * Representation of a particular quantity value that is used in the definition of a TensorMeasurementReference
	 *
	 * Typically such a particular value is defined by convention. It can be used to define a selected reference value,
	 * such as the meaning of zero on a measurement scale or the origin of a top-level coordinate frame.
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
	 *
	 * Attribute systemOfQuantities speficies the associated SystemOfQuantities.
	 */
	attribute def SystemOfUnits {
		attribute longName: String[1];
		attribute systemOfQuantities : SystemOfQuantities[1];
		attribute baseUnits: SimpleUnit[1..*] ordered;
	}

	/**
	 * Constraint definition to verify that the given unit power factors comply with the required quantity dimension
	 *
	 * TODO: The implementation of this constraint requires reflection.
	 */
    constraint def VerifyUnitPowerFactors(unitPowerFactors: UnitPowerFactor[*] ordered, quantityDimension: QuantityDimension[1]);
}
