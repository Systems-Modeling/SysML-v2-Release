/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard ISO-80000-9:2019 "Physical chemistry and molecular physics"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-9:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQChemistryMolecular {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    private import ISQSpaceTime::LengthValue;
    private import ISQSpaceTime::length;
    private import ISQSpaceTime::AngularMeasureValue;
    private import ISQSpaceTime::angularMeasure;

    /**
     * source: item 9-1 number of entities
     * symbol(s): `N(X)`, `N_X`
     * application domain: General
     * name: NumberOfEntities
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of elementary entities of kind X in a system
     * remarks: The elementary entities must be specified and can be atoms, molecules, ions, electrons, other particle, or a specified group of such particles. It is important to always give a precise specification of the entity involved; this should preferably be done by the empirical chemical formula of the material involved.
     */
    attribute def NumberOfEntitiesUnit :> DimensionOneUnit {
    }
    attribute def NumberOfEntitiesValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NumberOfEntitiesUnit :>> QuantityValue::mRef;
    }
    attribute numberOfEntities: NumberOfEntitiesValue :> quantity;

    /**    
     * source: item 9-2 amount of substance, number of moles
     * symbol(s): `n(X)`
     * application domain: General
     * name: AmountOfSubstance
     * quantity dimension: N^1
     * measurement unit(s): mol
     * definition: quotient of number `N` of specified elementary entities of kind X (item 9-1) in a sample, and the Avogadro constant `N_A` (ISO 80000-1): `n(X) = N(X)/N_A`
     * remarks: Amount of substance is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). Elementary entities, such as molecules, atoms, ions, electrons, holes and other quasi-particles, double bonds can be used. It is necessary to specify precisely the entity involved, e.g. atoms of hydrogen `H` vs. molecules of hydrogen `H_2`, preferably by giving the molecular chemical formula of the material involved. In the name “amount of substance”, the words “of substance” could be replaced by words specifying the substance concerned, e.g. “amount of hydrogen chloride, `HCl`”, or “amount of benzene, `C_6H_6`”. The name “number of moles” is often used for “amount of substance”, but this is deprecated because the name of a quantity should be distinguished from the name of the unit.
     */
    attribute def AmountOfSubstanceUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: AmountOfSubstanceUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def AmountOfSubstanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AmountOfSubstanceUnit :>> QuantityValue::mRef;
    }    
    attribute amountOfSubstance: AmountOfSubstanceValue :> quantity;

    alias AmountOfSubstanceUnit as NumberOfMolesUnit;
    alias AmountOfSubstanceValue as NumberOfMolesValue;
    alias amountOfSubstance as numberOfMoles;

    /**
     * source: item 9-3 relative atomic mass
     * symbol(s): `A_r(X)`
     * application domain: General
     * name: RelativeAtomicMass
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the average mass (ISO 80000-4) of atom X and the unified atomic mass (ISO 80000-10)
     * remarks: A similar quantity “relative molecular mass” can be defined for molecules. EXAMPLE `A_r(Cl) ~~ 35.453` `A_r(CO_2) ~~ 44` The relative atomic or relative molecular mass depends on the nuclidic composition. The International Union of Pure and Applied Chemistry (IUPAC) accepts the use of the special names “atomic weight” and “molecular weight” for the quantities “relative atomic mass” and “relative molecular mass”, respectively. The use of these traditional names is deprecated.
     */
    attribute def RelativeAtomicMassUnit :> DimensionOneUnit {
    }
    attribute def RelativeAtomicMassValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeAtomicMassUnit :>> QuantityValue::mRef;
    }
    attribute relativeAtomicMass: RelativeAtomicMassValue :> quantity;

    /**
     * source: item 9-4 molar mass
     * symbol(s): `M(X)`
     * application domain: General
     * name: MolarMass
     * quantity dimension: M^1*N^-1
     * measurement unit(s): g/mol, kg*mol^-1
     * definition: for a pure substance X, quotient of mass `m`(X) (ISO 80000-4) and amount `n` of substance (item 9-2): `M = m/n`
     * remarks: 
     */
    attribute def MolarMassUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarMassValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarMassUnit :>> QuantityValue::mRef;
    }
    attribute molarMass: MolarMassValue :> quantity;

    /**
     * source: item 9-5 molar volume
     * symbol(s): `V_m`
     * application domain: General
     * name: MolarVolume
     * quantity dimension: L^3*N^-1
     * measurement unit(s): m^3*mol^-1
     * definition: for a pure substance, quotient of its volume `V` (ISO 80000-3) and amount `n` of substance (item 9-2): `V_m = V/n`
     * remarks: 
     */
    attribute def MolarVolumeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarVolumeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarVolumeUnit :>> QuantityValue::mRef;
    }
    attribute molarVolume: MolarVolumeValue :> quantity;

    /**
     * source: item 9-6.1 molar internal energy
     * symbol(s): `U_m`
     * application domain: General
     * name: MolarInternalEnergy
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: quotient of internal energy `U` (ISO 80000-5) and amount `n` of substance (item 9-2): `U_m = U/n`
     * remarks: Molar quantities are normally only used with reference to pure substances.
     */
    attribute def MolarInternalEnergyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarInternalEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarInternalEnergyUnit :>> QuantityValue::mRef;
    }
    attribute molarInternalEnergy: MolarInternalEnergyValue :> quantity;

    /**
     * source: item 9-6.2 molar enthalpy
     * symbol(s): `H_m`
     * application domain: General
     * name: MolarEnthalpy
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: quotient of enthalpy `H` (ISO 80000-5) and amount `n` of substance (item 9-2): `H_m = H/n`
     * remarks: Molar quantities are normally only used with reference to pure substances.
     */
    attribute def MolarEnthalpyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarEnthalpyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarEnthalpyUnit :>> QuantityValue::mRef;
    }
    attribute molarEnthalpy: MolarEnthalpyValue :> quantity;

    /**
     * source: item 9-6.3 molar Helmholtz energy
     * symbol(s): `F_m`
     * application domain: General
     * name: MolarHelmholtzEnergy
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: quotient of the Helmholtz energy `F` (ISO 80000-5) and amount `n` of substance (item 9-2): `F_m = F/n`
     * remarks: Molar quantities are normally only used with reference to pure substances.
     */
    attribute def MolarHelmholtzEnergyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarHelmholtzEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarHelmholtzEnergyUnit :>> QuantityValue::mRef;
    }
    attribute molarHelmholtzEnergy: MolarHelmholtzEnergyValue :> quantity;

    /**
     * source: item 9-6.4 molar Gibbs energy
     * symbol(s): `G_m`
     * application domain: General
     * name: MolarGibbsEnergy
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: quotient of the Gibbs energy `G` (ISO 80000-5) and amount `n` of substance (item 9-2): `G_m = G/n`
     * remarks: Molar quantities are normally only used with reference to pure substances.
     */
    attribute def MolarGibbsEnergyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarGibbsEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarGibbsEnergyUnit :>> QuantityValue::mRef;
    }
    attribute molarGibbsEnergy: MolarGibbsEnergyValue :> quantity;

    /**
     * source: item 9-7 molar heat capacity
     * symbol(s): `C_m`
     * application domain: General
     * name: MolarHeatCapacity
     * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
     * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
     * definition: quotient of heat capacity `C` (ISO 80000-5) and amount of substance `n` (item 9-2): `C_m = C/n`
     * remarks: Conditions (constant pressure or volume etc.) must be specified.
     */
    attribute def MolarHeatCapacityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarHeatCapacityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarHeatCapacityUnit :>> QuantityValue::mRef;
    }
    attribute molarHeatCapacity: MolarHeatCapacityValue :> quantity;

    /**
     * source: item 9-8 molar entropy
     * symbol(s): `S_m`
     * application domain: General
     * name: MolarEntropy
     * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
     * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
     * definition: quotient of entropy `S` (ISO 80000-5) and amount `n` of substance (item 9-2): `S_m = S/n`
     * remarks: Conditions (constant pressure or volume etc.) must be specified.
     */
    attribute def MolarEntropyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarEntropyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarEntropyUnit :>> QuantityValue::mRef;
    }
    attribute molarEntropy: MolarEntropyValue :> quantity;

    /**
     * source: item 9-9.1 particle concentration
     * symbol(s): `n`, `(C)`
     * application domain: General
     * name: ParticleConcentration
     * quantity dimension: L^-3
     * measurement unit(s): m^-3
     * definition: quotient of number `N` of particles (item 9-1) and volume `V `(ISO 80000-3): `n = N/V`
     * remarks: The term “number density” is also used.
     */
    attribute def ParticleConcentrationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def ParticleConcentrationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleConcentrationUnit :>> QuantityValue::mRef;
    }
    attribute particleConcentration: ParticleConcentrationValue :> quantity;

    /**
     * source: item 9-9.2 molecular concentration
     * symbol(s): `C(X)`, `C_X`
     * application domain: General
     * name: MolecularConcentration (specializes ParticleConcentration)
     * quantity dimension: L^-3
     * measurement unit(s): m^-3
     * definition: for substance X in a mixture, quotient of number `N_X` of molecules of substance X and volume `V` (ISO 80000-3) of the mixture: `C_X = N_X/V`
     * remarks: 
     */
    attribute molecularConcentration :> particleConcentration;

    /**
     * source: item 9-10 mass concentration
     * symbol(s): `γ_X`, `(ρ_X)`
     * application domain: General
     * name: MassConcentration
     * quantity dimension: L^-3*M^1
     * measurement unit(s): g/l, kg*m^-3
     * definition: for substance X in a mixture, quotient of mass `m_X` (ISO 80000-4) of substance X and volume `V` (ISO 80000-3) of the mixture: `γ_X = m_X/V`
     * remarks: Decided by the 16th CGPM (1979), both “l” and “L” are allowed for the symbols for the litre.
     */
    attribute def MassConcentrationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MassConcentrationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassConcentrationUnit :>> QuantityValue::mRef;
    }
    attribute massConcentration: MassConcentrationValue :> quantity;

    /**
     * source: item 9-11 mass fraction
     * symbol(s): `w_X`
     * application domain: General
     * name: MassFraction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance X in a mixture, quotient of mass `m_X` (ISO 80000-4) of substance X and total mass `m` of the mixture: `w_X = m_X/m`
     * remarks: 
     */
    attribute def MassFractionUnit :> DimensionOneUnit {
    }
    attribute def MassFractionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassFractionUnit :>> QuantityValue::mRef;
    }
    attribute massFraction: MassFractionValue :> quantity;

    /**
     * source: item 9-12.1 amount-of-substance concentration
     * symbol(s): `c_X`
     * application domain: General
     * name: AmountOfSubstanceConcentration
     * quantity dimension: L^-3*N^1
     * measurement unit(s): mol/l, mol*m^-3
     * definition: for substance X in a mixture, quotient of amount `n_X` of substance (item 9-2) of X and volume `V` (ISO 80000-3) of the mixture: `c_X = n_X/V`
     * remarks: In chemistry, the name “amount-of-substance concentration” is generally abbreviated to the single word “concentration”, it being assumed that the adjective “amount-of-substance” is intended. For this reason, however, the word “mass” should never be omitted from the name “mass concentration” in item 9-10. Decided by the 16th CGPM (1979), both “l” and “L” are allowed for the symbols for the litre.
     */
    attribute def AmountOfSubstanceConcentrationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def AmountOfSubstanceConcentrationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AmountOfSubstanceConcentrationUnit :>> QuantityValue::mRef;
    }
    attribute amountOfSubstanceConcentration: AmountOfSubstanceConcentrationValue :> quantity;

    /**
     * source: item 9-12.2 standard amount-of-substance concentration
     * symbol(s): `c^!(X)`
     * application domain: General
     * name: StandardAmountOfSubstanceConcentration (specializes AmountOfSubstanceConcentration)
     * quantity dimension: L^-3*N^1
     * measurement unit(s): mol/l, mol*m^-3
     * definition: for substance X, one mole per litre
     * remarks: Decided by the 16th CGPM (1979), both “l” and “L” are allowed for the symbols for the litre.
     */
    attribute standardAmountOfSubstanceConcentration :> amountOfSubstanceConcentration;

    /**
     * source: item 9-13 amount-of-substance fraction mole fraction
     * symbol(s): `x_X`, `y_X`
     * application domain: General
     * name: AmountOfSubstanceFractionMoleFraction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance X in a mixture, quotient of amount of substance `n_X` (item 9-2) of X and total amount `n` of substance (item 9-2) in the mixture: `x_X = n_X/n`
     * remarks: For condensed phases, `x_X` is used, and for gaseous mixtures `y_X` may be used. The unsystematic name “mole fraction” is still used. However, the use of this name is deprecated. For this quantity, the entity used to define the amount of substance should always be a single molecule for every species in the mixture.
     */
    attribute def AmountOfSubstanceFractionMoleFractionUnit :> DimensionOneUnit {
    }
    attribute def AmountOfSubstanceFractionMoleFractionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AmountOfSubstanceFractionMoleFractionUnit :>> QuantityValue::mRef;
    }
    attribute amountOfSubstanceFractionMoleFraction: AmountOfSubstanceFractionMoleFractionValue :> quantity;

    /**
     * source: item 9-14 volume fraction
     * symbol(s): `φ_X`
     * application domain: General
     * name: VolumeFraction
     * quantity dimension: 1
     * measurement unit(s): ml/l, 1
     * definition: for substance `X`, quotient of product of amount of substance fraction `x_X` (item 9-13) of `X` and molar volume `V_(m,X)` (item 9-5) of the pure substance `X` at the same temperature (ISO 80000-5) and pressure (ISO 80000-4), and sum over all substances `i` of products of amount-of-substance fractions `x_i` (item 9-13) of substance `i` and their molar volumes `V_(m,i)` (item 9-5): `φ_X = (x_X V_(m,X))/(sum_i x_i V_(m,i))`
     * remarks: Generally, the volume fraction is temperature dependent. Decided by the 16th CGPM (1979), both “l” and “L” are allowed for the symbols for the litre.
     */
    attribute def VolumeFractionUnit :> DimensionOneUnit {
    }
    attribute def VolumeFractionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VolumeFractionUnit :>> QuantityValue::mRef;
    }
    attribute volumeFraction: VolumeFractionValue :> quantity;

    /**
     * source: item 9-15 molality
     * symbol(s): `b_B`, `m_B`
     * application domain: General
     * name: Molality
     * quantity dimension: M^-1*N^1
     * measurement unit(s): mol/kg
     * definition: quotient of amount of substance (item 9-2) of solute B and mass `m_A` (ISO 80000-4) of the solvent substance A `b_B` = `n_B`/`m_A`
     * remarks: The alternative symbol `m_B` should be avoided in situations where it might be mistaken for the mass of substance B. However, the symbol `m_B` is much more commonly used than the symbol `b_B` for molality, despite the possible confusion with mass.
     */
    attribute def MolalityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MolalityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolalityUnit :>> QuantityValue::mRef;
    }
    attribute molality: MolalityValue :> quantity;

    /**
     * source: item 9-16 latent heat of phase transition, enthalpy of phase transition
     * symbol(s): `C_(pt)`
     * application domain: General
     * name: LatentHeatOfPhaseTransition
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: energy (ISO 80000-5) necessary to be added or subtracted isothermally and isobarically to a system to completely undergo the phase transition
     * remarks: Mostly, molar or specific quantity is used and phase transition is expressed explicitly, e.g. molar latent heat of evaporation. The subscript “pt” is the qualifier for the phase transition, which may be changed to e.g. “l-g”. The term “enthalpy of phase transition” is mainly used in theory.
     */
    attribute def LatentHeatOfPhaseTransitionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def LatentHeatOfPhaseTransitionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LatentHeatOfPhaseTransitionUnit :>> QuantityValue::mRef;
    }
    attribute latentHeatOfPhaseTransition: LatentHeatOfPhaseTransitionValue :> quantity;

    alias LatentHeatOfPhaseTransitionUnit as EnthalpyOfPhaseTransitionUnit;
    alias LatentHeatOfPhaseTransitionValue as EnthalpyOfPhaseTransitionValue;
    alias latentHeatOfPhaseTransition as enthalpyOfPhaseTransition;

    /**
     * source: item 9-17 chemical potential
     * symbol(s): `μ_X`
     * application domain: chemistry
     * name: ChemicalPotential
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: partial derivative of the Gibbs energy (ISO 80000-5) with respect to amount `n_X` of substance X (item 9-2) at constant temperature `T` (ISO 80000-5) and pressure `p `(ISO 80000-4): `μ_X = ((del G)/(del n_X))_(T,p)`
     * remarks: For a pure substance, where `G_m` is the molar Gibbs energy. In a mixture, `μ_B` is the partial molar Gibbs energy. In condensed matter physics, the chemical potential of electrons is energy.
     */
    attribute def ChemicalPotentialUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ChemicalPotentialValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ChemicalPotentialUnit :>> QuantityValue::mRef;
    }
    attribute chemicalPotential: ChemicalPotentialValue :> quantity;

    /**
     * source: item 9-18 absolute activity
     * symbol(s): `λ_X`
     * application domain: General
     * name: AbsoluteActivity
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance X, exponential of quotient of chemical potential `μ_X` of substance B (item 9-17), and product of molar gas constant `R` (item 9-37.1) and thermodynamic temperature `T` (ISO 80000-5): `λ_X = exp(μ_X/(RT))`
     * remarks: 
     */
    attribute def AbsoluteActivityUnit :> DimensionOneUnit {
    }
    attribute def AbsoluteActivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AbsoluteActivityUnit :>> QuantityValue::mRef;
    }
    attribute absoluteActivity: AbsoluteActivityValue :> quantity;

    /**
     * source: item 9-19 partial pressure
     * symbol(s): `p_X`
     * application domain: General
     * name: PartialPressure
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: for substance X in a gaseous mixture, product of amount-of-substance fraction `y_X` of substance X (item 9-13) and total pressure `p` (ISO 80000-4): `p_X = y_X p`
     * remarks: 
     */
    attribute def PartialPressureUnit :> SIDerivedUnit {
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
    attribute def PartialPressureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PartialPressureUnit :>> QuantityValue::mRef;
    }
    attribute partialPressure: PartialPressureValue :> quantity;

    /**
     * source: item 9-20 fugacity
     * symbol(s): `tilde(p)_X`
     * application domain: General
     * name: Fugacity
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: for substance X, quantity proportional to the absolute activity, `λ_X` (item 9-18), the proportionality factor, which is a function of temperature (ISO 80000-5) only, being determined by the condition that, at constant temperature and composition, `p_X/tilde(p)_X` tends to 1 for an indefinitely dilute gas
     * remarks: `tilde(p)_X = λ_X * lim_(p->0) (p_X/λ_X)` where `p` is total pressure (ISO 80000-4). The IUPAC preferred symbol for fugacity is `f`.
     */
    attribute def FugacityUnit :> SIDerivedUnit {
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
    attribute def FugacityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: FugacityUnit :>> QuantityValue::mRef;
    }
    attribute fugacity: FugacityValue :> quantity;

    /**
     * source: item 9-21 standard chemical potential
     * symbol(s): `μ_B^!`, `μ^!`
     * application domain: General
     * name: StandardChemicalPotential
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: for substance B, value of the chemical potential (item 9-17) at specified standard conditions
     * remarks: `μ_B^! = RT ln(λ^!)` where `μ_B^!` is a function of temperature `T` at the standard pressure `p = p^!` The standard chemical potential depends on the choice of standard state, which must be specified. In a liquid or solid solution, the standard state is referenced to the ideal dilute behaviour of the solute (substance B).
     */
    attribute def StandardChemicalPotentialUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def StandardChemicalPotentialValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StandardChemicalPotentialUnit :>> QuantityValue::mRef;
    }
    attribute standardChemicalPotential: StandardChemicalPotentialValue :> quantity;

    /**
     * source: item 9-22 activity factor
     * symbol(s): `f_X`
     * application domain: General
     * name: ActivityFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance X in a liquid or a solid mixture, quotient of absolute activity `λ_X` (item 9-18) of substance X and the product of absolute activity `λ_X^**` of the pure substance X at the same temperature (ISO 80000-5) and pressure (ISO 80000-4) and amount-of-substance fraction `x_X` of substance X (item 9-13): `f_X = λ_X/(λ_X^** x_X)`
     * remarks: The systematic name is “activity factor”, but the name “activity coefficient” is also commonly used (see item 9-25). Activity factors can also be obtained applying Raoult’s law or Henry’s law.
     */
    attribute def ActivityFactorUnit :> DimensionOneUnit {
    }
    attribute def ActivityFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActivityFactorUnit :>> QuantityValue::mRef;
    }
    attribute activityFactor: ActivityFactorValue :> quantity;

    /**
     * source: item 9-23 standard absolute activity in mixture
     * symbol(s): `λ_X^!`
     * application domain: in a mixture
     * name: StandardAbsoluteActivityInMixture
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance X in a liquid or a solid mixture, absolute activity `λ_X^**` (item 9-18) of the pure substance X at the same temperature (ISO 80000-5) but at standard pressure (ISO 80000-4) 10^5 Pa: `λ_X^! = λ_X^** (p^!)`
     * remarks: This quantity is a function of temperature only.
     */
    attribute def StandardAbsoluteActivityInMixtureUnit :> DimensionOneUnit {
    }
    attribute def StandardAbsoluteActivityInMixtureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StandardAbsoluteActivityInMixtureUnit :>> QuantityValue::mRef;
    }
    attribute standardAbsoluteActivityInMixture: StandardAbsoluteActivityInMixtureValue :> quantity;

    /**
     * source: item 9-24 activity of solute, relative activity of solute
     * symbol(s): `a_X`, `a_(m,X)`
     * application domain: General
     * name: ActivityOfSolute
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a solute X in a solution, quantity proportional to the absolute activity, `λ_X` (item 9-18), the proportionality factor, which is a function of temperature (ISO 80000-5) and pressure (ISO 80000-4) only, being determined by the condition that, at constant temperature and pressure, `a_X` divided by the molality (item 9-15) ratio, `b_X/b^!` tends to 1 at infinite dilution; `b_X` is the molality of solute X (item 9-15), and `b^!` is standard molality: `a_X = λ_X * lim_(sum b_X -> 0) (b_X//b^!)/λ_X`
     * remarks: The quantity `a_(c,X)` , similarly defined in terms of the concentration ratio `c_X/c^!` , is also called the activity or relative activity of solute X; `c^!` is a standard amount-of-substance concentration (item 9-12.2): `a_(c,x) = λ_X * lim_(sum c_X -> 0) (c_X//c^!)/λ_X` where ∑ denotes summation over all the solute substances. This especially applies to a dilute liquid solution.
     */
    attribute def ActivityOfSoluteUnit :> DimensionOneUnit {
    }
    attribute def ActivityOfSoluteValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActivityOfSoluteUnit :>> QuantityValue::mRef;
    }
    attribute activityOfSolute: ActivityOfSoluteValue :> quantity;

    alias ActivityOfSoluteUnit as RelativeActivityOfSoluteUnit;
    alias ActivityOfSoluteValue as RelativeActivityOfSoluteValue;
    alias activityOfSolute as relativeActivityOfSolute;

    /**
     * source: item 9-25 activity coefficient
     * symbol(s): `γ_B`
     * application domain: General
     * name: ActivityCoefficient
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a solute B in a solution, quotient of activity `a_B` of solute B (item 9-24), and quotient of the molality (item 9-15) `b_B` of substance B and standard molality `b^!` : `γ_B = a_B/(b_B//b^!)`
     * remarks: The name “activity coefficient of solute B” is also used for the quantity `γ_B` defined as: `γ_B = a_(c,B)/(c_B//c^!)` See item 9-22.
     */
    attribute def ActivityCoefficientUnit :> DimensionOneUnit {
    }
    attribute def ActivityCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActivityCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute activityCoefficient: ActivityCoefficientValue :> quantity;

    /**
     * source: item 9-26 standard absolute activity in solution
     * symbol(s): `λ_B^!`
     * application domain: in a solution
     * name: StandardAbsoluteActivityInSolution
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a solute B in a solution: `λ_B^! = lim_(sum b_B -> 0) [λ_B ((p^!)b^!)/b_B]` where ∑ denotes summation over all solutes, `p^!` is a standard pressure (ISO 80000-4), `b^!` is standard molality, and `b_B` is the molality of substance B (item 9-15)
     * remarks: This quantity is a function of temperature only. It especially applies to a dilute liquid solution. The standard pressure is 10^5 Pa.
     */
    attribute def StandardAbsoluteActivityInSolutionUnit :> DimensionOneUnit {
    }
    attribute def StandardAbsoluteActivityInSolutionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StandardAbsoluteActivityInSolutionUnit :>> QuantityValue::mRef;
    }
    attribute standardAbsoluteActivityInSolution: StandardAbsoluteActivityInSolutionValue :> quantity;

    /**
     * source: item 9-27.1 activity of solvent, relative activity of solvent
     * symbol(s): `a_A`
     * application domain: General
     * name: ActivityOfSolvent
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for the solvent A in a solution, quotient of the absolute activity of substance A, `λ_A` (item 9-18), and that, `λ_A^**` , of the pure solvent at the same temperature (ISO 80000-5) and pressure (ISO 80000-4): `a_A = λ_A/λ_A^**`
     * remarks: 
     */
    attribute def ActivityOfSolventUnit :> DimensionOneUnit {
    }
    attribute def ActivityOfSolventValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActivityOfSolventUnit :>> QuantityValue::mRef;
    }
    attribute activityOfSolvent: ActivityOfSolventValue :> quantity;

    alias ActivityOfSolventUnit as RelativeActivityOfSolventUnit;
    alias ActivityOfSolventValue as RelativeActivityOfSolventValue;
    alias activityOfSolvent as relativeActivityOfSolvent;

    /**
     * source: item 9-27.2 osmotic factor of solvent, osmotic coefficient of solvent A
     * symbol(s): `φ`
     * application domain: General
     * name: OsmoticFactorOfSolvent
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantity given by: `φ = -(M_A sum b_B)^-1 ln(a_A)` where `M_A` is the molar mass (item 9-4) of the solvent A, ∑ denotes summation over all the solutes, `b_B` is the molality of solute B (item 9-15), and `a_A` is the activity of solvent A (item 9-27.1)
     * remarks: The name “osmotic coefficient” is generally used, although the name “osmotic factor” is more systematic. This concept especially applies to a dilute liquid solution.
     */
    attribute def OsmoticFactorOfSolventUnit :> DimensionOneUnit {
    }
    attribute def OsmoticFactorOfSolventValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: OsmoticFactorOfSolventUnit :>> QuantityValue::mRef;
    }
    attribute osmoticFactorOfSolvent: OsmoticFactorOfSolventValue :> quantity;

    alias OsmoticFactorOfSolventUnit as OsmoticCoefficientOfSolventAUnit;
    alias OsmoticFactorOfSolventValue as OsmoticCoefficientOfSolventAValue;
    alias osmoticFactorOfSolvent as osmoticCoefficientOfSolventA;

    /**
     * source: item 9-27.3 standard absolute activity of solvent
     * symbol(s): `λ_A^!`
     * application domain: in a dilute solution
     * name: StandardAbsoluteActivityOfSolvent
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for solvent A, standard absolute activity (item 9-23) of the pure substance A at the same temperature (ISO 80000-5) and at a standard pressure `p^!` (ISO 80000-4): `λ_A^! = λ_A^** p^!`
     * remarks: 
     */
    attribute def StandardAbsoluteActivityOfSolventUnit :> DimensionOneUnit {
    }
    attribute def StandardAbsoluteActivityOfSolventValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StandardAbsoluteActivityOfSolventUnit :>> QuantityValue::mRef;
    }
    attribute standardAbsoluteActivityOfSolvent: StandardAbsoluteActivityOfSolventValue :> quantity;

    /**
     * source: item 9-28 osmotic pressure
     * symbol(s): `Π`
     * application domain: General
     * name: OsmoticPressure
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: excess pressure (ISO 80000-4) required to maintain osmotic equilibrium between a solution and the pure solvent separated by a membrane permeable to the solvent only
     * remarks: 
     */
    attribute def OsmoticPressureUnit :> SIDerivedUnit {
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
    attribute def OsmoticPressureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: OsmoticPressureUnit :>> QuantityValue::mRef;
    }
    attribute osmoticPressure: OsmoticPressureValue :> quantity;

    /**
     * source: item 9-29 stoichiometric number of substance
     * symbol(s): `ν_B`
     * application domain: General
     * name: StoichiometricNumberOfSubstance
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for substance B, an integer number or a simple fraction, being negative for a reactant and positive for a product, occurring in the expression for a chemical reaction: `0 = sum ν_B` where the symbol B denotes the reactants and products involved in the reaction
     * remarks: EXAMPLE (1/2)N_2 + (3/2)H_2 = NH_3 `ν` (N_2) = -1/2, `ν` (H_2) = -3/2, `ν` (NH_3) = +1.
     */
    attribute def StoichiometricNumberOfSubstanceUnit :> DimensionOneUnit {
    }
    attribute def StoichiometricNumberOfSubstanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StoichiometricNumberOfSubstanceUnit :>> QuantityValue::mRef;
    }
    attribute stoichiometricNumberOfSubstance: StoichiometricNumberOfSubstanceValue :> quantity;

    /**
     * source: item 9-30 affinity of a chemical reaction
     * symbol(s): `A`
     * application domain: General
     * name: AffinityOfAChemicalReaction
     * quantity dimension: L^2*M^1*T^-2*N^-1
     * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
     * definition: negative of the sum over all substances B of products of stoichiometric number `ν_B` of substance B (item 9-29) and chemical potential `μ_B` of substance B (item 9-17): `A = -sum ν_B μ_B`
     * remarks: The affinity of a reaction is a measure of the “driving force” of the reaction. When it is positive, the reaction goes spontaneously from reactants to products, and when it is negative, the reaction goes in the opposite direction. Another way to write the definition is: `A = ((del G)/(del ksi))_(p,T)` where `G` is Gibbs energy (ISO 80000-5) and `ξ` is the extent of the reaction (item 9-31). Note that `v_B` is negative for reactants and positive for products.
     */
    attribute def AffinityOfAChemicalReactionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def AffinityOfAChemicalReactionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AffinityOfAChemicalReactionUnit :>> QuantityValue::mRef;
    }
    attribute affinityOfAChemicalReaction: AffinityOfAChemicalReactionValue :> quantity;

    /**
     * source: item 9-31 extent of reaction
     * symbol(s): `ξ`
     * application domain: General
     * name: ExtentOfReaction (specializes AmountOfSubstance)
     * quantity dimension: N^1
     * measurement unit(s): mol
     * definition: difference of initial amount `n_(`B in) of substance B (item 9-2) and equilibrium amount` n_(`B eq) of substance B (item 9-2) divided by stoichiometric number `ν_B` of substance B (item 9-29): `ξ = (n_(Beq) - n_(Bin))/ν_B`
     * remarks: See remark to item 9-30.
     */
    attribute extentOfReaction :> amountOfSubstance;

    /**
     * source: item 9-32 standard equilibrium constant, thermodynamic equilibrium constant
     * symbol(s): `K^!`
     * application domain: General
     * name: StandardEquilibriumConstant
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a chemical reaction, product for all substances B of standard absolute activity `λ_B^!` of substance B (item 9-26) in power of minus stoichiometric number `ν_B` of substance B (item 9-29): `K^! = prod_B (tilde(a) λ_B^!)^νV`
     * remarks: This quantity is a function of temperature only. Others depend on temperature, pressure, and composition. One can define in an analogous way an equilibrium constant in terms of fugacity, `K_f`, molality, `K_m`, etc.
     */
    attribute def StandardEquilibriumConstantUnit :> DimensionOneUnit {
    }
    attribute def StandardEquilibriumConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StandardEquilibriumConstantUnit :>> QuantityValue::mRef;
    }
    attribute standardEquilibriumConstant: StandardEquilibriumConstantValue :> quantity;

    alias StandardEquilibriumConstantUnit as ThermodynamicEquilibriumConstantUnit;
    alias StandardEquilibriumConstantValue as ThermodynamicEquilibriumConstantValue;
    alias standardEquilibriumConstant as thermodynamicEquilibriumConstant;

    /**
     * source: item 9-33 equilibrium constant on pressure basis
     * symbol(s): `K_p`
     * application domain: pressure basis
     * name: EquilibriumConstantOnPressureBasis
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: for gases, product for all substances B of partial pressure `p_B` of substance B (item 9-19) in power of its stoichiometric number `ν_B` (item 9-29): `K_p = prod_B (p_B)^(ν_B)`
     * remarks: 
     */
    attribute def EquilibriumConstantOnPressureBasisUnit :> SIDerivedUnit {
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
    attribute def EquilibriumConstantOnPressureBasisValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EquilibriumConstantOnPressureBasisUnit :>> QuantityValue::mRef;
    }
    attribute equilibriumConstantOnPressureBasis: EquilibriumConstantOnPressureBasisValue :> quantity;

    /**
     * source: item 9-34 equilibrium constant on concentration basis
     * symbol(s): `K_c`
     * application domain: concentration basis
     * name: EquilibriumConstantOnConcentrationBasis
     * quantity dimension: L^-3*N^1
     * measurement unit(s): mol/m^3
     * definition: for solutions, product for all substances B of concentration `c_B` of substance B (item 9-9.1) in power of its stoichiometric number `ν_B` (item 9-29): `K_c = prod_B (c_B)^(ν_B)`
     * remarks: 
     */
    attribute def EquilibriumConstantOnConcentrationBasisUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def EquilibriumConstantOnConcentrationBasisValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EquilibriumConstantOnConcentrationBasisUnit :>> QuantityValue::mRef;
    }
    attribute equilibriumConstantOnConcentrationBasis: EquilibriumConstantOnConcentrationBasisValue :> quantity;

    /**
     * source: item 9-35.1 microcanonical partition function
     * symbol(s): `Ω`
     * application domain: General
     * name: MicrocanonicalPartitionFunction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of all quantum states `r` consistent with given energy `E` (ISO 80000-4), volume (ISO 80000-3), and external fields: `Ω = sum_r 1`
     * remarks: `S = k ln(Ω)` where `S` is entropy (ISO 80000-5) and `k` is the Boltzmann constant (ISO 80000-1).
     */
    attribute def MicrocanonicalPartitionFunctionUnit :> DimensionOneUnit {
    }
    attribute def MicrocanonicalPartitionFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MicrocanonicalPartitionFunctionUnit :>> QuantityValue::mRef;
    }
    attribute microcanonicalPartitionFunction: MicrocanonicalPartitionFunctionValue :> quantity;

    /**
     * source: item 9-35.2 canonical partition function
     * symbol(s): `Z`
     * application domain: General
     * name: CanonicalPartitionFunction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: sum over quantum states of energy `E_r` (ISO 80000-4), expressed by: `Z = sum_r exp(-E_r/(kT))` where `k` is the Boltzmann constant (ISO 80000-1), and `T` is thermodynamic temperature (ISO 80000-5)
     * remarks: `A = -kT ln(Z)` where `A` is Helmholtz energy (ISO 80000-5).
     */
    attribute def CanonicalPartitionFunctionUnit :> DimensionOneUnit {
    }
    attribute def CanonicalPartitionFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CanonicalPartitionFunctionUnit :>> QuantityValue::mRef;
    }
    attribute canonicalPartitionFunction: CanonicalPartitionFunctionValue :> quantity;

    /**
     * source: item 9-35.3 grand-canonical partition function, grand partition function
     * symbol(s): `Ξ`
     * application domain: General
     * name: GrandCanonicalPartitionFunction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: sum of canonical partition function `Z` (`N_A`,`N_B`,…) for the given number of particles A, B multiplied by absolute activities (item 9-18) `λ_A, λ_B` ... of particles A, B: `Ξ = sum_(N_A, N_B, ...) Z(N_A, N_B, …) * λ_A^(N_A) * λ_B^(N_B) *`
     * remarks: `A - sum μ_B n_B = -kT ln(Ξ)` where `A` is Helmholtz energy (ISO 80000-5), `μ_B` is the chemical potential of substance B, and `n_B` is the amount of substance B.
     */
    attribute def GrandCanonicalPartitionFunctionUnit :> DimensionOneUnit {
    }
    attribute def GrandCanonicalPartitionFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: GrandCanonicalPartitionFunctionUnit :>> QuantityValue::mRef;
    }
    attribute grandCanonicalPartitionFunction: GrandCanonicalPartitionFunctionValue :> quantity;

    alias GrandCanonicalPartitionFunctionUnit as GrandPartitionFunctionUnit;
    alias GrandCanonicalPartitionFunctionValue as GrandPartitionFunctionValue;
    alias grandCanonicalPartitionFunction as grandPartitionFunction;

    /**
     * source: item 9-35.4 molecular partition function, partition function of a molecule
     * symbol(s): `q`
     * application domain: General
     * name: MolecularPartitionFunction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantity given by: `q = sum_r exp(-ε_r/(kT))` where `ε_r` is the energy (ISO 80000-5) of the `r`-th level of the molecule consistent with given volume (ISO 80000-3) and external fields, `k` is the Boltzmann constant (ISO 80000-1), and `T` is thermodynamic temperature (ISO 80000-5)
     * remarks: 
     */
    attribute def MolecularPartitionFunctionUnit :> DimensionOneUnit {
    }
    attribute def MolecularPartitionFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolecularPartitionFunctionUnit :>> QuantityValue::mRef;
    }
    attribute molecularPartitionFunction: MolecularPartitionFunctionValue :> quantity;

    alias MolecularPartitionFunctionUnit as PartitionFunctionOfAMoleculeUnit;
    alias MolecularPartitionFunctionValue as PartitionFunctionOfAMoleculeValue;
    alias molecularPartitionFunction as partitionFunctionOfAMolecule;

    /**
     * source: item 9-36.1 statistical weight of subsystem
     * symbol(s): `g`
     * application domain: General
     * name: StatisticalWeightOfSubsystem
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of different microstates in a subsystem
     * remarks: 
     */
    attribute def StatisticalWeightOfSubsystemUnit :> DimensionOneUnit {
    }
    attribute def StatisticalWeightOfSubsystemValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StatisticalWeightOfSubsystemUnit :>> QuantityValue::mRef;
    }
    attribute statisticalWeightOfSubsystem: StatisticalWeightOfSubsystemValue :> quantity;

    /**
     * source: item 9-36.2 degeneracy, multiplicity
     * symbol(s): `g`
     * application domain: General
     * name: Degeneracy
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for quantum level, statistical weight of that level
     * remarks: If `g` = 1, the level is called non-degenerate.
     */
    attribute def DegeneracyUnit :> DimensionOneUnit {
    }
    attribute def DegeneracyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DegeneracyUnit :>> QuantityValue::mRef;
    }
    attribute degeneracy: DegeneracyValue :> quantity;

    alias DegeneracyUnit as MultiplicityUnit;
    alias DegeneracyValue as MultiplicityValue;
    alias degeneracy as multiplicity;

    /**
     * source: item 9-37.1 molar gas constant
     * symbol(s): `R`
     * application domain: General
     * name: MolarGasConstant
     * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
     * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
     * definition: product of the Boltzmann constant (ISO 80000-1) and the Avogadro constant (ISO 80000-1)
     * remarks: For an ideal gas, `pV_m` = `RT`
     */
    attribute def MolarGasConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarGasConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarGasConstantUnit :>> QuantityValue::mRef;
    }
    attribute molarGasConstant: MolarGasConstantValue :> quantity;

    /**
     * source: item 9-37.2 specific gas constant
     * symbol(s): `R_s`
     * application domain: General
     * name: SpecificGasConstant
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: quotient of molar gas constant `R` (item 9-37.1) and molar mass (item 9-4) `M`, i.e. `R_s` = `R/M`
     * remarks: 
     */
    attribute def SpecificGasConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificGasConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificGasConstantUnit :>> QuantityValue::mRef;
    }
    attribute specificGasConstant: SpecificGasConstantValue :> quantity;

    /**
     * source: item 9-38 mean free path
     * symbol(s): `l`, `λ`
     * application domain: chemistry
     * name: MeanFreePath (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: for a particle, the average distance `d` (ISO 80000-3) between two successive collisions with other particles
     * remarks: 
     */
    attribute meanFreePath :> length;

    /**
     * source: item 9-39 diffusion coefficient
     * symbol(s): `D`
     * application domain: chemistry
     * name: DiffusionCoefficient
     * quantity dimension: L^2*T^-1
     * measurement unit(s): m^2*s^-1
     * definition: proportionality coefficient of local molecular concentration `C_B` (item 9-9.2) of substance B in the mixture multiplied by the local average velocity (ISO 80000-3) `v_B` of the molecules of B, and minus the gradient of the local molecular concentration `C_B` (item 9-9.2) of substance B in the mixture, expressed by: `C_B(v_B) = -D grad C_B`
     * remarks: 
     */
    attribute def DiffusionCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def DiffusionCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DiffusionCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute diffusionCoefficient: DiffusionCoefficientValue :> quantity;

    /**
     * source: item 9-40.1 thermal diffusion ratio
     * symbol(s): `k_T`
     * application domain: General
     * name: ThermalDiffusionRatio
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: in a steady-state of a binary mixture in which thermal diffusion occurs, proportionality factor between gradient of the amount-of-subsstance fraction `x_B` (item 9-13) of the heavier substance B, and negative gradient of the local thermodynamic temperature `T` (ISO 80000-5) divided by that temperature (ISO 80000-5): grad `x_B` = -(`k_T`/`T`) grad `T`
     * remarks: 
     */
    attribute def ThermalDiffusionRatioUnit :> DimensionOneUnit {
    }
    attribute def ThermalDiffusionRatioValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalDiffusionRatioUnit :>> QuantityValue::mRef;
    }
    attribute thermalDiffusionRatio: ThermalDiffusionRatioValue :> quantity;

    /**
     * source: item 9-40.2 thermal diffusion factor
     * symbol(s): `α_T`
     * application domain: General
     * name: ThermalDiffusionFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the thermal diffusion ratio `k_T` (item 9-40.1), and the product of the local amount-of-substance fractions `x_A`_, `x_B` (item 9-13) of two substances A and B: `α_T = k_T//(x_A x_B)`
     * remarks: 
     */
    attribute def ThermalDiffusionFactorUnit :> DimensionOneUnit {
    }
    attribute def ThermalDiffusionFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalDiffusionFactorUnit :>> QuantityValue::mRef;
    }
    attribute thermalDiffusionFactor: ThermalDiffusionFactorValue :> quantity;

    /**
     * source: item 9-41 thermal diffusion coefficient
     * symbol(s): `D_T`
     * application domain: General
     * name: ThermalDiffusionCoefficient
     * quantity dimension: L^2*T^-1
     * measurement unit(s): m^2*s^-1
     * definition: product of the thermal diffusion ratio `k_T` (item 9-40.1) and the diffusion coefficient `D` (item 9-39): `D_T = k_T*D`
     * remarks: 
     */
    attribute def ThermalDiffusionCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ThermalDiffusionCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalDiffusionCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute thermalDiffusionCoefficient: ThermalDiffusionCoefficientValue :> quantity;

    /**
     * source: item 9-42 ionic strength
     * symbol(s): `I`
     * application domain: General
     * name: IonicStrength
     * quantity dimension: M^-1*N^1
     * measurement unit(s): mol*kg^-1
     * definition: in a sample, one half of the sum of square of the charge number `z_i` (ISO 80000-10) of `i`-th ion multiplied by its molality `b_i` (item 9-15) over any involved ion: `I = 1/2 sum z_i^2 b_i`
     * remarks: 
     */
    attribute def IonicStrengthUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def IonicStrengthValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: IonicStrengthUnit :>> QuantityValue::mRef;
    }
    attribute ionicStrength: IonicStrengthValue :> quantity;

    /**
     * source: item 9-43 degree of dissociation, dissociation fraction
     * symbol(s): `α`
     * application domain: General
     * name: DegreeOfDissociation
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: in a sample, quotient of the number `n_d` of dissociated molecules and the total number `n` of molecules: `α = n_D / n`
     * remarks: 
     */
    attribute def DegreeOfDissociationUnit :> DimensionOneUnit {
    }
    attribute def DegreeOfDissociationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DegreeOfDissociationUnit :>> QuantityValue::mRef;
    }
    attribute degreeOfDissociation: DegreeOfDissociationValue :> quantity;

    alias DegreeOfDissociationUnit as DissociationFractionUnit;
    alias DegreeOfDissociationValue as DissociationFractionValue;
    alias degreeOfDissociation as dissociationFraction;

    /**
     * source: item 9-44 electrolytic conductivity
     * symbol(s): `κ`
     * application domain: General
     * name: ElectrolyticConductivity
     * quantity dimension: L^-3*M^-1*T^3*I^2
     * measurement unit(s): S/m, kg^-1*m^-3*s^3*A^2
     * definition: quotient of the magnitude of electric current density `J` (IEC 80000-6) and the magnitude electric field strength `E` (IEC 80000-6) in an electrolyte: `κ = J//E`
     * remarks: For anisotropic media, `κ` is a tensor. In IEC 80000-6 the symbols `σ`, `γ` are used.
     */
    attribute def ElectrolyticConductivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def ElectrolyticConductivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectrolyticConductivityUnit :>> QuantityValue::mRef;
    }
    attribute electrolyticConductivity: ElectrolyticConductivityValue :> quantity;

    /**
     * source: item 9-45 molar conductivity
     * symbol(s): `Λ_m`
     * application domain: General
     * name: MolarConductivity
     * quantity dimension: M^-1*T^3*I^2*N^-1
     * measurement unit(s): S*m^2/mol, kg^-1*s^3*A^2*mol^-1
     * definition: in an electrolyte, quotient of electrolytic conductivity `κ` (item 9-44) and amount-of-substance concentration `c_B` (item 9-12.1): `Λ_m = κ//c_B`
     * remarks: 
     */
    attribute def MolarConductivityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarConductivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarConductivityUnit :>> QuantityValue::mRef;
    }
    attribute molarConductivity: MolarConductivityValue :> quantity;

    /**
     * source: item 9-46 transport number of the ion B, current fraction of the ion B
     * symbol(s): `t_B`
     * application domain: General
     * name: TransportNumberOfTheIonB
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for the ion B, quotient of electric current `i_B` (IEC 80000-6) carried by the ion B and total electric current `i` (IEC 80000-6) in an electrolyte: `t_B = i_B // i`
     * remarks: 
     */
    attribute def TransportNumberOfTheIonBUnit :> DimensionOneUnit {
    }
    attribute def TransportNumberOfTheIonBValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TransportNumberOfTheIonBUnit :>> QuantityValue::mRef;
    }
    attribute transportNumberOfTheIonB: TransportNumberOfTheIonBValue :> quantity;

    alias TransportNumberOfTheIonBUnit as CurrentFractionOfTheIonBUnit;
    alias TransportNumberOfTheIonBValue as CurrentFractionOfTheIonBValue;
    alias transportNumberOfTheIonB as currentFractionOfTheIonB;

    /**
     * source: item 9-47 angle of optical rotation
     * symbol(s): `α`
     * application domain: General
     * name: AngleOfOpticalRotation (specializes AngularMeasure)
     * quantity dimension: 1
     * measurement unit(s): rad
     * definition: angle through which plane-polarized light is rotated clockwise, as seen when facing the light source, in passing through an optically active medium
     * remarks: 
     */
    attribute angleOfOpticalRotation :> angularMeasure;

    /**
     * source: item 9-48 molar optical rotatory power
     * symbol(s): `α_n`
     * application domain: General
     * name: MolarOpticalRotatoryPower
     * quantity dimension: L^2*N^-1
     * measurement unit(s): rad*m^2/mol, m^2*mol^-1
     * definition: angle `α` of optical rotation (item 9-47), multiplied by the quotient of cross-sectional area `A` (ISO 80000-3) of a linearly polarized light beam and the amount of substance `n` (item 9-2) of the optically active component in the path of the beam: `α_n = α A // n`
     * remarks: 
     */
    attribute def MolarOpticalRotatoryPowerUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarOpticalRotatoryPowerValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarOpticalRotatoryPowerUnit :>> QuantityValue::mRef;
    }
    attribute molarOpticalRotatoryPower: MolarOpticalRotatoryPowerValue :> quantity;

    /**
     * source: item 9-49 specific optical rotatory power
     * symbol(s): `α_m`
     * application domain: General
     * name: SpecificOpticalRotatoryPower
     * quantity dimension: L^2*M^-1
     * measurement unit(s): rad*m^2/kg^1, kg^-1*m^2
     * definition: angle `α` of optical rotation (item 9-47), multiplied by the quotient of cross-sectional area `A` (ISO 80000-3) of a linearly polarized light beam and the mass `m` (ISO 80000-4) of the optically active component in the path of the beam: `α_m = α A // m`
     * remarks: 
     */
    attribute def SpecificOpticalRotatoryPowerUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificOpticalRotatoryPowerValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificOpticalRotatoryPowerUnit :>> QuantityValue::mRef;
    }
    attribute specificOpticalRotatoryPower: SpecificOpticalRotatoryPowerValue :> quantity;

}
