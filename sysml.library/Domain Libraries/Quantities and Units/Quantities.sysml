standard library package Quantities {
	doc
	/*
	 * This package defines the root representations for quantities and their values.
	 */

	private import Collections::*;
	private import ScalarValues::NumericalValue;
	private import ScalarValues::Number;
	private import ScalarValues::Real;
	private import ScalarValues::Natural;
	private import ScalarValues::Boolean;
	private import ScalarValues::String;
	private import VectorValues::NumericalVectorValue;
	private import VectorValues::ThreeVectorValue;

	abstract attribute def TensorQuantityValue :> Array {
		doc
		/*
		 * The value of a quantity is a tuple of one or more numbers (i.e. mathematical number values) and a reference to a measurement reference.
		 * The most general case is a multi-dimensional, tensor quantity of any order. In engineering, the majority of quantities used are 
		 * scalar and vector quantities, that are tensor quantities of order 0 and 1 respectively.
		 * The measurement reference used to express a quantity value must have a type, dimensions and order that match the quantity, i.e.,
		 * a TensorQuantityValue must use a TensorMeasurementReference, a VectorQuantityValue a VectorMeasurementReference, 
		 * and a ScalarQuantityValue a ScalarMeasurementReference. See package MeasurementReferences for details.
		 */
	
		attribute isBound: Boolean;
		attribute num: Number[1..*] ordered nonunique :>> elements;
		attribute mRef: MeasurementReferences::TensorMeasurementReference;
        attribute :>> dimensions = mRef.dimensions;
		attribute order :>> rank;
        attribute contravariantOrder: Natural;
        attribute covariantOrder: Natural;

        assert constraint orderSum { contravariantOrder + covariantOrder == order }
        assert constraint boundMatch { (isBound == mRef.isBound) or (not isBound and mRef.isBound) }
	}

	abstract attribute def VectorQuantityValue :> TensorQuantityValue, NumericalVectorValue {
		attribute :>> mRef: MeasurementReferences::VectorMeasurementReference;
	}

	abstract attribute def ScalarQuantityValue :> VectorQuantityValue, NumericalValue {
		attribute :>> mRef: MeasurementReferences::ScalarMeasurementReference;
	}
	
	abstract attribute tensorQuantities: TensorQuantityValue[*] nonunique {
		doc
		/*
		 * Quantities are defined as self-standing features that can be used to consistently specify quantities as 
		 * features of occurrences. Each single quantity feature is subsetting the root feature tensorQuantities. 
		 * In other words, the codomain of a quantity feature is a suitable specialization of TensorQuantityValue.
		 */
	}
	abstract attribute vectorQuantities: VectorQuantityValue[*] nonunique :> tensorQuantities;
	abstract attribute scalarQuantities: ScalarQuantityValue[*] nonunique :> vectorQuantities;

	abstract attribute def '3dVectorQuantityValue' :> VectorQuantityValue, ThreeVectorValue {
        doc
    	/*
    	 * Most general representation of real 3-vector quantities
    	 */

        attribute :>> num: Real[3];
	}
	alias ThreeDVectorQuantityValue for '3dVectorQuantityValue';
	
    /*
     * Define generic aliases QuantityValue and quantities for the top level quantity attribute def and attribute.
     */
	alias QuantityValue for TensorQuantityValue;
	alias quantities for tensorQuantities;

	attribute def SystemOfQuantities {
		doc
		/*
		 * A SystemOfQuantities represents the essentials of [VIM] concept "system of quantities" (https://jcgm.bipm.org/vim/en/1.3.html), defined as a
		 * "set of quantities together with a set of noncontradictory equations relating those quantities".
		 * In order to establish such a set of noncontradictory equations a set of base quantities is selected. Subsequently the system of quantities is 
		 * completed by adding derived quantities which are products of powers of the base quantities.
		 */
	
		attribute baseQuantities: ScalarQuantityValue[*] ordered :> scalarQuantities;
	}

	attribute def QuantityPowerFactor {
		doc
		/*
		 * Representation of a quantity power factor, being the combination of a quantity and an exponent.
		 * 
		 * A sequence of QuantityPowerFactors for the baseQuantities of a SystemOfQuantities define the QuantityDimension of a scalar quantity.
		 */
	
		attribute quantity: ScalarQuantityValue[1];
		attribute exponent: Real[1];
	}

	attribute def QuantityDimension {
		doc
		/*
		 * Representation of quantity dimension, which is the product of powers of the set of base quantities defined for a particular system of quantities, units and scales.
		 */
	
		 attribute quantityPowerFactors: QuantityPowerFactor[*] ordered;
	}
}
