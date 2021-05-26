/**
 * International system of quantities (ISQ), as defined in ISO/IEC 80000
 */
package ISQ {
	private import ScalarValues::Real;
	private import Quantities::*;
	private import UnitsAndScales::*;

	import ISQBase::*;                  // ISO/IEC 80000 base quantities and general concepts
    import ISQSpaceTime::*;             // ISO 80000-3 "Space and Time"
    import ISQMechanics::*;             // ISO 80000-4 "Mechanics"
    import ISQThermodynamics::*;        // ISO 80000-5 "Thermodynamics"
    import ISQElectromagnetism::*;      // IEC 80000-6 "Electromagnetism"
    import ISQLight::*;                 // ISO 80000-7 "Light"
    import ISQAcoustics::*;             // ISO 80000-8 "Acoustics"
    import ISQChemistryMolecular::*;    // ISO 80000-9 "Physical chemistry and molecular physics"
    import ISQAtomicNuclear::*;         // ISO 80000-10 "Atomic and nuclear physics"
    import ISQCharacteristicNumbers::*; // ISO 80000-11 "Characteristic numbers"
    import ISQCondensedMatter::*;       // ISO 80000-12 "Condensed matter physics"
    import ISQInformation::*;           // IEC 80000-13 "Information science and technology"
}
