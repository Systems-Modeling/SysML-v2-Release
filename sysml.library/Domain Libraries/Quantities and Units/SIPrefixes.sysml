/**
 * Definition of SI unit prefixes as specified in ISO/IEC 80000-1
 */
package SIPrefixes {
	private import UnitsAndScales::*;

	/*
	 * ISO/IEC 80000-1 prefixes for decimal multiples and sub-multiples
	 * 
	 * See also https://en.wikipedia.org/wiki/Unit_prefix
	 */
	attribute yocto = UnitPrefix(name => "yocto", symbol => "y",  conversionFactor => 1E-24);
	attribute zepto = UnitPrefix(name => "zepto", symbol => "z",  conversionFactor => 1E-21);
	attribute atto  = UnitPrefix(name => "atto",  symbol => "a",  conversionFactor => 1E-18);
	attribute femto = UnitPrefix(name => "femto", symbol => "f",  conversionFactor => 1E-15);
	attribute pico  = UnitPrefix(name => "pico",  symbol => "p",  conversionFactor => 1E-12);
	attribute nano  = UnitPrefix(name => "nano",  symbol => "n",  conversionFactor => 1E-9);
	attribute micro = UnitPrefix(name => "micro", symbol => "μ",  conversionFactor => 1E-6);
	attribute milli = UnitPrefix(name => "milli", symbol => "m",  conversionFactor => 1E-3);
	attribute centi = UnitPrefix(name => "centi", symbol => "c",  conversionFactor => 1E-2);
	attribute deci  = UnitPrefix(name => "deci",  symbol => "d",  conversionFactor => 1E-1);
	attribute deca  = UnitPrefix(name => "deca",  symbol => "da", conversionFactor => 1E1);
	attribute hecto = UnitPrefix(name => "hecto", symbol => "h",  conversionFactor => 1E2);
	attribute kilo  = UnitPrefix(name => "kilo",  symbol => "k",  conversionFactor => 1E3);
	attribute mega  = UnitPrefix(name => "mega",  symbol => "M",  conversionFactor => 1E6);
	attribute giga  = UnitPrefix(name => "giga",  symbol => "G",  conversionFactor => 1E9);
	attribute tera  = UnitPrefix(name => "tera",  symbol => "T",  conversionFactor => 1E12);
	attribute peta  = UnitPrefix(name => "peta",  symbol => "P",  conversionFactor => 1E15);
	attribute exa   = UnitPrefix(name => "exa",   symbol => "E",  conversionFactor => 1E18);
	attribute zetta = UnitPrefix(name => "zetta", symbol => "Z",  conversionFactor => 1E21);
	attribute yotta = UnitPrefix(name => "yotta", symbol => "Y",  conversionFactor => 1E24);
	
	/*
	 * ISO/IEC 80000-1 prefixes for binary multiples, i.e. multiples of 1024 (= 2^10)
	 * 
	 * See also https://en.wikipedia.org/wiki/Binary_prefix
	 */
	attribute kibi = UnitPrefix(name => "kibi", symbol => "Ki", conversionFactor => 1024);
	attribute mebi = UnitPrefix(name => "mebi", symbol => "Mi", conversionFactor => 1024^2);
	attribute gibi = UnitPrefix(name => "gibi", symbol => "Gi", conversionFactor => 1024^3);
	attribute tebi = UnitPrefix(name => "tebi", symbol => "Ti", conversionFactor => 1024^4);
	attribute pebi = UnitPrefix(name => "pebi", symbol => "Pi", conversionFactor => 1024^5);
	attribute exbi = UnitPrefix(name => "exbi", symbol => "Ei", conversionFactor => 1024^6);
	attribute zebi = UnitPrefix(name => "zebi", symbol => "Zi", conversionFactor => 1024^7);
	attribute yobi = UnitPrefix(name => "yobi", symbol => "Yi", conversionFactor => 1024^8);
}