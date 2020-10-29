package '15_19a-Materials with Properties' {
	import ScalarValues::*;
	import Quantities::*;
	import UnitsAndScales::*;
	import SI::*;
	
	// TODO: Move definition of atomic mass and Da to SI
	part def AtomicMassUnit :> MassUnit;
        
    attribute def AtomicMassValue :> QuantityValue {
		attribute num: Real :>> QuantityValue::num;
    	ref mRef: AtomicMassUnit :>> QuantityValue::mRef;
    }
    
    part Da: AtomicMassUnit = AtomicMassUnit(
    	name => "dalton", 
    	unitConversion => ConversionByConvention(referenceUnit => kg, conversionFactor => 1.66053906660e-27)
    );
    
	// TODO: Move definition of tensile strength and N/mm² to SI
    part def TensileStrengthUnit :> SIDerivedUnit {
		attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
			attribute exponent :>> UnitPowerFactor::exponent = -1;
		}
		attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
			attribute exponent :>> UnitPowerFactor::exponent = 1;
		}
		attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
			attribute exponent :>> UnitPowerFactor::exponent = -2;
		}
    }
    
    attribute def TensileStrengthValue :> QuantityValue {
		attribute num: Real redefines QuantityValue::num;
    	ref mRef: TensileStrengthUnit redefines QuantityValue::mRef;
    }
    
    part 'N/mm²': TensileStrengthUnit = N / mm**2 {
    	attribute name :>> MeasurementReference::name = "newton per square millimetre";
    }

    attribute def Substance;
	attribute def Material :> Substance;
	
	/*
	 * The classification of materials into metals and alloys is grossly simplified and not exhaustive.
	 * A more complete classification would include: ChemicalSubstance, PureMaterial, MixedMaterial,
	 * Class, Ceramic, OrganicMaterial, AnorganicMaterial, Polymer, HybridMaterial, CompositeMaterial,
	 * etc.
	 */

    attribute def Metal :> Material {
        attribute atomicMass: AtomicMassValue[1];
    }

    attribute def Alloy :> Material {
        attribute fractions: MaterialFraction[2..*];
    }

    attribute def MaterialFraction {
        attribute material: Material[1]; 
        attribute massFraction: MassFractionValue[1];
    }

    attribute def MassFractionValue :> DimensionOneValue;    

	/*
	 * Value properties bound to specifically constructed compound values.
	 */
    attribute Iron = Metal(atomicMass => 55.845@[Da]);
    attribute Carbon = Metal(atomicMass => 12.011@[Da]);
    attribute Manganese = Metal(atomicMass => 54.938@[Da]);
    
	/**
	 * Value property with redefined/added sub-properties.
	 * (Particular example of high tensile strength steel.)
	 */
    attribute Steel_980 : Alloy {
    	attribute :>> fractions = {
    		MaterialFraction(Iron, 0.9862),
    		MaterialFraction(Carbon, 0.0018),
    		MaterialFraction(Manganese, 0.012)
    	};
        attribute tensileStrength: TensileStrengthValue = 980@['N/mm²'];
    }
  
}
