/**
 * US customary units defined w.r.t. SI units
 * Conversion factors are taken from NIST SP 811 Appendix B
 * See https://www.nist.gov/physical-measurement-laboratory/nist-guide-si-appendix-b
 */
package USCustomaryUnits {	
	private import UnitsAndScales::*;
	import ISQ::*;
	private import SI::*;
	
	attribute ft: LengthUnit { 
		:>> longName = "foot"; 
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = m; :>> conversionFactor = 3048/10000; }
	}

	attribute 'in': LengthUnit {
		:>> longName = "inch";
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = ft; :>> conversionFactor = 1/12; }
	}

    attribute mi: LengthUnit {
    	:>> longName = "mile"; 
    	:>> unitConversion: ConversionByConvention { :>> referenceUnit = ft; :>> conversionFactor = 5280; }    	
    }	

    attribute lb: MassUnit {
    	:>> longName = "pound (avoirdupois)";
    	:>> unitConversion: ConversionByConvention { :>> referenceUnit = kg; :>> conversionFactor = 4535924/10000000; }
    }

    attribute 'mi/h': SpeedUnit = mi/h { :>> longName = "mile per hour"; }
    
    attribute lbf: ForceUnit {
		:>> longName = "pound-force"; 
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = SI::N; :>> conversionFactor = 4448222/1000000; }
	}

    /*
     * Definition of an alias for 'mi/h' ("mile per hour")
     */
    alias 'mi/h' as mph;

	/*
	 * degree Fahrenheit unit for relative temperature (i.e. temperature difference) quantities
	 */
	attribute '°F_unit': TemperatureUnit {
		:>> longName = "degree fahrenheit (relative)";
		:>> unitConversion: ConversionByConvention { :>> referenceUnit = K; :>> conversionFactor = 5/9; }
	}
	 
	/*
	 * degree Fahrenheit interval scale for absolute temperature quantities
	 * 
	 * The interval scale is defined with an explicit mapping to the degree Celsius interval scale from which the offset between the scales can be computed.
	 */
	attribute '°F_scale': IntervalScale {
		:>> longName = "degree fahrenheit (absolute)";
		:>> unit = '°F_unit';
		private attribute temperatureWaterAtFreezingPointInF: ScaleValueDefinition {
			:>> num = 32.0; 
			:>> description = "temperature in degree Fahrenheit of pure water at freezing point";
		}
		private attribute fahrenheitToCelsiusScaleMapping: ScaleValueMapping {
			:>> mappedScaleValue = temperatureWaterAtFreezingPointInF; 
			:>> referenceScaleValue = '°C_scale'::temperatureWaterAtFreezingPointInC;
		}
		attribute :>> scaleValueDefinitions = temperatureWaterAtFreezingPointInF;
		attribute :>> scaleValueMapping = fahrenheitToCelsiusScaleMapping;
	}
	alias '°F_scale' as '°F';
}