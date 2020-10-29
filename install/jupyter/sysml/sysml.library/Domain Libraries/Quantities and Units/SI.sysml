/**
 * International System of (Measurement) Units -- Système International d'Unités (SI), as defined in ISO/IEC 80000
 * 
 * Note 1: In accordance with ISO/IEC 80000 en-GB spelling is used for the names and definitions of the units.
 * Note 2: This is a representative but not yet complete list of measurement units.
 */
package SI {
    private import RationalFunctions::Rat;
    private import UnitsAndScales::*;
    import ISQ::*;
    import SIPrefixes::*;
    
    /*
     * SI simple units needed before creation of base units
     */
    attribute g: MassUnit = MassUnit(name => "gram");

    /*
     * SI base units
     */    
    attribute m: LengthUnit = LengthUnit(name => "metre");

    attribute kg: MassUnit = MassUnit(name => "kilogram", unitConversion => ConversionByPrefix(prefix => kilo, referenceUnit => g));

    attribute s: TimeUnit = TimeUnit(name => "second");

    attribute A: ElectricCurrentUnit = ElectricCurrentUnit(name => "ampere");
    
    attribute K: TemperatureUnit = TemperatureUnit(name => "kelvin") { 
        attribute temperatureOfWaterAtTriplePointInK = ScaleValueDefinition(num => Rat(27316, 100), description => "temperature in kelvin of pure water at the triple point");
        attribute scaleValueDefinition: ScaleValueDefinition :>> MeasurementReference::scaleValueDefinition = temperatureOfWaterAtTriplePointInK; 
    }
    
    attribute mol: AmountOfSubstanceUnit = AmountOfSubstanceUnit(name => "mol");

    attribute cd: LuminousIntensityUnit = LuminousIntensityUnit(name => "candela");

    /*
     * Derived units - generated from ISO/IEC 80000 parts 3 to 14
     */ 
    attribute Bq: NuclearActivityUnit = s**-1 {name redefines MeasurementReference::name = "becquerel";}
    attribute C: ElectricChargeUnit = A*s {name redefines MeasurementReference::name = "coulomb";}
    attribute Hz: FrequencyUnit = s**-1 {name redefines MeasurementReference::name = "hertz";}
    attribute lx: IlluminanceUnit = lm/m**2 {name redefines MeasurementReference::name = "lux";}
    attribute N: ForceUnit = kg*m/s**2 {name redefines MeasurementReference::name = "newton";}
    attribute J: EnergyUnit = N*m {name redefines MeasurementReference::name = "joule";}
    attribute Gy: AbsorbedDoseUnit = J/kg {name redefines MeasurementReference::name = "gray";}
    attribute Pa: PressureUnit = N/m**2 {name redefines MeasurementReference::name = "pascal";}
    attribute rad: AngularMeasureUnit = m/m {name redefines MeasurementReference::name = "radian";}
    attribute sr: SolidAngularMeasureUnit = m**2/m**2 {name redefines MeasurementReference::name = "steradian";}
    attribute lm: LuminousFluxUnit = cd*sr {name redefines MeasurementReference::name = "lumen";}
    attribute Sv: DoseEquivalentUnit = J/kg {name redefines MeasurementReference::name = "sievert";}
    attribute u: MassUnit = u {name redefines MeasurementReference::name = "atomic mass unit";}
    attribute var: PowerUnit = var {name redefines MeasurementReference::name = "var";}
    attribute W: PowerUnit = J/s {name redefines MeasurementReference::name = "watt";}
    attribute V: ElectricPotentialUnit = W/A {name redefines MeasurementReference::name = "volt";}
    attribute F: CapacitanceUnit = C/V {name redefines MeasurementReference::name = "farad";}
    attribute Wb: MagneticFluxUnit = V*s {name redefines MeasurementReference::name = "weber";}
    attribute T: MagneticFluxDensityUnit = Wb/m**2 {name redefines MeasurementReference::name = "tesla";}
    attribute H: PermeanceUnit = Wb/A {name redefines MeasurementReference::name = "henry";}
    attribute 'Ω': ResistanceUnit = V/A {name redefines MeasurementReference::name = "ohm";}
    attribute S: ConductanceUnit = 'Ω'**-1 {name redefines MeasurementReference::name = "siemens";}

    attribute eV: EnergyUnit = EnergyUnit(name => "electronvolt", unitConversion => ConversionByConvention(referenceUnit => J, conversionFactor => 1.60218e-19));

    attribute 'm³': VolumeUnit = m**3 {name redefines MeasurementReference::name = "cubic metre";}
    attribute nm: LengthUnit = LengthUnit(name => "nanometre", unitConversion => ConversionByPrefix(prefix => nano, referenceUnit => m));

    attribute L: VolumeUnit = VolumeUnit(name => "litre", unitConversion => ConversionByConvention(referenceUnit => 'm³', conversionFactor => 1.0-3));
    attribute mL: VolumeUnit = VolumeUnit(name => "millilitre", unitConversion => ConversionByPrefix(prefix => milli, referenceUnit => L));

    attribute 'A⋅m²': MagneticMomentUnit = A*m**2 {name redefines MeasurementReference::name = "ampere metre squared";}
    attribute 'A⋅m²⋅J⁻¹⋅s⁻¹': GyromagneticRatioUnit = A*m**2*J**-1*s**-1 {name redefines MeasurementReference::name = "ampere metre squared joule to the power minus 1 second to the power minus 1";}
    attribute 'A⋅s/kg': GyromagneticRatioUnit = A*s/kg {name redefines MeasurementReference::name = "ampere second per kilogram";}
    attribute 'A/m': LinearElectricCurrentDensityUnit = A/m {name redefines MeasurementReference::name = "ampere per metre";}
    attribute 'A/m²': ElectricCurrentDensityUnit = A/m**2 {name redefines MeasurementReference::name = "ampere per square metre";}
    attribute 'Bq/kg': SpecificActivityUnit = Bq/kg {name redefines MeasurementReference::name = "becquerel per kilogram";}
    attribute 'Bq/m²': SurfaceActivityDensityUnit = Bq/m**2 {name redefines MeasurementReference::name = "becquerel per square metre";}
    attribute 'Bq/m³': ActivityDensityUnit = Bq/m**3 {name redefines MeasurementReference::name = "becquerel per cubic metre";}
    attribute 'C⋅m': ElectricDipoleMomentUnit = C*m {name redefines MeasurementReference::name = "coulomb metre";}
    attribute 'C/(kg⋅s)': ExposureRateUnit = C/(kg*s) {name redefines MeasurementReference::name = "coulomb per kilogram second";}
    attribute 'C/kg': ExposureUnit = C/kg {name redefines MeasurementReference::name = "coulomb per kilogram";}
    attribute 'C/m': LinearDensityOfElectricChargeUnit = C/m {name redefines MeasurementReference::name = "coulomb per metre";}
    attribute 'C/m²': SurfaceDensityOfElectricChargeUnit = C/m**2 {name redefines MeasurementReference::name = "coulomb per square metre";}
    attribute 'C/m³': ElectricChargeDensityUnit = C/m**3 {name redefines MeasurementReference::name = "coulomb per cubic metre";}
    attribute 'cd⋅m⁻²': LuminanceUnit = cd*m**-2 {name redefines MeasurementReference::name = "candela metre to the power minus 2";}
    attribute 'cd⋅sr': LuminousFluxUnit = cd*sr {name redefines MeasurementReference::name = "candela steradian";}
    attribute 'cd⋅sr⋅kg⁻¹⋅m⁻²⋅s³': LuminousEfficacyOfRadiationUnit = cd*sr*kg**-1*m**-2*s**3 {name redefines MeasurementReference::name = "candela steradian kilogram to the power minus 1 metre to the power minus 2 second to the power 3";}
    attribute 'cd⋅sr⋅m⁻²': IlluminanceUnit = cd*sr*m**-2 {name redefines MeasurementReference::name = "candela steradian metre to the power minus 2";}
    attribute 'cd⋅sr⋅m⁻²⋅s': LuminousExposureUnit = cd*sr*m**-2*s {name redefines MeasurementReference::name = "candela steradian metre to the power minus 2 second";}
    attribute 'cd⋅sr⋅s': LuminousEnergyUnit = cd*sr*s {name redefines MeasurementReference::name = "candela steradian second";}
    attribute 'eV⋅J⋅kg⋅m²⋅s⁻²': HartreeEnergyUnit = eV*J*kg*m**2*s**-2 {name redefines MeasurementReference::name = "electronvolt joule kilogram metre squared second to the power minus 2";}
    attribute 'eV⋅m⁻²/kg': TotalMassStoppingPowerUnit = eV*m**-2/kg {name redefines MeasurementReference::name = "electronvolt metre squared per kilogram";}
    attribute 'eV/m': TotalLinearStoppingPowerUnit = eV/m {name redefines MeasurementReference::name = "electronvolt per metre";}
    attribute 'eV/m²': EnergyFluenceUnit = eV/m**2 {name redefines MeasurementReference::name = "electronvolt per square metre";}
    attribute 'F/m': ElectricConstantUnit = F/m {name redefines MeasurementReference::name = "farad per metre";}
    attribute 'g/L': MassConcentrationUnit = g/L {name redefines MeasurementReference::name = "gram per litre";}
    attribute 'g/mol': MolarMassUnit = g/mol {name redefines MeasurementReference::name = "gram per mole";}
    attribute 'Gy/s': AbsorbedDoseRateUnit = Gy/s {name redefines MeasurementReference::name = "gray per second";}
    attribute 'H/m': MagneticConstantUnit = H/m {name redefines MeasurementReference::name = "henry per metre";}
    attribute 'H⁻¹': ReluctanceUnit = H**-1 {name redefines MeasurementReference::name = "henry to the power minus 1";}
    attribute 'J⋅m²/kg': TotalMassStoppingPowerUnit = J*m**2/kg {name redefines MeasurementReference::name = "joule metre squared per kilogram";}
    attribute 'J⋅s': ActionQuantityUnit = J*s {name redefines MeasurementReference::name = "joule second";}
    attribute 'J⋅s⋅eV⋅s': TotalAngularMomentumUnit = J*s*eV*s {name redefines MeasurementReference::name = "joule second electronvolt second";}
    attribute 'J/(kg⋅K)': SpecificHeatCapacityUnit = J/(kg*K) {name redefines MeasurementReference::name = "joule per kilogram kelvin";}
    attribute 'J/(m²⋅nm)': SpectralRadiantExposureUnit = J/(m**2*nm) {name redefines MeasurementReference::name = "joule per square metre nanometre";}
    attribute 'J/(m³⋅nm)': SpectralRadiantEnergyDensityInTermsOfWavelengthUnit = J/(m**3*nm) {name redefines MeasurementReference::name = "joule per cubic metre nanometre";}
    attribute 'J/(mol⋅K)': MolarHeatCapacityUnit = J/(mol*K) {name redefines MeasurementReference::name = "joule per mole kelvin";}
    attribute 'J/K': HeatCapacityUnit = J/K {name redefines MeasurementReference::name = "joule per kelvin";}
    attribute 'J/kg': SpecificEnergyUnit = J/kg {name redefines MeasurementReference::name = "joule per kilogram";}
    attribute 'J/m': TotalLinearStoppingPowerUnit = J/m {name redefines MeasurementReference::name = "joule per metre";}
    attribute 'J/m²': SpectralRadiantEnergyDensityInTermsOfWavenumberUnit = J/m**2 {name redefines MeasurementReference::name = "joule per square metre";}
    attribute 'J/m³': ElectromagneticUnit = J/m**3 {name redefines MeasurementReference::name = "joule per cubic metre";}
    attribute 'J/mol': MolarInternalEnergyUnit = J/mol {name redefines MeasurementReference::name = "joule per mole";}
    attribute 'J/nm': SpectralRadiantEnergyUnit = J/nm {name redefines MeasurementReference::name = "joule per nanometre";}
    attribute 'J/s': HeatFlowRateUnit = J/s {name redefines MeasurementReference::name = "joule per second";}
    attribute 'K/Pa': JouleThomsonCoefficientUnit = K/Pa {name redefines MeasurementReference::name = "kelvin per pascal";}
    attribute 'K/W': ThermalResistanceUnit = K/W {name redefines MeasurementReference::name = "kelvin per watt";}
    attribute 'K⁻¹': LinearExpansionCoefficientUnit = K**-1 {name redefines MeasurementReference::name = "kelvin to the power minus 1";}
    attribute 'kg⋅m⋅s⁻¹': MomentumUnit = kg*m*s**-1 {name redefines MeasurementReference::name = "kilogram metre second to the power minus 1";}
    attribute 'kg⋅m⋅s⁻²': ForceUnit = kg*m*s**-2 {name redefines MeasurementReference::name = "kilogram metre second to the power minus 2";}
    attribute 'kg⋅m⋅s⁻³': SpectralRadiantFluxUnit = kg*m*s**-3 {name redefines MeasurementReference::name = "kilogram metre second to the power minus 3";}
    attribute 'kg⋅m⋅s⁻³⋅K⁻¹': ThermalConductivityUnit = kg*m*s**-3*K**-1 {name redefines MeasurementReference::name = "kilogram metre second to the power minus 3 kelvin to the power minus 1";}
    attribute 'kg⋅m⋅s⁻³⋅sr⁻¹': SpectralRadiantIntensityUnit = kg*m*s**-3*sr**-1 {name redefines MeasurementReference::name = "kilogram metre second to the power minus 3 steradian to the power minus 1";}
    attribute 'kg⋅m⁻¹': LinearMassDensityUnit = kg*m**-1 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1";}
    attribute 'kg⋅m⁻¹⋅s⁻¹': DynamicViscosityUnit = kg*m**-1*s**-1 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1 second to the power minus 1";}
    attribute 'kg⋅m⁻¹⋅s⁻²': PressureUnit = kg*m**-1*s**-2 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1 second to the power minus 2";}
    attribute 'kg⋅m⁻¹⋅s⁻²⋅K⁻¹': PressureCoefficientUnit = kg*m**-1*s**-2*K**-1 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1 second to the power minus 2 kelvin to the power minus 1";}
    attribute 'kg⋅m⁻¹⋅s⁻³': SpectralIrradianceUnit = kg*m**-1*s**-3 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1 second to the power minus 3";}
    attribute 'kg⋅m⁻¹⋅s⁻³⋅sr⁻¹': SpectralRadianceUnit = kg*m**-1*s**-3*sr**-1 {name redefines MeasurementReference::name = "kilogram metre to the power minus 1 second to the power minus 3 steradian to the power minus 1";}
    attribute 'kg⋅m⁻²': SurfaceMassDensityUnit = kg*m**-2 {name redefines MeasurementReference::name = "kilogram metre to the power minus 2";}
    attribute 'kg⋅m⁻²⋅s⁻¹': MassFlowUnit = kg*m**-2*s**-1 {name redefines MeasurementReference::name = "kilogram metre to the power minus 2 second to the power minus 1";}
    attribute 'kg⋅m⁻²⋅s⁻²': SpectralRadiantEnergyDensityInTermsOfWavelengthUnit = kg*m**-2*s**-2 {name redefines MeasurementReference::name = "kilogram metre to the power minus 2 second to the power minus 2";}
    attribute 'kg⋅m⁻³': MassDensityUnit = kg*m**-3 {name redefines MeasurementReference::name = "kilogram metre to the power minus 3";}
    attribute 'kg⋅m²': MomentOfInertiaUnit = kg*m**2 {name redefines MeasurementReference::name = "kilogram metre squared";}
    attribute 'kg⋅m²⋅s⁻¹': AngularMomentumUnit = kg*m**2*s**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 1";}
    attribute 'kg⋅m²⋅s⁻²': MomentOfForceUnit = kg*m**2*s**-2 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 2";}
    attribute 'kg⋅m²⋅s⁻²⋅K⁻¹': HeatCapacityUnit = kg*m**2*s**-2*K**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 2 kelvin to the power minus 1";}
    attribute 'kg⋅m²⋅s⁻²⋅K⁻¹⋅mol⁻¹': MolarHeatCapacityUnit = kg*m**2*s**-2*K**-1*mol**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 2 kelvin to the power minus 1 mole to the power minus 1";}
    attribute 'kg⋅m²⋅s⁻²⋅mol⁻¹': MolarInternalEnergyUnit = kg*m**2*s**-2*mol**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 2 mole to the power minus 1";}
    attribute 'kg⋅m²⋅s⁻³': PowerUnit = kg*m**2*s**-3 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 3";}
    attribute 'kg⋅m²⋅s⁻³⋅K⁻¹': ThermalConductanceUnit = kg*m**2*s**-3*K**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 3 kelvin to the power minus 1";}
    attribute 'kg⋅m²⋅s⁻³⋅sr⁻¹': RadiantIntensityUnit = kg*m**2*s**-3*sr**-1 {name redefines MeasurementReference::name = "kilogram metre squared second to the power minus 3 steradian to the power minus 1";}
    attribute 'kg⋅mol⁻¹': MolarMassUnit = kg*mol**-1 {name redefines MeasurementReference::name = "kilogram mole to the power minus 1";}
    attribute 'kg⋅s⁻¹': MassFlowRateUnit = kg*s**-1 {name redefines MeasurementReference::name = "kilogram second to the power minus 1";}
    attribute 'kg⋅s⁻²': SurfaceTensionUnit = kg*s**-2 {name redefines MeasurementReference::name = "kilogram second to the power minus 2";}
    attribute 'kg⋅s⁻³': DensityOfHeatFlowRateUnit = kg*s**-3 {name redefines MeasurementReference::name = "kilogram second to the power minus 3";}
    attribute 'kg⋅s⁻³⋅K⁻¹': CoefficientOfHeatTransferUnit = kg*s**-3*K**-1 {name redefines MeasurementReference::name = "kilogram second to the power minus 3 kelvin to the power minus 1";}
    attribute 'kg⋅s⁻³⋅sr⁻¹': RadianceUnit = kg*s**-3*sr**-1 {name redefines MeasurementReference::name = "kilogram second to the power minus 3 steradian to the power minus 1";}
    attribute 'kg⁻¹⋅A': ExposureRateUnit = kg**-1*A {name redefines MeasurementReference::name = "kilogram to the power minus 1 ampere";}
    attribute 'kg⁻¹⋅m⋅s²': CompressibilityUnit = kg**-1*m*s**2 {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre second to the power 2";}
    attribute 'kg⁻¹⋅m⋅s²⋅K': JouleThomsonCoefficientUnit = kg**-1*m*s**2*K {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre second to the power 2 kelvin";}
    attribute 'kg⁻¹⋅m⁻²⋅s³⋅K': ThermalResistanceUnit = kg**-1*m**-2*s**3*K {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre to the power minus 2 second to the power 3 kelvin";}
    attribute 'kg⁻¹⋅m⁻³⋅s³⋅A²': ElectrolyticConductivityUnit = kg**-1*m**-3*s**3*A**2 {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre to the power minus 3 second to the power 3 ampere to the power 2";}
    attribute 'kg⁻¹⋅m²': MassAttenuationCoefficientUnit = kg**-1*m**2 {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre squared";}
    attribute 'kg⁻¹⋅m³': SpecificVolumeUnit = kg**-1*m**3 {name redefines MeasurementReference::name = "kilogram to the power minus 1 metre cubed";}
    attribute 'kg⁻¹⋅s⋅A': GyromagneticRatioUnit = kg**-1*s*A {name redefines MeasurementReference::name = "kilogram to the power minus 1 second ampere";}
    attribute 'kg⁻¹⋅s⁻¹': SpecificActivityUnit = kg**-1*s**-1 {name redefines MeasurementReference::name = "kilogram to the power minus 1 second to the power minus 1";}
    attribute 'kg⁻¹⋅s²': EnergyDistributionOfCrossSectionUnit = kg**-1*s**2 {name redefines MeasurementReference::name = "kilogram to the power minus 1 second to the power 2";}
    attribute 'kg⁻¹⋅s²⋅A': MobilityUnit = kg**-1*s**2*A {name redefines MeasurementReference::name = "kilogram to the power minus 1 second to the power 2 ampere";}
    attribute 'kg⁻¹⋅s³⋅A²⋅mol⁻¹': MolarConductivityUnit = kg**-1*s**3*A**2*mol**-1 {name redefines MeasurementReference::name = "kilogram to the power minus 1 second to the power 3 ampere to the power 2 mole to the power minus 1";}
    attribute 'kg⁻¹⋅s³⋅K': ThermalInsulanceUnit = kg**-1*s**3*K {name redefines MeasurementReference::name = "kilogram to the power minus 1 second to the power 3 kelvin";}
    attribute 'lm⋅s': LuminousEnergyUnit = lm*s {name redefines MeasurementReference::name = "lumen second";}
    attribute 'lm/m²': LuminousExitanceUnit = lm/m**2 {name redefines MeasurementReference::name = "lumen per square metre";}
    attribute 'lm/W': LuminousEfficacyOfRadiationUnit = lm/W {name redefines MeasurementReference::name = "lumen per watt";}
    attribute 'lx⋅s': LuminousExposureUnit = lx*s {name redefines MeasurementReference::name = "lux second";}
    attribute 'm/s': VelocityUnit = m/s {name redefines MeasurementReference::name = "metre per second";}
    attribute 'm⋅s⁻²': AccelerationUnit = m*s**-2 {name redefines MeasurementReference::name = "metre second to the power minus 2";}
    attribute 'm⁻¹': CurvatureUnit = m**-1 {name redefines MeasurementReference::name = "metre to the power minus 1";}
    attribute 'm⁻²': PhotonExposureUnit = m**-2 {name redefines MeasurementReference::name = "metre to the power minus 2";}
    attribute 'm⁻²⋅s⁻¹': PhotonIrradianceUnit = m**-2*s**-1 {name redefines MeasurementReference::name = "metre to the power minus 2 second to the power minus 1";}
    attribute 'm⁻²⋅s⁻¹⋅sr⁻¹': PhotonRadianceUnit = m**-2*s**-1*sr**-1 {name redefines MeasurementReference::name = "metre to the power minus 2 second to the power minus 1 steradian to the power minus 1";}
    attribute 'm⁻³': ParticleConcentrationUnit = m**-3 {name redefines MeasurementReference::name = "metre to the power minus 3";}
    attribute 'm⁻³⋅s⁻¹': ActivityDensityUnit = m**-3*s**-1 {name redefines MeasurementReference::name = "metre to the power minus 3 second to the power minus 1";}
    attribute 'm²': AreaUnit = m**2 {name redefines MeasurementReference::name = "square metre";}
    attribute 'm²⋅A': MagneticDipoleMomentUnit = m**2*A {name redefines MeasurementReference::name = "metre squared ampere";}
    attribute 'm²⋅K/W': ThermalInsulanceUnit = m**2*K/W {name redefines MeasurementReference::name = "metre squared kelvin per watt";}
    attribute 'm²⋅mol⁻¹': MolarAbsorptionCoefficientUnit = m**2*mol**-1 {name redefines MeasurementReference::name = "metre squared mole to the power minus 1";}
    attribute 'm²⋅s⁻¹': KinematicViscosityUnit = m**2*s**-1 {name redefines MeasurementReference::name = "metre squared second to the power minus 1";}
    attribute 'm²⋅s⁻²': SpecificEnergyUnit = m**2*s**-2 {name redefines MeasurementReference::name = "metre squared second to the power minus 2";}
    attribute 'm²⋅s⁻²⋅K⁻¹': SpecificHeatCapacityUnit = m**2*s**-2*K**-1 {name redefines MeasurementReference::name = "metre squared second to the power minus 2 kelvin to the power minus 1";}
    attribute 'm²⋅s⁻³': DoseEquivalentUnit = m**2*s**-3 {name redefines MeasurementReference::name = "metre squared second to the power minus 3";}
    attribute 'm²⋅sr⁻¹': DirectionDistributionOfCrossSectionUnit = m**2*sr**-1 {name redefines MeasurementReference::name = "metre squared steradian to the power minus 1";}
    attribute 'm²/(J⋅sr)': DirectionAndEnergyDistributionOfCrossSectionUnit = m**2/(J*sr) {name redefines MeasurementReference::name = "metre squared per joule steradian";}
    attribute 'm²/(V⋅s)': MobilityUnit = m**2/(V*s) {name redefines MeasurementReference::name = "metre squared per volt second";}
    attribute 'm²/J': EnergyDistributionOfCrossSectionUnit = m**2/J {name redefines MeasurementReference::name = "metre squared per joule";}
    attribute 'm³⋅mol⁻¹': MolarVolumeUnit = m**3*mol**-1 {name redefines MeasurementReference::name = "metre cubed mole to the power minus 1";}
    attribute 'm³⋅s⁻¹': VolumeFlowRateUnit = m**3*s**-1 {name redefines MeasurementReference::name = "metre cubed second to the power minus 1";}
    attribute 'm⁴': SecondAxialMomentOfAreaUnit = m**4 {name redefines MeasurementReference::name = "metre to the power 4";}
    attribute 'm⁴⋅s⁻²': TotalMassStoppingPowerUnit = m**4*s**-2 {name redefines MeasurementReference::name = "metre to the power 4 second to the power minus 2";}
    attribute 'mL/L': VolumeFractionUnit = mL/L {name redefines MeasurementReference::name = "millilitre per litre";}
    attribute 'mol⋅kg⁻¹': IonicStrengthUnit = mol*kg**-1 {name redefines MeasurementReference::name = "mole kilogram to the power minus 1";}
    attribute 'mol⋅m⁻³': AmountOfSubstanceConcentrationUnit = mol*m**-3 {name redefines MeasurementReference::name = "mole metre to the power minus 3";}
    attribute 'mol/kg': MolalityUnit = mol/kg {name redefines MeasurementReference::name = "mole per kilogram";}
    attribute 'mol/L': AmountOfSubstanceConcentrationUnit = mol/L {name redefines MeasurementReference::name = "mole per l";}
    attribute 'mol/m³': EquilibriumConstantOnConcentrationBasisUnit = mol/m**3 {name redefines MeasurementReference::name = "mole per cubic metre";}
    attribute 'N⋅m': MomentOfForceUnit = N*m {name redefines MeasurementReference::name = "newton metre";}
    attribute 'N⋅m⋅s': AngularImpulseUnit = N*m*s {name redefines MeasurementReference::name = "newton metre second";}
    attribute 'N⋅m⋅s⁻¹': PowerUnit = N*m*s**-1 {name redefines MeasurementReference::name = "newton metre second to the power minus 1";}
    attribute 'N⋅m⁻¹': SurfaceTensionUnit = N*m**-1 {name redefines MeasurementReference::name = "newton metre to the power minus 1";}
    attribute 'N⋅m⁻²': PressureUnit = N*m**-2 {name redefines MeasurementReference::name = "newton metre to the power minus 2";}
    attribute 'N⋅s': ImpulseUnit = N*s {name redefines MeasurementReference::name = "newton second";}
    attribute 'Pa⋅s': DynamicViscosityUnit = Pa*s {name redefines MeasurementReference::name = "pascal second";}
    attribute 'Pa/K': PressureCoefficientUnit = Pa/K {name redefines MeasurementReference::name = "pascal per kelvin";}
    attribute 'Pa⁻¹': CompressibilityUnit = Pa**-1 {name redefines MeasurementReference::name = "pascal to the power minus 1";}
    attribute 'rad⋅m²/kg¹': SpecificOpticalRotatoryPowerUnit = rad*m**2/kg**1 {name redefines MeasurementReference::name = "radian metre squared per kilogram to the power 1";}
    attribute 'rad⋅m²/mol': MolarOpticalRotatoryPowerUnit = rad*m**2/mol {name redefines MeasurementReference::name = "radian metre squared per mole";}
    attribute 'rad⋅s⁻¹': AngularVelocityUnit = rad*s**-1 {name redefines MeasurementReference::name = "radian second to the power minus 1";}
    attribute 'rad⋅s⁻²': AngularAccelerationUnit = rad*s**-2 {name redefines MeasurementReference::name = "radian second to the power minus 2";}
    attribute 's⋅A': ElectricChargeUnit = s*A {name redefines MeasurementReference::name = "second ampere";}
    attribute 'S⋅m²/mol': MolarConductivityUnit = S*m**2/mol {name redefines MeasurementReference::name = "siemens metre squared per mole";}
    attribute 'S/m': ConductivityUnit = S/m {name redefines MeasurementReference::name = "siemens per metre";}
    attribute 's⁻¹': AngularVelocityUnit = s**-1 {name redefines MeasurementReference::name = "second to the power minus 1";}
    attribute 's⁻¹⋅sr⁻¹': PhotonIntensityUnit = s**-1*sr**-1 {name redefines MeasurementReference::name = "second to the power minus 1 steradian to the power minus 1";}
    attribute 's⁻²': AngularAccelerationUnit = s**-2 {name redefines MeasurementReference::name = "second to the power minus 2";}
    attribute 'Sv/s': DoseEquivalentUnit = Sv/s {name redefines MeasurementReference::name = "sievert per second";}
    attribute 'V⋅A': PowerUnit = V*A {name redefines MeasurementReference::name = "volt ampere";}
    attribute 'V/m': ElectricFieldStrengthUnit = V/m {name redefines MeasurementReference::name = "volt per metre";}
    attribute 'W⋅h': ActiveEnergyUnit = W*h {name redefines MeasurementReference::name = "watt hour";}
    attribute 'W/(m⋅K)': ThermalConductivityUnit = W/(m*K) {name redefines MeasurementReference::name = "watt per metre kelvin";}
    attribute 'W/(m²⋅K)': CoefficientOfHeatTransferUnit = W/(m**2*K) {name redefines MeasurementReference::name = "watt per square metre kelvin";}
    attribute 'W/(m²⋅nm)': SpectralIrradianceUnit = W/(m**2*nm) {name redefines MeasurementReference::name = "watt per square metre nanometre";}
    attribute 'W/(sr⋅m²)': RadianceUnit = W/(sr*m**2) {name redefines MeasurementReference::name = "watt per steradian square metre";}
    attribute 'W/(sr⋅m²⋅nm)': SpectralRadianceUnit = W/(sr*m**2*nm) {name redefines MeasurementReference::name = "watt per steradian square metre nanometre";}
    attribute 'W/(sr⋅nm)': SpectralRadiantIntensityUnit = W/(sr*nm) {name redefines MeasurementReference::name = "watt per steradian nanometre";}
    attribute 'W/K': ThermalConductanceUnit = W/K {name redefines MeasurementReference::name = "watt per kelvin";}
    attribute 'W/kg': DoseEquivalentUnit = W/kg {name redefines MeasurementReference::name = "watt per kilogram";}
    attribute 'W/m²': DensityOfHeatFlowRateUnit = W/m**2 {name redefines MeasurementReference::name = "watt per square metre";}
    attribute 'W/nm': SpectralRadiantFluxUnit = W/nm {name redefines MeasurementReference::name = "watt per nanometre";}
    attribute 'W/sr': RadiantIntensityUnit = W/sr {name redefines MeasurementReference::name = "watt per steradian";}
    attribute 'Wb⋅m': MagneticDipoleMomentUnit = Wb*m {name redefines MeasurementReference::name = "weber metre";}
    attribute 'Wb/m': MagneticVectorPotentialUnit = Wb/m {name redefines MeasurementReference::name = "weber per metre";}
    attribute 'Ω⋅m': ResistivityUnit = 'Ω'*m {name redefines MeasurementReference::name = "ohm metre";}

    alias 'm/s' as 'm⋅s⁻¹';
    alias 'm⋅s⁻²' as 'm/s²';

    /* 
     * Prefixed units
     */
    attribute mm: LengthUnit = LengthUnit(name => "millimetre", unitConversion => ConversionByPrefix(prefix => milli, referenceUnit => m));
    attribute km: LengthUnit = LengthUnit(name => "kilometre", unitConversion => ConversionByPrefix(prefix => kilo, referenceUnit => m));
    attribute mN: ForceUnit = ForceUnit(name => "millinewton", unitConversion => ConversionByPrefix(prefix => milli, referenceUnit => N));
    attribute kJ: EnergyUnit = EnergyUnit(name => "kilojoule", unitConversion => ConversionByPrefix(prefix => kilo, referenceUnit => J));
    attribute MJ: EnergyUnit = EnergyUnit(name => "megajoule", unitConversion => ConversionByPrefix(prefix => mega, referenceUnit => J));
    attribute GJ: EnergyUnit = EnergyUnit(name => "gigajoule", unitConversion => ConversionByPrefix(prefix => giga, referenceUnit => J));
    
    /*
     * Non-standard conversion based units that are accepted in SI
     */
    attribute min: TimeUnit = TimeUnit(name => "minute", unitConversion => ConversionByConvention(referenceUnit => s, conversionFactor => 60));
    attribute h: TimeUnit = TimeUnit(name => "hour", unitConversion => ConversionByConvention(referenceUnit => min, conversionFactor => 60));
    attribute 'km/h': SpeedUnit = km / h {name redefines MeasurementReference::name = "kilometre per hour";}
    attribute 'Å': LengthUnit = LengthUnit(name => "ångström", unitConversion => ConversionByConvention(referenceUnit => m, conversionFactor => 1E-10));
    
    /*
     * degree Celsius unit for relative temperature (i.e. temperature difference) quantities
     */
    attribute '°C«rel»': TemperatureUnit = TemperatureUnit(name => "degree celsius (relative)", unitConversion => ConversionByConvention(referenceUnit => K, conversionFactor => 1));
     
    /*
     * degree Celsius interval scale for absolute temperature quantities
     * 
     * The interval scale is defined with an explicit mapping to the kelvin ratio scale from which the offset between the scales can be computed.
     */
    attribute '°C«abs»': IntervalScale = IntervalScale(name => "degree celsius (absolute)") {
        attribute unit redefines MeasurementScale::unit = '°C«rel»';
        attribute temperatureWaterAtFreezingPointInC: ScaleValueDefinition = ScaleValueDefinition(
            num => 0, description => "temperature in degree Celsius of pure water at freezing point"
        );
        private attribute temperatureWaterAtTriplePointInC: ScaleValueDefinition = ScaleValueDefinition(
            num => Rat(1, 100), description => "temperature in degree Celsius of pure water at the triple point"
        );
        private attribute celsiusToKelvinScaleMapping: ScaleValueMapping = ScaleValueMapping(
            mappedScaleValue => temperatureWaterAtTriplePointInC, referenceScaleValue => K::temperatureOfWaterAtTriplePointInK
        );
        attribute scaleValueDefinition: ScaleValueDefinition :>> MeasurementReference::scaleValueDefinition = {temperatureWaterAtTriplePointInC, temperatureWaterAtFreezingPointInC};
        attribute scaleValueMapping redefines MeasurementScale::scaleValueMapping = celsiusToKelvinScaleMapping;
    }
    alias '°C«abs»' as '°C';
}
