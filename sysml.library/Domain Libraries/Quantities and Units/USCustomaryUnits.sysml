/**
 * US customary units defined w.r.t. SI units
 * Conversion factors are taken from NIST SP 811 Appendix B
 * See https://www.nist.gov/physical-measurement-laboratory/nist-guide-si-appendix-b
 */
package USCustomaryUnits {
	private import UnitsAndScales::*;
	import ISQ::*;
	private import SI::*;

	attribute <ft> foot : LengthUnit {
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3048/10000; }
	}

	attribute <'in'> inch : LengthUnit {
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = ft; :>> conversionFactor = 1/12; }
	}

    attribute <mi> mile : LengthUnit {
    	:>> unitConversion: ConversionByConvention { :>> referenceUnit = ft; :>> conversionFactor = 5280; }
    }

    attribute <lb> 'pound  (avoirdupois)' : MassUnit {
    	:>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 4535924/10000000; }
    }

    attribute <'mi/h'> 'mile per hour' : SpeedUnit = mi/h;

    attribute <lbf> 'pound-force' : ForceUnit {
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = SI::N; :>> conversionFactor = 4448222/1000000; }
	}

    /*
     * Definition of an alias for 'mi/h' ("mile per hour")
     */
    alias mph for 'mi/h';

	/*
	 * degree Fahrenheit unit for relative temperature (i.e. temperature difference) quantities
	 */
	attribute <'°F_unit'> 'degree fahrenheit (relative)' : TemperatureUnit {
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = K; :>> conversionFactor = 5/9; }
	}

	/*
	 * degree Fahrenheit interval scale for absolute temperature quantities
	 *
	 * The interval scale is defined with an explicit mapping to the degree Celsius interval scale from which the offset between the scales can be computed.
	 */
	attribute <'°F_scale'> 'degree fahrenheit (absolute)' : IntervalScale {
		:>> unit = '°F_unit';
		private attribute temperatureWaterAtFreezingPointInF: DefinitionalQuantityValue {
			:>> num = 32.0;
			:>> definition = "temperature in degree Fahrenheit of pure water at freezing point";
		}
		private attribute fahrenheitToCelsiusScaleMapping: QuantityValueMapping {
			:>> mappedQuantityValue = temperatureWaterAtFreezingPointInF;
			:>> referenceQuantityValue = '°C_scale'.temperatureWaterAtFreezingPointInC;

		}
		attribute :>> definitionalQuantityValues = temperatureWaterAtFreezingPointInF;
		attribute :>> quantityValueMapping = fahrenheitToCelsiusScaleMapping;
	}
	//alias '°F' for '°F_scale';

    /*
     * US Customary Units generated after transformation from NIST SP811 Appendix B
     * See https://www.nist.gov/pml/special-publication-811/nist-guide-si-appendix-b-conversion-factors/nist-guide-si-appendix-b8
     * Generated at 2022-01-10T00:45:14Z
     */

    attribute 'abampere' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 1.0E+01; } }
    attribute 'abcoulomb' : ElectricChargeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C; :>> conversionFactor = 1.0E+01; } }
    attribute 'abfarad' : CapacitanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = F; :>> conversionFactor = 1.0E+09; } }
    attribute 'abhenry' : InductanceUnit, PermeanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = H; :>> conversionFactor = 1.0E-09; } }
    attribute 'abmho' : ConductanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = S; :>> conversionFactor = 1.0E+09; } }
    attribute 'abohm' : ResistanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'Ω'; :>> conversionFactor = 1.0E-09; } }
    attribute 'abvolt' : ElectricPotentialUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = V; :>> conversionFactor = 1.0E-08; } }
    attribute <g_n> 'acceleration of free fall, standard' : AccelerationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m/s^2; :>> conversionFactor = 9.80665E+00; } }
    attribute 'acre (based on US survey foot)' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 4.046873E+03; } }
    attribute 'acre foot (based on US survey foot)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.233489E+03; } }
    attribute <'A⋅h'> 'ampere hour' : ElectricChargeUnit = A*h;
    attribute <'Å'> 'ångström' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.0E-10; } }
    attribute <a> 'are' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 1.0E+02; } }
    attribute <au> 'astronomical unit' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.495979E+11; } }
    attribute <atm> 'atmosphere, standard' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.01325E+05; } }
    attribute <at> 'atmosphere, technical' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 9.80665E+04; } }
    attribute <bar> 'bar' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.0E+05; } }
    attribute <b> 'barn' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 1.0E-28; } }
    attribute <bbl> 'barrel (for petroleum, 42 gallons (US))' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.589873E-01; } }
    attribute <Bi> 'biot' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 1.0E+01; } }
    attribute <Btu_IT> 'British thermal unit (IT)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.055056E+03; } }
    attribute <Btu_th> 'British thermal unit (th)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.054350E+03; } }
    attribute <Btu> 'British thermal unit (mean)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.05587E+03; } }
    attribute 'British thermal unit (39 °F)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.05967E+03; } }
    attribute 'British thermal unit (59 °F)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.05480E+03; } }
    attribute 'British thermal unit (60 °F)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.05468E+03; } }
    attribute <'Btu_IT⋅ft/(h⋅ft²⋅°F)'> 'British thermal unit (IT) foot per hour square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_IT*ft/(h*ft^2*'°F');
    attribute <'Btu_th⋅ft/(h⋅ft²⋅°F)'> 'British thermal unit (th) foot per hour square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_th*ft/(h*ft^2*'°F');
    attribute <'Btu_IT⋅in/(h⋅ft²⋅°F)'> 'British thermal unit (IT) inch per hour square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_IT*'in'/(h*ft^2*'°F');
    attribute <'Btu_th⋅in/(h⋅ft²⋅°F)'> 'British thermal unit (th) inch per hour square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_th*'in'/(h*ft^2*'°F');
    attribute <'Btu_IT⋅in/(s⋅ft²⋅°F)'> 'British thermal unit (IT) inch per second square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_IT*'in'/(s*ft^2*'°F');
    attribute <'Btu_th⋅in/(s⋅ft²⋅°F)'> 'British thermal unit (th) inch per second square foot degree Fahrenheit' : ThermalConductivityUnit = Btu_th*'in'/(s*ft^2*'°F');
    //attribute <'Btu_IT/ft³'> 'British thermal unit (IT) per cubic foot' : EnergyDensityUnit = Btu_IT/ft^3;
    //attribute <'Btu_th/ft³'> 'British thermal unit (th) per cubic foot' : EnergyDensityUnit = Btu_th/ft^3;
    attribute <'Btu_IT/°F'> 'British thermal unit (IT) per degree Fahrenheit' : HeatCapacityUnit = Btu_IT/'°F';
    attribute <'Btu_th/°F'> 'British thermal unit (th) per degree Fahrenheit' : HeatCapacityUnit = Btu_th/'°F';
    attribute <'Btu_IT/°R'> 'British thermal unit (IT) per degree Rankine' : HeatCapacityUnit = Btu_IT/'°R';
    attribute <'Btu_th/°R'> 'British thermal unit (th) per degree Rankine' : HeatCapacityUnit = Btu_th/'°R';
    attribute <'Btu_IT/h'> 'British thermal unit (IT) per hour' : PowerUnit = Btu_IT/h;
    attribute <'Btu_th/h'> 'British thermal unit (th) per hour' : PowerUnit = Btu_th/h;
    attribute <'Btu_IT/(h⋅ft²⋅°F)'> 'British thermal unit (IT) per hour square foot degree Fahrenheit' : CoefficientOfHeatTransferUnit = Btu_IT/(h*ft^2*'°F');
    attribute <'Btu_th/(h⋅ft²⋅°F)'> 'British thermal unit (th) per hour square foot degree Fahrenheit' : CoefficientOfHeatTransferUnit = Btu_th/(h*ft^2*'°F');
    attribute <'Btu_th/min'> 'British thermal unit (th) per minute' : PowerUnit = Btu_th/min;
    attribute <'Btu_IT/lb'> 'British thermal unit (IT) per pound' : SpecificEnergyUnit = Btu_IT/lb;
    attribute <'Btu_th/lb'> 'British thermal unit (th) per pound' : SpecificEnergyUnit = Btu_th/lb;
    attribute <'Btu_IT/(lb⋅°F)'> 'British thermal unit (IT) per pound degree Fahrenheit' : SpecificHeatCapacityUnit = Btu_IT/(lb*'°F');
    attribute <'Btu_th/(lb⋅°F)'> 'British thermal unit (th) per pound degree Fahrenheit' : SpecificHeatCapacityUnit = Btu_th/(lb*'°F');
    attribute <'Btu_IT/(lb⋅°R)'> 'British thermal unit (IT) per pound degree Rankine' : SpecificHeatCapacityUnit = Btu_IT/(lb*'°R');
    attribute <'Btu_th/(lb⋅°R)'> 'British thermal unit (th) per pound degree Rankine' : SpecificHeatCapacityUnit = Btu_th/(lb*'°R');
    attribute <'Btu_IT/s'> 'British thermal unit (IT) per second' : PowerUnit = Btu_IT/s;
    attribute <'Btu_th/s'> 'British thermal unit (th) per second' : PowerUnit = Btu_th/s;
    attribute <'Btu_IT/(s⋅ft²⋅°F)'> 'British thermal unit (IT) per second square foot degree Fahrenheit' : CoefficientOfHeatTransferUnit = Btu_IT/(s*ft^2*'°F');
    attribute <'Btu_th/(s⋅ft²⋅°F)'> 'British thermal unit (th) per second square foot degree Fahrenheit' : CoefficientOfHeatTransferUnit = Btu_th/(s*ft^2*'°F');
    //attribute <'Btu_IT/ft²'> 'British thermal unit (IT) per square foot' : SurfaceHeatDensityUnit = Btu_IT/ft^2;
    //attribute <'Btu_th/ft²'> 'British thermal unit (th) per square foot' : SurfaceHeatDensityUnit = Btu_th/ft^2;
    attribute <'Btu_IT/(ft²⋅h)'> 'British thermal unit (IT) per square foot hour' : DensityOfHeatFlowRateUnit = Btu_IT/(ft^2*h);
    attribute <'Btu_th/(ft²⋅h)'> 'British thermal unit (th) per square foot hour' : DensityOfHeatFlowRateUnit = Btu_th/(ft^2*h);
    attribute <'Btu_th/(ft²⋅min)'> 'British thermal unit (th) per square foot minute' : DensityOfHeatFlowRateUnit = Btu_th/(ft^2*min);
    attribute <'Btu_IT/(ft²⋅s)'> 'British thermal unit (IT) per square foot second' : DensityOfHeatFlowRateUnit = Btu_IT/(ft^2*s);
    attribute <'Btu_th/(ft²⋅s)'> 'British thermal unit (th) per square foot second' : DensityOfHeatFlowRateUnit = Btu_th/(ft^2*s);
    attribute <'Btu_th/(in²⋅s)'> 'British thermal unit (th) per square inch second' : DensityOfHeatFlowRateUnit = Btu_th/('in'^2*s);
    attribute <bu> 'bushel (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 3.523907E-02; } }
    attribute <cal_IT> 'calorie (IT)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.1868E+00; } }
    attribute <cal_th> 'calorie (th)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.184E+00; } }
    attribute <cal> 'calorie (mean)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.19002E+00; } }
    attribute <cal_15> 'calorie (15 °C)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.18580E+00; } }
    attribute <cal_20> 'calorie (20 °C)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.18190E+00; } }
    attribute 'calorie (IT), kilogram (nutrition)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.1868E+03; } }
    attribute 'calorie (th), kilogram (nutrition)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.184E+03; } }
    attribute 'calorie (mean), kilogram (nutrition)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.19002E+03; } }
    attribute <'cal_th/(cm⋅s⋅°C)'> 'calorie (th) per centimeter second degree Celsius' : ThermalConductivityUnit = cal_th/(cm*s*'°C');
    attribute <'cal_IT/g'> 'calorie (IT) per gram' : SpecificEnergyUnit = cal_IT/g;
    attribute <'cal_th/g'> 'calorie (th) per gram' : SpecificEnergyUnit = cal_th/g;
    attribute <'cal_IT/(g⋅°C)'> 'calorie (IT) per gram degree Celsius' : SpecificHeatCapacityUnit = cal_IT/(g*'°C');
    attribute <'cal_th/(g⋅°C)'> 'calorie (th) per gram degree Celsius' : SpecificHeatCapacityUnit = cal_th/(g*'°C');
    attribute <'cal_IT/(g⋅K)'> 'calorie (IT) per gram kelvin' : SpecificHeatCapacityUnit = cal_IT/(g*K);
    //attribute <'cal_th/(g·K)'> 'calorie (th) per gram kelvin' : SpecificHeatCapacityUnit = cal_th/('g·K');
    attribute <'cal_th/min'> 'calorie (th) per minute' : PowerUnit = cal_th/min;
    attribute <'cal_th/s'> 'calorie (th) per second' : PowerUnit = cal_th/s;
    //attribute <'cal_th/cm²'> 'calorie (th) per square centimeter' : SurfaceHeatDensityUnit = cal_th/cm^2;
    attribute <'cal_th/(cm²⋅min)'> 'calorie (th) per square centimeter minute' : DensityOfHeatFlowRateUnit = cal_th/(cm^2*min);
    attribute <'cal_th/(cm²⋅s)'> 'calorie (th) per square centimeter second' : DensityOfHeatFlowRateUnit = cal_th/(cm^2*s);
    attribute <'cd/in²'> 'candela per square inch' : LuminanceUnit = cd/'in'^2;
    attribute 'carat, metric' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 2.0E-04; } }
    attribute 'centimeter of mercury (0 °C)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.33322E+03; } }
    attribute <cmHg> 'centimeter of mercury, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.333224E+03; } }
    attribute 'centimeter of water (4 °C)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 9.80638E+01; } }
    attribute <cmH2O> 'centimeter of water, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 9.80665E+01; } }
    attribute <cP> 'centipoise' : DynamicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa*s; :>> conversionFactor = 1.0E-03; } }
    attribute <cSt> 'centistokes' : KinematicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2/s; :>> conversionFactor = 1.0E-06; } }
    attribute <ch> 'chain (based on US survey foot)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 2.011684E+01; } }
    attribute 'circular mil' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 5.067075E-10; } }
    attribute 'clo' : ThermalInsulanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2*K/W; :>> conversionFactor = 1.55E-01; } }
    attribute 'cord (128 ft^3)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 3.624556E+00; } }
    attribute <'ft³'> 'cubic foot' : VolumeUnit = ft^3;
    attribute <'ft³/min'> 'cubic foot per minute' : VolumeFlowRateUnit = ft^3/min;
    attribute <'ft³/s'> 'cubic foot per second' : VolumeFlowRateUnit = ft^3/s;
    attribute <'in³'> 'cubic inch' : VolumeUnit = 'in'^3;
    attribute <'in³/min'> 'cubic inch per minute' : VolumeFlowRateUnit = 'in'^3/min;
    attribute <'mi³'> 'cubic mile' : VolumeUnit = mi^3;
    attribute <'yd³'> 'cubic yard' : VolumeUnit = yd^3;
    attribute <'yd³/min'> 'cubic yard per minute' : VolumeFlowRateUnit = yd^3/min;
    attribute 'cup (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 2.365882E-04; } }
    attribute <Ci> 'curie' : NuclearActivityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Bq; :>> conversionFactor = 3.7E+10; } }
    attribute 'darcy' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 9.869233E-13; } }
    attribute <d> 'day' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 8.64E+04; } }
    attribute 'day (sidereal)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 8.616409E+04; } }
    attribute <D> 'debye' : ElectricDipoleMomentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C*m; :>> conversionFactor = 3.335641E-30; } }
    attribute <'°'> 'degree (angle)' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 1.745329E-02; } }
    attribute <'°C'> 'degree Celsius (temperature)' : TemperatureUnit; // conversion TBD
    attribute 'degree Celsius (temperature interval)' : TemperatureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = K; :>> conversionFactor = 1.0E+00; } }
    attribute 'degree centigrade (temperature)' : TemperatureUnit; // conversion TBD
    attribute 'degree centigrade (temperature interval)' : TemperatureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = '°C'; :>> conversionFactor = 1.0E+00; } }
    attribute <'°F'> 'degree Fahrenheit (temperature)' : TemperatureUnit; // conversion TBD
    attribute 'degree Fahrenheit (temperature interval)' : TemperatureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = '°C'; :>> conversionFactor = 5.555556E-01; } }
    attribute <'°F⋅h/Btu_IT'> 'degree Fahrenheit hour per British thermal unit (IT)' : ThermalResistanceUnit = '°F'*h/Btu_IT;
    attribute <'°F⋅h/Btu_th'> 'degree Fahrenheit hour per British thermal unit (th)' : ThermalResistanceUnit = '°F'*h/Btu_th;
    attribute <'°F⋅h⋅ft²/Btu_IT'> 'degree Fahrenheit hour square foot per British thermal unit (IT)' : ThermalInsulanceUnit = '°F'*h*ft^2/Btu_IT;
    attribute <'°F⋅h⋅ft²/Btu_th'> 'degree Fahrenheit hour square foot per British thermal unit (th)' : ThermalInsulanceUnit = '°F'*h*ft^2/Btu_th;
    //attribute <'°F⋅h⋅ft²/(Btu_IT⋅in)'> 'degree Fahrenheit hour square foot per British thermal unit (IT) inch' : ThermalResistivityUnit = '°F'*h*ft^2/(Btu_IT*'in');
    //attribute <'°F⋅h⋅ft²/(Btu_th⋅in)'> 'degree Fahrenheit hour square foot per British thermal unit (th) inch' : ThermalResistivityUnit = '°F'*h*ft^2/(Btu_th*'in');
    attribute <'°F⋅s/Btu_IT'> 'degree Fahrenheit second per British thermal unit (IT)' : ThermalResistanceUnit = '°F'*s/Btu_IT;
    attribute <'°F⋅s/Btu_th'> 'degree Fahrenheit second per British thermal unit (th)' : ThermalResistanceUnit = '°F'*s/Btu_th;
    attribute <'°R'> 'degree Rankine' : TemperatureUnit; // conversion TBD
    attribute 'degree Rankine (temperature interval)' : TemperatureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = K; :>> conversionFactor = 5.555556E-01; } }
    attribute 'denier' : LinearMassDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/m; :>> conversionFactor = 1.111111E-07; } }
    attribute <dyn> 'dyne' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 1.0E-05; } }
    attribute <'dyn⋅cm'> 'dyne centimeter' : MomentOfForceUnit = dyn*cm;
    attribute <'dyn/cm²'> 'dyne per square centimeter' : PressureUnit = dyn/cm^2;
    attribute <eV> 'electronvolt' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.602177E-19; } }
    //attribute <abfarad> 'EMU of capacitance' : CapacitanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = F; :>> conversionFactor = 1.0E+09; } }
    //attribute <abampere> 'EMU of current' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 1.0E+01; } }
    //attribute <abvolt> 'EMU of electric potential' : ElectricPotentialUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = V; :>> conversionFactor = 1.0E-08; } }
    //attribute <abhenry> 'EMU of inductance' : InductanceUnit, PermeanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = H; :>> conversionFactor = 1.0E-09; } }
    //attribute <abohm> 'EMU of resistance' : ResistanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'Ω'; :>> conversionFactor = 1.0E-09; } }
    attribute <erg> 'erg' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.0E-07; } }
    attribute <'erg/s'> 'erg per second' : PowerUnit = erg/s;
    attribute <'erg/(cm²⋅s)'> 'erg per square centimeter second' : DensityOfHeatFlowRateUnit = erg/(cm^2*s);
    attribute <statfarad> 'ESU of capacitance' : CapacitanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = F; :>> conversionFactor = 1.112650E-12; } }
    attribute <statampere> 'ESU of current' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 3.335641E-10; } }
    attribute <statvolt> 'ESU of electric potential' : ElectricPotentialUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = V; :>> conversionFactor = 2.997925E+02; } }
    attribute <stathenry> 'ESU of inductance' : InductanceUnit, PermeanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = H; :>> conversionFactor = 8.987552E+11; } }
    attribute <statohm> 'ESU of resistance' : ResistanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'Ω'; :>> conversionFactor = 8.987552E+11; } }
    attribute 'faraday (based on carbon 12)' : ElectricChargeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C; :>> conversionFactor = 9.648531E+04; } }
    attribute 'fathom (based on US survey foot)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.828804E+00; } }
    attribute 'fermi' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.0E-15; } }
    attribute <floz> 'fluid ounce (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 2.957353E-05; } }
    //attribute <ft> 'foot' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3.048E-01; } }
    attribute 'foot (US survey)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3.048006E-01; } }
    attribute 'footcandle' : IlluminanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = lx; :>> conversionFactor = 1.076391E+01; } }
    attribute 'footlambert' : LuminanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = cd/m^2; :>> conversionFactor = 3.426259E+00; } }
    attribute <ftHg> 'foot of mercury, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 4.063666E+04; } }
    attribute 'foot of water (39.2 °F)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 2.98898E+03; } }
    attribute <ftH2O> 'foot of water, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 2.989067E+03; } }
    attribute <'ft/h'> 'foot per hour' : SpeedUnit = ft/h;
    attribute <'ft/min'> 'foot per minute' : SpeedUnit = ft/min;
    attribute <'ft/s'> 'foot per second' : SpeedUnit = ft/s;
    attribute <'ft/s²'> 'foot per second squared' : AccelerationUnit = ft/s^2;
    attribute 'foot poundal' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.214011E-02; } }
    attribute <'ft⋅lbf'> 'foot pound-force' : EnergyUnit = ft*lbf;
    attribute <'ft⋅lbf/h'> 'foot pound-force per hour' : PowerUnit = ft*lbf/h;
    attribute <'ft⋅lbf/min'> 'foot pound-force per minute' : PowerUnit = ft*lbf/min;
    attribute <'ft⋅lbf/s'> 'foot pound-force per second' : PowerUnit = ft*lbf/s;
    attribute <'ft⁴'> 'foot to the fourth power' : SecondAxialMomentOfAreaUnit = ft^4;
    attribute <Fr> 'franklin' : ElectricChargeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C; :>> conversionFactor = 3.335641E-10; } }
    //attribute <Gal> 'gal' : AccelerationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m/s^2; :>> conversionFactor = 1.0E-02; } }
    attribute <gal_imp> 'gallon (Canadian and UK (Imperial))' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 4.54609E-03; } }
    attribute <gal> 'gallon (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 3.785412E-03; } }
    attribute <'gal/d'> 'gallon (US) per day' : VolumeFlowRateUnit = gal/d;
    //attribute <'gal/(hp⋅h)'> 'gallon (US) per horsepower hour' : EnergySpecificVolumeUnit = gal/(hp*h);
    attribute <'gal/min'> 'gallon (US) per minute (gpm)' : VolumeFlowRateUnit = gal/min;
    attribute <'γ'> 'gamma' : MagneticFluxDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = T; :>> conversionFactor = 1.0E-09; } }
    attribute <Gs> 'gauss' : MagneticFluxDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = T; :>> conversionFactor = 1.0E-04; } }
    attribute <Gi> 'gilbert' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 7.957747E-01; } }
    attribute <gi> 'gill (Canadian and UK (Imperial))' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.420653E-04; } }
    attribute 'gill (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.182941E-04; } }
    attribute <gon> 'gon (also called grade)' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 1.570796E-02; } }
    attribute <gr> 'grain' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 6.479891E-05; } }
    attribute <'gr/gal'> 'grain per gallon (US)' : MassDensityUnit = gr/gal;
    //attribute <'gf/cm²'> 'gram-force per square centimeter' : PressureUnit = gf/cm^2;
    attribute <'g/cm³'> 'gram per cubic centimeter' : MassDensityUnit = g/cm^3;
    attribute <ha> 'hectare' : AreaUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2; :>> conversionFactor = 1.0E+04; } }
    attribute <hp> 'horsepower (550 ft*lbf/s)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 7.456999E+02; } }
    attribute 'horsepower (boiler)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 9.80950E+03; } }
    attribute 'horsepower (electric)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 7.46E+02; } }
    attribute 'horsepower (metric)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 7.354988E+02; } }
    attribute 'horsepower (UK)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 7.4570E+02; } }
    attribute 'horsepower (water)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 7.46043E+02; } }
    attribute <h> 'hour' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 3.6E+03; } }
    attribute 'hour (sidereal)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 3.590170E+03; } }
    attribute 'hundredweight (long, 112 lb)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 5.080235E+01; } }
    attribute 'hundredweight (short, 100 lb)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 4.535924E+01; } }
    //attribute <'in'> 'inch' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 2.54E-02; } }
    attribute 'inch of mercury (32 °F)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 3.38638E+03; } }
    attribute 'inch of mercury (60 °F)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 3.37685E+03; } }
    attribute <inHg> 'inch of mercury, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 3.386389E+03; } }
    attribute 'inch of water (39.2 °F)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 2.49082E+02; } }
    attribute 'inch of water (60 °F)' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 2.4884E+02; } }
    attribute <inH2O> 'inch of water, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 2.490889E+02; } }
    attribute <'in/s'> 'inch per second' : SpeedUnit = 'in'/s;
    attribute <'in/s²'> 'inch per second squared' : AccelerationUnit = 'in'/s^2;
    attribute <'in⁴'> 'inch to the fourth power' : SecondAxialMomentOfAreaUnit = 'in'^4;
    attribute <K> 'kayser' : CurvatureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^-1; :>> conversionFactor = 1.0E+02; } }
    attribute 'kelvin' : TemperatureUnit; // conversion TBD
    attribute <kcal_IT> 'kilocalorie (IT)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.1868E+03; } }
    attribute <kcal_th> 'kilocalorie (th)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.184E+03; } }
    attribute <kcal> 'kilocalorie (mean)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.19002E+03; } }
    attribute <'kcal_th/min'> 'kilocalorie (th) per minute' : PowerUnit = kcal_th/min;
    attribute <'kcal_th/s'> 'kilocalorie (th) per second' : PowerUnit = kcal_th/s;
    attribute <kgf> 'kilogram-force' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 9.80665E+00; } }
    attribute <'kgf⋅m'> 'kilogram-force meter' : MomentOfForceUnit = kgf*m;
    attribute <'kgf/cm²'> 'kilogram-force per square centimeter' : PressureUnit = kgf/cm^2;
    attribute <'kgf/m²'> 'kilogram-force per square meter' : PressureUnit = kgf/m^2;
    attribute <'kgf/mm²'> 'kilogram-force per square millimeter' : PressureUnit = kgf/mm^2;
    attribute <'kgf⋅s²/m'> 'kilogram-force second squared per meter' : MassUnit = kgf*s^2/m;
    attribute <'km/h'> 'kilometer per hour' : SpeedUnit = km/h;
    attribute <kp> 'kilopond (kilogram-force)' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 9.80665E+00; } }
    attribute <'kW⋅h'> 'kilowatt hour' : EnergyUnit = kW*h;
    attribute <kip> 'kip (1 kip = 1000 lbf)' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 4.448222E+03; } }
    attribute <'kip/in²'> 'kip per square inch (ksi)' : PressureUnit = kip/'in'^2;
    attribute 'knot (nautical mile per hour)' : SpeedUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m/s; :>> conversionFactor = 5.144444E-01; } }
    attribute 'lambert' : LuminanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = cd/m^2; :>> conversionFactor = 3.183099E+03; } }
    //attribute 'langley' : SurfaceHeatDensityUnit = cal_th/cm^2;
    attribute <'l.y.'> 'light year' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 9.46073E+15; } }
    attribute <L> 'liter' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.0E-03; } }
    attribute <'lm/ft²'> 'lumen per square foot' : IlluminanceUnit = lm/ft^2;
    attribute <Mx> 'maxwell' : MagneticFluxUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Wb; :>> conversionFactor = 1.0E-08; } }
    attribute 'mho' : ConductanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = S; :>> conversionFactor = 1.0E+00; } }
    attribute 'microinch' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 2.54E-08; } }
    attribute <'μ'> 'micron' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.0E-06; } }
    attribute 'mil (0.001 in)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 2.54E-05; } }
    attribute 'mil (angle)' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 9.817477E-04; } }
    //attribute <mi> 'mile' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.609344E+03; } }
    attribute 'mile (based on US survey foot)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.609347E+03; } }
    attribute 'mile, nautical' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 1.852E+03; } }
    //attribute <'mi/gal'> 'mile per gallon (US) (mpg)' : FuelEconomyUnit = mi/gal;
    //attribute <'mi/h'> 'mile per hour' : SpeedUnit = mi/h;
    attribute <'mi/min'> 'mile per minute' : SpeedUnit = mi/min;
    attribute <'mi/s'> 'mile per second' : SpeedUnit = mi/s;
    attribute <mbar> 'millibar' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.0E+02; } }
    attribute <mmHg> 'millimeter of mercury, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.333224E+02; } }
    attribute <mmH2O> 'millimeter of water, conventional' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 9.80665E+00; } }
    attribute <'′'> 'minute (angle)' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 2.908882E-04; } }
    attribute <min> 'minute' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 6.0E+01; } }
    attribute 'minute (sidereal)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 5.983617E+01; } }
    attribute <Oe> 'oersted' : LinearElectricCurrentDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A/m; :>> conversionFactor = 7.957747E+01; } }
    attribute <'Ω⋅cm'> 'ohm centimeter' : ResistivityUnit = 'Ω'*cm;
    attribute 'ohm circular-mil per foot' : ResistivityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'Ω'*m; :>> conversionFactor = 1.662426E-09; } }
    attribute <oz> 'ounce (avoirdupois)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 2.834952E-02; } }
    attribute 'ounce (troy or apothecary)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 3.110348E-02; } }
    attribute 'ounce (Canadian and UK fluid (Imperial))' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 2.841306E-05; } }
    attribute 'ounce (US fluid)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 2.957353E-05; } }
    attribute <ozf> 'ounce (avoirdupois)-force' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 2.780139E-01; } }
    attribute <'ozf⋅in'> 'ounce (avoirdupois)-force inch' : MomentOfForceUnit = ozf*'in';
    attribute <'oz/in³'> 'ounce (avoirdupois) per cubic inch' : MassDensityUnit = oz/'in'^3;
    attribute <'oz/gal'> 'ounce (avoirdupois) per gallon (Canadian and UK (Imperial))' : MassDensityUnit = oz/gal;
    attribute 'ounce (avoirdupois) per gallon (US)' : MassDensityUnit = oz/gal;
    attribute <'oz/ft²'> 'ounce (avoirdupois) per square foot' : SurfaceMassDensityUnit = oz/ft^2;
    attribute <'oz/in²'> 'ounce (avoirdupois) per square inch' : SurfaceMassDensityUnit = oz/'in'^2;
    attribute <'oz/yd²'> 'ounce (avoirdupois) per square yard' : SurfaceMassDensityUnit = oz/yd^2;
    attribute <pc> 'parsec' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3.085678E+16; } }
    attribute <pk> 'peck (US)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 8.809768E-03; } }
    attribute <dwt> 'pennyweight' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.555174E-03; } }
    //attribute 'perm (0 °C)' : VapourTransmissionUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/(Pa*s*m^2); :>> conversionFactor = 5.72135E-11; } }
    //attribute 'perm (23 °C)' : VapourTransmissionUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/(Pa*s*m^2); :>> conversionFactor = 5.74525E-11; } }
    //attribute 'perm inch (0 °C)' : VapourTransmissionUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/('Pa·s·m'); :>> conversionFactor = 1.45322E-12; } }
    //attribute 'perm inch (23 °C)' : VapourTransmissionUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/('Pa·s·m'); :>> conversionFactor = 1.45929E-12; } }
    attribute <ph> 'phot' : IlluminanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = lx; :>> conversionFactor = 1.0E+04; } }
    attribute 'pica (computer) (1/6 in)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 4.233333E-03; } }
    attribute 'pica (printers)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 4.217518E-03; } }
    attribute <drypt> 'pint (US dry)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 5.506105E-04; } }
    attribute <liqpt> 'pint (US liquid)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 4.731765E-04; } }
    attribute 'point (computer) (1/72 in)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3.527778E-04; } }
    //attribute 'point (printer's)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3.514598E-04; } }
    attribute <P> 'poise' : DynamicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa*s; :>> conversionFactor = 1.0E-01; } }
    //attribute <lb> 'pound (avoirdupois)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 4.535924E-01; } }
    attribute 'pound (troy or apothecary)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 3.732417E-01; } }
    attribute 'poundal' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 1.382550E-01; } }
    attribute 'poundal per square foot' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.488164E+00; } }
    attribute 'poundal second per square foot' : DynamicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa*s; :>> conversionFactor = 1.488164E+00; } }
    attribute <'lb⋅ft²'> 'pound foot squared' : MomentOfInertiaUnit = lb*ft^2;
    //attribute <lbf> 'pound-force' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 4.448222E+00; } }
    attribute <'lbf⋅ft'> 'pound-force foot' : MomentOfForceUnit = lbf*ft;
    attribute <'lbf⋅ft/in'> 'pound-force foot per inch' : ForceUnit = lbf*ft/'in';
    attribute <'lbf⋅in'> 'pound-force inch' : MomentOfForceUnit = lbf*'in';
    attribute <'lbf⋅in/in'> 'pound-force inch per inch' : ForceUnit = lbf*'in'/'in';
    attribute <'lbf/ft'> 'pound-force per foot' : SurfaceTensionUnit = lbf/ft;
    attribute <'lbf/in'> 'pound-force per inch' : SurfaceTensionUnit = lbf/'in';
    //attribute 'pound-force per pound (lbf/lb) (thrust to mass ratio)' : ThrustToMassRatioUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N/kg; :>> conversionFactor = 9.80665E+00; } }
    attribute <'lbf/ft²'> 'pound-force per square foot' : PressureUnit = lbf/ft^2;
    attribute <'lbf/in²'> 'pound-force per square inch (psi)' : PressureUnit = lbf/'in'^2;
    attribute <'lbf⋅s/ft²'> 'pound-force second per square foot' : DynamicViscosityUnit = lbf*s/ft^2;
    attribute <'lbf⋅s/in²'> 'pound-force second per square inch' : DynamicViscosityUnit = lbf*s/'in'^2;
    attribute <'lb⋅in²'> 'pound inch squared' : MomentOfInertiaUnit = lb*'in'^2;
    attribute <'lb/ft³'> 'pound per cubic foot' : MassDensityUnit = lb/ft^3;
    attribute <'lb/in³'> 'pound per cubic inch' : MassDensityUnit = lb/'in'^3;
    attribute <'lb/yd³'> 'pound per cubic yard' : MassDensityUnit = lb/yd^3;
    attribute <'lb/ft'> 'pound per foot' : LinearMassDensityUnit = lb/ft;
    attribute <'lb/(ft⋅h)'> 'pound per foot hour' : DynamicViscosityUnit = lb/(ft*h);
    attribute <'lb/(ft⋅s)'> 'pound per foot second' : DynamicViscosityUnit = lb/(ft*s);
    attribute <'lb/gal'> 'pound per gallon (Canadian and UK (Imperial))' : MassDensityUnit = lb/gal;
    attribute 'pound per gallon (US)' : MassDensityUnit = lb/gal;
    //attribute <'lb/(hp⋅h)'> 'pound per horsepower hour' : FuelConsumptionUnit = lb/(hp*h);
    attribute <'lb/h'> 'pound per hour' : MassFlowRateUnit = lb/h;
    attribute <'lb/in'> 'pound per inch' : LinearMassDensityUnit = lb/'in';
    attribute <'lb/min'> 'pound per minute' : MassFlowRateUnit = lb/min;
    attribute <'lb/s'> 'pound per second' : MassFlowRateUnit = lb/s;
    attribute <'lb/ft²'> 'pound per square foot' : SurfaceMassDensityUnit = lb/ft^2;
    attribute <'lb/in²'> 'pound per square inch (not pound-force)' : SurfaceMassDensityUnit = lb/'in'^2;
    attribute <'lb/yd'> 'pound per yard' : LinearMassDensityUnit = lb/yd;
    attribute 'psi (pound-force per square inch)' : PressureUnit = lbf/'in'^2;
    attribute 'quad (10^15 Btu_IT)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.055056E+18; } }
    attribute <dryqt> 'quart (US dry)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.101221E-03; } }
    attribute <liqqt> 'quart (US liquid)' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 9.463529E-04; } }
    attribute <rad> 'rad (absorbed dose)' : AbsorbedDoseUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Gy; :>> conversionFactor = 1.0E-02; } }
    attribute <rem> 'rem' : DoseEquivalentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Sv; :>> conversionFactor = 1.0E-02; } }
    attribute <r> 'revolution' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 6.283185E+00; } }
    attribute <'r/min'> 'revolution per minute (rpm)' : AngularVelocityUnit = r/min;
    //attribute 'rhe' : ReciprocalDynamicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa^-1*s^-1; :>> conversionFactor = 1.0E+01; } }
    attribute <rd> 'rod (based on US survey foot)' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 5.029210E+00; } }
    attribute <R> 'roentgen' : ExposureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C/kg; :>> conversionFactor = 2.58E-04; } }
    attribute 'rpm (revolution per minute)' : AngularVelocityUnit = r/min;
    attribute <'″'> 'second (angle)' : AngularMeasureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = rad; :>> conversionFactor = 4.848137E-06; } }
    attribute 'second (sidereal)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 9.972696E-01; } }
    attribute 'shake' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 1.0E-08; } }
    attribute <slug> 'slug' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.459390E+01; } }
    attribute <'slug/ft³'> 'slug per cubic foot' : MassDensityUnit = slug/ft^3;
    attribute <'slug/(ft⋅s)'> 'slug per foot second' : DynamicViscosityUnit = slug/(ft*s);
    attribute <'ft²'> 'square foot' : AreaUnit = ft^2;
    attribute <'ft²/h'> 'square foot per hour' : KinematicViscosityUnit = ft^2/h;
    attribute <'ft²/s'> 'square foot per second' : KinematicViscosityUnit = ft^2/s;
    attribute <'in²'> 'square inch' : AreaUnit = 'in'^2;
    attribute <'mi²'> 'square mile' : AreaUnit = mi^2;
    attribute 'square mile (based on US survey foot)' : AreaUnit = mi^2;
    attribute <'yd²'> 'square yard' : AreaUnit = yd^2;
    //attribute 'statampere' : ElectricCurrentUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = A; :>> conversionFactor = 3.335641E-10; } }
    attribute 'statcoulomb' : ElectricChargeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = C; :>> conversionFactor = 3.335641E-10; } }
    //attribute 'statfarad' : CapacitanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = F; :>> conversionFactor = 1.112650E-12; } }
    //attribute 'stathenry' : InductanceUnit, PermeanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = H; :>> conversionFactor = 8.987552E+11; } }
    attribute 'statmho' : ConductanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = S; :>> conversionFactor = 1.112650E-12; } }
    //attribute 'statohm' : ResistanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = 'Ω'; :>> conversionFactor = 8.987552E+11; } }
    //attribute 'statvolt' : ElectricPotentialUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = V; :>> conversionFactor = 2.997925E+02; } }
    attribute <st> 'stere' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.0E+00; } }
    attribute <sb> 'stilb' : LuminanceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = cd/m^2; :>> conversionFactor = 1.0E+04; } }
    attribute <St> 'stokes' : KinematicViscosityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^2/s; :>> conversionFactor = 1.0E-04; } }
    attribute 'tablespoon' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 1.478676E-05; } }
    attribute 'teaspoon' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 4.928922E-06; } }
    attribute 'tex' : LinearMassDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/m; :>> conversionFactor = 1.0E-06; } }
    attribute 'therm (EC)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.05506E+08; } }
    attribute 'therm (US)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 1.054804E+08; } }
    attribute <AT> 'ton, assay' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 2.916667E-02; } }
    attribute 'ton-force (2000 lbf)' : ForceUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = N; :>> conversionFactor = 8.896443E+03; } }
    attribute 'ton, long (2240 lb)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.016047E+03; } }
    attribute 'ton, long, per cubic yard' : MassDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/m^3; :>> conversionFactor = 1.328939E+03; } }
    attribute <t> 'ton, metric' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.0E+03; } }
    attribute 'tonne (called "metric ton" in US)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 1.0E+03; } }
    attribute 'ton of refrigeration (12 000 Btu_IT/h)' : PowerUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = W; :>> conversionFactor = 3.516853E+03; } }
    attribute 'ton of TNT (energy equivalent)' : EnergyUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = J; :>> conversionFactor = 4.184E+09; } }
    attribute 'ton, register' : VolumeUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m^3; :>> conversionFactor = 2.831685E+00; } }
    attribute 'ton, short (2000 lb)' : MassUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 9.071847E+02; } }
    attribute 'ton, short, per cubic yard' : MassDensityUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/m^3; :>> conversionFactor = 1.186553E+03; } }
    attribute 'ton, short, per hour' : MassFlowRateUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = kg/s; :>> conversionFactor = 2.519958E-01; } }
    attribute <Torr> 'torr' : PressureUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Pa; :>> conversionFactor = 1.333224E+02; } }
    attribute 'unit pole' : MagneticFluxUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = Wb; :>> conversionFactor = 1.256637E-07; } }
    attribute <'W⋅h'> 'watt hour' : EnergyUnit = W*h;
    attribute <'W/cm²'> 'watt per square centimeter' : DensityOfHeatFlowRateUnit = W/cm^2;
    attribute <'W/in²'> 'watt per square inch' : DensityOfHeatFlowRateUnit = W/'in'^2;
    attribute <'W⋅s'> 'watt second' : EnergyUnit = W*s;
    attribute <yd> 'yard' : LengthUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 9.144E-01; } }
    attribute 'year (365 days)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 3.1536E+07; } }
    attribute 'year (sidereal)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 3.155815E+07; } }
    attribute 'year (tropical)' : DurationUnit { :>> unitConversion: ConversionByConvention { :>> referenceUnit = s; :>> conversionFactor = 3.155693E+07; } }

}
