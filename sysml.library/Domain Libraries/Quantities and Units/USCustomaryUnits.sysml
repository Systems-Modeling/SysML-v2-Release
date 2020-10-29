/**
 * US customary units defined w.r.t. SI units
 * Conversion factors are taken from NIST SP 811 Appendix B
 * See https://www.nist.gov/physical-measurement-laboratory/nist-guide-si-appendix-b
 */
package USCustomaryUnits {	
	private import RationalFunctions::Rat;
	private import UnitsAndScales::*;
	import ISQ::*;
	private import SI::*;
	
	attribute ft: LengthUnit = LengthUnit(name => "foot", unitConversion => ConversionByConvention(referenceUnit => m, conversionFactor => Rat(3048, 10000)));
	attribute 'in': LengthUnit = LengthUnit(name => "inch", unitConversion => ConversionByConvention(referenceUnit => ft, conversionFactor => Rat(1, 12)));
    attribute mi: LengthUnit = LengthUnit(name => "mile", unitConversion => ConversionByConvention(referenceUnit => ft, conversionFactor => 5280 ));	

    attribute lb: MassUnit = MassUnit(name => "pound (avoirdupois)", unitConversion => ConversionByConvention(referenceUnit => kg, conversionFactor => Rat(4535924, 10000000)));

    attribute 'mi/h': SpeedUnit = mi / h { name redefines MeasurementReference::name = "mile per hour"; }
    
    attribute lbf: ForceUnit = ForceUnit(name => "pound-force", unitConversion => ConversionByConvention(referenceUnit => N, conversionFactor => Rat(4448222, 1000000) ));

    /*
     * Definition of an alias for mile per hour
     */
    alias 'mi/h' as mph;

	/*
	 * degree Fahrenheit unit for relative temperature (i.e. temperature difference) quantities
	 */
	attribute '°F«rel»': TemperatureUnit = TemperatureUnit(name => "degree fahrenheit (relative)", unitConversion => ConversionByConvention(referenceUnit => K, conversionFactor => Rat(5, 9)));
	 
	/*
	 * degree Fahrenheit interval scale for absolute temperature quantities
	 * 
	 * The interval scale is defined with an explicit mapping to the degree Celsius interval scale from which the offset between the scales can be computed.
	 */
	attribute '°F«abs»': IntervalScale = IntervalScale(name => "degree fahrenheit (absolute)") {
		attribute unit redefines MeasurementScale::unit = '°F«rel»';
		private attribute temperatureWaterAtFreezingPointInF: ScaleValueDefinition = ScaleValueDefinition(
			num => 32.0, description => "temperature in degree Fahrenheit of pure water at freezing point"
		);
		private attribute fahrenheitToCelsiusScaleMapping: ScaleValueMapping = ScaleValueMapping(
			mappedScaleValue => temperatureWaterAtFreezingPointInF, referenceScaleValue => '°C«abs»'::temperatureWaterAtFreezingPointInC
		);
		attribute scaleValueDefinition: ScaleValueDefinition :>> MeasurementReference::scaleValueDefinition = temperatureWaterAtFreezingPointInF;
		attribute scaleValueMapping redefines MeasurementScale::scaleValueMapping = fahrenheitToCelsiusScaleMapping;
	}
	alias '°F«abs»' as '°F';
}