standard library package SIPrefixes {
	doc
	/*
	 * Definition of SI unit prefixes as specified in ISO/IEC 80000-1
	 */

	private import MeasurementReferences::*;

	/*
	 * ISO/IEC 80000-1 prefixes for decimal multiples and sub-multiples
	 * 
	 * See also https://en.wikipedia.org/wiki/Unit_prefix
	 */
	attribute yocto: UnitPrefix { :>> longName = "yocto"; :>> symbol = "y"; :>> conversionFactor = 1E-24; }
	attribute zepto: UnitPrefix { :>> longName = "zepto"; :>> symbol = "z"; :>> conversionFactor = 1E-21; }
	attribute atto: UnitPrefix { :>> longName = "atto"; :>> symbol = "a"; :>> conversionFactor = 1E-18; }
	attribute femto: UnitPrefix { :>> longName = "femto"; :>> symbol = "f"; :>> conversionFactor = 1E-15; }
	attribute pico: UnitPrefix { :>> longName = "pico"; :>> symbol = "p"; :>> conversionFactor = 1E-12; }
	attribute nano: UnitPrefix { :>> longName = "nano"; :>> symbol = "n"; :>> conversionFactor = 1E-9; }
	attribute micro: UnitPrefix { :>> longName = "micro"; :>> symbol = "μ"; :>> conversionFactor = 1E-6; }
	attribute milli: UnitPrefix { :>> longName = "milli"; :>> symbol = "m"; :>> conversionFactor = 1E-3; }
	attribute centi: UnitPrefix { :>> longName = "centi"; :>> symbol = "c"; :>> conversionFactor = 1E-2; }
	attribute deci: UnitPrefix { :>> longName = "deci"; :>> symbol = "d"; :>> conversionFactor = 1E-1; }
	attribute deca: UnitPrefix { :>> longName = "deca"; :>> symbol = "da"; :>> conversionFactor = 1E1; }
	attribute hecto: UnitPrefix { :>> longName = "hecto"; :>> symbol = "h"; :>> conversionFactor = 1E2; }
	attribute kilo: UnitPrefix { :>> longName = "kilo"; :>> symbol = "k"; :>> conversionFactor = 1E3; }
	attribute mega: UnitPrefix { :>> longName = "mega"; :>> symbol = "M"; :>> conversionFactor = 1E6; }
	attribute giga: UnitPrefix { :>> longName = "giga"; :>> symbol = "G"; :>> conversionFactor = 1E9; }
	attribute tera: UnitPrefix { :>> longName = "tera"; :>> symbol = "T"; :>> conversionFactor = 1E12; }
	attribute peta: UnitPrefix { :>> longName = "peta"; :>> symbol = "P"; :>> conversionFactor = 1E15; }
	attribute exa: UnitPrefix { :>> longName = "exa"; :>> symbol = "E"; :>> conversionFactor = 1E18; }
	attribute zetta: UnitPrefix { :>> longName = "zetta"; :>> symbol = "Z"; :>> conversionFactor = 1E21; }
	attribute yotta: UnitPrefix { :>> longName = "yotta"; :>> symbol = "Y"; :>> conversionFactor = 1E24; }
	
	/*
	 * ISO/IEC 80000-1 prefixes for binary multiples, i.e. multiples of 1024 (= 2^10)
	 * 
	 * See also https://en.wikipedia.org/wiki/Binary_prefix
	 */
	attribute kibi: UnitPrefix { :>> longName = "kibi"; :>> symbol = "Ki"; :>> conversionFactor = 1024; }
	attribute mebi: UnitPrefix { :>> longName = "mebi"; :>> symbol = "Mi"; :>> conversionFactor = 1024^2; }
	attribute gibi: UnitPrefix { :>> longName = "gibi"; :>> symbol = "Gi"; :>> conversionFactor = 1024^3; }
	attribute tebi: UnitPrefix { :>> longName = "tebi"; :>> symbol = "Ti"; :>> conversionFactor = 1024^4; }
	attribute pebi: UnitPrefix { :>> longName = "pebi"; :>> symbol = "Pi"; :>> conversionFactor = 1024^5; }
	attribute exbi: UnitPrefix { :>> longName = "exbi"; :>> symbol = "Ei"; :>> conversionFactor = 1024^6; }
	attribute zebi: UnitPrefix { :>> longName = "zebi"; :>> symbol = "Zi"; :>> conversionFactor = 1024^7; }
	attribute yobi: UnitPrefix { :>> longName = "yobi"; :>> symbol = "Yi"; :>> conversionFactor = 1024^8; }
}
