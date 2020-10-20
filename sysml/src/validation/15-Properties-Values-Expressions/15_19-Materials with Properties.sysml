package '15_19-Materials with Properties' {
	import ScalarValues::Real;
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

    part def Substance;
    part def Material :> Substance;

	/*
	 * The classification of materials into metals and alloys is grossly simplified and not exhaustive.
	 * A more complete classification would include: ChemicalSubstance, PureMaterial, MixedMaterial,
	 * Class, Ceramic, OrganicMaterial, AnorganicMaterial, Polymer, HybridMaterial, CompositeMaterial,
	 * etc.
	 */

    part def Metal :> Material {
        attribute atomicMass: AtomicMassValue[1];
    }

    attribute def MaterialFraction {
        ref material: Material[1]; 
        attribute massFraction: MassFractionValue[1];
    }

    attribute def MassFractionValue :> DimensionOneValue;    

    part def Alloy :> Material {
        attribute fractions: MaterialFraction[2..*];
    }

    individual def Iron :> Metal {
        attribute :>> atomicMass = 55.845@[Da];
    }

    individual def Carbon :> Metal {
        attribute atomicMass :>> Metal::atomicMass = 12.011@[Da];
    }

    individual def Manganese :> Metal {
        attribute atomicMass :>> Metal::atomicMass = 54.938@[Da];
    }

 	/**
	 * Particular example of high tensile strength steel.
	 */
    individual def Steel_980 :> Alloy {
        attribute fraction1 :> fractions {
        	ref :>> material : Iron;
        	attribute :>> massFraction = 0.9862;
        }
        
        attribute fraction2 :> fractions {
        	ref :>> material : Carbon;
        	attribute :>> massFraction = 0.9862;
        }
        
        attribute fraction3 :> fractions {
        	ref :>> material : Manganese;
        	attribute :>> massFraction = 0.9862;
        }
        
        attribute tensileStrength: TensileStrengthValue = 980@['N/mm²'];
    }
}
