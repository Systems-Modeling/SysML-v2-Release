/**
 * International System of (Measurement) Units -- Système International d'Unités (SI), as defined in ISO/IEC 80000
 *
 * Note 1: In accordance with ISO/IEC 80000 en-GB spelling is used for the longNames and definitions of the units.
 * Note 2: This is a representative but not yet complete list of measurement units.
 */
package SI {
    private import UnitsAndScales::*;
    import ISQ::*;
    import SIPrefixes::*;
    import QuantityCalculations::*;

    /*
     * SI simple units needed before creation of base units
     */
    attribute g: MassUnit { :>> longName = "gram"; }

    /*
     * SI base units
     */
    attribute m: LengthUnit { :>> longName = "metre"; }
    attribute kg: MassUnit { :>> longName = "kilogram"; :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = g; } }
    attribute s: DurationUnit { :>> longName = "second"; }
    attribute A: ElectricCurrentUnit { :>> longName = "ampere";  }
    attribute K: TemperatureUnit {
        :>> longName = "kelvin";
        attribute temperatureOfWaterAtTriplePointInK: DefinitionalQuantityValue {
            :>> num = 27316/100;
            :>> definition = "temperature in kelvin of pure water at the triple point";
        }
        attribute :>> definitionalQuantityValues = temperatureOfWaterAtTriplePointInK;
    }
    attribute mol: AmountOfSubstanceUnit { :>> longName = "mol"; }
    attribute cd: LuminousIntensityUnit { :>> longName = "candela"; }

    /*
     * Declare the SI system of units with its explicit base units
     */
	attribute systemOfUnits: SystemOfUnits {
		:>> longName = "ISO/IEC 80000 International System of Units";
		:>> baseUnits = (m, kg, s, A, K, mol, cd);
	}

    /*
     * Units with special names
     */
    attribute B: StorageCapacityUnit = one { :>> longName = "byte"; }
    attribute Bd: ModulationRateUnit = one { :>> longName = "baud"; }
    attribute bit: StorageCapacityUnit = one { :>> longName = "bit"; }
    attribute Bq: NuclearActivityUnit = s**-1 { :>> longName = "becquerel"; }
    attribute C: ElectricChargeUnit = A*s { :>> longName = "coulomb"; }
    attribute dB: SoundPressureLevelUnit = one { :>> longName = "decibel"; }
    attribute dec: LogarithmicFrequencyRangeUnit = one { :>> longName = "decade"; }
    attribute E: TrafficIntensityUnit = one { :>> longName = "erlang"; }
    attribute F: CapacitanceUnit = C/V { :>> longName = "farad"; }
    attribute Gy: AbsorbedDoseUnit = J/kg { :>> longName = "gray"; }
    attribute H: PermeanceUnit, InductanceUnit = Wb/A { :>> longName = "henry"; }
    attribute Hart: InformationContentUnit = one { :>> longName = "hartley"; }
    attribute Hz: FrequencyUnit = s**-1 { :>> longName = "hertz"; }
    attribute J: EnergyUnit = N*m { :>> longName = "joule"; }
    attribute lm: LuminousFluxUnit = cd*sr { :>> longName = "lumen"; }
    attribute lx: IlluminanceUnit = lm/m**2 { :>> longName = "lux"; }
    attribute N: ForceUnit = kg*m/s**2 { :>> longName = "newton"; }
    attribute nat: InformationContentUnit = one { :>> longName = "natural unit of information"; }
    attribute o: StorageCapacityUnit = one { :>> longName = "octet"; }
    attribute oct: LogarithmicFrequencyRangeUnit = one { :>> longName = "octave"; }
    attribute Pa: PressureUnit = N/m**2 { :>> longName = "pascal"; }
    attribute rad: AngularMeasureUnit = m/m { :>> longName = "radian"; }
    attribute S: ConductanceUnit = 'Ω'**-1 { :>> longName = "siemens"; }
    attribute Sh: InformationContentUnit = one { :>> longName = "shannon"; }
    attribute sr: SolidAngularMeasureUnit = m**2/m**2 { :>> longName = "steradian"; }
    attribute Sv: DoseEquivalentUnit = J/kg { :>> longName = "sievert"; }
    attribute T: MagneticFluxDensityUnit = Wb/m**2 { :>> longName = "tesla"; }
    attribute V: ElectricPotentialUnit = W/A { :>> longName = "volt"; }
    attribute W: PowerUnit = J/s { :>> longName = "watt"; }
    attribute Wb: MagneticFluxUnit = V*s { :>> longName = "weber"; }
    attribute '°': AngularMeasureUnit = '°' { :>> longName = "degree"; }
    attribute 'Ω': ResistanceUnit = V/A { :>> longName = "ohm"; }

    /*
     * Units recognized in SI
     */
    attribute b: AreaUnit { :>> longName = "barn"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'm²'; :>> conversionFactor = 1.0e-28; } }
    attribute Da: MassUnit { :>> longName = "dalton"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.66053906660e-27; } }
    attribute eV: EnergyUnit { :>> longName = "electronvolt"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.602176487e-19; } }
    attribute u: MassUnit { :>> longName = "atomic mass unit"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = Da; :>> conversionFactor = 1.0; } }
    attribute ua: LengthUnit { :>> longName = "astronomical unit"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 149597870691e11; } }
    attribute var: PowerUnit { :>> longName = "var"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = V*A; :>> conversionFactor = 1.0; } }
    attribute 'Å': LengthUnit { :>> longName = "ångström"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.0e-10; } }

    attribute L: VolumeUnit { :>> longName = "litre"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'm³'; :>> conversionFactor = 1.0e-3; } }
    attribute mL: VolumeUnit { :>> longName = "millilitre"; :>> unitConversion: ConversionByPrefix { :>> prefix = milli; :>> referenceUnit = L; } }

    /*
     * Derived units used in parts 3 to 12 of ISO/IEC 80000
     */ 
    attribute 'A⋅m⁻²⋅K⁻²': RichardsonConstantUnit = A*m**-2*K**-2 { :>> longName = "ampere metre to the power minus 2 kelvin to the power minus 2"; }
    attribute 'A⋅m²': MagneticMomentUnit = A*m**2 { :>> longName = "ampere metre squared"; }
    attribute 'A⋅m²⋅J⁻¹⋅s⁻¹': GyromagneticRatioUnit = A*m**2*J**-1*s**-1 { :>> longName = "ampere metre squared joule to the power minus 1 second to the power minus 1"; }
    attribute 'A⋅s/kg': GyromagneticRatioUnit = A*s/kg { :>> longName = "ampere second per kilogram"; }
    attribute 'A/m': LinearElectricCurrentDensityUnit = A/m { :>> longName = "ampere per metre"; }
    attribute 'A/m²': ElectricCurrentDensityUnit = A/m**2 { :>> longName = "ampere per square metre"; }
    attribute 'B/s': TransferRateUnit = B/s { :>> longName = "byte per second"; }
    attribute 'bit/s': BinaryDigitRateUnit = bit/s { :>> longName = "bit per second"; }
    attribute 'Bq/kg': SpecificActivityUnit = Bq/kg { :>> longName = "becquerel per kilogram"; }
    attribute 'Bq/m²': SurfaceActivityDensityUnit = Bq/m**2 { :>> longName = "becquerel per square metre"; }
    attribute 'Bq/m³': ActivityDensityUnit = Bq/m**3 { :>> longName = "becquerel per cubic metre"; }
    attribute 'C⋅m': ElectricDipoleMomentUnit = C*m { :>> longName = "coulomb metre"; }
    attribute 'C/(kg⋅s)': ExposureRateUnit = C/(kg*s) { :>> longName = "coulomb per kilogram second"; }
    attribute 'C/kg': ExposureUnit = C/kg { :>> longName = "coulomb per kilogram"; }
    attribute 'C/m': LinearDensityOfElectricChargeUnit = C/m { :>> longName = "coulomb per metre"; }
    attribute 'C/m²': SurfaceDensityOfElectricChargeUnit = C/m**2 { :>> longName = "coulomb per square metre"; }
    attribute 'C/m³': ElectricChargeDensityUnit = C/m**3 { :>> longName = "coulomb per cubic metre"; }
    attribute 'cd⋅m⁻²': LuminanceUnit = cd*m**-2 { :>> longName = "candela metre to the power minus 2"; }
    attribute 'cd⋅sr': LuminousFluxUnit = cd*sr { :>> longName = "candela steradian"; }
    attribute 'cd⋅sr⋅kg⁻¹⋅m⁻²⋅s³': LuminousEfficacyOfRadiationUnit = cd*sr*kg**-1*m**-2*s**3 { :>> longName = "candela steradian kilogram to the power minus 1 metre to the power minus 2 second to the power 3"; }
    attribute 'cd⋅sr⋅m⁻²': IlluminanceUnit = cd*sr*m**-2 { :>> longName = "candela steradian metre to the power minus 2"; }
    attribute 'cd⋅sr⋅m⁻²⋅s': LuminousExposureUnit = cd*sr*m**-2*s { :>> longName = "candela steradian metre to the power minus 2 second"; }
    attribute 'cd⋅sr⋅s': LuminousEnergyUnit = cd*sr*s { :>> longName = "candela steradian second"; }
    attribute 'eV⋅J⋅kg⋅m²⋅s⁻²': HartreeEnergyUnit = eV*J*kg*m**2*s**-2 { :>> longName = "electronvolt joule kilogram metre squared second to the power minus 2"; }
    attribute 'eV⋅m⁻²/kg': TotalMassStoppingPowerUnit = eV*m**-2/kg { :>> longName = "electronvolt metre to the power minus 2 per kilogram"; }
    attribute 'eV/m': TotalLinearStoppingPowerUnit = eV/m { :>> longName = "electronvolt per metre"; }
    attribute 'eV/m²': EnergyFluenceUnit = eV/m**2 { :>> longName = "electronvolt per square metre"; }
    attribute 'F/m': ElectricConstantUnit = F/m { :>> longName = "farad per metre"; }
    attribute 'g/L': MassConcentrationUnit = g/L { :>> longName = "gram per litre"; }
    attribute 'g/mol': MolarMassUnit = g/mol { :>> longName = "gram per mole"; }
    attribute 'Gy/s': AbsorbedDoseRateUnit = Gy/s { :>> longName = "gray per second"; }
    attribute 'H/m': MagneticConstantUnit = H/m { :>> longName = "henry per metre"; }
    attribute 'H⁻¹': ReluctanceUnit = H**-1 { :>> longName = "henry to the power minus 1"; }
    attribute 'Hart/s': AverageInformationRateUnit = Hart/s { :>> longName = "hartley per second"; }
    attribute 'J⋅m²/kg': TotalMassStoppingPowerUnit = J*m**2/kg { :>> longName = "joule metre squared per kilogram"; }
    attribute 'J⋅s': ActionQuantityUnit = J*s { :>> longName = "joule second"; }
    attribute 'J⋅s⋅eV⋅s': TotalAngularMomentumUnit = J*s*eV*s { :>> longName = "joule second electronvolt second"; }
    attribute 'J⋅s⁻¹': PowerUnit = J*s**-1 { :>> longName = "joule second to the power minus 1"; }
    attribute 'J/(kg⋅K)': SpecificHeatCapacityUnit = J/(kg*K) { :>> longName = "joule per kilogram kelvin"; }
    attribute 'J/(m²⋅nm)': SpectralRadiantExposureUnit = J/(m**2*nm) { :>> longName = "joule per square metre nanometre"; }
    attribute 'J/(m³⋅nm)': SpectralRadiantEnergyDensityInTermsOfWavelengthUnit = J/(m**3*nm) { :>> longName = "joule per cubic metre nanometre"; }
    attribute 'J/(mol⋅K)': MolarHeatCapacityUnit = J/(mol*K) { :>> longName = "joule per mole kelvin"; }
    attribute 'J/K': HeatCapacityUnit = J/K { :>> longName = "joule per kelvin"; }
    attribute 'J/kg': SpecificEnergyUnit = J/kg { :>> longName = "joule per kilogram"; }
    attribute 'J/m': TotalLinearStoppingPowerUnit = J/m { :>> longName = "joule per metre"; }
    attribute 'J/m²': SpectralRadiantEnergyDensityInTermsOfWavenumberUnit = J/m**2 { :>> longName = "joule per square metre"; }
    attribute 'J/m³': ElectromagneticEnergyDensityUnit = J/m**3 { :>> longName = "joule per cubic metre"; }
    attribute 'J/mol': MolarInternalEnergyUnit = J/mol { :>> longName = "joule per mole"; }
    attribute 'J/nm': SpectralRadiantEnergyUnit = J/nm { :>> longName = "joule per nanometre"; }
    attribute 'J/s': HeatFlowRateUnit = J/s { :>> longName = "joule per second"; }
    attribute 'J⁻¹⋅m⁻³⋅eV⁻¹⋅m⁻³': EnergyDensityOfStatesUnit = J**-1*m**-3*eV**-1*m**-3 { :>> longName = "joule to the power minus 1 metre to the power minus 3 electronvolt to the power minus 1 metre to the power minus 3"; }
    attribute 'K/Pa': JouleThomsonCoefficientUnit = K/Pa { :>> longName = "kelvin per pascal"; }
    attribute 'K/W': ThermalResistanceUnit = K/W { :>> longName = "kelvin per watt"; }
    attribute 'K⁻¹': LinearExpansionCoefficientUnit = K**-1 { :>> longName = "kelvin to the power minus 1"; }
    attribute 'kg⋅m⋅s⁻¹': MomentumUnit = kg*m*s**-1 { :>> longName = "kilogram metre second to the power minus 1"; }
    attribute 'kg⋅m⋅s⁻²': ForceUnit = kg*m*s**-2 { :>> longName = "kilogram metre second to the power minus 2"; }
    attribute 'kg⋅m⋅s⁻³': SpectralRadiantFluxUnit = kg*m*s**-3 { :>> longName = "kilogram metre second to the power minus 3"; }
    attribute 'kg⋅m⋅s⁻³⋅K⁻¹': ThermalConductivityUnit = kg*m*s**-3*K**-1 { :>> longName = "kilogram metre second to the power minus 3 kelvin to the power minus 1"; }
    attribute 'kg⋅m⋅s⁻³⋅sr⁻¹': SpectralRadiantIntensityUnit = kg*m*s**-3*sr**-1 { :>> longName = "kilogram metre second to the power minus 3 steradian to the power minus 1"; }
    attribute 'kg⋅m⁻¹': LinearMassDensityUnit = kg*m**-1 { :>> longName = "kilogram metre to the power minus 1"; }
    attribute 'kg⋅m⁻¹⋅s⁻¹': DynamicViscosityUnit = kg*m**-1*s**-1 { :>> longName = "kilogram metre to the power minus 1 second to the power minus 1"; }
    attribute 'kg⋅m⁻¹⋅s⁻²': PressureUnit = kg*m**-1*s**-2 { :>> longName = "kilogram metre to the power minus 1 second to the power minus 2"; }
    attribute 'kg⋅m⁻¹⋅s⁻²⋅K⁻¹': PressureCoefficientUnit = kg*m**-1*s**-2*K**-1 { :>> longName = "kilogram metre to the power minus 1 second to the power minus 2 kelvin to the power minus 1"; }
    attribute 'kg⋅m⁻¹⋅s⁻³': SpectralIrradianceUnit = kg*m**-1*s**-3 { :>> longName = "kilogram metre to the power minus 1 second to the power minus 3"; }
    attribute 'kg⋅m⁻¹⋅s⁻³⋅sr⁻¹': SpectralRadianceUnit = kg*m**-1*s**-3*sr**-1 { :>> longName = "kilogram metre to the power minus 1 second to the power minus 3 steradian to the power minus 1"; }
    attribute 'kg⋅m⁻²': SurfaceMassDensityUnit = kg*m**-2 { :>> longName = "kilogram metre to the power minus 2"; }
    attribute 'kg⋅m⁻²⋅s⁻¹': MassFlowUnit = kg*m**-2*s**-1 { :>> longName = "kilogram metre to the power minus 2 second to the power minus 1"; }
    attribute 'kg⋅m⁻²⋅s⁻²': SpectralRadiantEnergyDensityInTermsOfWavelengthUnit = kg*m**-2*s**-2 { :>> longName = "kilogram metre to the power minus 2 second to the power minus 2"; }
    attribute 'kg⋅m⁻³': MassDensityUnit = kg*m**-3 { :>> longName = "kilogram metre to the power minus 3"; }
    attribute 'kg⋅m⁻⁴⋅s⁻¹': AcousticImpedanceUnit = kg*m**-4*s**-1 { :>> longName = "kilogram metre to the power minus 4 second to the power minus 1"; }
    attribute 'kg⋅m²': MomentOfInertiaUnit = kg*m**2 { :>> longName = "kilogram metre squared"; }
    attribute 'kg⋅m²⋅s⁻¹': AngularMomentumUnit = kg*m**2*s**-1 { :>> longName = "kilogram metre squared second to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻²': MomentOfForceUnit = kg*m**2*s**-2 { :>> longName = "kilogram metre squared second to the power minus 2"; }
    attribute 'kg⋅m²⋅s⁻²⋅K⁻¹': HeatCapacityUnit = kg*m**2*s**-2*K**-1 { :>> longName = "kilogram metre squared second to the power minus 2 kelvin to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻²⋅K⁻¹⋅mol⁻¹': MolarHeatCapacityUnit = kg*m**2*s**-2*K**-1*mol**-1 { :>> longName = "kilogram metre squared second to the power minus 2 kelvin to the power minus 1 mole to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻²⋅mol⁻¹': MolarInternalEnergyUnit = kg*m**2*s**-2*mol**-1 { :>> longName = "kilogram metre squared second to the power minus 2 mole to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻³': PowerUnit = kg*m**2*s**-3 { :>> longName = "kilogram metre squared second to the power minus 3"; }
    attribute 'kg⋅m²⋅s⁻³⋅A⁻¹': ElectricPotentialDifferenceUnit = kg*m**2*s**-3*A**-1 { :>> longName = "kilogram metre squared second to the power minus 3 ampere to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻³⋅A⁻¹⋅K⁻¹': SeebeckCoefficientForSubstancesAAndBUnit = kg*m**2*s**-3*A**-1*K**-1 { :>> longName = "kilogram metre squared second to the power minus 3 ampere to the power minus 1 kelvin to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻³⋅K⁻¹': ThermalConductanceUnit = kg*m**2*s**-3*K**-1 { :>> longName = "kilogram metre squared second to the power minus 3 kelvin to the power minus 1"; }
    attribute 'kg⋅m²⋅s⁻³⋅sr⁻¹': RadiantIntensityUnit = kg*m**2*s**-3*sr**-1 { :>> longName = "kilogram metre squared second to the power minus 3 steradian to the power minus 1"; }
    attribute 'kg⋅m³⋅s⁻³⋅A⁻²': ResistivityUnit = kg*m**3*s**-3*A**-2 { :>> longName = "kilogram metre cubed second to the power minus 3 ampere to the power minus 2"; }
    attribute 'kg⋅mol⁻¹': MolarMassUnit = kg*mol**-1 { :>> longName = "kilogram mole to the power minus 1"; }
    attribute 'kg⋅s⁻¹': MassFlowRateUnit = kg*s**-1 { :>> longName = "kilogram second to the power minus 1"; }
    attribute 'kg⋅s⁻²': SurfaceTensionUnit = kg*s**-2 { :>> longName = "kilogram second to the power minus 2"; }
    attribute 'kg⋅s⁻²⋅A⁻¹': MagneticFluxDensityUnit = kg*s**-2*A**-1 { :>> longName = "kilogram second to the power minus 2 ampere to the power minus 1"; }
    attribute 'kg⋅s⁻³': DensityOfHeatFlowRateUnit = kg*s**-3 { :>> longName = "kilogram second to the power minus 3"; }
    attribute 'kg⋅s⁻³⋅K⁻¹': CoefficientOfHeatTransferUnit = kg*s**-3*K**-1 { :>> longName = "kilogram second to the power minus 3 kelvin to the power minus 1"; }
    attribute 'kg⋅s⁻³⋅sr⁻¹': RadianceUnit = kg*s**-3*sr**-1 { :>> longName = "kilogram second to the power minus 3 steradian to the power minus 1"; }
    attribute 'kg⁻¹⋅A': ExposureRateUnit = kg**-1*A { :>> longName = "kilogram to the power minus 1 ampere"; }
    attribute 'kg⁻¹⋅m⋅s²': CompressibilityUnit = kg**-1*m*s**2 { :>> longName = "kilogram to the power minus 1 metre second to the power 2"; }
    attribute 'kg⁻¹⋅m⋅s²⋅K': JouleThomsonCoefficientUnit = kg**-1*m*s**2*K { :>> longName = "kilogram to the power minus 1 metre second to the power 2 kelvin"; }
    attribute 'kg⁻¹⋅m⁻²⋅s³⋅K': ThermalResistanceUnit = kg**-1*m**-2*s**3*K { :>> longName = "kilogram to the power minus 1 metre to the power minus 2 second to the power 3 kelvin"; }
    attribute 'kg⁻¹⋅m⁻³⋅s³⋅A²': ElectrolyticConductivityUnit = kg**-1*m**-3*s**3*A**2 { :>> longName = "kilogram to the power minus 1 metre to the power minus 3 second to the power 3 ampere to the power 2"; }
    attribute 'kg⁻¹⋅m⁻⁵⋅s²': EnergyDensityOfStatesUnit = kg**-1*m**-5*s**2 { :>> longName = "kilogram to the power minus 1 metre to the power minus 5 second to the power 2"; }
    attribute 'kg⁻¹⋅m²': MassAttenuationCoefficientUnit = kg**-1*m**2 { :>> longName = "kilogram to the power minus 1 metre squared"; }
    attribute 'kg⁻¹⋅m³': SpecificVolumeUnit = kg**-1*m**3 { :>> longName = "kilogram to the power minus 1 metre cubed"; }
    attribute 'kg⁻¹⋅s⋅A': GyromagneticRatioUnit = kg**-1*s*A { :>> longName = "kilogram to the power minus 1 second ampere"; }
    attribute 'kg⁻¹⋅s⁻¹': SpecificActivityUnit = kg**-1*s**-1 { :>> longName = "kilogram to the power minus 1 second to the power minus 1"; }
    attribute 'kg⁻¹⋅s²': EnergyDistributionOfCrossSectionUnit = kg**-1*s**2 { :>> longName = "kilogram to the power minus 1 second to the power 2"; }
    attribute 'kg⁻¹⋅s²⋅A': MobilityUnit = kg**-1*s**2*A { :>> longName = "kilogram to the power minus 1 second to the power 2 ampere"; }
    attribute 'kg⁻¹⋅s³⋅A²⋅mol⁻¹': MolarConductivityUnit = kg**-1*s**3*A**2*mol**-1 { :>> longName = "kilogram to the power minus 1 second to the power 3 ampere to the power 2 mole to the power minus 1"; }
    attribute 'kg⁻¹⋅s³⋅K': ThermalInsulanceUnit = kg**-1*s**3*K { :>> longName = "kilogram to the power minus 1 second to the power 3 kelvin"; }
    attribute 'kg²⋅m⁻²⋅s⁻³': SoundExposureUnit = kg**2*m**-2*s**-3 { :>> longName = "kilogram to the power 2 metre to the power minus 2 second to the power minus 3"; }
    attribute 'kg²⋅m⁴⋅s⁻⁶⋅A⁻²⋅K⁻²': LorenzCoefficientUnit = kg**2*m**4*s**-6*A**-2*K**-2 { :>> longName = "kilogram to the power 2 metre to the power 4 second to the power minus 6 ampere to the power minus 2 kelvin to the power minus 2"; }
    attribute 'lm⋅s': LuminousEnergyUnit = lm*s { :>> longName = "lumen second"; }
    attribute 'lm/m²': LuminousExitanceUnit = lm/m**2 { :>> longName = "lumen per square metre"; }
    attribute 'lm/W': LuminousEfficacyOfRadiationUnit = lm/W { :>> longName = "lumen per watt"; }
    attribute 'lx⋅s': LuminousExposureUnit = lx*s { :>> longName = "lux second"; }
    attribute 'm⋅s⁻¹': SpeedUnit = m*s**-1 { :>> longName = "metre second to the power minus 1"; }
    attribute 'm⋅s⁻²': AccelerationUnit = m*s**-2 { :>> longName = "metre second to the power minus 2"; }
    attribute 'm/s': SpeedUnit = m/s { :>> longName = "metre per second"; }
    attribute 'm⁻¹': CurvatureUnit = m**-1 { :>> longName = "metre to the power minus 1"; }
    attribute 'm⁻²': PhotonExposureUnit = m**-2 { :>> longName = "metre to the power minus 2"; }
    attribute 'm⁻²⋅s⁻¹': PhotonIrradianceUnit = m**-2*s**-1 { :>> longName = "metre to the power minus 2 second to the power minus 1"; }
    attribute 'm⁻²⋅s⁻¹⋅sr⁻¹': PhotonRadianceUnit = m**-2*s**-1*sr**-1 { :>> longName = "metre to the power minus 2 second to the power minus 1 steradian to the power minus 1"; }
    attribute 'm⁻³': ParticleConcentrationUnit = m**-3 { :>> longName = "metre to the power minus 3"; }
    attribute 'm⁻³⋅s': DensityOfVibrationalStatesUnit = m**-3*s { :>> longName = "metre to the power minus 3 second"; }
    attribute 'm⁻³⋅s⁻¹': ActivityDensityUnit = m**-3*s**-1 { :>> longName = "metre to the power minus 3 second to the power minus 1"; }
    attribute 'm²': AreaUnit = m**2 { :>> longName = "square metre"; }
    attribute 'm²⋅A': MagneticDipoleMomentUnit = m**2*A { :>> longName = "metre squared ampere"; }
    attribute 'm²⋅K/W': ThermalInsulanceUnit = m**2*K/W { :>> longName = "metre squared kelvin per watt"; }
    attribute 'm²⋅mol⁻¹': MolarAbsorptionCoefficientUnit = m**2*mol**-1 { :>> longName = "metre squared mole to the power minus 1"; }
    attribute 'm²⋅s⁻¹': KinematicViscosityUnit = m**2*s**-1 { :>> longName = "metre squared second to the power minus 1"; }
    attribute 'm²⋅s⁻²': SpecificEnergyUnit = m**2*s**-2 { :>> longName = "metre squared second to the power minus 2"; }
    attribute 'm²⋅s⁻²⋅K⁻¹': SpecificHeatCapacityUnit = m**2*s**-2*K**-1 { :>> longName = "metre squared second to the power minus 2 kelvin to the power minus 1"; }
    attribute 'm²⋅s⁻³': DoseEquivalentUnit = m**2*s**-3 { :>> longName = "metre squared second to the power minus 3"; }
    attribute 'm²⋅sr⁻¹': DirectionDistributionOfCrossSectionUnit = m**2*sr**-1 { :>> longName = "metre squared steradian to the power minus 1"; }
    attribute 'm²/(J⋅sr)': DirectionAndEnergyDistributionOfCrossSectionUnit = m**2/(J*sr) { :>> longName = "metre squared per joule steradian"; }
    attribute 'm²/(V⋅s)': MobilityUnit = m**2/(V*s) { :>> longName = "metre squared per volt second"; }
    attribute 'm²/J': EnergyDistributionOfCrossSectionUnit = m**2/J { :>> longName = "metre squared per joule"; }
    attribute 'm³': VolumeUnit = m**3 { :>> longName = "cubic metre"; }
    attribute 'm³⋅mol⁻¹': MolarVolumeUnit = m**3*mol**-1 { :>> longName = "metre cubed mole to the power minus 1"; }
    attribute 'm³⋅s⁻¹': VolumeFlowRateUnit = m**3*s**-1 { :>> longName = "metre cubed second to the power minus 1"; }
    attribute 'm³/C⋅m³⋅s⁻¹⋅A⁻¹': HallCoefficientUnit = m**3/C*m**3*s**-1*A**-1 { :>> longName = "metre cubed per coulomb cubic metre second to the power minus 1 ampere to the power minus 1"; }
    attribute 'm⁴': SecondAxialMomentOfAreaUnit = m**4 { :>> longName = "metre to the power 4"; }
    attribute 'm⁴⋅s⁻²': TotalMassStoppingPowerUnit = m**4*s**-2 { :>> longName = "metre to the power 4 second to the power minus 2"; }
    attribute 'mL/L': VolumeFractionUnit = mL/L { :>> longName = "millilitre per litre"; }
    attribute 'mol⋅kg⁻¹': IonicStrengthUnit = mol*kg**-1 { :>> longName = "mole kilogram to the power minus 1"; }
    attribute 'mol⋅m⁻³': AmountOfSubstanceConcentrationUnit = mol*m**-3 { :>> longName = "mole metre to the power minus 3"; }
    attribute 'mol/kg': MolalityUnit = mol/kg { :>> longName = "mole per kilogram"; }
    attribute 'mol/L': AmountOfSubstanceConcentrationUnit = mol/L { :>> longName = "mole per litre"; }
    attribute 'mol/m³': EquilibriumConstantOnConcentrationBasisUnit = mol/m**3 { :>> longName = "mole per cubic metre"; }
    attribute 'N⋅m': MomentOfForceUnit, TorqueUnit = N*m { :>> longName = "newton metre"; }
    attribute 'N⋅m⋅s': AngularImpulseUnit = N*m*s { :>> longName = "newton metre second"; }
    attribute 'N⋅m⋅s⁻¹': PowerUnit = N*m*s**-1 { :>> longName = "newton metre second to the power minus 1"; }
    attribute 'N⋅m⁻¹': SurfaceTensionUnit = N*m**-1 { :>> longName = "newton metre to the power minus 1"; }
    attribute 'N⋅m⁻²': PressureUnit = N*m**-2 { :>> longName = "newton metre to the power minus 2"; }
    attribute 'N⋅s': ImpulseUnit = N*s { :>> longName = "newton second"; }
    attribute 'nat/s': AverageInformationRateUnit = nat/s { :>> longName = "natural unit of information per second"; }
    attribute 'o/s': TransferRateUnit = o/s { :>> longName = "octet per second"; }
    attribute 'Pa⋅s': DynamicViscosityUnit = Pa*s { :>> longName = "pascal second"; }
    attribute 'Pa⋅s/m': CharacteristicImpedanceOfAMediumForLongitudinalWavesUnit = Pa*s/m { :>> longName = "pascal second per metre"; }
    attribute 'Pa⋅s/m³': AcousticImpedanceUnit = Pa*s/m**3 { :>> longName = "pascal second per cubic metre"; }
    attribute 'Pa/K': PressureCoefficientUnit = Pa/K { :>> longName = "pascal per kelvin"; }
    attribute 'Pa⁻¹': CompressibilityUnit = Pa**-1 { :>> longName = "pascal to the power minus 1"; }
    attribute 'Pa²⋅s': SoundExposureUnit = Pa**2*s { :>> longName = "pascal to the power 2 second"; }
    attribute 'rad⋅m²/kg¹': SpecificOpticalRotatoryPowerUnit = rad*m**2/kg**1 { :>> longName = "radian metre squared per kilogram to the power 1"; }
    attribute 'rad⋅m²/mol': MolarOpticalRotatoryPowerUnit = rad*m**2/mol { :>> longName = "radian metre squared per mole"; }
    attribute 'rad⋅s⁻¹': AngularVelocityUnit = rad*s**-1 { :>> longName = "radian second to the power minus 1"; }
    attribute 'rad⋅s⁻²': AngularAccelerationUnit = rad*s**-2 { :>> longName = "radian second to the power minus 2"; }
    attribute 'rad/m': PhaseCoefficientUnit = rad/m { :>> longName = "radian per metre"; }
    attribute 's⋅A': ElectricChargeUnit = s*A { :>> longName = "second ampere"; }
    attribute 'S⋅m²/mol': MolarConductivityUnit = S*m**2/mol { :>> longName = "siemens metre squared per mole"; }
    attribute 'S/m': ConductivityUnit = S/m { :>> longName = "siemens per metre"; }
    attribute 's⁻¹': AngularVelocityUnit = s**-1 { :>> longName = "second to the power minus 1"; }
    attribute 's⁻¹⋅sr⁻¹': PhotonIntensityUnit = s**-1*sr**-1 { :>> longName = "second to the power minus 1 steradian to the power minus 1"; }
    attribute 's⁻²': AngularAccelerationUnit = s**-2 { :>> longName = "second to the power minus 2"; }
    attribute 'Sh/s': AverageInformationRateUnit = Sh/s { :>> longName = "shannon per second"; }
    attribute 'Sv/s': DoseEquivalentUnit = Sv/s { :>> longName = "sievert per second"; }
    attribute 'V⋅A': PowerUnit = V*A { :>> longName = "volt ampere"; }
    attribute 'V/K': SeebeckCoefficientForSubstancesAAndBUnit = V/K { :>> longName = "volt per kelvin"; }
    attribute 'V/m': ElectricFieldStrengthUnit = V/m { :>> longName = "volt per metre"; }
    attribute 'V²/K²': LorenzCoefficientUnit = V**2/K**2 { :>> longName = "volt to the power 2 per kelvin to the power 2"; }
    attribute 'W⋅h': EnergyUnit = W*h { :>> longName = "watt hour"; }
    attribute 'W/(m⋅K)': ThermalConductivityUnit = W/(m*K) { :>> longName = "watt per metre kelvin"; }
    attribute 'W/(m²⋅K)': CoefficientOfHeatTransferUnit = W/(m**2*K) { :>> longName = "watt per square metre kelvin"; }
    attribute 'W/(m²⋅nm)': SpectralIrradianceUnit = W/(m**2*nm) { :>> longName = "watt per square metre nanometre"; }
    attribute 'W/(sr⋅m²)': RadianceUnit = W/(sr*m**2) { :>> longName = "watt per steradian square metre"; }
    attribute 'W/(sr⋅m²⋅nm)': SpectralRadianceUnit = W/(sr*m**2*nm) { :>> longName = "watt per steradian square metre nanometre"; }
    attribute 'W/(sr⋅nm)': SpectralRadiantIntensityUnit = W/(sr*nm) { :>> longName = "watt per steradian nanometre"; }
    attribute 'W/K': ThermalConductanceUnit = W/K { :>> longName = "watt per kelvin"; }
    attribute 'W/kg': DoseEquivalentUnit = W/kg { :>> longName = "watt per kilogram"; }
    attribute 'W/m²': DensityOfHeatFlowRateUnit = W/m**2 { :>> longName = "watt per square metre"; }
    attribute 'W/nm': SpectralRadiantFluxUnit = W/nm { :>> longName = "watt per nanometre"; }
    attribute 'W/sr': RadiantIntensityUnit = W/sr { :>> longName = "watt per steradian"; }
    attribute 'Wb⋅m': MagneticDipoleMomentUnit = Wb*m { :>> longName = "weber metre"; }
    attribute 'Wb/m': MagneticVectorPotentialUnit = Wb/m { :>> longName = "weber per metre"; }
    attribute 'Ω⋅m': ResistivityUnit = 'Ω'*m { :>> longName = "ohm metre"; }

    alias 'm/s²' for 'm⋅s⁻²';

    /*
     * Prefixed units
     */
    attribute nm: LengthUnit { :>> longName = "nanometre"; :>> unitConversion: ConversionByPrefix { :>> prefix = nano; :>> referenceUnit = m; } }
    attribute mm: LengthUnit { :>> longName = "millimetre"; :>> unitConversion: ConversionByPrefix { :>> prefix = milli; :>> referenceUnit = m; } }
    attribute km: LengthUnit { :>> longName = "kilometre"; :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = m; } }
    attribute mN: ForceUnit { :>> longName = "millinewton"; :>> unitConversion: ConversionByPrefix { :>> prefix = milli; :>> referenceUnit = N; } }
    attribute kJ: EnergyUnit { :>> longName = "kilojoule"; :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = J; } }
    attribute MJ: EnergyUnit { :>> longName = "megajoule"; :>> unitConversion: ConversionByPrefix { :>> prefix = mega; :>> referenceUnit = J; } }
    attribute GJ: EnergyUnit { :>> longName = "gigajoule"; :>> unitConversion: ConversionByPrefix { :>> prefix = giga; :>> referenceUnit = J; } }

    /*
     * Non-standard conversion based units that are accepted in SI
     */
    attribute min: DurationUnit { :>> longName = "minute"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 60; } }
    attribute h: DurationUnit { :>> longName = "hour"; :>> unitConversion: ConversionByConvention { :>> referenceUnit = min; :>> conversionFactor = 60; } }
    attribute 'km/h': SpeedUnit = km / h { :>> longName = "kilometre per hour"; }

    /*
     * degree Celsius unit for temperature difference quantities
     */
    attribute '°C_unit': TemperatureUnit {
    	attribute :>> longName = "degree celsius (unit)";
        attribute :>> unitConversion: ConversionByConvention { :>> referenceUnit = K; :>> conversionFactor = 1; }
   	}

    /*
     * degree Celsius interval scale for absolute temperature quantities
     *
     * The interval scale is defined with an explicit mapping to the kelvin ratio scale from which the offset between the scales can be computed.
     */
    attribute '°C_scale': IntervalScale {
    	attribute :>> longName = "degree celsius scale";
        attribute :>> unit = '°C_unit';
        attribute temperatureWaterAtFreezingPointInC: DefinitionalQuantityValue {
            :>> num = 0; :>> definition = "temperature in degree Celsius of pure water at freezing point";
        }
        private attribute temperatureWaterAtTriplePointInC: DefinitionalQuantityValue {
            :>> num = 1/100; :>> definition = "temperature in degree Celsius of pure water at the triple point";
        }
        private attribute celsiusToKelvinScaleMapping: QuantityValueMapping {
            :>> mappedQuantityValue = temperatureWaterAtTriplePointInC; :>> referenceQuantityValue = K.temperatureOfWaterAtTriplePointInK;
        }
        attribute :>> definitionalQuantityValues = (temperatureWaterAtTriplePointInC, temperatureWaterAtFreezingPointInC);
        attribute :>> quantityValueMapping = celsiusToKelvinScaleMapping;
        // Experimental zero shift w.r.t. to K (kelvin) thermodynamic temperature ratio scale
        // Such CoordinateTransformation can be used instead of the celsiusToKelvinScaleMapping
        private attribute zeroDegreeCelsiusInKelvin: ThermodynamicTemperatureValue = 273.15 [K];
        attribute zeroShift : CoordinateTransformation { :>> source = K; :>> target = self; :>> origin = zeroDegreeCelsiusInKelvin; }
        attribute :>> placement = zeroShift;
    }
    alias '°C' for '°C_scale';
}
