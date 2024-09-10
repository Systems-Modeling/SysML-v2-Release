package '15_07-System of Units and Scales' {
    private import ISQ::*;
    private import USCustomaryUnits::*;

	/*
	 * A System of Units and Scales is represented by a model library package.
	 * 
	 * Its structure is modeled after the International System of Units -- Système Internationale d'Unités, abbreviated to SI -- as defined in ISO/IEC 80000:
	 * - Measurement units and scales are generalized to a common super type MeasurementReference.
	 * - A particular quantity is modeled as the tuple of a numerical value (i.e. a mathematical number) and a MeasurementReference.
	 * - An actual measurement unit is modeled as a usage of a specialization of either SimpleUnit or DerivedUnit, e.g. TimeUnit or ForceUnit,
	 *   see the SI package.
	 * - The quantity dimension of the actual unit usage must match the quantity dimension of the generic quantity unit definition that it is a usage of.
	 * - A system of units and scales must define exactly one selected base unit for each base quantity in the associated system of quantities. The collection of 
	 *   base units forms the foundation for automated quantity value conversion between any pair of compatible units and/or scales.
	 * - If only a measurement unit is used on a quantity value, it implies expression on a ratio scale, in other words only the ratio between the actual quantity value,
	 *   and the defined unit value is of importance. On ratio scales for one kind of quantity that only differ in their unit (e.g. metre and inch) 
	 *   zero is zero no matter what unit is selected.
	 * - A unit may carry a conversion factor definition w.r.t. to another reference unit. It can be a conversion by convention (e.g. between metre and foot) or 
	 *   via an ISO/IEC 80000 prefix symbol that indicates a decimal or binary multiple or sub-multiple (e.g. kilo, nano, mega, kibi, mebi, ...). See package SIPrefixes. 
	 * - In addition to measurement units / ratio scales also other types of measurement scales are supported. The additional scales are:
	 *   - ordinal scales (e.g. Beaufort wind force, Richter Scale, Rockwell C hardness scale), 
	 *   - interval scales (e.g. absolute temperature in deg C or F), 
	 *   - cyclic ratio scales (e.g. rotation angle with modulus 360 degree), 
	 *   - logarithmic scales (e.g. dB(A) or dBA sound pressure level w.r.t. a reference ambient pressure, dB(m) or dBm power ratio w.r.t. 1 mW).
	 * - Any base unit quantity is modeled as a specialization of a SimpleUnit. This specialized SimpleUnit (e.g. MassUnit) defines one base unit vector (with power one by definition)
	 *   that establishes a base quantity dimension for the system of quantities, without committing yet to a particular choice of measurement unit.
	 * 
	 * The International System of Units (SI) as defined in ISO/IEC 80000 as well as the US Customary System of Units as defined by NIST SP 811
	 * are added as predefined model libraries to SysML v2.
	 * However, this does not prevent to model any other system of units and scales in another model library and use it.
	 */
	 
	 /*
	  * Above capabilities were implemented in:
	  * - standard library MeasurementReferences:
      *   TensorMeasurementReference, VectorMeasurementReference, ScalarMeasurementReference,
      *   MeasurementUnit, OrdinalScale, IntervalScale, CyclicRatioScale, LogarithmicScale, 
      *   SystemOfUnits
	  * - standard library SI:
	  *   attribute <si> 'ISO/IEC 80000 International System of Units' : SystemOfUnits
      *     :>> systemOfQuantities = isq;
      *     :>> baseUnits = (m, kg, s, A, K, mol, cd);
      *   }
	  */
}
