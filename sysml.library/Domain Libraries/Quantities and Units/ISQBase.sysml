standard library package ISQBase {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard ISO/IEC 80000
     * 
     * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
     * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
     */

    private import ScalarValues::Real;
    private import Quantities::*;
    private import MeasurementReferences::*;

    /* ISO-80000-3 item 3-1.1 length */
    attribute def LengthValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 3-1.1 length
         * symbol(s): `l`, `L`
         * application domain: generic
         * name: Length
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: linear extent in space between any two points
         * remarks: Length does not need to be measured along a straight line. Length is one of the seven base quantities in the International System of Units (ISO 80000-1).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LengthUnit[1];
    }

    attribute length: LengthValue[*] nonunique :> scalarQuantities;

    attribute def LengthUnit :> SimpleUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    attribute def Cartesian3dSpatialCoordinateFrame :> VectorMeasurementReference {
        doc
        /*
         * General spatial coordinate system
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = true;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: LengthValue[3];
    }

    /* ISO-80000-3 item 3-9 duration, time */
    attribute def DurationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 3-9 duration, time
         * symbol(s): `t`
         * application domain: generic
         * name: Duration
         * quantity dimension: T^1
         * measurement unit(s): s
         * tensor order: 0
         * definition: measure of the time difference between two events
         * remarks: Duration is often just called time. Time is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). Duration is a measure of a time interval.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DurationUnit[1];
    }

    attribute duration: DurationValue[*] nonunique :> scalarQuantities;

    attribute def DurationUnit :> SimpleUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = durationPF; }
    }

    /* ISO-80000-4 item 4-1 mass */
    attribute def MassValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 4-1 mass
         * symbol(s): `m`
         * application domain: generic
         * name: Mass
         * quantity dimension: M^1
         * measurement unit(s): kg
         * tensor order: 0
         * definition: property of a body which expresses itself in terms of inertia with regard to changes in its state of motion as well as its gravitational attraction to other bodies
         * remarks: The kilogram (kg) is one of the seven base units (see ISO 80000-1) of the International System of Units, the SI. See also IEC 60050-113.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassUnit[1];
    }

    attribute mass: MassValue[*] nonunique :> scalarQuantities;

    attribute def MassUnit :> SimpleUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = massPF; }
    }

    /* ISO-80000-5 item 5-1 thermodynamic temperature, temperature */
    attribute def ThermodynamicTemperatureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-1 thermodynamic temperature, temperature
         * symbol(s): `T`, `Θ`
         * application domain: generic
         * name: ThermodynamicTemperature
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: partial derivative of internal energy with respect to entropy at constant volume and constant number of particles in the system: `T = ((partial U)/(partial S))_(V,N)` where `U` is internal energy (item 5-20.2), `S` is entropy (item 5-18), `V` is volume (ISO 80000-3), and `N` is number of particles
         * remarks: It is measured with a primary thermometer, examples of which are gas thermometers of different kinds, noise thermometers, or radiation thermometers. The Boltzmann constant (ISO 80000-1) relates energy at the individual particle level with thermodynamic temperature. Differences of thermodynamic temperatures or changes may be expressed either in kelvin, symbol K, or in degrees Celsius, symbol °C (item 5-2). Thermodynamic temperature is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). The International Temperature Scale of 1990. For the purpose of practical measurements, the International Temperature Scale of 1990, ITS-90, was adopted by CIPM in 1989, which is a close approximation to the thermodynamic temperature scale. The quantities defined by this scale are denoted `T_90` and `t_90`, respectively (replacing `T_68` and `t_68` defined by the International Practical Temperature Scale of 1968, IPTS-68), where `t_90/(1 °C) = T_90/(1 K) - 273,15`. The units of `T_90` and `t_90` are the kelvin, symbol K, and the degree Celsius, symbol °C (item 5-2), respectively. For further information, see References [5], [6]. For ready conversion between temperatures reported on the International Temperature Scale and thermodynamic temperatures the systematic deviations can be found in Reference [7].
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermodynamicTemperatureUnit[1];
    }

    attribute thermodynamicTemperature: ThermodynamicTemperatureValue[*] nonunique :> scalarQuantities;

    attribute def ThermodynamicTemperatureUnit :> SimpleUnit {
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = thermodynamicTemperaturePF; }
    }

    /* IEC-80000-6 item 6-1 electric current */
    attribute def ElectricCurrentValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-1 electric current
         * symbol(s): `I`, `i`
         * application domain: generic
         * name: ElectricCurrent
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: electric current is one of the base quantities in the International System of Quantities, ISQ, on which the International System of Units, SI, is based
         * remarks: Electric current is the quantity that can often be measured with an ammeter. The electric current through a surface is the quotient of the electric charge (item 6-2) transferred through the surface during a time interval by the duration of that interval. For a more complete definition, see item 6-8 and IEC 60050-121, item 121-11-13.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricCurrentUnit[1];
    }

    attribute electricCurrent: ElectricCurrentValue[*] nonunique :> scalarQuantities;

    attribute def ElectricCurrentUnit :> SimpleUnit {
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = electricCurrentPF; }
    }

    /* ISO-80000-7 item 7-14 luminous intensity */
    attribute def LuminousIntensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-14 luminous intensity
         * symbol(s): `I_v`, `(I)`
         * application domain: generic
         * name: LuminousIntensity
         * quantity dimension: J^1
         * measurement unit(s): cd
         * tensor order: 0
         * definition: density of luminous flux with respect to solid angle in a specified direction, expressed by `I_v = (dΦ_v)/(dΩ)` where `Φ_v` is the luminous flux (item 7-13) emitted in a specified direction, and `Ω` is the solid angle (ISO 80000-3) containing that direction
         * remarks: The definition holds strictly only for a point source. The distribution of the luminous intensities as a function of the direction of emission, e.g. given by the polar angles `(θ,ϕ)`, is used to determine the luminous flux (item 7-13) within a certain solid angle (ISO 80000-3) `Ω` of a source: `Φ_v = int int_Ω I_v(θ,φ) sin(θ) dφ dθ`. Luminous intensity can be derived from the spectral radiant intensity distribution by `I_v = K_m int_0^∞ I_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `I_(e,λ)(λ)` is the spectral radiant intensity (item 7-5.2) at wavelength `λ` (ISO 80000-3), and `V(λ)` is spectral luminous efficiency (item 7-10.2). The corresponding radiometric quantity is "radiant intensity" (item 7-5.1). The corresponding quantity for photons is "photon intensity" (item 7-21).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousIntensityUnit[1];
    }

    attribute luminousIntensity: LuminousIntensityValue[*] nonunique :> scalarQuantities;

    attribute def LuminousIntensityUnit :> SimpleUnit {
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = luminousIntensityPF; }
    }

    /* ISO-80000-9 item 9-2 amount of substance, number of moles */
    attribute def AmountOfSubstanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 9-2 amount of substance, number of moles
         * symbol(s): `n(X)`
         * application domain: generic
         * name: AmountOfSubstance
         * quantity dimension: N^1
         * measurement unit(s): mol
         * tensor order: 0
         * definition: quotient of number `N` of specified elementary entities of kind `X` (item 9-1) in a sample, and the Avogadro constant `N_A` (ISO 80000-1): `n(X) = N(X)/N_A`
         * remarks: Amount of substance is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). Elementary entities, such as molecules, atoms, ions, electrons, holes and other quasi-particles, double bonds can be used. It is necessary to specify precisely the entity involved, e.g. atoms of hydrogen `H` vs. molecules of hydrogen `H_2`, preferably by giving the molecular chemical formula of the material involved. In the name "amount of substance", the words "of substance" could be replaced by words specifying the substance concerned, e.g. "amount of hydrogen chloride, `HCl`", or "amount of benzene, `C_6H_6`". The name "number of moles" is often used for "amount of substance", but this is deprecated because the name of a quantity should be distinguished from the name of the unit.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AmountOfSubstanceUnit[1];
    }

    attribute amountOfSubstance: AmountOfSubstanceValue[*] nonunique :> scalarQuantities;

    attribute def AmountOfSubstanceUnit :> SimpleUnit {
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = amountOfSubstancePF; }
    }

    attribute <isq> 'International System of Quantities': SystemOfQuantities {
        doc
        /*
         * Declaration of the International System of Quantities (ISQ), 
         * including its base quantities and symbols as specified in ISO 80000-1:2009.
         */
        attribute :>> baseQuantities = ( L, M, T, I, 'Θ', N, J );
        
        attribute L: LengthValue[1];
        attribute M: MassValue[1];
        attribute T: DurationValue[1];
        attribute I: ElectricCurrentValue[1];
        attribute 'Θ': ThermodynamicTemperatureValue[1];
        attribute N: AmountOfSubstanceValue[1];
        attribute J: LuminousIntensityValue[1];
    }
}
