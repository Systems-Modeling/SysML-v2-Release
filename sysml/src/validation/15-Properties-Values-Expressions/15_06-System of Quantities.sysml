package '15_06-System of Quantities' {
    private import ISQ::*;

	/*
	 * A System of Quantities is represented by a model library package.
	 * 
	 * Its structure is modeled after the International System of Quantities (ISQ):
	 * - Quantity dimension is defined as the product of powers of a selected set of base quantities.
	 * - A system of quantities is multi-dimensional space spanned by the powers of its base quantities.
	 * - Any base quantity is modeled as a specialization of a SimpleUnit. Such a specialized SimpleUnit defines one base unit vector 
	 *   (with power one by definition), e.g. MassUnit with symbol M, that establishes a base quantity dimension for the system of quantities, 
	 *	 without committing yet to a particular choice of measurement unit.
	 * - To complete the system of quantities any number of derived quantities can be added.
	 * - A derived quantity is modeled as a specialization of a DerivedUnit. A DerivedUnit is defined in terms of so-called UnitPowerFactors. 
	 *   Each UnitPowerFactor is a combination of a base (or other derived) quantity and an exponent.
	 * - As an example the AccelerationUnit (specialization of DerivedUnit) can be defined as the combination of LengthUnit (symbol L) 
	 *   to the power 1 and TimeUnit (symbol T) to the power -2, so having quantity dimension L¹⋅T⁻².
	 * - A quantity of dimension one is defined as a derived quantity for which the effective exponent for each 
	 *   of its base quantity power factors is zero. Historically a quantity of dimension one was also called a dimensionless quantity.
	 * - A quantity of dimension one may be defined by adding all quantity power factors that cancel out by having positive and negative 
	 *   exponents. Doing so enables distinction between different 'kinds of' quantities of dimension one, e.g:
	 *   angle (L¹⋅L⁻¹), mass ratio (L¹⋅L⁻¹), power ratio (L²⋅M⋅T⁻³⋅L⁻²⋅M⁻¹⋅T³), Mach number (L¹⋅T⁻¹⋅L⁻¹⋅T¹).
	 * 
	 * The International System of Quantities (ISQ) as defined in ISO/IEC 80000 is added as a predefined model library to SysML v2.
	 * However, this does not prevent to model any other system of quantities in another model library and use it.
	 */
	 
	 /*
	  * Above capabilities were implemented in:
      * - standard library Quantities:
      *   TensorQuantityValue, VectorQuantityValue, ScalarQuantityValue,
      *   tensorQuantities, vectorQuantities, scalarQuantities, 
      *   SystemOfQuantities
	  * - standard library MeasurementReferences:
	  *   TensorMeasurementReference, VectorMeasurementReference, ScalarMeasurementReference,
      *   SystemOfUnits
	  * - standard library ISQBase:
	  *   attribute <isq> 'International System of Quantities': SystemOfQuantities in ISQBase
	  */
}
