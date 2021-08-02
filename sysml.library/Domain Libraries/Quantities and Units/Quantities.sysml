/**
 * This package defines the root representations for quantities and their values.
 */
package Quantities {
	private import Collections::*;
	private import ScalarValues::ScalarValue;
	
	/**
	 * The value of a quantity is a tuple of one or more numbers (i.e. mathematical number values) and a reference to a measurement reference.
	 * The most general case is a multi-dimensional, tensor quantity of any order. In engineering, the majority of quantities used are 
	 * scalar and vector quantities, that are tensor quantities of order 0 and 1 respectively.
	 * The measurement reference used to express a quantity value must have a type, dimensions and order that match the quantity, i.e.,
	 * a TensorQuantityValue must use a TensorMeasurementReference, a VectorQuantityValue a VectorMeasurementReference, 
	 * and a ScalarQuantityValue a ScalarMeasurementReference. See package UnitsAndScales for details.
	 */
	abstract attribute def TensorQuantityValue :> Array {
		attribute isBound: ScalarValues::Boolean;
		attribute num: ScalarValues::Number[1..*] ordered nonunique :>> elements;
		attribute mRef: UnitsAndScales::TensorMeasurementReference;
		attribute measure: UnitsAndScales::TensorMeasurementReference;
        attribute :>> dimensions = mRef.dimensions;
		attribute order :>> rank = mRef.order;
        attribute contravariantOrder: ScalarValues::Natural;
        attribute covariantOrder: ScalarValues::Natural;

        assert constraint orderSum { contravariantOrder + covariantOrder == order }
        assert constraint boundMatch { (isBound == mRef.isBound) || (!isBound && mRef.isBound) }
	}
	
	abstract attribute def VectorQuantityValue :> TensorQuantityValue {
		attribute :>> mRef: UnitsAndScales::VectorMeasurementReference;
	}
	
	abstract attribute def ScalarQuantityValue :> VectorQuantityValue, ScalarValue {
		attribute :>> mRef: UnitsAndScales::ScalarMeasurementReference;
	}
	
	/**
	 * Quantities are defined as self-standing features that can be used to consistently specify quantities as 
	 * features of occurrences. Each single quantity feature is subsetting the root feature tensorQuantities. 
	 * In other words, the codomain of a quantity feature is a suitable specialization of TensorQuantityValue.
	 */
	abstract attribute tensorQuantities: TensorQuantityValue[*] nonunique;
	abstract attribute vectorQuantities: VectorQuantityValue[*] nonunique :> tensorQuantities;
	abstract attribute scalarQuantities: ScalarQuantityValue[*] nonunique :> vectorQuantities;

    /*
     * Define generic aliases QuantityValue and quantities for the top level quantity attribute def and attribute.
     */
	alias QuantityValue for TensorQuantityValue;
	alias quantities for tensorQuantities;
	
	/**
	 * A SystemOfQuantities represents the essentials of [VIM] concept "system of quantities" (https://jcgm.bipm.org/vim/en/1.3.html), defined as a
	 * "set of quantities together with a set of noncontradictory equations relating those quantities".
	 * In order to establish such a set of noncontradictory equations a set of base quantities is selected. Subsequently the system of quantities is 
	 * completed by adding derived quantities which are products of powers of the base quantities.
	 */
	attribute def SystemOfQuantities {
		attribute longName: ScalarValues::String;
		attribute baseQuantities: ScalarQuantityValue[*] ordered :> scalarQuantities;
	}

	/**
	 * Representation of a quantity power factor, being the combination of a quantity and an exponent.
	 * 
	 * A sequence of QuantityPowerFactors for the baseQuantities of a SystemOfQuantities define the QuantityDimension of a scalar quantity.
	 */
	attribute def QuantityPowerFactor {
		attribute quantity: ScalarQuantityValue[1];
		attribute exponent: ScalarValues::Real[1];
	}
	
	/**
	 * Representation of quantity dimension, which is the product of powers of the set of base quantities defined for a particular system of quantities, units and scales.
	 */
	attribute def QuantityDimension {
		 attribute quantityPowerFactors: QuantityPowerFactor[*] ordered;
	}
}