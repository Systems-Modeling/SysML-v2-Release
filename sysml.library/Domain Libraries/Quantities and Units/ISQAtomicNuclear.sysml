/**
 * International System of Quantities and Units
 * from standard ISO-80000-10:2019 "Atomic and nuclear physics"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-10:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQAtomicNuclear {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    private import ISQSpaceTime::LengthValue;
    private import ISQSpaceTime::length;
    private import ISQSpaceTime::AreaValue;
    private import ISQSpaceTime::area;
    private import ISQSpaceTime::AngularFrequencyValue;
    private import ISQSpaceTime::angularFrequency;
    private import ISQSpaceTime::TimeValue;
    private import ISQSpaceTime::time;
    private import ISQMechanics::MassValue;
    private import ISQMechanics::mass;
    private import ISQThermodynamics::EnergyValue;
    private import ISQThermodynamics::energy;
    private import ISQElectromagnetism::ElectricChargeValue;
    private import ISQElectromagnetism::electricCharge;

    /**
     * source: item 10-1.1 atomic number, proton number
     * symbol(s): Z
     * application domain: General
     * name: AtomicNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of protons in an atomic nucleus
     * remarks: A nuclide is a species of atom with specified numbers of protons and neutrons. Nuclides with the same value of `Z` but different values of `N` are called isotopes of an element. The ordinal number of an element in the periodic table is equal to the atomic number. The atomic number equals the quotient of the charge (IEC 80000-6) of the nucleus and the elementary charge (ISO 80000-1).
     */
    attribute def AtomicNumberUnit :> DimensionOneUnit {
    }
    attribute def AtomicNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AtomicNumberUnit :>> QuantityValue::mRef;
    }
    attribute atomicNumber: AtomicNumberValue :> quantity;

    alias AtomicNumberValue as ProtonNumberValue;
    attribute protonNumber: ProtonNumberValue :> quantity;

    /**
     * source: item 10-1.2 neutron number
     * symbol(s): N
     * application domain: General
     * name: NeutronNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of neutrons in an atomic nucleus
     * remarks: Nuclides with the same value of `N` but different values of `Z` are called isotones. `N` - `Z` is called the neutron excess number.
     */
    attribute def NeutronNumberUnit :> DimensionOneUnit {
    }
    attribute def NeutronNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NeutronNumberUnit :>> QuantityValue::mRef;
    }
    attribute neutronNumber: NeutronNumberValue :> quantity;

    /**
     * source: item 10-1.3 nucleon number, mass number
     * symbol(s): A
     * application domain: General
     * name: NucleonNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of nucleons in an atomic nucleus
     * remarks: `A` = `Z` + `N` Nuclides with the same value of `A` are called isobars.
     */
    attribute def NucleonNumberUnit :> DimensionOneUnit {
    }
    attribute def NucleonNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NucleonNumberUnit :>> QuantityValue::mRef;
    }
    attribute nucleonNumber: NucleonNumberValue :> quantity;

    alias NucleonNumberValue as MassNumberValue;
    attribute massNumber: MassNumberValue :> quantity;

    /**
     * source: item 10-2 rest mass, proper mass
     * symbol(s): m(X), m_X
     * application domain: General
     * name: RestMass (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, u, Da
     * definition: for particle X, mass (ISO 80000-4) of that particle at rest in an inertial frame
     * remarks: EXAMPLE `m`(H_2O) for a water molecule, `m_e` for an electron. Rest mass is often denoted `m_0`. 1 u is equal to 1/12 times the mass of a free carbon 12 atom, at rest and in its ground state. 1 Da = 1 u
     */
    attribute restMass: MassValue :> mass;

    alias restMass as properMass;

    /**
     * source: item 10-3 rest energy
     * symbol(s): E_0
     * application domain: General
     * name: RestEnergy
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, N*m, kg*m^2*s^-2
     * definition: energy `E_0` (ISO 80000-5) of a particle at rest: `E_0 = m_0 c_0^2` where `m_0` is the rest mass (item 10-2) of that particle, and `c_0` is speed of light in vacuum (ISO 80000-1)
     * remarks: 
     */
    attribute def RestEnergyUnit :> SIDerivedUnit {
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
    attribute def RestEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RestEnergyUnit :>> QuantityValue::mRef;
    }
    attribute restEnergy: RestEnergyValue :> quantity;

    /**
     * source: item 10-4.1 atomic mass
     * symbol(s): m(X), m_X
     * application domain: General
     * name: AtomicMass (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, u, Da
     * definition: rest mass (item 10-2) of an atom X in the ground state
     * remarks: `m(X)/m_u` is called the relative atomic mass. 1 u is equal to 1/12 times the mass of a free carbon 12 atom, at rest and in its ground state. 1 Da = 1 u
     */
    attribute atomicMass: MassValue :> mass;

    /**
     * source: item 10-4.2 nuclidic mass
     * symbol(s): m(X), m_X
     * application domain: General
     * name: NuclidicMass (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, u, Da
     * definition: rest mass (item 10-2) of a nuclide X in the ground state
     * remarks: 1 u is equal to 1/12 times the mass of a free carbon 12 atom, at rest and in its ground state. 1 Da = 1 u
     */
    attribute nuclidicMass: MassValue :> mass;

    /**
     * source: item 10-4.3 unified atomic mass constant
     * symbol(s): m_u
     * application domain: General
     * name: UnifiedAtomicMassConstant (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, u, Da
     * definition: 1/12 of the mass (ISO 80000-4) of an atom of the nuclide ^(12)C in the ground state at rest
     * remarks: 1 u is equal to 1/12 times the mass of a free carbon 12 atom, at rest and in its ground state. 1 Da = 1 u
     */
    attribute unifiedAtomicMassConstant: MassValue :> mass;

    /**
     * source: item 10-5.1 elementary charge
     * symbol(s): e
     * application domain: General
     * name: ElementaryCharge (specializes ElectricCharge)
     * quantity dimension: T^1*I^1
     * measurement unit(s): C, s*A
     * definition: one of the fundamental constants in the SI system (ISO 80000-1), equal to the charge of the proton and opposite to the charge of the electron
     * remarks: 
     */
    attribute elementaryCharge: ElectricChargeValue :> electricCharge;

    /**
     * source: item 10-5.2 charge number, ionization number
     * symbol(s): c
     * application domain: General
     * name: ChargeNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a particle, quotient of the electric charge (IEC 80000-6) and the elementary charge (ISO 80000-1)
     * remarks: A particle is said to be electrically neutral if its charge number is equal to zero. The charge number of a particle can be positive, negative, or zero. The state of charge of a particle may be presented as a superscript to the symbol of that particle, e.g. `H^+, He^(++), Al^(3+), Cl^-, S^(--), N^(3-)`.
     */
    attribute def ChargeNumberUnit :> DimensionOneUnit {
    }
    attribute def ChargeNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ChargeNumberUnit :>> QuantityValue::mRef;
    }
    attribute chargeNumber: ChargeNumberValue :> quantity;

    alias ChargeNumberValue as IonizationNumberValue;
    attribute ionizationNumber: IonizationNumberValue :> quantity;

    /**
     * source: item 10-6 Bohr radius
     * symbol(s): a_0
     * application domain: General
     * name: BohrRadius (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m, Å
     * definition: radius (ISO 80000-3) of the electron orbital in the hydrogen atom in its ground state in the Bohr model of the atom: `a_0 = (4 π ε_0 ℏ^2)/(m_e e^2)` where `ε_0` is the electric constant (IEC 80000-6), `ℏ` is the reduced Planck constant (ISO 80000-1), `m_e` is the rest mass (item 10-2) of electron, and `e` is the elementary charge (ISO 80000-1)
     * remarks: The radius of the electron orbital in the H atom in its ground state is `a_0` in the Bohr model of the atom. ångström (Å), `1 Å := 10^-10 m`.
     */
    attribute bohrRadius: LengthValue :> length;

    /**
     * source: item 10-7 Rydberg constant
     * symbol(s): R_∞
     * application domain: General
     * name: RydbergConstant
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: spectroscopic constant that determines the wave numbers of the lines in the spectrum of hydrogen: `R_(oo) = e^2/(8 π ε_0 a_0 h c_0)` where `e` is the elementary charge (ISO 80000-1), `ε_0` is the electric constant (IEC 80000-6), `a_0` is the Bohr radius (item 10-6), `h` is the Planck constant (ISO 80000-1), and `c_0` is the speed of light in vacuum (ISO 80000-1)
     * remarks: The quantity `R_y = R_∞ h c_0` is called the Rydberg energy.
     */
    attribute def RydbergConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def RydbergConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RydbergConstantUnit :>> QuantityValue::mRef;
    }
    attribute rydbergConstant: RydbergConstantValue :> quantity;

    /**
     * source: item 10-8 Hartree energy
     * symbol(s): E_H, E_h
     * application domain: General
     * name: HartreeEnergy
     * quantity dimension: L^6*M^3*T^-6
     * measurement unit(s): eV*J*kg*m^2*s^-2
     * definition: energy (ISO 80000-5) of the electron in a hydrogen atom in its ground state: `E_H = e^2/(4 π ε_0 a_0)` where `e` is the elementary charge (ISO 80000-1), `ε_0` is the electric constant (IEC 80000-6), and `a_0` is the Bohr radius (item 10-6)
     * remarks: The energy of the electron in an H atom in its ground state is `E_H`.
     */
    attribute def HartreeEnergyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 6;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -6;
        }
    }
    attribute def HartreeEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: HartreeEnergyUnit :>> QuantityValue::mRef;
    }
    attribute hartreeEnergy: HartreeEnergyValue :> quantity;

    /**
     * source: item 10-9.1 magnetic dipole moment
     * symbol(s): μ
     * application domain: atomic physics
     * name: MagneticDipoleMoment
     * quantity dimension: L^2*I^1
     * measurement unit(s): m^2*A
     * definition: for a particle, vector (ISO 80000-2) quantity causing a change to its energy (ISO 80000-5) Δ`W` in an external magnetic field of field flux density `vec(B)` (IEC 80000-6): Δ`W` = -`vec(μ)` · `vec(B)`
     * remarks: For an atom or nucleus, this energy is quantized and can be written as: `W` = `g μ_x`` M B` where `g` is the appropriate `g` factor (item 10-14.1 or item 10-14.2), `μ_x` is mostly the Bohr magneton or nuclear magneton (item 10-9.2 or item 10-9.3), `M` is magnetic quantum number (item 10-13.4), and `B` is magnitude of the magnetic flux density. See also IEC 80000-6.
     */
    attribute def MagneticDipoleMomentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MagneticDipoleMomentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticDipoleMomentUnit :>> QuantityValue::mRef;
    }
    attribute magneticDipoleMoment: MagneticDipoleMomentValue :> quantity;

    /**
     * source: item 10-9.2 Bohr magneton
     * symbol(s): μ_B
     * application domain: General
     * name: BohrMagneton (specializes MagneticDipoleMoment)
     * quantity dimension: L^2*I^1
     * measurement unit(s): m^2*A
     * definition: magnitude of the magnetic moment of an electron in a state with orbital angular momentum quantum number `l`=1 (item 10-13.3) due to its orbital motion: `μ_B = (e ℏ)/(2 m_e)` where `e` is the elementary charge (ISO 80000-1), `ℏ` is the reduced Planck constant (ISO 80000-1), and `m_e` is the rest mass (item 10-2) of electron
     * remarks: 
     */
    attribute bohrMagneton: MagneticDipoleMomentValue :> magneticDipoleMoment;

    /**
     * source: item 10-9.3 nuclear magneton
     * symbol(s): μ_N
     * application domain: General
     * name: NuclearMagneton (specializes MagneticDipoleMoment)
     * quantity dimension: L^2*I^1
     * measurement unit(s): m^2*A
     * definition: absolute value of the magnetic moment of a nucleus: `μ_N = (e ℏ)/(2 m_p)` where `e` is the elementary charge (ISO 80000-1), `ℏ` is the reduced Planck constant (ISO 80000-1), and `m_p` is the rest mass (item 10-2) of proton
     * remarks: Subscript N stands for nucleus. For the neutron magnetic moment, subscript n is used. The magnetic moments of protons and neutrons differ from this quantity by their specific `g` factors (item 10-14.2).
     */
    attribute nuclearMagneton: MagneticDipoleMomentValue :> magneticDipoleMoment;

    /**
     * source: item 10-10 spin
     * symbol(s): s
     * application domain: General
     * name: Spin
     * quantity dimension: L^2*M^1*T^-1
     * measurement unit(s): kg*m^2*s^-1
     * definition: vector (ISO 80000-2) quantity expressing the internal angular momentum (ISO 80000-4) of a particle or a particle system
     * remarks: Spin is an additive vector quantity.
     */
    attribute def SpinUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpinValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpinUnit :>> QuantityValue::mRef;
    }
    attribute spin: SpinValue :> quantity;

    /**
     * source: item 10-11 total angular momentum
     * symbol(s): J
     * application domain: General
     * name: TotalAngularMomentum
     * quantity dimension: L^2*M^1*T^-1
     * measurement unit(s): J*s*eV*s, kg*m^2*s^-1
     * definition: vector (ISO 80000-2) quantity in a quantum system composed of the vectorial sum of angular momentum `vec(L)` (ISO 80000-4) and spin `vec(s)` (item 10-10)
     * remarks: In atomic and nuclear physics, orbital angular momentum is usually denoted by `vec(l)` or `vec(L)`. The magnitude of `vec(J)` is quantized so that: `J^2 = ℏ^2 j (j+1)` where `j` is the total angular momentum quantum number (item 10-13.6). Total angular momentum and magnetic dipole moment have the same direction. `j` is not the magnitude of the total angular momentum `vec(J)` but its projection onto the quantization axis, divided by `ℏ`.
     */
    attribute def TotalAngularMomentumUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def TotalAngularMomentumValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalAngularMomentumUnit :>> QuantityValue::mRef;
    }
    attribute totalAngularMomentum: TotalAngularMomentumValue :> quantity;

    /**
     * source: item 10-12.1 gyromagnetic ratio, magnetogyric ratio, gyromagnetic coefficient
     * symbol(s): γ
     * application domain: General
     * name: GyromagneticRatio
     * quantity dimension: M^-1*T^1*I^1
     * measurement unit(s): A*m^2*J^-1*s^-1, A*s/kg, kg^-1*s*A
     * definition: proportionality constant between the magnetic dipole moment and the angular momentum: `vec(μ)` = `γ` `vec(J)` where `vec(μ)` is the magnetic dipole moment (item 10-9.1), and `vec(J)` is the total angular momentum (item 10-11)
     * remarks: 1 A·m^2/(J·s) = 1 A·s/kg = 1 T^-1·s^-1 The systematic name is “gyromagnetic coefficient”, but “gyromagnetic ratio” is more usual. The gyromagnetic ratio of the proton is denoted by `γ_p`. The gyromagnetic ratio of the neutron is denoted by `γ_n`.
     */
    attribute def GyromagneticRatioUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def GyromagneticRatioValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: GyromagneticRatioUnit :>> QuantityValue::mRef;
    }
    attribute gyromagneticRatio: GyromagneticRatioValue :> quantity;

    alias GyromagneticRatioValue as MagnetogyricRatioValue;
    attribute magnetogyricRatio: MagnetogyricRatioValue :> quantity;

    alias GyromagneticRatioValue as GyromagneticCoefficientValue;
    attribute gyromagneticCoefficient: GyromagneticCoefficientValue :> quantity;

    /**
     * source: item 10-12.2 gyromagnetic ratio of the electron, magnetogyric ratio of the electron, gyromagnetic coefficient of the electron
     * symbol(s): γ_e
     * application domain: General
     * name: GyromagneticRatioOfTheElectron
     * quantity dimension: M^-1*T^1*I^1
     * measurement unit(s): A*m^2*J^-1*s^-1, A*s/kg, kg^-1*s*A
     * definition: proportionality constant between the magnetic dipole moment and the angular momentum of the electron `vec(μ)` = `γ_e` `vec(J)` where `vec(μ)` is the magnetic dipole moment (item 10-9.1), and `vec(J)` is the total angular momentum (item 10-11)
     * remarks: 1 A·m^2/(J·s) = 1 A·s/kg = 1 T^-1·s^-1
     */
    attribute def GyromagneticRatioOfTheElectronUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def GyromagneticRatioOfTheElectronValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: GyromagneticRatioOfTheElectronUnit :>> QuantityValue::mRef;
    }
    attribute gyromagneticRatioOfTheElectron: GyromagneticRatioOfTheElectronValue :> quantity;

    alias GyromagneticRatioOfTheElectronValue as MagnetogyricRatioOfTheElectronValue;
    attribute magnetogyricRatioOfTheElectron: MagnetogyricRatioOfTheElectronValue :> quantity;

    alias GyromagneticRatioOfTheElectronValue as GyromagneticCoefficientOfTheElectronValue;
    attribute gyromagneticCoefficientOfTheElectron: GyromagneticCoefficientOfTheElectronValue :> quantity;

    /**
     * source: item 10-13.1 quantum number
     * symbol(s): N, L, M, j, s, F
     * application domain: General
     * name: QuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number describing a particular state of a quantum system
     * remarks: Electron states determine the binding energy `E` = `E`(`n`,`l`,`m`,`j`,`s`,`f`) in an atom. Upper case letters `N`, `L`, `M`, `J`, `S, F` are usually used for the whole system. The spatial probability distribution of an electron is given by │`Ψ`│^2, where `Ψ` is its wave function. For an electron in an H atom in a non-relativistic approximation, the wave function can be presented as: `ψ(r, θ, φ) = R_(nl)(r)*Y_l^m(θ, φ) ` where `r, θ, φ` are spherical coordinates (ISO 80000-2) with respect to the nucleus and to a given (quantization) axis, `R_(nl)(r)` is the radial distribution function, and `Y_l^m(θ, φ) ` are spherical harmonics. In the Bohr model of one-electron atoms, `n`, `l`, and `m` define the possible orbits of an electron about the nucleus.
     */
    attribute def QuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def QuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: QuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute quantumNumber: QuantumNumberValue :> quantity;

    /**
     * source: item 10-13.2 principal quantum number
     * symbol(s): n
     * application domain: General
     * name: PrincipalQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: atomic quantum number related to the number `n`-1 of radial nodes of one-electron wave functions
     * remarks: In the Bohr model, `n` = 1,2,…,∞ is related to the binding energy of an electron and the radius of spherical orbits (principal axis of the elliptic orbits). For an electron in an H atom, the semi-classical radius of its orbit is `r_n` = `a_0``n`^2 and its binding energy is `E_n` = `E_H`/`n`^2.
     */
    attribute def PrincipalQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def PrincipalQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PrincipalQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute principalQuantumNumber: PrincipalQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.3 orbital angular momentum quantum number
     * symbol(s): l, l_i, L
     * application domain: General
     * name: OrbitalAngularMomentumQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: atomic quantum number related to the orbital angular momentum `l` of a one-electron state
     * remarks: `abs(l)^2 = ℏ^2 l (l-1)` , `l = 0, 1, …, n-1` where `vec(l)` is the orbital angular momentum and `ℏ` is the reduced Planck constant (ISO 80000-1). If reference is made to a specific particle `i`, the symbol `l_i` is used instead of `l`; if reference is made to the whole system, the symbol `L` is used instead of `l`. An electron in an H atom for `l` = 0 appears as a spherical cloud. In the Bohr model, it is related to the form of the orbit.
     */
    attribute def OrbitalAngularMomentumQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def OrbitalAngularMomentumQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: OrbitalAngularMomentumQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute orbitalAngularMomentumQuantumNumber: OrbitalAngularMomentumQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.4 magnetic quantum number
     * symbol(s): m, m_i, M
     * application domain: General
     * name: MagneticQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: atomic quantum number related to the `z` component `l_z`, `j_z` or `s_z`, of the orbital, total, or spin angular momentum
     * remarks: `l_z = m_l ℏ` , `j_z = m_j ℏ` , and `s_z = m_s ℏ` , with the ranges from `-l` to `l`, from `-j` to `j`, and ±1/2, respectively. `m_i` refers to a specific particle `i`. `M` is used for the whole system. Subscripts `l`, `s`, `j`, etc., as appropriate, indicate the angular momentum involved. `ℏ` is the reduced Planck constant (ISO 80000-1).
     */
    attribute def MagneticQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def MagneticQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute magneticQuantumNumber: MagneticQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.5 spin quantum number
     * symbol(s): s
     * application domain: General
     * name: SpinQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: characteristic quantum number `s` of a particle, related to its spin (item 10-10), `vec(s)`: `s^2 = ℏ^2 s (s+1)` where `ℏ` is the reduced Planck constant (ISO 80000-1)
     * remarks: Spin quantum numbers of fermions are odd multiples of 1/2, and those of bosons are integers.
     */
    attribute def SpinQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def SpinQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpinQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute spinQuantumNumber: SpinQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.6 total angular momentum quantum number
     * symbol(s): j, j_i, J
     * application domain: General
     * name: TotalAngularMomentumQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantum number in an atom describing the magnitude of total angular momentum `vec(J)` (item 10-11)
     * remarks: `j_i` refers to a specific particle `i`; `J` is used for the whole system. The quantum number `J` and the magnitude of total angular momentum `vec(J)` (item 10-11) are different quantities. The two values of `j` are `l`±1/2. (See item 10-13.3.)
     */
    attribute def TotalAngularMomentumQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def TotalAngularMomentumQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalAngularMomentumQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute totalAngularMomentumQuantumNumber: TotalAngularMomentumQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.7 nuclear spin quantum number
     * symbol(s): I
     * application domain: General
     * name: NuclearSpinQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantum number related to the total angular momentum (item 10-11), `vec(J)`, of a nucleus in any specified state, normally called nuclear spin: `vec(J)^2 = ℏ^2 I (I+1)` where `ℏ` is the reduced Planck constant (ISO 80000-1)
     * remarks: Nuclear spin is composed of spins of the nucleons (protons and neutrons) and their (orbital) motions. In principle there is no upper limit for the nuclear spin quantum number. It has possible values `I` = 0,1,2,… for even `A` and `I = 1/2, 3/2, …` for odd `A`. In nuclear and particle physics, `vec(J)` is often used.
     */
    attribute def NuclearSpinQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def NuclearSpinQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NuclearSpinQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute nuclearSpinQuantumNumber: NuclearSpinQuantumNumberValue :> quantity;

    /**
     * source: item 10-13.8 hyperfine structure quantum number
     * symbol(s): F
     * application domain: General
     * name: HyperfineStructureQuantumNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantum number of an atom describing the inclination of the nuclear spin with respect to a quantization axis given by the magnetic field produced by the orbital electrons
     * remarks: The interval of `F` is │`I`-`J`│, │`I`-`J`│+1, ..., `I`-`J`. This is related to the hyperfine splitting of the atomic energy levels due to the interaction between the electron and nuclear magnetic moments.
     */
    attribute def HyperfineStructureQuantumNumberUnit :> DimensionOneUnit {
    }
    attribute def HyperfineStructureQuantumNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: HyperfineStructureQuantumNumberUnit :>> QuantityValue::mRef;
    }
    attribute hyperfineStructureQuantumNumber: HyperfineStructureQuantumNumberValue :> quantity;

    /**
     * source: item 10-14.1 Lande factor, g factor of atom
     * symbol(s): g
     * application domain: General
     * name: LandeFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the magnetic dipole moment of an atom, and the product of the total angular momentum quantum number and the Bohr magneton: `g = μ/(J*μ_B)` where `μ` is magnitude of magnetic dipole moment (item 10-9.1), `J` is total angular momentum quantum number (item 10-13.6), and `μ_B` is the Bohr magneton (item 10-9.2)
     * remarks: These quantities are also called `g` values. The Landé factor can be calculated from the expression: `g(L, S, J) = 1 + (g_e -1) xx (J(J+1) + S(S+1) - L(L+1))/(2J(J+1))` where `g_e` is the` g` factor of the electron.
     */
    attribute def LandeFactorUnit :> DimensionOneUnit {
    }
    attribute def LandeFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LandeFactorUnit :>> QuantityValue::mRef;
    }
    attribute landeFactor: LandeFactorValue :> quantity;

    alias LandeFactorValue as GFactorOfAtomValue;
    attribute gFactorOfAtom: GFactorOfAtomValue :> quantity;

    /**
     * source: item 10-14.2 g factor of nucleus or nuclear particle
     * symbol(s): g
     * application domain: General
     * name: GFactorOfNucleusOrNuclearParticle
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the magnetic dipole moment of an atom, and the product of the nuclear spin quantum number and the nuclear magneton: `g = μ/(I*μ_N)` where `μ` is magnitude of magnetic dipole moment (item 10-9.1), `I` is nuclear spin quantum number (item 10-13.7), and `μ_N` is the nuclear magneton (item 10-9.3)
     * remarks: The `g` factors for nuclei or nucleons are known from measurements.
     */
    attribute def GFactorOfNucleusOrNuclearParticleUnit :> DimensionOneUnit {
    }
    attribute def GFactorOfNucleusOrNuclearParticleValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: GFactorOfNucleusOrNuclearParticleUnit :>> QuantityValue::mRef;
    }
    attribute gFactorOfNucleusOrNuclearParticle: GFactorOfNucleusOrNuclearParticleValue :> quantity;

    /**
     * source: item 10-15.1 Larmor angular frequency
     * symbol(s): ω_L
     * application domain: General
     * name: LarmorAngularFrequency (specializes AngularFrequency)
     * quantity dimension: T^-1
     * measurement unit(s): rad*s^-1, s^-1
     * definition: angular frequency (ISO 80000-3) of the electron angular momentum (ISO 80000-4) vector precession about the axis of an external magnetic field: `ω_L = e/(2 m_e) B` where `e` is the elementary charge (ISO 80000-1), `m_e` is the rest mass (item 10-2) of electron, and `B` is magnetic flux density (IEC 80000-6)
     * remarks: 
     */
    attribute larmorAngularFrequency: AngularFrequencyValue :> angularFrequency;

    /**
     * source: item 10-15.2 Larmor frequency
     * symbol(s): ν_L
     * application domain: General
     * name: LarmorFrequency
     * quantity dimension: T^-1
     * measurement unit(s): s^-1
     * definition: quotient of Larmor angular frequency (ISO 80000-3) and 2π
     * remarks: 
     */
    attribute def LarmorFrequencyUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def LarmorFrequencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LarmorFrequencyUnit :>> QuantityValue::mRef;
    }
    attribute larmorFrequency: LarmorFrequencyValue :> quantity;

    /**
     * source: item 10-15.3 nuclear precession angular frequency
     * symbol(s): ω_N
     * application domain: General
     * name: NuclearPrecessionAngularFrequency (specializes AngularFrequency)
     * quantity dimension: T^-1
     * measurement unit(s): rad*s^-1, s^-1
     * definition: frequency (ISO 80000-3) by which the nucleus angular momentum vector (ISO 80000-4) precesses about the axis of an external magnetic field: `ω_N` = `γ` `B` where `γ` is the gyromagnetic ratio (item 10-12.1), and `B` is magnetic flux density (IEC 80000-6)
     * remarks: 
     */
    attribute nuclearPrecessionAngularFrequency: AngularFrequencyValue :> angularFrequency;

    /**
     * source: item 10-16 cyclotron angular frequency
     * symbol(s): ω_c
     * application domain: General
     * name: CyclotronAngularFrequency
     * quantity dimension: T^-1
     * measurement unit(s): rad*s^-1, s^-1
     * definition: quotient of the product of the electric charge of a particle and the magnitude of the magnetic flux density of the magnetic field, and the particle mass: `ω_c = abs(q)/m B` where `q` is the electric charge (IEC 80000-6) of the particle, `m` is the mass (ISO 80000-4) of the particle, and `B` is the absolute value of the magnetic flux density (IEC 80000-6)
     * remarks: The quantity `v_c` = `ω_c`/2π is called the cyclotron frequency.
     */
    attribute def CyclotronAngularFrequencyUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def CyclotronAngularFrequencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CyclotronAngularFrequencyUnit :>> QuantityValue::mRef;
    }
    attribute cyclotronAngularFrequency: CyclotronAngularFrequencyValue :> quantity;

    /**
     * source: item 10-17 gyroradius, Larmor radius
     * symbol(s): r_g, r_L
     * application domain: General
     * name: Gyroradius (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: radius (ISO 80000-3) of circular movement of a particle with mass (ISO 80000-4), velocity `vec(v)` (ISO 80000-3), and electric charge `q` (IEC 80000-6), moving in a magnetic field with magnetic flux density `vec(B)` (IEC 80000-6): `r_g = (m abs(vec(v) xx vec(B)))/(q B^2)`
     * remarks: 
     */
    attribute gyroradius: LengthValue :> length;

    alias gyroradius as larmorRadius;

    /**
     * source: item 10-18 nuclear quadrupole moment
     * symbol(s): Q
     * application domain: General
     * name: NuclearQuadrupoleMoment
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: `z` component of the diagonalized tensor of nuclear quadrupole moment: `Q = (1/e) int (3z^2 - r^2) ρ(x, y, z) dV` in the quantum state with the nuclear spin in the field direction (`z`), where `e` is the elementary charge (ISO 80000-1), `r`^2 = `x`^2 + `y`^2 + `z`^2, `ρ`(`x`,`y`,`z`) is the nuclear electric charge density (IEC 80000-6), and d`V` is the volume element d`x` d`y` d`z`
     * remarks: The electric nuclear quadrupole moment is `eQ`. This value is equal to the `z` component of the diagonalized tensor of quadrupole moment.
     */
    attribute def NuclearQuadrupoleMomentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def NuclearQuadrupoleMomentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NuclearQuadrupoleMomentUnit :>> QuantityValue::mRef;
    }
    attribute nuclearQuadrupoleMoment: NuclearQuadrupoleMomentValue :> quantity;

    /**
     * source: item 10-19.1 nuclear radius
     * symbol(s): R
     * application domain: General
     * name: NuclearRadius (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: conventional radius (ISO 80000-3) of sphere in which the nuclear matter is included
     * remarks: This quantity is not exactly defined. It is given approximately for nuclei in their ground state by: `R = r_0 A^(1//3)` where `r_0 ~~ 1.2 * 10^-15` m, and `A` is the nucleon number (item 10-1.3). Nuclear radius is usually expressed in femtometres, 1 fm = 10^(-15) m.
     */
    attribute nuclearRadius: LengthValue :> length;

    /**
     * source: item 10-19.2 electron radius
     * symbol(s): r_e
     * application domain: General
     * name: ElectronRadius (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: radius of a sphere such that the relativistic electron energy is distributed uniformly: `r_e = e^2/(4 π ε_0 m_e c_0^2)` where `e` is the elementary charge (ISO 80000-1), `ε_0` is the electric constant (IEC 80000-6), `m_e` is the rest mass (item 10-2) of electron, and `c_0` is the speed of light in vacuum (ISO 80000-1)
     * remarks: This quantity corresponds to the electrostatic energy `E` of a charge distributed inside a sphere of radius `r_e` as if all the rest energy (item 10-3) of the electron were attributed to the energy of electromagnetic origin, using the relation `E = m_e c_0^2`.
     */
    attribute electronRadius: LengthValue :> length;

    /**
     * source: item 10-20 Compton wavelength
     * symbol(s): λ_C
     * application domain: General
     * name: ComptonWavelength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: quotient of the Planck constant and the product of the mass of the particle and the speed of light in vacuum: `λ_C = h / (m c_0)` where `h` is the Planck constant (ISO 80000-1), `m` is the rest mass (item 10-2) of a particle, and `c_0` is the speed of light in vacuum (ISO 80000-1)
     * remarks: The wavelength of electromagnetic radiation scattered from free electrons (Compton scattering) is larger than that of the incident radiation by a maximum of 2`λ_C`.
     */
    attribute comptonWavelength: LengthValue :> length;

    /**
     * source: item 10-21.1 mass excess
     * symbol(s): Δ
     * application domain: General
     * name: MassExcess (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, Da, u
     * definition: difference between the mass of an atom, and the product of its mass number and the unified mass constant: `Δ` = `m_a` - `A` · `m_u` where `m_a` is the rest mass (item 10-2) of the atom, `A` is its nucleon number (item 10-1.3), and `m_u` is the unified atomic mass constant (item 10-4.3)
     * remarks: The mass excess is usually expressed in daltons, 1 Da = 1 u. See item 10-2.
     */
    attribute massExcess: MassValue :> mass;

    /**
     * source: item 10-21.2 mass defect
     * symbol(s): B
     * application domain: General
     * name: MassDefect (specializes Mass)
     * quantity dimension: M^1
     * measurement unit(s): kg, Da, u
     * definition: sum of the product of the proton number and the hydrogen atomic mass, and the neutron rest mass, minus the rest mass of the atom: `B` = `Z` `m`(^1H) + `N` `m_n` -` m_a` where `Z` is the proton number (item 10-1.1) of the atom, `m`(^1H) is atomic mass (item 10-4.1) of ^1H, `N` is neutron number (item 10-1.2), `m_n` is the rest mass (item 10-2) of the neutron, and `m_a` is the rest mass (item 10-2) of the atom
     * remarks: The mass excess is usually expressed in daltons, 1 Da = 1 u. If the binding energy of the orbital electrons is neglected, `B c_0^2` is equal to the binding energy of the nucleus.
     */
    attribute massDefect: MassValue :> mass;

    /**
     * source: item 10-22.1 relative mass excess
     * symbol(s): Δ_r
     * application domain: General
     * name: RelativeMassExcess
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass excess and the unified atomic mass constant: `Δ_r` = `Δ`/`m_u` where `Δ` is mass excess (item 10-21.1), and `m_u` is the unified atomic mass constant (item 10-4.3)
     * remarks: 
     */
    attribute def RelativeMassExcessUnit :> DimensionOneUnit {
    }
    attribute def RelativeMassExcessValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeMassExcessUnit :>> QuantityValue::mRef;
    }
    attribute relativeMassExcess: RelativeMassExcessValue :> quantity;

    /**
     * source: item 10-22.2 relative mass defect
     * symbol(s): B_r
     * application domain: General
     * name: RelativeMassDefect
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass defect and the unified atomic mass constant: `B_r` = `B`/`m_u` where `B` is mass defect (item 10-21.2), and `m_u` is the unified atomic mass constant (item 10-4.3)
     * remarks: 
     */
    attribute def RelativeMassDefectUnit :> DimensionOneUnit {
    }
    attribute def RelativeMassDefectValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeMassDefectUnit :>> QuantityValue::mRef;
    }
    attribute relativeMassDefect: RelativeMassDefectValue :> quantity;

    /**
     * source: item 10-23.1 packing fraction
     * symbol(s): f
     * application domain: General
     * name: PackingFraction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of relative mass excess and the nucleon number: `f` = `Δ_r`/`A` where `Δ_r` is relative mass excess (item 10-22.1), and `A` is the nucleon number (item 10-1.3)
     * remarks: 
     */
    attribute def PackingFractionUnit :> DimensionOneUnit {
    }
    attribute def PackingFractionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PackingFractionUnit :>> QuantityValue::mRef;
    }
    attribute packingFraction: PackingFractionValue :> quantity;

    /**
     * source: item 10-23.2 binding fraction
     * symbol(s): b
     * application domain: General
     * name: BindingFraction
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of relative mass defect and the nucleon number: `b` = `B_r`/`A` where `B_r` is relative mass defect (item 10-22.2), and `A` is the nucleon number (item 10-1.3)
     * remarks: 
     */
    attribute def BindingFractionUnit :> DimensionOneUnit {
    }
    attribute def BindingFractionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: BindingFractionUnit :>> QuantityValue::mRef;
    }
    attribute bindingFraction: BindingFractionValue :> quantity;

    /**
     * source: item 10-24 decay constant, disintegration constant
     * symbol(s): λ
     * application domain: General
     * name: DecayConstant
     * quantity dimension: T^-1
     * measurement unit(s): s^-1
     * definition: quotient of -d`N`/`N` and d`t`, where d`N`/`N` is the mean fractional change in the number of nuclei in a particular energy state due to spontaneous transformations in a time interval of duration (ISO 80000-3) d`t`: `λ = -1/N (dN)/(dt)`
     * remarks: For exponential decay, this quantity is constant. For more than one decay channel, `λ = sum λ_a` where `λ_a` denotes the decay constant for a specified final state and the sum is taken over all final states.
     */
    attribute def DecayConstantUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def DecayConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DecayConstantUnit :>> QuantityValue::mRef;
    }
    attribute decayConstant: DecayConstantValue :> quantity;

    alias DecayConstantValue as DisintegrationConstantValue;
    attribute disintegrationConstant: DisintegrationConstantValue :> quantity;

    /**
     * source: item 10-25 mean duration of life, mean life time
     * symbol(s): τ
     * application domain: atomic and nuclear physics
     * name: MeanDurationOfLife (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: reciprocal of the decay constant `λ `(item 10-24): `τ = 1/λ`
     * remarks: Mean duration of life is the expected value of the duration of life of an unstable particle or an excited state of a particle when the number of decay events in a short time interval follows a Poisson distribution.
     */
    attribute meanDurationOfLife: TimeValue :> time;

    alias meanDurationOfLife as meanLifeTime;

    /**
     * source: item 10-26 level width
     * symbol(s): Γ
     * application domain: General
     * name: LevelWidth (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: quotient of the reduced Planck constant and the mean life: `Γ = ℏ/τ` where `ℏ` is the reduced Planck constant (ISO 80000-1), and `τ` is mean duration of life (item 10-25)
     * remarks: Level width is the uncertainty of the energy of an unstable particle or an excited state of a system due to the Heisenberg principle. The term energy level refers to the configuration of the distribution function of the density of states. Energy levels may be considered as discrete, like those in an atom, or may have a finite width, like e.g. this item or like e.g. the valence or conduction band in solid state physics. Energy levels are applicable to both real and virtual particles, e.g. electrons and phonons, respectively.
     */
    attribute levelWidth: EnergyValue :> energy;

    /**
     * source: item 10-27 nuclear activity
     * symbol(s): A
     * application domain: General
     * name: NuclearActivity
     * quantity dimension: T^-1
     * measurement unit(s): Bq, s^-1
     * definition: differential quotient of `N` with respect to time, where `N` is the mean change in the number of nuclei in a particular energy state due to spontaneous nuclear transformations in a time interval of duration (ISO 80000-3) d`t`: `A = - (dN)/(dt)`
     * remarks: For exponential decay, `A` = `λN`, where `λ` is the decay constant (item 10-24). The becquerel (Bq) is a special name for second to the power minus one, to be used as the coherent SI unit of activity. In report 85a of the ICRU a definition with an equivalent meaning is given as: The activity, `A`, of an amount of a radionuclide in a particular energy state at a given time is the quotient of -d`N` by d`t`, where d`N` is the mean change in the number of nuclei in that energy state due to spontaneous nuclear transformations in the time interval d`t`: `A = - (dN)/(dt)`. See also section 0.3.
     */
    attribute def NuclearActivityUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def NuclearActivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NuclearActivityUnit :>> QuantityValue::mRef;
    }
    attribute nuclearActivity: NuclearActivityValue :> quantity;

    /**
     * source: item 10-28 specific activity, massic activity
     * symbol(s): a
     * application domain: General
     * name: SpecificActivity
     * quantity dimension: M^-1*T^-1
     * measurement unit(s): Bq/kg, kg^-1*s^-1
     * definition: quotient of the activity `A` (item 10-27) of a sample and the mass `m` (ISO 80000-4) of that sample: `a` = A/`m`
     * remarks: 
     */
    attribute def SpecificActivityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificActivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificActivityUnit :>> QuantityValue::mRef;
    }
    attribute specificActivity: SpecificActivityValue :> quantity;

    alias SpecificActivityValue as MassicActivityValue;
    attribute massicActivity: MassicActivityValue :> quantity;

    /**
     * source: item 10-29 activity density, volumic activity, activity concentration
     * symbol(s): c_A
     * application domain: General
     * name: ActivityDensity
     * quantity dimension: L^-3*T^-1
     * measurement unit(s): Bq/m^3, m^-3*s^-1
     * definition: quotient of the activity `A` (item 10-27) of a sample and the volume `V` (ISO 80000-3) of that sample: `c_A` = `A`/`V`
     * remarks: 
     */
    attribute def ActivityDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ActivityDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActivityDensityUnit :>> QuantityValue::mRef;
    }
    attribute activityDensity: ActivityDensityValue :> quantity;

    alias ActivityDensityValue as VolumicActivityValue;
    attribute volumicActivity: VolumicActivityValue :> quantity;

    alias ActivityDensityValue as ActivityConcentrationValue;
    attribute activityConcentration: ActivityConcentrationValue :> quantity;

    /**
     * source: item 10-30 surface-activity density
     * symbol(s): a_S
     * application domain: General
     * name: SurfaceActivityDensity
     * quantity dimension: L^-2*T^-1
     * measurement unit(s): Bq/m^2, m^-2*s^-1
     * definition: quotient of the activity `A` (item 10-27) of a sample and the total area `S` (ISO 80000-3) of the surface of that sample: `a_S` = `A`/`S`
     * remarks: This value is usually defined for flat sources, where `S` corresponds to the total area of surface of one side of the source.
     */
    attribute def SurfaceActivityDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SurfaceActivityDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SurfaceActivityDensityUnit :>> QuantityValue::mRef;
    }
    attribute surfaceActivityDensity: SurfaceActivityDensityValue :> quantity;

    /**
     * source: item 10-31 half life
     * symbol(s): T_(1/2)
     * application domain: General
     * name: HalfLife (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: mean duration (ISO 80000-3) required for the decay of one half of the atoms or nuclei
     * remarks: For exponential decay, `T_(`1/2) = (ln2)/`λ`, where `λ` is the decay constant (item 10-24).
     */
    attribute halfLife: TimeValue :> time;

    /**
     * source: item 10-32 alpha disintegration energy
     * symbol(s): Q_α
     * application domain: General
     * name: AlphaDisintegrationEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: sum of the kinetic energy (ISO 80000-4) of the α-particle produced in the disintegration process and the recoil energy (ISO 80000-5) of the product atom in a reference frame in which the emitting nucleus is at rest before its disintegration
     * remarks: The ground-state alpha disintegration energy, `Q_(`α,0), also includes the energy of any nuclear transitions that take place in the daughter produced.
     */
    attribute alphaDisintegrationEnergy: EnergyValue :> energy;

    /**
     * source: item 10-33 maximum beta- particle energy
     * symbol(s): E_β
     * application domain: General
     * name: MaximumBetaParticleEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: maximum kinetic energy (ISO 80000-4) of the emitted beta particle produced in the nuclear disintegration process
     * remarks: The maximum kinetic energy corresponds to the highest energy of the beta spectrum.
     */
    attribute maximumBetaParticleEnergy: EnergyValue :> energy;

    /**
     * source: item 10-34 beta disintegration energy
     * symbol(s): Q_β
     * application domain: General
     * name: BetaDisintegrationEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: sum of the maximum beta-particle kinetic energy (item 10-33) and the recoil energy (ISO 80000-5) of the atom produced in a reference frame in which the emitting nucleus is at rest before its disintegration
     * remarks: For positron emitters, the energy for the production of the annihilation radiation created in the combination of an electron with the positron is part of the beta disintegration energy. The ground-state beta disintegration energy, `Q_(`β,0), also includes the energy of any nuclear transitions that take place in the daughter product.
     */
    attribute betaDisintegrationEnergy: EnergyValue :> energy;

    /**
     * source: item 10-35 internal conversion factor
     * symbol(s): α
     * application domain: General
     * name: InternalConversionFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the number of internal conversion electrons and the number of gamma quanta emitted by the radioactive atom in a given transition, where a conversion electron represents an orbital electron emitted through the radioactive decay
     * remarks: The quantity `α`/(`α`+1) is also used and called the internal-conversion fraction. Partial conversion fractions referring to the various electron shells K, L, ... are indicated by `α_K`, `α_L`, …. `α_K`/`α_L` is called the K-to-L internal conversion ratio.
     */
    attribute def InternalConversionFactorUnit :> DimensionOneUnit {
    }
    attribute def InternalConversionFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: InternalConversionFactorUnit :>> QuantityValue::mRef;
    }
    attribute internalConversionFactor: InternalConversionFactorValue :> quantity;

    /**
     * source: item 10-36 particle emission rate
     * symbol(s): dot(N)
     * application domain: General
     * name: ParticleEmissionRate
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: differential quotient of `N` with respect to time, where `N` is the number of particles being emitted from an infinitesimally small volume element in the time interval of duration d`t` (ISO 80000-3), and d`t`: `dot(N) = (dN)/(dt)`
     * remarks: Usually the kind of particles is specified, e.g. neutron emission rate or alpha particle emission rate.
     */
    attribute def ParticleEmissionRateUnit :> DimensionOneUnit {
    }
    attribute def ParticleEmissionRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleEmissionRateUnit :>> QuantityValue::mRef;
    }
    attribute particleEmissionRate: ParticleEmissionRateValue :> quantity;

    /**
     * source: item 10-37.1 reaction energy
     * symbol(s): Q
     * application domain: General
     * name: ReactionEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: in a nuclear reaction, sum of the kinetic energies (ISO 80000-4) and photon energies (ISO 80000-5) of the reaction products minus the sum of the kinetic and photon energies of the reactants
     * remarks: For exothermic nuclear reactions, `Q`>0. For endothermic nuclear reactions, `Q`<0.
     */
    attribute reactionEnergy: EnergyValue :> energy;

    /**
     * source: item 10-37.2 resonance energy
     * symbol(s): E_r, E_(res)
     * application domain: General
     * name: ResonanceEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: kinetic energy (ISO 80000-4) of an incident particle, in the reference frame of the target, corresponding to a resonance in a nuclear reaction
     * remarks: The energy of the resonance corresponds to the difference of the energy levels involved of the nucleus.
     */
    attribute resonanceEnergy: EnergyValue :> energy;

    /**
     * source: item 10-38.1 cross section
     * symbol(s): σ
     * application domain: atomic physics
     * name: CrossSection (specializes Area)
     * quantity dimension: L^2
     * measurement unit(s): m^2, b
     * definition: for a specified target entity and for a specified reaction or process produced by incident charged or uncharged particles of a given type and energy, the quotient of the mean number of such reactions or processes and the incident-particle fluence (item 10-43)
     * remarks: The type of process is indicated by subscripts, e.g. absorption cross section `σ_a`, scattering cross section `σ_s`, fission cross section `σ_f`. 1 barn (b) = 10^(-28) m^2
     */
    attribute crossSection: AreaValue :> area;

    /**
     * source: item 10-38.2 total cross section
     * symbol(s): σ_(tot), σ_T
     * application domain: atomic physics
     * name: TotalCrossSection (specializes Area)
     * quantity dimension: L^2
     * measurement unit(s): m^2, b
     * definition: sum of all cross sections (item 10-38.1) corresponding to the various reactions or processes between an incident particle of specified type and energy (ISO 80000-5) and a target entity
     * remarks: In the case of a narrow unidirectional beam of incident particles, this is the effective cross section for the removal of an incident particle from the beam. See the Remarks for item 10-52. 1 barn (b) = 10^(-28) m^2
     */
    attribute totalCrossSection: AreaValue :> area;

    /**
     * source: item 10-39 direction distribution of cross section
     * symbol(s): σ_Ω
     * application domain: atomic physics
     * name: DirectionDistributionOfCrossSection
     * quantity dimension: L^2
     * measurement unit(s): m^2*sr^-1, m^2
     * definition: differential quotient of `σ` with respect to `Ω`, where `σ` is the cross section (item 10-38.1) for ejecting or scattering a particle into a specified direction, and `Ω` is the solid angle (ISO 80000-3) around that direction: `σ_Ω` = d`σ`/d`Ω`
     * remarks: Quantities listed under items 10-39, 10-40 and 10-41 are sometimes called differential cross sections. The type of interaction needs to be specified.
     */
    attribute def DirectionDistributionOfCrossSectionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def DirectionDistributionOfCrossSectionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DirectionDistributionOfCrossSectionUnit :>> QuantityValue::mRef;
    }
    attribute directionDistributionOfCrossSection: DirectionDistributionOfCrossSectionValue :> quantity;

    /**
     * source: item 10-40 energy distribution of cross section
     * symbol(s): σ_E
     * application domain: atomic physics
     * name: EnergyDistributionOfCrossSection
     * quantity dimension: M^-1*T^2
     * measurement unit(s): m^2/J, kg^-1*s^2
     * definition: differential quotient of `σ` with respect to energy, where `σ` is the cross section (item 10-38.1) for a process in which the energy `E` (ISO 80000-5) of the ejected or scattered particle is between `E` and `E`+d`E`: `σ_E` = d`σ`/d`E`
     * remarks: 
     */
    attribute def EnergyDistributionOfCrossSectionUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def EnergyDistributionOfCrossSectionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnergyDistributionOfCrossSectionUnit :>> QuantityValue::mRef;
    }
    attribute energyDistributionOfCrossSection: EnergyDistributionOfCrossSectionValue :> quantity;

    /**
     * source: item 10-41 direction and energy distribution of cross section
     * symbol(s): σ_(Ω,E)
     * application domain: atomic physics
     * name: DirectionAndEnergyDistributionOfCrossSection
     * quantity dimension: M^-1*T^2
     * measurement unit(s): m^2/(J*sr), kg^-1*s^2
     * definition: partial differential quotient of `σ` with respect to solid angle and energy, where `σ` is the cross section (item 10-38.1) for ejecting or scattering a particle into a solid angle d`Ω` around a specified direction and with an energy between `E` and `E`+d`E`: `σ_(Ω,E) = (del^2 σ) / (del Ω del E)`
     * remarks: 
     */
    attribute def DirectionAndEnergyDistributionOfCrossSectionUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def DirectionAndEnergyDistributionOfCrossSectionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DirectionAndEnergyDistributionOfCrossSectionUnit :>> QuantityValue::mRef;
    }
    attribute directionAndEnergyDistributionOfCrossSection: DirectionAndEnergyDistributionOfCrossSectionValue :> quantity;

    /**
     * source: item 10-42.1 volumic cross section, macroscopic cross section
     * symbol(s): Σ
     * application domain: atomic physics
     * name: VolumicCrossSection
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: product of the number density `n_a` of the atoms and of the cross section (item 10-38.1) `σ_a` for a given type of atoms: `Σ` =` n_a` `σ_a`
     * remarks: When the target particles of the medium are at rest, `Σ` = 1/`l`, where `l` is the mean free path (item 10-71).
     */
    attribute def VolumicCrossSectionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VolumicCrossSectionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VolumicCrossSectionUnit :>> QuantityValue::mRef;
    }
    attribute volumicCrossSection: VolumicCrossSectionValue :> quantity;

    alias VolumicCrossSectionValue as MacroscopicCrossSectionValue;
    attribute macroscopicCrossSection: MacroscopicCrossSectionValue :> quantity;

    /**
     * source: item 10-42.2 volumic total cross section, macroscopic total cross section
     * symbol(s): Σ_(tot), Σ_T
     * application domain: atomic physics
     * name: VolumicTotalCrossSection
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: product of the number density `n_a` of the atoms and the cross section (item 10-38.1) `σ_(`tot) for a given type of atoms: `Σ_(`tot) = `n_a` `σ_(`tot)
     * remarks: See the Remarks for item 10-49.
     */
    attribute def VolumicTotalCrossSectionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VolumicTotalCrossSectionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VolumicTotalCrossSectionUnit :>> QuantityValue::mRef;
    }
    attribute volumicTotalCrossSection: VolumicTotalCrossSectionValue :> quantity;

    alias VolumicTotalCrossSectionValue as MacroscopicTotalCrossSectionValue;
    attribute macroscopicTotalCrossSection: MacroscopicTotalCrossSectionValue :> quantity;

    /**
     * source: item 10-43 particle fluence
     * symbol(s): Φ
     * application domain: General
     * name: ParticleFluence
     * quantity dimension: L^-2
     * measurement unit(s): m^-2
     * definition: differential quotient of `N` with respect to `a`, where `N` is the number of particles incident on a sphere of cross-sectional area `a `(item 10-38.1): `Φ = (dN)/(da)`
     * remarks: The word “particle” is usually replaced by the name of a specific particle, for example `proton` fluence. If a flat area of size d`A` is passed perpendicularly by a number of d`N` particles, the corresponding particle fluence is: `Φ = (dN)/(dA)`. A plane area of size d`A` crossed at an angle `α` with respect to the surface normal by a number of d`N` particles results in the particle fluence: `Φ = (dN)/(cos(α) dA)` In report 85a of the ICRU a definition with an equivalent meaning is given as: The fluence, `Φ` , is the quotient of d`N` and d`a`, where d`N` is the number of particles incident on a sphere of cross-sectional area d`a`: `Φ = (dN)/(dA)`. See also section 0.3.
     */
    attribute def ParticleFluenceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ParticleFluenceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleFluenceUnit :>> QuantityValue::mRef;
    }
    attribute particleFluence: ParticleFluenceValue :> quantity;

    /**
     * source: item 10-44 particle fluence rate
     * symbol(s): dot(Φ)
     * application domain: General
     * name: ParticleFluenceRate
     * quantity dimension: L^-2*T^-1
     * measurement unit(s): m^-2*s^-1
     * definition: differential quotient of fluence `Φ` (item 10-43) with respect to time (ISO 80000-3): `dot(Φ) = (dΦ)/(dA)`
     * remarks: The word “particle” is usually replaced by the name of a specific particle, for example proton fluence rate. The distribution function expressed in terms of speed and energy, `dot(Φ)_v` and `dot(Φ)_E` , are related to by: `dot(Φ) = int dot(Φ)_v dv = int dot(Φ)_E dE`. This quantity has also been termed particle flux density. Because the word “density” has several connotations, the term “fluence rate” is preferred. For a radiation field composed of particles of velocity `v`, the fluence rate is equal to `n`·`v` where `n` is the particle number density. See Remarks for item 10-43. In report 85a of the ICRU a definition with an equivalent meaning is given as: The fluence rate, `dot(Φ)` , is the quotient of `d Φ` and d`t`, where `d Φ` is the increment of the fluence in the time interval d`t`: `dot(Φ) = (dΦ)/(dt)`. See also section 0.3.
     */
    attribute def ParticleFluenceRateUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ParticleFluenceRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleFluenceRateUnit :>> QuantityValue::mRef;
    }
    attribute particleFluenceRate: ParticleFluenceRateValue :> quantity;

    /**
     * source: item 10-45 radiant energy
     * symbol(s): R
     * application domain: ionizing radiation
     * name: RadiantEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: mean energy (ISO 80000-5), excluding rest energy (item 10-3), of the particles that are emitted, transferred, or received
     * remarks: For particles of energy `E` (excluding rest energy), the radiant energy, `R`, is equal to the product `N·E` where `N` is the number of the particles that are emitted, transferred, or received The distributions, `N_E` and `R_E`, of the particle number and the radiant energy with respect to energy are given by `N_E` = d`N`/d`E` and `R_E` = d`R`/d`E`, respectively, where d`N` is the number of particles with energy between `E` and `E`+d`E`, and d`R` is their radiant energy. The two distributions are related by `R_E` = `E`·`N_E`.
     */
    attribute radiantEnergy: EnergyValue :> energy;

    /**
     * source: item 10-46 energy fluence
     * symbol(s): Ψ
     * application domain: General
     * name: EnergyFluence
     * quantity dimension: M^1*T^-2
     * measurement unit(s): eV/m^2, J/m^2, kg*s^-2
     * definition: differential quotient of radiant energy `R` (item 10-45) incident on a sphere of cross-sectional area (item 10-38.1) `a` with respect to that area: `Ψ = (dR)/(da)`
     * remarks: In report 85a of the ICRU a definition with an equivalent meaning is given as: The energy fluence, `Ψ` is the quotient of d`R` and d`a`, where d`R` is the radiant energy incident on a sphere of cross-sectional area d`a`: `Ψ = (dR)/(da)`. See also section 0.3.
     */
    attribute def EnergyFluenceUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def EnergyFluenceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnergyFluenceUnit :>> QuantityValue::mRef;
    }
    attribute energyFluence: EnergyFluenceValue :> quantity;

    /**
     * source: item 10-47 energy fluence rate
     * symbol(s): dot(Ψ)
     * application domain: General
     * name: EnergyFluenceRate
     * quantity dimension: M^1*T^-3
     * measurement unit(s): W/m^2, kg*s^-3
     * definition: differential quotient of the energy fluence `Ψ` (item 10-46) with respect to time (ISO 80000-3): `dot(Ψ) = (d Ψ)/(dt)`
     * remarks: In report 85a of the ICRU a definition with an equivalent meaning is given as: The energy-fluence rate, `dot(Ψ)` , is the quotient of `d Ψ` by d`t`, where `d Ψ` is the increment of the energy fluence in the time interval d`t`: `dot(Ψ) = (d Ψ)/(dt)`. See also section 0.3.
     */
    attribute def EnergyFluenceRateUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def EnergyFluenceRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnergyFluenceRateUnit :>> QuantityValue::mRef;
    }
    attribute energyFluenceRate: EnergyFluenceRateValue :> quantity;

    /**
     * source: item 10-48 particle current density
     * symbol(s): J, S
     * application domain: General
     * name: ParticleCurrentDensity
     * quantity dimension: L^-2*T^-1
     * measurement unit(s): m^-2*s^-1
     * definition: vector whose component in direction of an area normal is given by: `J_n = int Φ_Ω(θ, α) cos(θ) dΩ` where `Φ_Ω(θ, α)` is the directional distribution of the particle fluence rate (item 10-44), and ` θ` and `α` are polar and azimuthal angles, respectively
     * remarks: Usually the word “particle” is replaced by the name of a specific particle, for example proton current. Symbol `vec(S)` is recommended when there is a possibility of confusion with the symbol `vec(J)` for electric current density. For neutron current, the symbol `vec(J)` is generally used. The distribution functions expressed in terms of speed and energy, `vec(J)_v` and `vec(J)_E`, are related to `vec(J)` by: `J = int J_v dv = int J_E dE`. The directional distribution of the particle fluence rate is also denoted as particle radiance.
     */
    attribute def ParticleCurrentDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ParticleCurrentDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleCurrentDensityUnit :>> QuantityValue::mRef;
    }
    attribute particleCurrentDensity: ParticleCurrentDensityValue :> quantity;

    /**
     * source: item 10-49 linear attenuation coefficient
     * symbol(s): μ, μ_l
     * application domain: ionizing radiation
     * name: LinearAttenuationCoefficient
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: for uncharged particles of a given type and energy the differential quotient `n` with respect to `l,` where `n` is the fraction of `N` incoming particles that experience interactions in traversing a distance (ISO 80000-3) `l` in a given material: `μ = (dn)/(dl) = 1/N (dN)/(dl)` where d`N` is the number of particles that experience interactions in traversing d`l`
     * remarks: `μ` is equal to the macroscopic total cross section `Σ_(`tot) for the removal of particles from the beam. Using the relation `μ_m` = `μ`/`ρ` between the linear attenuation coefficient `μ`, the mass attenuation coefficient `μ_m` (item 10-50) and the density `ρ`, the definition given for the mass attenuation coefficient in report 85a of the ICRU can be applied to the linear attenuation coefficient resulting in: The linear attenuation coefficient, `μ`, of a material, for uncharged particles of a given type and energy, is the quotient of d`N`/`N` by d`l`, where d`N`/`N` is the mean fraction of the particles that experience interactions in traversing a distance d`l` in the material: `μ = 1/(dl) (dN)/(N)`. This definition has an equivalent meaning as the one given in column 4 of this item. See also section 0.3.
     */
    attribute def LinearAttenuationCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def LinearAttenuationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearAttenuationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute linearAttenuationCoefficient: LinearAttenuationCoefficientValue :> quantity;

    /**
     * source: item 10-50 mass attenuation coefficient
     * symbol(s): μ_m
     * application domain: ionizing radiation
     * name: MassAttenuationCoefficient
     * quantity dimension: L^2*M^-1
     * measurement unit(s): kg^-1*m^2
     * definition: quotient of the linear attenuation coefficient `µ` (item 10-49) and the mass density `ρ` (ISO 80000-4) of the medium: `μ_m` = μ/`ρ`
     * remarks: 
     */
    attribute def MassAttenuationCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassAttenuationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassAttenuationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute massAttenuationCoefficient: MassAttenuationCoefficientValue :> quantity;

    /**
     * source: item 10-51 molar attenuation coefficient
     * symbol(s): μ_c
     * application domain: General
     * name: MolarAttenuationCoefficient
     * quantity dimension: L^2*N^-1
     * measurement unit(s): m^2*mol^-1
     * definition: quotient of linear attenuation coefficient `µ` (item 10-49) and the amount c (ISO 80000-9) of the medium: `μ_c` = μ/`c`
     * remarks: 
     */
    attribute def MolarAttenuationCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute amountOfSubstancePowerFactor :>> SIDerivedUnit::amountOfSubstancePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MolarAttenuationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MolarAttenuationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute molarAttenuationCoefficient: MolarAttenuationCoefficientValue :> quantity;

    /**
     * source: item 10-52 atomic attenuation coefficient
     * symbol(s): μ_a
     * application domain: General
     * name: AtomicAttenuationCoefficient
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: quotient of the linear attenuation coefficient `µ` (item 10-49) and the number density (item 10-62.1), `n`, of atoms in the substance: `μ_a`` = μ`/`n`
     * remarks: `μ` is equal to the total cross section `σ_(`tot) for the removal of particles from the beam. See also item 10-38.2.
     */
    attribute def AtomicAttenuationCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def AtomicAttenuationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AtomicAttenuationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute atomicAttenuationCoefficient: AtomicAttenuationCoefficientValue :> quantity;

    /**
     * source: item 10-53 half-value thickness
     * symbol(s): d_(1//2)
     * application domain: General
     * name: HalfValueThickness (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: thickness (ISO 80000-3) of the attenuating layer that reduces the quantity of interest of a unidirectional beam of infinitesimal width to half of its initial value
     * remarks: For exponential attenuation, `d_(`1/2) = ln(2)/`μ`. The quantity of interest is often the air kerma or exposure.
     */
    attribute halfValueThickness: LengthValue :> length;

    /**
     * source: item 10-54 total linear stopping power, linear stopping power
     * symbol(s): S, S_l
     * application domain: General
     * name: TotalLinearStoppingPower
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): eV/m, J/m, kg*m*s^-2
     * definition: for charged particles of a given type and energy `E_0` the differential quotient of `E` with respect to `x,` where `E` is the mean energy (ISO 80000-4) lost by the charged particles in traversing a distance (ISO 80000-3) `x` in the given material: `S = - (dE)/(dx)`
     * remarks: The total linear stopping power is sometimes also called stopping power. Both electronic losses and radiative losses are included. The quotient of the total linear stopping power of a substance and that of a reference substance is called the relative linear stopping power. See also item 10-85. Using the relation `S_m` = `S`/`ρ` between the total mass stopping power `S_m` (item 10-55), the total linear stopping power `S`, and the density `ρ`, the definition given for the mass stopping in report 85a of the ICRU can be applied to that of the total linear stopping power resulting in: The linear stopping power, `S`, of a material, for charged particles of a given type and energy, is the quotient of d`E` by d`l`, where d`E` is the mean energy lost by the charged particles in traversing a distance d`l` in the material: `S = - (dE)/(dx)`. This definition has an equivalent meaning as the one given in column 4 of this item. See also section 0.3.
     */
    attribute def TotalLinearStoppingPowerUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def TotalLinearStoppingPowerValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalLinearStoppingPowerUnit :>> QuantityValue::mRef;
    }
    attribute totalLinearStoppingPower: TotalLinearStoppingPowerValue :> quantity;

    alias TotalLinearStoppingPowerValue as LinearStoppingPowerValue;
    attribute linearStoppingPower: LinearStoppingPowerValue :> quantity;

    /**
     * source: item 10-55 total mass stopping power, mass stopping power
     * symbol(s): S_m
     * application domain: General
     * name: TotalMassStoppingPower
     * quantity dimension: L^4*T^-2
     * measurement unit(s): eV*m^‑2/kg, J*m^2/kg, m^4*s^-2
     * definition: quotient of the total linear stopping power `S` (item 10-54) and the mass density `ρ` (ISO 80000-4) of the material: `S_m` = S/`ρ`
     * remarks: The quotient of total mass stopping power of a material and that of a reference material is called relative mass stopping power.
     */
    attribute def TotalMassStoppingPowerUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def TotalMassStoppingPowerValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalMassStoppingPowerUnit :>> QuantityValue::mRef;
    }
    attribute totalMassStoppingPower: TotalMassStoppingPowerValue :> quantity;

    alias TotalMassStoppingPowerValue as MassStoppingPowerValue;
    attribute massStoppingPower: MassStoppingPowerValue :> quantity;

    /**
     * source: item 10-56 mean linear range
     * symbol(s): R, R_l
     * application domain: General
     * name: MeanLinearRange (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: mean total rectified path length (ISO 80000-3) travelled by a particle in the course of slowing down to rest in a given material averaged over a group of particles having the same initial energy (ISO 80000-5)
     * remarks: 
     */
    attribute meanLinearRange: LengthValue :> length;

    /**
     * source: item 10-57 mean mass range
     * symbol(s): R_ρ, R_m
     * application domain: General
     * name: MeanMassRange
     * quantity dimension: L^-2*M^1
     * measurement unit(s): kg*m^-2
     * definition: product of the mean linear range (item 10-56) `R` and the mass density `ρ` (ISO 80000-4) of the material: `R_ρ` = R`ρ`
     * remarks: 
     */
    attribute def MeanMassRangeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MeanMassRangeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MeanMassRangeUnit :>> QuantityValue::mRef;
    }
    attribute meanMassRange: MeanMassRangeValue :> quantity;

    /**
     * source: item 10-58 linear ionization
     * symbol(s): N_i_l
     * application domain: General
     * name: LinearIonization
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: differential quotient of `q` with respect to `l`, where `q` is the average total charge (IEC 80000-6) of all positive ions produced by an ionizing charged particle over a path `l` (ISO 80000-3), divided by the elementary charge, `e `(ISO 80000-1): `N_(il) = 1/e (dq)/(dl)`
     * remarks: Ionization due to secondary ionizing particles is included.
     */
    attribute def LinearIonizationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def LinearIonizationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearIonizationUnit :>> QuantityValue::mRef;
    }
    attribute linearIonization: LinearIonizationValue :> quantity;

    /**
     * source: item 10-59 total ionization
     * symbol(s): N_i
     * application domain: General
     * name: TotalIonization
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the total mean charge of all positive ions produced by an ionizing charged particle along its entire path and along the paths of any secondary charged particles, and the elementary charge, `e `(ISO 80000-1)
     * remarks: `N_i = int N_(il) dl` See item 10-58.
     */
    attribute def TotalIonizationUnit :> DimensionOneUnit {
    }
    attribute def TotalIonizationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalIonizationUnit :>> QuantityValue::mRef;
    }
    attribute totalIonization: TotalIonizationValue :> quantity;

    /**
     * source: item 10-60 average energy loss per elementary charge produced
     * symbol(s): W_i
     * application domain: General
     * name: AverageEnergyLossPerElementaryChargeProduced
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: quotient of the initial kinetic energy `E_k` (ISO 80000-4) of an ionizing charged particle and the total ionization `N_i` (item 10-59) produced by that particle: `W_i` = `E_k`/`N_i`
     * remarks: The name “average energy loss per ion pair formed” is usually used, although it is ambiguous. In the practical dosimetry of ionizing radiation the term `W`/`e`, the quotient of `W`, the average energy deposited in dry air per ion pair formed, and `e`, the elementary charge, is used as the factor which, when multiplied with the electric charge of one sign carried by all ion pairs formed in dry air of given mass, gives the energy deposited in this amount of dry air in the form of excitations and ionizations. In ICRU Report 85a, the mean energy expended in a gas per ion pair formed, `W`, is the quotient of `E` by `N,` where `N` is the mean total liberated charge of either sign, divided by the elementary charge when the initial kinetic energy `E` of a charged particle introduced into the gas is completely dissipated in the gas. Thus, `W` = `E`/`N`. It follows from the definition of `W` that the ions produced by bremsstrahlung or other secondary radiation emitted by the initial and secondary charged particles are included in `N`.
     */
    attribute def AverageEnergyLossPerElementaryChargeProducedUnit :> SIDerivedUnit {
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
    attribute def AverageEnergyLossPerElementaryChargeProducedValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AverageEnergyLossPerElementaryChargeProducedUnit :>> QuantityValue::mRef;
    }
    attribute averageEnergyLossPerElementaryChargeProduced: AverageEnergyLossPerElementaryChargeProducedValue :> quantity;

    /**
     * source: item 10-61 mobility
     * symbol(s): μ, μ_m
     * application domain: General
     * name: Mobility
     * quantity dimension: M^-1*T^2*I^1
     * measurement unit(s): m^2/(V*s), kg^-1*s^2*A
     * definition: quotient of average drift speed (ISO 80000-3) imparted to a charged particle in a medium by an electric field, and the electric field strength (IEC 80000-6)
     * remarks: 
     */
    attribute def MobilityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MobilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MobilityUnit :>> QuantityValue::mRef;
    }
    attribute mobility: MobilityValue :> quantity;

    /**
     * source: item 10-62.1 particle number density
     * symbol(s): n
     * application domain: General
     * name: ParticleNumberDensity
     * quantity dimension: L^-3
     * measurement unit(s): m^-3
     * definition: quotient of the mean number `N` of particles in the volume (ISO 80000-3) `V` and volume: `n` =` N`/`V`
     * remarks: `n` is the general symbol for the number density of particles. The distribution functions expressed in terms of speed and energy, `n_v` and `n_E`, are related to `n` by: `n = int n_v dv = int n_E dE`. The word “particle” is usually replaced by the name of a specific particle, for example `neutron` number density.
     */
    attribute def ParticleNumberDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def ParticleNumberDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleNumberDensityUnit :>> QuantityValue::mRef;
    }
    attribute particleNumberDensity: ParticleNumberDensityValue :> quantity;

    /**
     * source: item 10-62.2 ion number density, ion density
     * symbol(s): n^+, n^-
     * application domain: General
     * name: IonNumberDensity
     * quantity dimension: L^-3
     * measurement unit(s): m^-3
     * definition: quotient of the number of positive and negative ions, `N`^+ and `N`^-, respectively, in the volume `V` (ISO 80000-3), and that volume: `n`^+ = `N`^+/`V`, `n`^- = `N`^-/`V`
     * remarks: 
     */
    attribute def IonNumberDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def IonNumberDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: IonNumberDensityUnit :>> QuantityValue::mRef;
    }
    attribute ionNumberDensity: IonNumberDensityValue :> quantity;

    alias IonNumberDensityValue as IonDensityValue;
    attribute ionDensity: IonDensityValue :> quantity;

    /**
     * source: item 10-63 Recombination coefficient
     * symbol(s): α
     * application domain: General
     * name: RecombinationCoefficient
     * quantity dimension: L^3*T^-1
     * measurement unit(s): m^3*s^-1
     * definition: coefficient in the law of recombination: `- (dn^+)/(dt) = - (dn^-)/(dt) = α * n^+ n^-` where `n`^+ and `n`^- are the ion number densities (item 10-62.2) of positive and negative ions, respectively, recombined during a time interval of duration d`t` (ISO 80000-3)
     * remarks: The widely used term “recombination factor” is not correct because “factor” should only be used for quantities with dimension 1. The terms `(dn^+)/(dt) , (dn^-)/(dt)` are differential quotients.
     */
    attribute def RecombinationCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def RecombinationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RecombinationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute recombinationCoefficient: RecombinationCoefficientValue :> quantity;

    /**
     * source: item 10-64 diffusion coefficient, diffusion coefficient for particle number density
     * symbol(s): D, D_n
     * application domain: General
     * name: DiffusionCoefficient
     * quantity dimension: L^2*T^-1
     * measurement unit(s): m^2*s^-1
     * definition: proportionality constant between the particle current density `vec(J)` (item 10-48) and the gradient of the particle number density `n` (item 10-62.1): `vec(J) = - vec(D) * nabla n`
     * remarks: The word “particle” is usually replaced by the name of a specific particle, for example `neutron` number density. For a particle of a given speed `v`: `D_n(v) = - J_(v,x)/(del n_v // del x)`
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

    alias DiffusionCoefficientValue as DiffusionCoefficientForParticleNumberDensityValue;
    attribute diffusionCoefficientForParticleNumberDensity: DiffusionCoefficientForParticleNumberDensityValue :> quantity;

    /**
     * source: item 10-65 diffusion coefficient for fluence rate
     * symbol(s): D_ϕ, D
     * application domain: General
     * name: DiffusionCoefficientForFluenceRate (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: proportionality constant between the particle current density `vec(J )`(item 10-48) and the gradient of the particle fluence rate `dot(Φ)` (item 10-44): `vec(J) = - vec(D) * nabla Φ`
     * remarks: For a particle of a given speed `v`: `d_Ψ(v) = - J_(v,x)/(del Ψ // del x)` and `vec(v) * vec(D_Ψ)(v) = - vec(D_n)(v)`
     */
    attribute diffusionCoefficientForFluenceRate: LengthValue :> length;

    /**
     * source: item 10-66 particle source density
     * symbol(s): S
     * application domain: General
     * name: ParticleSourceDensity
     * quantity dimension: L^-3*T^-1
     * measurement unit(s): m^-3*s^-1
     * definition: quotient of the mean rate of production of particles in a volume, and that volume (ISO 80000-3)
     * remarks: The word “particle” is usually replaced by the name of a specific particle, for example `proton` source density. The distribution functions expressed in terms of speed and energy, `S_v` and `S_E`, are related to `S` by: `S = int S_v dv = int S_E dE`.
     */
    attribute def ParticleSourceDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ParticleSourceDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ParticleSourceDensityUnit :>> QuantityValue::mRef;
    }
    attribute particleSourceDensity: ParticleSourceDensityValue :> quantity;

    /**
     * source: item 10-67 slowing-down density
     * symbol(s): q
     * application domain: General
     * name: SlowingDownDensity
     * quantity dimension: L^-3*T^-1
     * measurement unit(s): m^-3*s^-1
     * definition: differential quotient of `n` with respect to time, where `n` is the number density of particles that are slowed down in a time interval of duration (ISO 80000-3) `t`: `q = - (dn)/(dt)`
     * remarks: 
     */
    attribute def SlowingDownDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SlowingDownDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SlowingDownDensityUnit :>> QuantityValue::mRef;
    }
    attribute slowingDownDensity: SlowingDownDensityValue :> quantity;

    /**
     * source: item 10-68 resonance escape probability
     * symbol(s): p
     * application domain: General
     * name: ResonanceEscapeProbability
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: in an infinite medium, the probability that a neutron slowing down will traverse all or some specified portion of the range of resonance energies (item 10-37.2) without being absorbed
     * remarks: 
     */
    attribute def ResonanceEscapeProbabilityUnit :> DimensionOneUnit {
    }
    attribute def ResonanceEscapeProbabilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ResonanceEscapeProbabilityUnit :>> QuantityValue::mRef;
    }
    attribute resonanceEscapeProbability: ResonanceEscapeProbabilityValue :> quantity;

    /**
     * source: item 10-69 lethargy
     * symbol(s): u
     * application domain: General
     * name: Lethargy
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for a neutron of kinetic energy `E` (ISO 80000-4) : `u` = ln(`E_0`/`E`), where `E_0` is a reference energy
     * remarks: Lethargy is also referred to as logarithmic energy decrement.
     */
    attribute def LethargyUnit :> DimensionOneUnit {
    }
    attribute def LethargyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LethargyUnit :>> QuantityValue::mRef;
    }
    attribute lethargy: LethargyValue :> quantity;

    /**
     * source: item 10-70 average logarithmic energy decrement
     * symbol(s): ζ
     * application domain: General
     * name: AverageLogarithmicEnergyDecrement
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: average value of the increase in lethargy (item 10-69) in elastic collisions between neutrons and nuclei whose kinetic energy (ISO 80000-4) is negligible compared with that of the neutrons
     * remarks: 
     */
    attribute def AverageLogarithmicEnergyDecrementUnit :> DimensionOneUnit {
    }
    attribute def AverageLogarithmicEnergyDecrementValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AverageLogarithmicEnergyDecrementUnit :>> QuantityValue::mRef;
    }
    attribute averageLogarithmicEnergyDecrement: AverageLogarithmicEnergyDecrementValue :> quantity;

    /**
     * source: item 10-71 mean free path
     * symbol(s): l, λ
     * application domain: atomic physics
     * name: MeanFreePath (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: average distance (ISO 80000-3) that particles travel between two successive specified reactions or processes
     * remarks: See the Remarks for item 10-42.1.
     */
    attribute meanFreePath: LengthValue :> length;

    /**
     * source: item 10-72.1 slowing-down area
     * symbol(s): L_s^2, L_(sl)^2
     * application domain: General
     * name: SlowingDownArea (specializes Area)
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: in an infinite homogenous medium, one-sixth of the mean square of the distance (ISO 80000-3) between the neutron source and the point where a neutron reaches a given energy (ISO 80000-5)
     * remarks: 
     */
    attribute slowingDownArea: AreaValue :> area;

    /**
     * source: item 10-72.2 diffusion area
     * symbol(s): L^2
     * application domain: General
     * name: DiffusionArea (specializes Area)
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: in an infinite homogenous medium, one-sixth of the mean square distance (ISO 80000-3) between the point where a neutron enters a specified class and the point where it leaves this class
     * remarks: The class of neutrons must be specified, e.g. thermal.
     */
    attribute diffusionArea: AreaValue :> area;

    /**
     * source: item 10-72.3 migration area
     * symbol(s): M^2
     * application domain: General
     * name: MigrationArea (specializes Area)
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: sum of the slowing-down area (item 10-72.1) from fission energy to thermal energy (ISO 80000-5) and the diffusion area (item 10-72.2) for thermal neutrons
     * remarks: 
     */
    attribute migrationArea: AreaValue :> area;

    /**
     * source: item 10-73.1 slowing-down length
     * symbol(s): L_s, L_(sl)
     * application domain: General
     * name: SlowingDownLength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: square root of the slowing down area `L_s^2` (item 10-72.1): `L_s = sqrt(L_s^2)`
     * remarks: 
     */
    attribute slowingDownLength: LengthValue :> length;

    /**
     * source: item 10-73.2 diffusion length
     * symbol(s): L
     * application domain: atomic physics
     * name: DiffusionLength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: square root of the diffusion area `L`^2 (item 10-72.2): `L = sqrt(L^2)`
     * remarks: 
     */
    attribute diffusionLength: LengthValue :> length;

    /**
     * source: item 10-73.3 migration length
     * symbol(s): M
     * application domain: General
     * name: MigrationLength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: square root of the migration area `M`^2 (item 10-72.3): `M = sqrt(M^2)`
     * remarks: 
     */
    attribute migrationLength: LengthValue :> length;

    /**
     * source: item 10-74.1 neutron yield per fission
     * symbol(s): ν
     * application domain: General
     * name: NeutronYieldPerFission
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: average number of fission neutrons, both prompt and delayed, emitted per fission event
     * remarks: 
     */
    attribute def NeutronYieldPerFissionUnit :> DimensionOneUnit {
    }
    attribute def NeutronYieldPerFissionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NeutronYieldPerFissionUnit :>> QuantityValue::mRef;
    }
    attribute neutronYieldPerFission: NeutronYieldPerFissionValue :> quantity;

    /**
     * source: item 10-74.2 neutron yield per absorption
     * symbol(s): η
     * application domain: General
     * name: NeutronYieldPerAbsorption
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: average number of fission neutrons, both prompt and delayed, emitted per neutron absorbed in a fissionable nuclide or in a nuclear fuel, as specified
     * remarks: `ν`/`η` is equal to the quotient of the macroscopic cross section for fission and that for absorption, both for neutrons in the fuel material.
     */
    attribute def NeutronYieldPerAbsorptionUnit :> DimensionOneUnit {
    }
    attribute def NeutronYieldPerAbsorptionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NeutronYieldPerAbsorptionUnit :>> QuantityValue::mRef;
    }
    attribute neutronYieldPerAbsorption: NeutronYieldPerAbsorptionValue :> quantity;

    /**
     * source: item 10-75 fast fission factor
     * symbol(s): φ
     * application domain: General
     * name: FastFissionFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: in an infinite medium, the quotient of the mean number of neutrons produced by fission due to neutrons of all energies (ISO 80000-5) and the mean number of neutrons produced by fissions due to thermal neutrons only
     * remarks: The class of neutrons must be specified, e.g. thermal.
     */
    attribute def FastFissionFactorUnit :> DimensionOneUnit {
    }
    attribute def FastFissionFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: FastFissionFactorUnit :>> QuantityValue::mRef;
    }
    attribute fastFissionFactor: FastFissionFactorValue :> quantity;

    /**
     * source: item 10-76 thermal utilization factor
     * symbol(s): f
     * application domain: General
     * name: ThermalUtilizationFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: in an infinite medium, the quotient of the number of thermal neutrons absorbed in a fissionable nuclide or in a nuclear fuel, as specified, and the total number of thermal neutrons absorbed
     * remarks: 
     */
    attribute def ThermalUtilizationFactorUnit :> DimensionOneUnit {
    }
    attribute def ThermalUtilizationFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalUtilizationFactorUnit :>> QuantityValue::mRef;
    }
    attribute thermalUtilizationFactor: ThermalUtilizationFactorValue :> quantity;

    /**
     * source: item 10-77 non-leakage probability
     * symbol(s): Λ
     * application domain: General
     * name: NonLeakageProbability
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: probability that a neutron will not escape from the reactor during the slowing-down process or while it diffuses as a thermal neutron
     * remarks: 
     */
    attribute def NonLeakageProbabilityUnit :> DimensionOneUnit {
    }
    attribute def NonLeakageProbabilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NonLeakageProbabilityUnit :>> QuantityValue::mRef;
    }
    attribute nonLeakageProbability: NonLeakageProbabilityValue :> quantity;

    /**
     * source: item 10-78.1 multiplication factor
     * symbol(s): k
     * application domain: General
     * name: MultiplicationFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of the total number of fission or fission-dependent neutrons produced in the duration of a time interval and the total number of neutrons lost by absorption and leakage in that duration
     * remarks: 
     */
    attribute def MultiplicationFactorUnit :> DimensionOneUnit {
    }
    attribute def MultiplicationFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MultiplicationFactorUnit :>> QuantityValue::mRef;
    }
    attribute multiplicationFactor: MultiplicationFactorValue :> quantity;

    /**
     * source: item 10-78.2 infinite multiplication factor
     * symbol(s): k_(oo)
     * application domain: General
     * name: InfiniteMultiplicationFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: multiplication factor (item 10-78.1) for an infinite medium or for an infinite repeating lattice
     * remarks: For a thermal reactor, `k_∞`` = η·ε·p·f`
     */
    attribute def InfiniteMultiplicationFactorUnit :> DimensionOneUnit {
    }
    attribute def InfiniteMultiplicationFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: InfiniteMultiplicationFactorUnit :>> QuantityValue::mRef;
    }
    attribute infiniteMultiplicationFactor: InfiniteMultiplicationFactorValue :> quantity;

    /**
     * source: item 10-79 reactor time constant
     * symbol(s): T
     * application domain: General
     * name: ReactorTimeConstant (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: duration (ISO 80000-3) required for the neutron fluence rate (item 10-44) in a reactor to change by the factor e when the fluence rate is rising or falling exponentially
     * remarks: Also called reactor period.
     */
    attribute reactorTimeConstant: TimeValue :> time;

    /**
     * source: item 10-80.1 energy imparted
     * symbol(s): ε
     * application domain: General
     * name: EnergyImparted
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: sum of all energy deposits in a given volume: `ε = sum_i ε_i` where the summation is performed over all energy (ISO 80000-5) deposits `ε_i` of interaction `i` in that volume
     * remarks: Energy imparted is a stochastic quantity. `ε_i` is given by: `ε_i` = `ε_(`in) -` ε_(`out) + `Q` where `ε_(`in) is the energy (ISO 80000-5) of the incident ionizing particle, excluding rest energy (item 10-3), `ε_(`out) is the sum of the energies (ISO 80000-5) of all ionizing particles leaving the interaction, excluding rest energy (item 10-3), and `Q` is the change in the rest energies (item 10-3) of the nucleus and of all particles involved in the interaction. `Q` > 0 means decrease of rest energy; `Q` < 0 means increase of rest energy. Stochastic quantities such as the energy imparted and the specific energy imparted (item 10-81.2) and their probability distributions have been introduced as they describe the discontinuous nature of the ionizing radiations as a determinant of radiochemical and radiobiological effects. In radiation applications involving large numbers of ionizing particles, e.g. in medicine, radiation protection and materials testing and processing, these fluctuations are adequately represented by the expectation values of the probability distributions. Non-stochastic quantities such as particle fluence (item 10-43), absorbed dose (item 10-81.1) and kerma (item 10-86.1) are based on these expectation values.
     */
    attribute def EnergyImpartedUnit :> SIDerivedUnit {
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
    attribute def EnergyImpartedValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnergyImpartedUnit :>> QuantityValue::mRef;
    }
    attribute energyImparted: EnergyImpartedValue :> quantity;

    /**
     * source: item 10-80.2 mean energy imparted
     * symbol(s): bar(ε)
     * application domain: General
     * name: MeanEnergyImparted
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): eV, J, kg*m^2*s^-2
     * definition: expectation value of the energy imparted (item 10-80.1): `bar(ε) = R_(i n) - R_(out) + int Q` where `R_(`in) is the radiant energy (item 10-45) of all those charged and uncharged ionizing particles that enter the volume, `R_(`out) is the radiant energy of all those charged and un- charged ionizing particles that leave the volume, and `sum Q` is the sum of all changes of the rest energy (item 10-3) of nuclei and elementary particles that occur in that volume
     * remarks: Sometimes, it has been called the integral absorbed dose. `Q` > 0 means decrease of rest energy; `Q` < 0 means increase of rest energy.
     */
    attribute def MeanEnergyImpartedUnit :> SIDerivedUnit {
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
    attribute def MeanEnergyImpartedValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MeanEnergyImpartedUnit :>> QuantityValue::mRef;
    }
    attribute meanEnergyImparted: MeanEnergyImpartedValue :> quantity;

    /**
     * source: item 10-81.1 absorbed dose
     * symbol(s): D
     * application domain: General
     * name: AbsorbedDose
     * quantity dimension: L^2*T^-2
     * measurement unit(s): Gy, J/kg, m^2*s^-2
     * definition: differential quotient of `bar(ε)` with respect to `m`, where `bar(ε)` is the mean energy (ISO 80000-5) imparted by ionizing radiation to matter of mass (ISO 80000-4) `m`: `D = (d bar(ε))/(dm)`
     * remarks: The gray is a special name for joule per kilogram, to be used as the coherent SI unit for absorbed dose. 1 Gy = 1 J/kg `bar(ε) = int D dm` where d`m` is the element of mass of the irradiated matter. In the limit of a small domain, the mean specific energy `bar(z) = (Δ bar(ε))/(Δ m)` is equal to the absorbed dose `D`. The absorbed dose can also be expressed in terms of the volume of the mass element by: `D = (d bar(ε))/(dm) = (d bar(ε))/(ρ dV)` where `ρ` is the mass density of the mass element. In report 85a of the ICRU a definition with an equivalent meaning is given as: The absorbed dose, `D`, is the quotient of `d bar(ε)` by dm, where `d bar(ε)` is the mean energy imparted by ionizing radiation to matter of mass d`m`: `D = (d bar(ε))/(dm)`.
     */
    attribute def AbsorbedDoseUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def AbsorbedDoseValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AbsorbedDoseUnit :>> QuantityValue::mRef;
    }
    attribute absorbedDose: AbsorbedDoseValue :> quantity;

    /**
     * source: item 10-81.2 specific energy imparted
     * symbol(s): z
     * application domain: General
     * name: SpecificEnergyImparted (specializes AbsorbedDose)
     * quantity dimension: L^2*T^-2
     * measurement unit(s): Gy, J/kg, m^2*s^-2
     * definition: quotient of the energy imparted `ε` (item 10-80.1) and the mass `m` (ISO 80000-4) of the matter in a given volume element: `z = ε / m`
     * remarks: `z` is a stochastic quantity. In the limit of a small domain, the mean specific energy `bar(z)` is equal to the absorbed dose `D`. The specific energy imparted can be due to one or more (energy-deposition) events.
     */
    attribute specificEnergyImparted: AbsorbedDoseValue :> absorbedDose;

    /**
     * source: item 10-82 quality factor
     * symbol(s): Q
     * application domain: ionizing radiation
     * name: QualityFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: factor in the calculation and measurement of dose equivalent (item 10-83.1), by which the absorbed dose (item 10-81.1) is to be weighted in order to account for different biological effectiveness of radiations, for radiation protection purposes
     * remarks: `Q` is determined by the linear energy transfer (item 10-85) for `Δ -> oo` , `L_∞` (often denoted as `L` or LET), of charged particles passing through a small volume element at this point (the value of `L_∞` refers to water, not to tissue; the difference, however, is small). The relationship between `L` and `Q` is given in ICRP Publication 103 (ICRP, 2007).
     */
    attribute def QualityFactorUnit :> DimensionOneUnit {
    }
    attribute def QualityFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: QualityFactorUnit :>> QuantityValue::mRef;
    }
    attribute qualityFactor: QualityFactorValue :> quantity;

    /**
     * source: item 10-83.1 dose equivalent
     * symbol(s): H
     * application domain: General
     * name: DoseEquivalent
     * quantity dimension: L^2*T^-2
     * measurement unit(s): Sv, J/kg, m^2*s^-2
     * definition: product of the absorbed dose `D` (item 10-81.1) to tissue at the point of interest and the quality factor `Q` (item 10-82) at that point: `H` =` DQ`
     * remarks: The sievert (Sv) is a special name for joule per kilogram, and is the coherent SI unit for dose equivalent. 1 Sv = 1 J/kg The dose equivalent at a point in tissue is given by: `H = int_o^oo Q(L) D_L dL` where `D_L` = d`D`/d`L` is the distribution of `D` in `L` at the point of interest. See ICRP Publication 103 (ICRP, 2007). The quantities measured with radiation protection dosimeters are based on the definition `H` = `Q D`. If various radiation qualities `i` have to be simultaneously accounted for, the definition is: `H = sum_i Q_i D_i`. In ICRU 51 this quantity is denoted as “dose equivalent”. In order to quantify the radiation exposition of the human body and to specify dose limits, use is made of a quantity defined in ICRP 103, the “equivalent dose to a tissue or organ”: `H_T = w_T sum_R w_R D_(T,R)`. The weighting factors `w_T` for various tissues and organs T and `w_R` for various radiation qualities R have been numerically laid down in ICRP 103. `D_(`T,R) is the mean absorbed dose to tissue within a tissue or organ T, imparted by radiation with radiation quality R.
     */
    attribute def DoseEquivalentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def DoseEquivalentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DoseEquivalentUnit :>> QuantityValue::mRef;
    }
    attribute doseEquivalent: DoseEquivalentValue :> quantity;

    /**
     * source: item 10-83.2 dose equivalent rate
     * symbol(s): dot(H)
     * application domain: General
     * name: DoseEquivalentRate (specializes DoseEquivalent)
     * quantity dimension: L^2*T^-3
     * measurement unit(s): Sv/s, W/kg, m^2*s^-3
     * definition: differential quotient of dose equivalent `H` (item 10-83.1) with respect to time (ISO 80000-3): `dot(H) = (dH)/(dt)`
     * remarks: 1 Sv/s = 1 W/kg See the remarks for item 10-83.1.
     */
    attribute doseEquivalentRate: DoseEquivalentValue :> doseEquivalent;

    /**
     * source: item 10-84 absorbed-dose rate
     * symbol(s): dot(D)
     * application domain: General
     * name: AbsorbedDoseRate
     * quantity dimension: L^2*T^-3
     * measurement unit(s): Gy/s, W/kg, m^2*s^-3
     * definition: differential quotient of the absorbed dose `D` (item 10-81.1) with respect to time (ISO 80000-3): `dot(D) = (dD)/(dt)`
     * remarks: 1 Gy/s = 1 W/kg See the remarks for item 10-81.1. In report 85a of the ICRU a definition with an equivalent meaning is given as: The absorbed-does rate, `dot(D)` , is the quotient of d`D` by d`t`, where d`D` is the increment of absorbed does in the time interval d`t`: `dot(D) = (dD)/(dt)`.
     */
    attribute def AbsorbedDoseRateUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def AbsorbedDoseRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AbsorbedDoseRateUnit :>> QuantityValue::mRef;
    }
    attribute absorbedDoseRate: AbsorbedDoseRateValue :> quantity;

    /**
     * source: item 10-85 linear energy transfer
     * symbol(s): L_Δ
     * application domain: General
     * name: LinearEnergyTransfer
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): eV/m, J/m, kg*m*s^-2
     * definition: quotient of the mean energy (ISO 80000-4) d`E_Δ` lost by the charged particles due to electronic interactions in traversing a distance (ISO 80000-3) d`l,` minus the mean sum of the kinetic energies in excess of `Δ` of all the electrons released by the charged particles and d`l`: `L_Δ = (dE_Δ)/(dl)`
     * remarks: This quantity is not completely defined unless `Δ` is specified, i.e. the maximum kinetic energy of secondary electrons whose energy is considered to be “locally deposited.” `Δ` may be expressed in eV. Note that the abbreviation LET specifically refers to the quantity `L_∞` mentioned in the remark to 10-82.
     */
    attribute def LinearEnergyTransferUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def LinearEnergyTransferValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearEnergyTransferUnit :>> QuantityValue::mRef;
    }
    attribute linearEnergyTransfer: LinearEnergyTransferValue :> quantity;

    /**
     * source: item 10-86.1 kerma
     * symbol(s): K
     * application domain: General
     * name: Kerma
     * quantity dimension: L^2*T^-2
     * measurement unit(s): Gy, J/kg, m^2*s^-2
     * definition: for uncharged ionizing radiation, differential quotient of `E_(`tr) with respect to `m`, where `E_(`tr) is the mean sum of the initial kinetic energies (ISO 80000-4) of all the charged ionizing particles liberated in a mass (ISO 80000-4) `m` of a material: `K = (dE_tr)/(dm)`
     * remarks: 1 Gy = 1 J/kg See the remarks for item 10-81.1. The name “kerma” is derived from Kinetic Energy Released in MAtter (or MAss or MAterial). The quantity d`E_(`tr) includes also the kinetic energy of the charged particles emitted in the decay of excited atoms, molecules, or nuclei. When the mass element d`m` consists of air the term air kerma is used. It can be convenient to refer to a value of air kerma in free space or at a point inside a material different from air, e.g. to the air kerma at a point inside a water phantom. In report 85a of the ICRU a definition with an equivalent meaning is given as: The kerma, `K`, for ionizing uncharged particles, is the quotient of d`E_(`tr) by d`m`, where d`E_(`tr) is the mean sum of the initial kinetic energies of all the charged particles liberated in a mass d`m` of a material by the uncharged particles incident on d`m`: `K = (dE_tr)/(dm)`.
     */
    attribute def KermaUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def KermaValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: KermaUnit :>> QuantityValue::mRef;
    }
    attribute kerma: KermaValue :> quantity;

    /**
     * source: item 10-86.2 kerma rate
     * symbol(s): dot(K)
     * application domain: General
     * name: KermaRate
     * quantity dimension: L^2*T^-3
     * measurement unit(s): Gy/s, W/kg, m^2*s^-3
     * definition: differential quotient of kerma (item 10-86.1) with respect to time (ISO 80000-3): `dot(K) = (dK)/(dt)`
     * remarks: 1 Gy/s = 1 W/kg See the Remarks for item 10-81.1. In report 85a of the ICRU a definition with an equivalent meaning is given as: The kerma rate, `dot(K)` , is the quotient of d`K` by d`t`, where d`K` is the increment of kerma in the time interval d`t`: `dot(K) = (dK)/(dt)`.
     */
    attribute def KermaRateUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def KermaRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: KermaRateUnit :>> QuantityValue::mRef;
    }
    attribute kermaRate: KermaRateValue :> quantity;

    /**
     * source: item 10-87 mass energy-transfer coefficient
     * symbol(s): μ_(tr)/ρ
     * application domain: General
     * name: MassEnergyTransferCoefficient
     * quantity dimension: L^2*M^-1
     * measurement unit(s): kg^-1*m^2
     * definition: for ionizing uncharged particles of a given type and energy, the differential quotient of `R_(`tr) with respect to `l`: `m_(tr)/ρ = 1/ρ 1/R (dR_tr)/(dl)` where `R_(`tr) is the mean energy (ISO 80000-5) that is transferred to kinetic energy (ISO 80000-4) of charged particles by interactions of the uncharged particles of incident radiant energy `R` (item 10-45) in traversing a distance (ISO 80000-3) `l` in the material of density (ISO 80000-4) `ρ` , divided by `ρ` and `R`
     * remarks: `m_(tr)/ρ = (dot(K))/ψ` , where `dot(K)` is kerma rate (item 10-86.2) and `ψ` is energy fluence rate (item 10-47). The quantity: `μ_(en)//ρ = (μ_(tr)//ρ)(1-g)` where `g` is mean fraction of the kinetic energy of the liberated charged particles that is lost in radiative processes in the material, is called mass energy-absorption coefficient. The mass energy-absorption coefficient of a compound material depends on the stopping power of the material. Thus, its evaluation cannot, in principle, be reduced to a simple summation of the mass energy-absorption coefficient of the atomic constituents. Such a summation can provide an adequate approximation when the value of `g` is sufficiently small. In report 85a of the ICRU a definition with an equivalent meaning is given as: The mass energy-transfer coefficient, `μ_(tr)//ρ` , of a material, for uncharged particles of a given type and energy, is the quotient of d`R_(`tr)/`R` by `ρ` d`l`, where d`R_(`tr) is the mean energy that is transferred to kinetic energy of charged particles by interactions of the uncharged particles of incident radiant energy `R` in traversing a distance d`l` in the material of density `ρ` : `μ_(tr)/ρ = 1/(ρ dl) (d R_(tr))/R`.
     */
    attribute def MassEnergyTransferCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassEnergyTransferCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassEnergyTransferCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute massEnergyTransferCoefficient: MassEnergyTransferCoefficientValue :> quantity;

    /**
     * source: item 10-88 exposure
     * symbol(s): X
     * application domain: ionizing radiation
     * name: Exposure
     * quantity dimension: M^-1*T^1*I^1
     * measurement unit(s): C/kg, kg^-1*s*A
     * definition: for X- or gamma radiation the differential quotient of `q` with respect to `m`, where `q` is the absolute value of the mean total electric charge of the ions of one sign produced when all the electrons and positrons liberated or created by photons incident on an element of dry air with mass `m` (ISO 80000-4) are completely stopped in dry air: `X = (dq)/(dm)`
     * remarks: The ionization produced by electrons emitted in atomic or molecular relaxation is included in d`q`. The ionization due to photons emitted by radiative processes (i.e. bremsstrahlung and fluorescence photons) is not included in d`q`. This quantity should not be confused with the quantity photon exposure (ISO 80000-7), radiation exposure (ISO 80000-7), or the quantity luminous exposure (ISO 80000-7). It can be convenient to refer to a value of exposure in free space or at a point inside a material different from air, e.g. to the exposure at a point inside a water phantom. The exposure is related to the air kerma, `K_a`, (see item 10-86.1) by: `X = (e (1-g))/W K_a` , where `e` is the elementary charge (ISO 80000-1), `W` the average energy loss per elementary charge produced (item 10-60), and `g` is the fraction of the kinetic energy of liberated charged particles that is lost in radiative processes. In report 85a of the ICRU a definition with an equivalent meaning is given as: The exposure, `X`, is the quotient of d`q` by d`m`, where d`q` is the absolute value of the mean total charge of the ions of one sign produced when all the electrons and positrons liberated or created by photons incident on a mass d`m` of dry air are completely stopped in dry air: `X = (dq)/(dm)`.
     */
    attribute def ExposureUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ExposureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ExposureUnit :>> QuantityValue::mRef;
    }
    attribute exposure: ExposureValue :> quantity;

    /**
     * source: item 10-89 exposure rate
     * symbol(s): dot(X)
     * application domain: General
     * name: ExposureRate
     * quantity dimension: M^-1*I^1
     * measurement unit(s): C/(kg*s), kg^-1*A
     * definition: differential quotient of the exposure `X` (item 10-88) with respect to time (ISO 80000-3): `dot(X) = (dX)/(dt)`
     * remarks: 1 C/(kg s) = 1 A/kg In report 85a of the ICRU a definition with an equivalent meaning is given as: The exposure rate, `dot(X)` , is the quotient of d`X` by d`t`, where d`X` is the increment of exposure in the time interval d`t`: `dot(X) = (dX)/(dt)`.
     */
    attribute def ExposureRateUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ExposureRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ExposureRateUnit :>> QuantityValue::mRef;
    }
    attribute exposureRate: ExposureRateValue :> quantity;

}
