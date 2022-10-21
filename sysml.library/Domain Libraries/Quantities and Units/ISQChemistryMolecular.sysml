standard library package ISQChemistryMolecular {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard ISO-80000-9:2019 "Physical chemistry and molecular physics"
     * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-9:ed-2:v1:en
     * 
     * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
     * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
     * Note 2: For vector and tensor quantities currently the unit and quantity value type for their (scalar) magnitude is 
     * defined, as well as their typical Cartesian 3d VectorMeasurementReference (i.e. coordinate system) 
     * or TensorMeasurementReference.
     */

    private import ScalarValues::Real;
    private import Quantities::*;
    private import MeasurementReferences::*;
    private import ISQBase::*;

    /* Quantity definitions referenced from other ISQ packages */
    private import ISQSpaceTime::AngularMeasureValue;
    private import ISQThermodynamics::EnergyValue;

    /* ISO-80000-9 item 9-1 number of entities */
    attribute numberOfEntities: CountValue :> scalarQuantities {
        doc
        /*
         * source: item 9-1 number of entities
         * symbol(s): `N(X)`, `N_X`
         * application domain: generic
         * name: NumberOfEntities (specializes Count)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: number of elementary entities of kind `X` in a system
         * remarks: The elementary entities must be specified and can be atoms, molecules, ions, electrons, other particle, or a specified group of such particles. It is important to always give a precise specification of the entity involved; this should preferably be done by the empirical chemical formula of the material involved.
         */
    }

    /* ISO-80000-9 item 9-2 amount of substance, number of moles */
    /* See package ISQBase for the declarations of AmountOfSubstanceValue and AmountOfSubstanceUnit */

    alias NumberOfMolesUnit for AmountOfSubstanceUnit;
    alias NumberOfMolesValue for AmountOfSubstanceValue;
    alias numberOfMoles for amountOfSubstance;

    /* ISO-80000-9 item 9-3 relative atomic mass */
    attribute def RelativeAtomicMassValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-3 relative atomic mass
         * symbol(s): `A_r(X)`
         * application domain: generic
         * name: RelativeAtomicMass (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the average mass (ISO 80000-4) of atom `X` and the unified atomic mass (ISO 80000-10)
         * remarks: A similar quantity "relative molecular mass" can be defined for molecules. EXAMPLE `A_r(Cl) ~~ 35.453` `A_r(CO_2) ~~ 44` The relative atomic or relative molecular mass depends on the nuclidic composition. The International Union of Pure and Applied Chemistry (IUPAC) accepts the use of the special names "atomic weight" and "molecular weight" for the quantities "relative atomic mass" and "relative molecular mass", respectively. The use of these traditional names is deprecated.
         */
    }
    attribute relativeAtomicMass: RelativeAtomicMassValue :> scalarQuantities;

    /* ISO-80000-9 item 9-4 molar mass */
    attribute def MolarMassValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-4 molar mass
         * symbol(s): `M(X)`
         * application domain: generic
         * name: MolarMass
         * quantity dimension: M^1*N^-1
         * measurement unit(s): g/mol, kg*mol^-1
         * tensor order: 0
         * definition: for a pure substance `X`, quotient of mass `m(X)` (ISO 80000-4) and amount `n` of substance (item 9-2): `M = m/n`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarMassUnit[1];
    }

    attribute molarMass: MolarMassValue[*] nonunique :> scalarQuantities;

    attribute def MolarMassUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-5 molar volume */
    attribute def MolarVolumeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-5 molar volume
         * symbol(s): `V_m`
         * application domain: generic
         * name: MolarVolume
         * quantity dimension: L^3*N^-1
         * measurement unit(s): m^3*mol^-1
         * tensor order: 0
         * definition: for a pure substance, quotient of its volume `V` (ISO 80000-3) and amount `n` of substance (item 9-2): `V_m = V/n`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarVolumeUnit[1];
    }

    attribute molarVolume: MolarVolumeValue[*] nonunique :> scalarQuantities;

    attribute def MolarVolumeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 3; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-6.1 molar internal energy */
    attribute def MolarInternalEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-6.1 molar internal energy
         * symbol(s): `U_m`
         * application domain: generic
         * name: MolarInternalEnergy
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: quotient of internal energy `U` (ISO 80000-5) and amount `n` of substance (item 9-2): `U_m = U/n`
         * remarks: Molar quantities are normally only used with reference to pure substances.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarInternalEnergyUnit[1];
    }

    attribute molarInternalEnergy: MolarInternalEnergyValue[*] nonunique :> scalarQuantities;

    attribute def MolarInternalEnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-6.2 molar enthalpy */
    attribute def MolarEnthalpyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-6.2 molar enthalpy
         * symbol(s): `H_m`
         * application domain: generic
         * name: MolarEnthalpy
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: quotient of enthalpy `H` (ISO 80000-5) and amount `n` of substance (item 9-2): `H_m = H/n`
         * remarks: Molar quantities are normally only used with reference to pure substances.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarEnthalpyUnit[1];
    }

    attribute molarEnthalpy: MolarEnthalpyValue[*] nonunique :> scalarQuantities;

    attribute def MolarEnthalpyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-6.3 molar Helmholtz energy */
    attribute def MolarHelmholtzEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-6.3 molar Helmholtz energy
         * symbol(s): `F_m`
         * application domain: generic
         * name: MolarHelmholtzEnergy
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: quotient of the Helmholtz energy `F` (ISO 80000-5) and amount `n` of substance (item 9-2): `F_m = F/n`
         * remarks: Molar quantities are normally only used with reference to pure substances.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarHelmholtzEnergyUnit[1];
    }

    attribute molarHelmholtzEnergy: MolarHelmholtzEnergyValue[*] nonunique :> scalarQuantities;

    attribute def MolarHelmholtzEnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-6.4 molar Gibbs energy */
    attribute def MolarGibbsEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-6.4 molar Gibbs energy
         * symbol(s): `G_m`
         * application domain: generic
         * name: MolarGibbsEnergy
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: quotient of the Gibbs energy `G` (ISO 80000-5) and amount `n` of substance (item 9-2): `G_m = G/n`
         * remarks: Molar quantities are normally only used with reference to pure substances.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarGibbsEnergyUnit[1];
    }

    attribute molarGibbsEnergy: MolarGibbsEnergyValue[*] nonunique :> scalarQuantities;

    attribute def MolarGibbsEnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-7 molar heat capacity */
    attribute def MolarHeatCapacityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-7 molar heat capacity
         * symbol(s): `C_m`
         * application domain: generic
         * name: MolarHeatCapacity
         * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
         * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
         * tensor order: 0
         * definition: quotient of heat capacity `C` (ISO 80000-5) and amount of substance `n` (item 9-2): `C_m = C/n`
         * remarks: Conditions (constant pressure or volume etc.) must be specified.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarHeatCapacityUnit[1];
    }

    attribute molarHeatCapacity: MolarHeatCapacityValue[*] nonunique :> scalarQuantities;

    attribute def MolarHeatCapacityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-8 molar entropy */
    attribute def MolarEntropyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-8 molar entropy
         * symbol(s): `S_m`
         * application domain: generic
         * name: MolarEntropy
         * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
         * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
         * tensor order: 0
         * definition: quotient of entropy `S` (ISO 80000-5) and amount `n` of substance (item 9-2): `S_m = S/n`
         * remarks: Conditions (constant pressure or volume etc.) must be specified.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarEntropyUnit[1];
    }

    attribute molarEntropy: MolarEntropyValue[*] nonunique :> scalarQuantities;

    attribute def MolarEntropyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-9.1 particle concentration */
    attribute def ParticleConcentrationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-9.1 particle concentration
         * symbol(s): `n`, `(C)`
         * application domain: generic
         * name: ParticleConcentration
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quotient of number `N` of particles (item 9-1) and volume `V `(ISO 80000-3): `n = N/V`
         * remarks: The term "number density" is also used.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ParticleConcentrationUnit[1];
    }

    attribute particleConcentration: ParticleConcentrationValue[*] nonunique :> scalarQuantities;

    attribute def ParticleConcentrationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-9 item 9-9.2 molecular concentration */
    attribute molecularConcentration: ParticleConcentrationValue :> scalarQuantities {
        doc
        /*
         * source: item 9-9.2 molecular concentration
         * symbol(s): `C(X)`, `C_X`
         * application domain: generic
         * name: MolecularConcentration (specializes ParticleConcentration)
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: for substance `X` in a mixture, quotient of number `N_X` of molecules of substance `X` and volume `V` (ISO 80000-3) of the mixture: `C_X = N_X/V`
         * remarks: None.
         */
    }

    /* ISO-80000-9 item 9-10 mass concentration */
    attribute def MassConcentrationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-10 mass concentration
         * symbol(s): `γ_X`, `(ρ_X)`
         * application domain: generic
         * name: MassConcentration
         * quantity dimension: L^-3*M^1
         * measurement unit(s): g/l, kg*m^-3
         * tensor order: 0
         * definition: for substance `X` in a mixture, quotient of mass `m_X` (ISO 80000-4) of substance `X` and volume `V` (ISO 80000-3) of the mixture: `γ_X = m_X/V`
         * remarks: Decided by the 16th CGPM (1979), both "l" and "L" are allowed for the symbols for the litre.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassConcentrationUnit[1];
    }

    attribute massConcentration: MassConcentrationValue[*] nonunique :> scalarQuantities;

    attribute def MassConcentrationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

    /* ISO-80000-9 item 9-11 mass fraction */
    attribute def MassFractionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-11 mass fraction
         * symbol(s): `w_X`
         * application domain: generic
         * name: MassFraction (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `X` in a mixture, quotient of mass `m_X` (ISO 80000-4) of substance `X` and total mass `m` of the mixture: `w_X = m_X/m`
         * remarks: None.
         */
    }
    attribute massFraction: MassFractionValue :> scalarQuantities;

    /* ISO-80000-9 item 9-12.1 amount-of-substance concentration */
    attribute def AmountOfSubstanceConcentrationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-12.1 amount-of-substance concentration
         * symbol(s): `c_X`
         * application domain: generic
         * name: AmountOfSubstanceConcentration
         * quantity dimension: L^-3*N^1
         * measurement unit(s): mol/l, mol*m^-3
         * tensor order: 0
         * definition: for substance `X` in a mixture, quotient of amount `n_X` of substance (item 9-2) of `X` and volume `V` (ISO 80000-3) of the mixture: `c_X = n_X/V`
         * remarks: In chemistry, the name "amount-of-substance concentration" is generally abbreviated to the single word "concentration", it being assumed that the adjective "amount-of-substance" is intended. For this reason, however, the word "mass" should never be omitted from the name "mass concentration" in item 9-10. Decided by the 16th CGPM (1979), both "l" and "L" are allowed for the symbols for the litre.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AmountOfSubstanceConcentrationUnit[1];
    }

    attribute amountOfSubstanceConcentration: AmountOfSubstanceConcentrationValue[*] nonunique :> scalarQuantities;

    attribute def AmountOfSubstanceConcentrationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-12.2 standard amount-of-substance concentration */
    attribute standardAmountOfSubstanceConcentration: AmountOfSubstanceConcentrationValue :> scalarQuantities {
        doc
        /*
         * source: item 9-12.2 standard amount-of-substance concentration
         * symbol(s): `c^!(X)`
         * application domain: generic
         * name: StandardAmountOfSubstanceConcentration (specializes AmountOfSubstanceConcentration)
         * quantity dimension: L^-3*N^1
         * measurement unit(s): mol/l, mol*m^-3
         * tensor order: 0
         * definition: for substance `X`, one mole per litre
         * remarks: Decided by the 16th CGPM (1979), both "l" and "L" are allowed for the symbols for the litre.
         */
    }

    /* ISO-80000-9 item 9-13 amount-of-substance fraction mole fraction */
    attribute def AmountOfSubstanceFractionMoleFractionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-13 amount-of-substance fraction mole fraction
         * symbol(s): `x_X`, `y_X`
         * application domain: generic
         * name: AmountOfSubstanceFractionMoleFraction (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `X` in a mixture, quotient of amount of substance `n_X` (item 9-2) of `X` and total amount `n` of substance (item 9-2) in the mixture: `x_X = n_X/n`
         * remarks: For condensed phases, `x_X` is used, and for gaseous mixtures `y_X` may be used. The unsystematic name "mole fraction" is still used. However, the use of this name is deprecated. For this quantity, the entity used to define the amount of substance should always be a single molecule for every species in the mixture.
         */
    }
    attribute amountOfSubstanceFractionMoleFraction: AmountOfSubstanceFractionMoleFractionValue :> scalarQuantities;

    /* ISO-80000-9 item 9-14 volume fraction */
    attribute def VolumeFractionValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-14 volume fraction
         * symbol(s): `φ_X`
         * application domain: generic
         * name: VolumeFraction
         * quantity dimension: 1
         * measurement unit(s): ml/l, 1
         * tensor order: 0
         * definition: for substance `X`, quotient of product of amount of substance fraction `x_X` (item 9-13) of `X` and molar volume `V_(m,X)` (item 9-5) of the pure substance `X` at the same temperature (ISO 80000-5) and pressure (ISO 80000-4), and sum over all substances `i` of products of amount-of-substance fractions `x_i` (item 9-13) of substance `i` and their molar volumes `V_(m,i)` (item 9-5): `φ_X = (x_X V_(m,X))/(sum_i x_i V_(m,i))`
         * remarks: Generally, the volume fraction is temperature dependent. Decided by the 16th CGPM (1979), both "l" and "L" are allowed for the symbols for the litre.
         */
        attribute :>> num: Real;
        attribute :>> mRef: VolumeFractionUnit[1];
    }

    attribute volumeFraction: VolumeFractionValue[*] nonunique :> scalarQuantities;

    attribute def VolumeFractionUnit :> DimensionOneUnit {
    }

    /* ISO-80000-9 item 9-15 molality */
    attribute def MolalityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-15 molality
         * symbol(s): `b_B`, `m_B`
         * application domain: generic
         * name: Molality
         * quantity dimension: M^-1*N^1
         * measurement unit(s): mol/kg
         * tensor order: 0
         * definition: quotient of amount of substance (item 9-2) of solute `B` and mass `m_A` (ISO 80000-4) of the solvent substance `A`: `b_B = n_B/m_A`
         * remarks: The alternative symbol `m_B` should be avoided in situations where it might be mistaken for the mass of substance B. However, the symbol `m_B` is much more commonly used than the symbol `b_B` for molality, despite the possible confusion with mass.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolalityUnit[1];
    }

    attribute molality: MolalityValue[*] nonunique :> scalarQuantities;

    attribute def MolalityUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-16 latent heat of phase transition, enthalpy of phase transition */
    attribute latentHeatOfPhaseTransition: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 9-16 latent heat of phase transition, enthalpy of phase transition
         * symbol(s): `C_"pt"`
         * application domain: generic
         * name: LatentHeatOfPhaseTransition (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: energy (ISO 80000-5) necessary to be added or subtracted isothermally and isobarically to a system to completely undergo the phase transition
         * remarks: Mostly, molar or specific quantity is used and phase transition is expressed explicitly, e.g. molar latent heat of evaporation. The subscript "pt" is the qualifier for the phase transition, which may be changed to e.g. "l-g". The term "enthalpy of phase transition" is mainly used in theory.
         */
    }

    alias enthalpyOfPhaseTransition for latentHeatOfPhaseTransition;

    /* ISO-80000-9 item 9-17 chemical potential */
    attribute def ChemicalPotentialValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-17 chemical potential
         * symbol(s): `μ_X`
         * application domain: chemistry
         * name: ChemicalPotential
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: partial derivative of the Gibbs energy (ISO 80000-5) with respect to amount `n_X` of substance `X` (item 9-2) at constant temperature `T` (ISO 80000-5) and pressure `p `(ISO 80000-4): `μ_X = ((del G)/(del n_X))_(T,p)`
         * remarks: For a pure substance, where `G_m` is the molar Gibbs energy. In a mixture, `μ_B` is the partial molar Gibbs energy. In condensed matter physics, the chemical potential of electrons is energy.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ChemicalPotentialUnit[1];
    }

    attribute chemicalPotential: ChemicalPotentialValue[*] nonunique :> scalarQuantities;

    attribute def ChemicalPotentialUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-18 absolute activity */
    attribute def AbsoluteActivityValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-18 absolute activity
         * symbol(s): `λ_X`
         * application domain: generic
         * name: AbsoluteActivity (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `X`, exponential of quotient of chemical potential `μ_X` of substance `B` (item 9-17), and product of molar gas constant `R` (item 9-37.1) and thermodynamic temperature `T` (ISO 80000-5): `λ_X = exp(μ_X/(RT))`
         * remarks: None.
         */
    }
    attribute absoluteActivity: AbsoluteActivityValue :> scalarQuantities;

    /* ISO-80000-9 item 9-19 partial pressure */
    attribute def PartialPressureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-19 partial pressure
         * symbol(s): `p_X`
         * application domain: generic
         * name: PartialPressure
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): Pa, kg*m^-1*s^-2
         * tensor order: 0
         * definition: for substance `X` in a gaseous mixture, product of amount-of-substance fraction `y_X` of substance X (item 9-13) and total pressure `p` (ISO 80000-4): `p_X = y_X p`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PartialPressureUnit[1];
    }

    attribute partialPressure: PartialPressureValue[*] nonunique :> scalarQuantities;

    attribute def PartialPressureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-9 item 9-20 fugacity */
    attribute def FugacityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-20 fugacity
         * symbol(s): `tilde(p)_X`
         * application domain: generic
         * name: Fugacity
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): Pa, kg*m^-1*s^-2
         * tensor order: 0
         * definition: for substance `X`, quantity proportional to the absolute activity, `λ_X` (item 9-18), the proportionality factor, which is a function of temperature (ISO 80000-5) only, being determined by the condition that, at constant temperature and composition, `p_X/tilde(p)_X` tends to 1 for an indefinitely dilute gas
         * remarks: `tilde(p)_X = λ_X * lim_(p->0) (p_X/λ_X)` where `p` is total pressure (ISO 80000-4). The IUPAC preferred symbol for fugacity is `f`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: FugacityUnit[1];
    }

    attribute fugacity: FugacityValue[*] nonunique :> scalarQuantities;

    attribute def FugacityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-9 item 9-21 standard chemical potential */
    attribute def StandardChemicalPotentialValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-21 standard chemical potential
         * symbol(s): `μ_B^!`, `μ^!`
         * application domain: generic
         * name: StandardChemicalPotential
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: for substance `B`, value of the chemical potential (item 9-17) at specified standard conditions
         * remarks: `μ_B^! = RT ln(λ^!)` where `μ_B^!` is a function of temperature `T` at the standard pressure `p = p^!` The standard chemical potential depends on the choice of standard state, which must be specified. In a liquid or solid solution, the standard state is referenced to the ideal dilute behaviour of the solute (substance `B`).
         */
        attribute :>> num: Real;
        attribute :>> mRef: StandardChemicalPotentialUnit[1];
    }

    attribute standardChemicalPotential: StandardChemicalPotentialValue[*] nonunique :> scalarQuantities;

    attribute def StandardChemicalPotentialUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-22 activity factor */
    attribute def ActivityFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-22 activity factor
         * symbol(s): `f_X`
         * application domain: generic
         * name: ActivityFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `X` in a liquid or a solid mixture, quotient of absolute activity `λ_X` (item 9-18) of substance `X` and the product of absolute activity `λ_X^"*"` of the pure substance `X` at the same temperature (ISO 80000-5) and pressure (ISO 80000-4) and amount-of-substance fraction `x_X` of substance `X` (item 9-13): `f_X = λ_X/(λ_X^"*" x_X)`
         * remarks: The systematic name is "activity factor", but the name "activity coefficient" is also commonly used (see item 9-25). Activity factors can also be obtained applying Raoult’s law or Henry’s law.
         */
    }
    attribute activityFactor: ActivityFactorValue :> scalarQuantities;

    /* ISO-80000-9 item 9-23 standard absolute activity in mixture */
    attribute def StandardAbsoluteActivityInMixtureValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-23 standard absolute activity in mixture
         * symbol(s): `λ_X^!`
         * application domain: in a mixture
         * name: StandardAbsoluteActivityInMixture (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `X` in a liquid or a solid mixture, absolute activity `λ_X^"*"` (item 9-18) of the pure substance `X` at the same temperature (ISO 80000-5) but at standard pressure (ISO 80000-4) `10^5 ["Pa"]`: `λ_X^! = λ_X"*" (p^!)`
         * remarks: This quantity is a function of temperature only.
         */
    }
    attribute standardAbsoluteActivityInMixture: StandardAbsoluteActivityInMixtureValue :> scalarQuantities;

    /* ISO-80000-9 item 9-24 activity of solute, relative activity of solute */
    attribute def ActivityOfSoluteValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-24 activity of solute, relative activity of solute
         * symbol(s): `a_X`, `a_(m,X)`
         * application domain: generic
         * name: ActivityOfSolute (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for a solute `X` in a solution, quantity proportional to the absolute activity, `λ_X` (item 9-18), the proportionality factor, which is a function of temperature (ISO 80000-5) and pressure (ISO 80000-4) only, being determined by the condition that, at constant temperature and pressure, `a_X` divided by the molality (item 9-15) ratio, `b_X/b^!` tends to 1 at infinite dilution; `b_X` is the molality of solute `X` (item 9-15), and `b^!` is standard molality: `a_X = λ_X * lim_(sum b_X -> 0) (b_X//b^!)/λ_X`
         * remarks: The quantity `a_(c,X)` , similarly defined in terms of the concentration ratio `c_X/c^!` , is also called the activity or relative activity of solute `X`; `c^!` is a standard amount-of-substance concentration (item 9-12.2): `a_(c,X) = λ_X * lim_(sum c_X -> 0) (c_X//c^!)/λ_X`, where `sum` denotes summation over all the solute substances. This especially applies to a dilute liquid solution.
         */
    }
    attribute activityOfSolute: ActivityOfSoluteValue :> scalarQuantities;

    alias relativeActivityOfSolute for activityOfSolute;

    /* ISO-80000-9 item 9-25 activity coefficient */
    attribute def ActivityCoefficientValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-25 activity coefficient
         * symbol(s): `γ_B`
         * application domain: generic
         * name: ActivityCoefficient (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for a solute `B` in a solution, quotient of activity `a_B` of solute `B` (item 9-24), and quotient of the molality (item 9-15) `b_B` of substance `B` and standard molality `b^!`: `γ_B = a_B/(b_B//b^!)`
         * remarks: The name "activity coefficient of solute B" is also used for the quantity `γ_B` defined as: `γ_B = a_(c,B)/(c_B//c^!)` See item 9-22.
         */
    }
    attribute activityCoefficient: ActivityCoefficientValue :> scalarQuantities;

    /* ISO-80000-9 item 9-26 standard absolute activity in solution */
    attribute def StandardAbsoluteActivityInSolutionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-26 standard absolute activity in solution
         * symbol(s): `λ_B^!`
         * application domain: in a solution
         * name: StandardAbsoluteActivityInSolution (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for a solute `B` in a solution: `λ_B^! = lim_(sum b_B -> 0) [λ_B ((p^!)b^!)/b_B]` where ∑ denotes summation over all solutes, `p^!` is a standard pressure (ISO 80000-4), `b^!` is standard molality, and `b_B` is the molality of substance `B` (item 9-15)
         * remarks: This quantity is a function of temperature only. It especially applies to a dilute liquid solution. The standard pressure is `10^5 ["Pa"]`.
         */
    }
    attribute standardAbsoluteActivityInSolution: StandardAbsoluteActivityInSolutionValue :> scalarQuantities;

    /* ISO-80000-9 item 9-27.1 activity of solvent, relative activity of solvent */
    attribute def ActivityOfSolventValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-27.1 activity of solvent, relative activity of solvent
         * symbol(s): `a_A`
         * application domain: generic
         * name: ActivityOfSolvent (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for the solvent `A` in a solution, quotient of the absolute activity of substance `A`, `λ_A` (item 9-18), and that, `λ_A^"*"` , of the pure solvent at the same temperature (ISO 80000-5) and pressure (ISO 80000-4): `a_A = λ_A/λ_A^"*"`
         * remarks: None.
         */
    }
    attribute activityOfSolvent: ActivityOfSolventValue :> scalarQuantities;

    alias relativeActivityOfSolvent for activityOfSolvent;

    /* ISO-80000-9 item 9-27.2 osmotic factor of solvent, osmotic coefficient of solvent A */
    attribute def OsmoticFactorOfSolventValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-27.2 osmotic factor of solvent, osmotic coefficient of solvent A
         * symbol(s): `φ`
         * application domain: generic
         * name: OsmoticFactorOfSolvent (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `φ = -(M_A sum b_B)^-1 ln(a_A)` where `M_A` is the molar mass (item 9-4) of the solvent A, ∑ denotes summation over all the solutes, `b_B` is the molality of solute B (item 9-15), and `a_A` is the activity of solvent A (item 9-27.1)
         * remarks: The name "osmotic coefficient" is generally used, although the name "osmotic factor" is more systematic. This concept especially applies to a dilute liquid solution.
         */
    }
    attribute osmoticFactorOfSolvent: OsmoticFactorOfSolventValue :> scalarQuantities;

    alias osmoticCoefficientOfSolventA for osmoticFactorOfSolvent;

    /* ISO-80000-9 item 9-27.3 standard absolute activity of solvent */
    attribute def StandardAbsoluteActivityOfSolventValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-27.3 standard absolute activity of solvent
         * symbol(s): `λ_A^!`
         * application domain: in a dilute solution
         * name: StandardAbsoluteActivityOfSolvent (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for solvent `A`, standard absolute activity (item 9-23) of the pure substance `A` at the same temperature (ISO 80000-5) and at a standard pressure `p^!` (ISO 80000-4): `λ_A^! = λ_A^"*" p^!`
         * remarks: None.
         */
    }
    attribute standardAbsoluteActivityOfSolvent: StandardAbsoluteActivityOfSolventValue :> scalarQuantities;

    /* ISO-80000-9 item 9-28 osmotic pressure */
    attribute def OsmoticPressureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-28 osmotic pressure
         * symbol(s): `Π`
         * application domain: generic
         * name: OsmoticPressure
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): Pa, kg*m^-1*s^-2
         * tensor order: 0
         * definition: excess pressure (ISO 80000-4) required to maintain osmotic equilibrium between a solution and the pure solvent separated by a membrane permeable to the solvent only
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: OsmoticPressureUnit[1];
    }

    attribute osmoticPressure: OsmoticPressureValue[*] nonunique :> scalarQuantities;

    attribute def OsmoticPressureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-9 item 9-29 stoichiometric number of substance */
    attribute def StoichiometricNumberOfSubstanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-29 stoichiometric number of substance
         * symbol(s): `ν_B`
         * application domain: generic
         * name: StoichiometricNumberOfSubstance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for substance `B`, an integer number or a simple fraction, being negative for a reactant and positive for a product, occurring in the expression for a chemical reaction: `0 = sum ν_B` where the symbol `B` denotes the reactants and products involved in the reaction
         * remarks: EXAMPLE `(1/2)"N"_2 + (3/2)"H"_2 = "N""H"_3` ; `ν("N"_2) = -1/2`, `ν("H"_2) = -3/2`, `ν("N""H"_3) = +1`.
         */
    }
    attribute stoichiometricNumberOfSubstance: StoichiometricNumberOfSubstanceValue :> scalarQuantities;

    /* ISO-80000-9 item 9-30 affinity of a chemical reaction */
    attribute def AffinityOfAChemicalReactionValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-30 affinity of a chemical reaction
         * symbol(s): `A`
         * application domain: generic
         * name: AffinityOfAChemicalReaction
         * quantity dimension: L^2*M^1*T^-2*N^-1
         * measurement unit(s): J/mol, kg*m^2*s^-2*mol^-1
         * tensor order: 0
         * definition: negative of the sum over all substances `B` of products of stoichiometric number `ν_B` of substance `B` (item 9-29) and chemical potential `μ_B` of substance `B` (item 9-17): `A = -sum ν_B μ_B`
         * remarks: The affinity of a reaction is a measure of the "driving force" of the reaction. When it is positive, the reaction goes spontaneously from reactants to products, and when it is negative, the reaction goes in the opposite direction. Another way to write the definition is: `A = ((del G)/(del ξ))_(p,T)` where `G` is Gibbs energy (ISO 80000-5) and `ξ` is the extent of the reaction (item 9-31). Note that `ν_B` is negative for reactants and positive for products.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AffinityOfAChemicalReactionUnit[1];
    }

    attribute affinityOfAChemicalReaction: AffinityOfAChemicalReactionValue[*] nonunique :> scalarQuantities;

    attribute def AffinityOfAChemicalReactionUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-31 extent of reaction */
    attribute extentOfReaction: AmountOfSubstanceValue :> scalarQuantities {
        doc
        /*
         * source: item 9-31 extent of reaction
         * symbol(s): `ξ`
         * application domain: generic
         * name: ExtentOfReaction (specializes AmountOfSubstance)
         * quantity dimension: N^1
         * measurement unit(s): mol
         * tensor order: 0
         * definition: difference of initial amount `n_(B "in")` of substance `B` (item 9-2) and equilibrium amount `n_(B "eq")` of substance `B` (item 9-2) divided by stoichiometric number `ν_B` of substance `B` (item 9-29): `ξ = (n_(B "eq") - n_(B "in"))/ν_B`
         * remarks: See remark to item 9-30.
         */
    }

    /* ISO-80000-9 item 9-32 standard equilibrium constant, thermodynamic equilibrium constant */
    attribute def StandardEquilibriumConstantValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-32 standard equilibrium constant, thermodynamic equilibrium constant
         * symbol(s): `K^!`
         * application domain: generic
         * name: StandardEquilibriumConstant (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for a chemical reaction, product for all substances `B` of standard absolute activity `λ_B^!` of substance `B` (item 9-26) in power of minus stoichiometric number `ν_B` of substance `B` (item 9-29): `K^! = prod_B (tilde(a) λ_B^!)^(-ν_B)`
         * remarks: This quantity is a function of temperature only. Others depend on temperature, pressure, and composition. One can define in an analogous way an equilibrium constant in terms of fugacity, `K_f`, molality, `K_m`, etc.
         */
    }
    attribute standardEquilibriumConstant: StandardEquilibriumConstantValue :> scalarQuantities;

    alias thermodynamicEquilibriumConstant for standardEquilibriumConstant;

    /* ISO-80000-9 item 9-33 equilibrium constant on pressure basis */
    attribute def EquilibriumConstantOnPressureBasisValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-33 equilibrium constant on pressure basis
         * symbol(s): `K_p`
         * application domain: pressure basis
         * name: EquilibriumConstantOnPressureBasis
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): Pa, kg*m^-1*s^-2
         * tensor order: 0
         * definition: for gases, product for all substances `B` of partial pressure `p_B` of substance `B` (item 9-19) in power of its stoichiometric number `ν_B` (item 9-29): `K_p = prod_B (p_B)^(ν_B)`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: EquilibriumConstantOnPressureBasisUnit[1];
    }

    attribute equilibriumConstantOnPressureBasis: EquilibriumConstantOnPressureBasisValue[*] nonunique :> scalarQuantities;

    attribute def EquilibriumConstantOnPressureBasisUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-9 item 9-34 equilibrium constant on concentration basis */
    attribute def EquilibriumConstantOnConcentrationBasisValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-34 equilibrium constant on concentration basis
         * symbol(s): `K_c`
         * application domain: concentration basis
         * name: EquilibriumConstantOnConcentrationBasis
         * quantity dimension: L^-3*N^1
         * measurement unit(s): mol/m^3
         * tensor order: 0
         * definition: for solutions, product for all substances `B` of concentration `c_B` of substance `B` (item 9-9.1) in power of its stoichiometric number `ν_B` (item 9-29): `K_c = prod_B (c_B)^(ν_B)`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: EquilibriumConstantOnConcentrationBasisUnit[1];
    }

    attribute equilibriumConstantOnConcentrationBasis: EquilibriumConstantOnConcentrationBasisValue[*] nonunique :> scalarQuantities;

    attribute def EquilibriumConstantOnConcentrationBasisUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-35.1 microcanonical partition function */
    attribute microcanonicalPartitionFunction: CountValue :> scalarQuantities {
        doc
        /*
         * source: item 9-35.1 microcanonical partition function
         * symbol(s): `Ω`
         * application domain: generic
         * name: MicrocanonicalPartitionFunction (specializes Count)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: number of all quantum states `r` consistent with given energy `E` (ISO 80000-4), volume (ISO 80000-3), and external fields: `Ω = sum_r 1`
         * remarks: `S = k ln(Ω)` where `S` is entropy (ISO 80000-5) and `k` is the Boltzmann constant (ISO 80000-1).
         */
    }

    /* ISO-80000-9 item 9-35.2 canonical partition function */
    attribute def CanonicalPartitionFunctionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-35.2 canonical partition function
         * symbol(s): `Z`
         * application domain: generic
         * name: CanonicalPartitionFunction (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: sum over quantum states of energy `E_r` (ISO 80000-4), expressed by: `Z = sum_r exp(-E_r/(kT))` where `k` is the Boltzmann constant (ISO 80000-1), and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: `A = -kT ln(Z)` where `A` is Helmholtz energy (ISO 80000-5).
         */
    }
    attribute canonicalPartitionFunction: CanonicalPartitionFunctionValue :> scalarQuantities;

    /* ISO-80000-9 item 9-35.3 grand-canonical partition function, grand partition function */
    attribute def GrandCanonicalPartitionFunctionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-35.3 grand-canonical partition function, grand partition function
         * symbol(s): `Ξ`
         * application domain: generic
         * name: GrandCanonicalPartitionFunction (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: sum of canonical partition function `Z(N_A,N_B,…)` for the given number of particles `A,B` multiplied by absolute activities (item 9-18) `λ_A, λ_B, ...` of particles `A, B`: `Ξ = sum_(N_A, N_B, ...) Z(N_A, N_B, …) * λ_A^(N_A) * λ_B^(N_B) * ...`
         * remarks: `A - sum μ_B n_B = -kT ln(Ξ)` where `A` is Helmholtz energy (ISO 80000-5), `μ_B` is the chemical potential of substance `B`, and `n_B` is the amount of substance `B`.
         */
    }
    attribute grandCanonicalPartitionFunction: GrandCanonicalPartitionFunctionValue :> scalarQuantities;

    alias grandPartitionFunction for grandCanonicalPartitionFunction;

    /* ISO-80000-9 item 9-35.4 molecular partition function, partition function of a molecule */
    attribute def MolecularPartitionFunctionValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-35.4 molecular partition function, partition function of a molecule
         * symbol(s): `q`
         * application domain: generic
         * name: MolecularPartitionFunction (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `q = sum_r exp(-ε_r/(kT))` where `ε_r` is the energy (ISO 80000-5) of the `r`-th level of the molecule consistent with given volume (ISO 80000-3) and external fields, `k` is the Boltzmann constant (ISO 80000-1), and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute molecularPartitionFunction: MolecularPartitionFunctionValue :> scalarQuantities;

    alias partitionFunctionOfAMolecule for molecularPartitionFunction;

    /* ISO-80000-9 item 9-36.1 statistical weight of subsystem */
    attribute statisticalWeightOfSubsystem: CountValue :> scalarQuantities {
        doc
        /*
         * source: item 9-36.1 statistical weight of subsystem
         * symbol(s): `g`
         * application domain: generic
         * name: StatisticalWeightOfSubsystem (specializes Count)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: number of different microstates in a subsystem
         * remarks: None.
         */
    }

    /* ISO-80000-9 item 9-36.2 degeneracy, multiplicity */
    attribute def DegeneracyValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-36.2 degeneracy, multiplicity
         * symbol(s): `g`
         * application domain: generic
         * name: Degeneracy (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for quantum level, statistical weight of that level
         * remarks: If `g = 1`, the level is called non-degenerate.
         */
    }
    attribute degeneracy: DegeneracyValue :> scalarQuantities;

    alias multiplicity for degeneracy;

    /* ISO-80000-9 item 9-37.1 molar gas constant */
    attribute def MolarGasConstantValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-37.1 molar gas constant
         * symbol(s): `R`
         * application domain: generic
         * name: MolarGasConstant
         * quantity dimension: L^2*M^1*T^-2*Θ^-1*N^-1
         * measurement unit(s): J/(mol*K), kg*m^2*s^-2*K^-1*mol^-1
         * tensor order: 0
         * definition: product of the Boltzmann constant (ISO 80000-1) and the Avogadro constant (ISO 80000-1)
         * remarks: For an ideal gas, `pV_m = RT`
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarGasConstantUnit[1];
    }

    attribute molarGasConstant: MolarGasConstantValue[*] nonunique :> scalarQuantities;

    attribute def MolarGasConstantUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-37.2 specific gas constant */
    /* Refer to declaration for SpecificGasConstant in ISQThermodynamics item 5-26 specific gas constant */

    /* ISO-80000-9 item 9-38 mean free path */
    attribute meanFreePath: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 9-38 mean free path
         * symbol(s): `l`, `λ`
         * application domain: chemistry
         * name: MeanFreePath (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: for a particle, the average distance `d` (ISO 80000-3) between two successive collisions with other particles
         * remarks: None.
         */
    }

    /* ISO-80000-9 item 9-39 diffusion coefficient */
    attribute def DiffusionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-39 diffusion coefficient
         * symbol(s): `D`
         * application domain: chemistry
         * name: DiffusionCoefficient
         * quantity dimension: L^2*T^-1
         * measurement unit(s): m^2*s^-1
         * tensor order: 0
         * definition: proportionality coefficient of local molecular concentration `C_B` (item 9-9.2) of substance `B` in the mixture multiplied by the local average velocity (ISO 80000-3) `v_B` of the molecules of `B`, and minus the gradient of the local molecular concentration `C_B` (item 9-9.2) of substance `B` in the mixture, expressed by: `C_B(v_B) = -D grad C_B`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DiffusionCoefficientUnit[1];
    }

    attribute diffusionCoefficient: DiffusionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def DiffusionCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-9 item 9-40.1 thermal diffusion ratio */
    attribute def ThermalDiffusionRatioValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-40.1 thermal diffusion ratio
         * symbol(s): `k_T`
         * application domain: generic
         * name: ThermalDiffusionRatio (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: in a steady-state of a binary mixture in which thermal diffusion occurs, proportionality factor between gradient of the amount-of-subsstance fraction `x_B` (item 9-13) of the heavier substance `B`, and negative gradient of the local thermodynamic temperature `T` (ISO 80000-5) divided by that temperature (ISO 80000-5): `grad x_B = -(k_T/T) grad T`
         * remarks: None.
         */
    }
    attribute thermalDiffusionRatio: ThermalDiffusionRatioValue :> scalarQuantities;

    /* ISO-80000-9 item 9-40.2 thermal diffusion factor */
    attribute def ThermalDiffusionFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-40.2 thermal diffusion factor
         * symbol(s): `α_T`
         * application domain: generic
         * name: ThermalDiffusionFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the thermal diffusion ratio `k_T` (item 9-40.1), and the product of the local amount-of-substance fractions `x_A`, `x_B` (item 9-13) of two substances `A` and `B`: `α_T = k_T//(x_A x_B)`
         * remarks: None.
         */
    }
    attribute thermalDiffusionFactor: ThermalDiffusionFactorValue :> scalarQuantities;

    /* ISO-80000-9 item 9-41 thermal diffusion coefficient */
    attribute def ThermalDiffusionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-41 thermal diffusion coefficient
         * symbol(s): `D_T`
         * application domain: generic
         * name: ThermalDiffusionCoefficient
         * quantity dimension: L^2*T^-1
         * measurement unit(s): m^2*s^-1
         * tensor order: 0
         * definition: product of the thermal diffusion ratio `k_T` (item 9-40.1) and the diffusion coefficient `D` (item 9-39): `D_T = k_T*D`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalDiffusionCoefficientUnit[1];
    }

    attribute thermalDiffusionCoefficient: ThermalDiffusionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def ThermalDiffusionCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-9 item 9-42 ionic strength */
    attribute def IonicStrengthValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-42 ionic strength
         * symbol(s): `I`
         * application domain: generic
         * name: IonicStrength
         * quantity dimension: M^-1*N^1
         * measurement unit(s): mol*kg^-1
         * tensor order: 0
         * definition: in a sample, one half of the sum of square of the charge number `z_i` (ISO 80000-10) of `i`-th ion multiplied by its molality `b_i` (item 9-15) over any involved ion: `I = 1/2 sum z_i^2 b_i`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: IonicStrengthUnit[1];
    }

    attribute ionicStrength: IonicStrengthValue[*] nonunique :> scalarQuantities;

    attribute def IonicStrengthUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-43 degree of dissociation, dissociation fraction */
    attribute def DegreeOfDissociationValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-43 degree of dissociation, dissociation fraction
         * symbol(s): `α`
         * application domain: generic
         * name: DegreeOfDissociation (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: in a sample, quotient of the number `n_d` of dissociated molecules and the total number `n` of molecules: `α = n_D / n`
         * remarks: None.
         */
    }
    attribute degreeOfDissociation: DegreeOfDissociationValue :> scalarQuantities;

    alias dissociationFraction for degreeOfDissociation;

    /* ISO-80000-9 item 9-44 electrolytic conductivity */
    attribute def ElectrolyticConductivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-44 electrolytic conductivity
         * symbol(s): `κ`
         * application domain: generic
         * name: ElectrolyticConductivity
         * quantity dimension: L^-3*M^-1*T^3*I^2
         * measurement unit(s): S/m, kg^-1*m^-3*s^3*A^2
         * tensor order: 0
         * definition: quotient of the magnitude of electric current density `J` (IEC 80000-6) and the magnitude electric field strength `E` (IEC 80000-6) in an electrolyte: `κ = J/E`
         * remarks: For anisotropic media, `κ` is a tensor. In IEC 80000-6 the symbols `σ`, `γ` are used.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectrolyticConductivityUnit[1];
    }

    attribute electrolyticConductivity: ElectrolyticConductivityValue[*] nonunique :> scalarQuantities;

    attribute def ElectrolyticConductivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* ISO-80000-9 item 9-45 molar conductivity */
    attribute def MolarConductivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-45 molar conductivity
         * symbol(s): `Λ_m`
         * application domain: generic
         * name: MolarConductivity
         * quantity dimension: M^-1*T^3*I^2*N^-1
         * measurement unit(s): S*m^2/mol, kg^-1*s^3*A^2*mol^-1
         * tensor order: 0
         * definition: in an electrolyte, quotient of electrolytic conductivity `κ` (item 9-44) and amount-of-substance concentration `c_B` (item 9-12.1): `Λ_m = κ/c_B`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarConductivityUnit[1];
    }

    attribute molarConductivity: MolarConductivityValue[*] nonunique :> scalarQuantities;

    attribute def MolarConductivityUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, electricCurrentPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-46 transport number of the ion B, current fraction of the ion B */
    attribute def TransportNumberOfTheIonBValue :> DimensionOneValue {
        doc
        /*
         * source: item 9-46 transport number of the ion B, current fraction of the ion B
         * symbol(s): `t_B`
         * application domain: generic
         * name: TransportNumberOfTheIonB (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for the ion `B`, quotient of electric current `i_B` (IEC 80000-6) carried by the ion `B` and total electric current `i` (IEC 80000-6) in an electrolyte: `t_B = i_B/i`
         * remarks: None.
         */
    }
    attribute transportNumberOfTheIonB: TransportNumberOfTheIonBValue :> scalarQuantities;

    alias currentFractionOfTheIonB for transportNumberOfTheIonB;

    /* ISO-80000-9 item 9-47 angle of optical rotation */
    attribute angleOfOpticalRotation: AngularMeasureValue :> scalarQuantities {
        doc
        /*
         * source: item 9-47 angle of optical rotation
         * symbol(s): `α`
         * application domain: generic
         * name: AngleOfOpticalRotation (specializes AngularMeasure)
         * quantity dimension: 1
         * measurement unit(s): rad
         * tensor order: 0
         * definition: angle through which plane-polarized light is rotated clockwise, as seen when facing the light source, in passing through an optically active medium
         * remarks: None.
         */
    }

    /* ISO-80000-9 item 9-48 molar optical rotatory power */
    attribute def MolarOpticalRotatoryPowerValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-48 molar optical rotatory power
         * symbol(s): `α_n`
         * application domain: generic
         * name: MolarOpticalRotatoryPower
         * quantity dimension: L^2*N^-1
         * measurement unit(s): rad*m^2/mol, m^2*mol^-1
         * tensor order: 0
         * definition: angle `α` of optical rotation (item 9-47), multiplied by the quotient of cross-sectional area `A` (ISO 80000-3) of a linearly polarized light beam and the amount of substance `n` (item 9-2) of the optically active component in the path of the beam: `α_n = (α A)/n`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarOpticalRotatoryPowerUnit[1];
    }

    attribute molarOpticalRotatoryPower: MolarOpticalRotatoryPowerValue[*] nonunique :> scalarQuantities;

    attribute def MolarOpticalRotatoryPowerUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, amountOfSubstancePF); }
    }

    /* ISO-80000-9 item 9-49 specific optical rotatory power */
    attribute def SpecificOpticalRotatoryPowerValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-49 specific optical rotatory power
         * symbol(s): `α_m`
         * application domain: generic
         * name: SpecificOpticalRotatoryPower
         * quantity dimension: L^2*M^-1
         * measurement unit(s): rad*m^2/kg^1, kg^-1*m^2
         * tensor order: 0
         * definition: angle `α` of optical rotation (item 9-47), multiplied by the quotient of cross-sectional area `A` (ISO 80000-3) of a linearly polarized light beam and the mass `m` (ISO 80000-4) of the optically active component in the path of the beam: `α_m = (α A)/m`
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificOpticalRotatoryPowerUnit[1];
    }

    attribute specificOpticalRotatoryPower: SpecificOpticalRotatoryPowerValue[*] nonunique :> scalarQuantities;

    attribute def SpecificOpticalRotatoryPowerUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

}
