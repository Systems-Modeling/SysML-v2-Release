/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard IEC-80000-6:2008 "Electromagnetism"
 * see also https://www.iso.org/obp/ui/#iso:std:iec:80000:-6:ed-1:v1:en,fr
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQElectromagnetism {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    private import ISQThermodynamics::EnergyValue;
    private import ISQThermodynamics::energy;

    /**    
     * source: item 6-1 electric current
     * symbol(s): `I`, `i`
     * application domain: General
     * name: ElectricCurrent
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: electric current is one of the base quantities in the International System of Quantities, ISQ, on which the International System of Units, SI, is based
     * remarks: Electric current is the quantity that can often be measured with an ammeter. The electric current through a surface is the quotient of the electric charge (item 6-2) transferred through the surface during a time interval by the duration of that interval. For a more complete definition, see item 6-8 and IEC 60050-121, item 121-11-13.
     */
    attribute def ElectricCurrentUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: ElectricCurrentUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def ElectricCurrentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricCurrentUnit :>> QuantityValue::mRef;
    }    
    attribute electricCurrent: ElectricCurrentValue :> quantity;

    /**
     * source: item 6-2 electric charge
     * symbol(s): `Q`, `q`
     * application domain: General
     * name: ElectricCharge
     * quantity dimension: T^1*I^1
     * measurement unit(s): C
     * definition: `d(Q) = I dt` where `I` is electric current (item 6-1) and `t` is time (ISO 80000-3, item 3-7)
     * remarks: Electric charge is carried by discrete particles and can be positive or negative. The sign convention is such that the elementary electric charge `e`, i.e. the charge of the proton, is positive. See IEC 60050-121, item121-11-01. To denote a point charge `q` is often used, and that is done in the present document.
     */
    attribute def ElectricChargeUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricChargeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricChargeUnit :>> QuantityValue::mRef;
    }
    attribute electricCharge: ElectricChargeValue :> quantity;

    /**
     * source: item 6-3 electric charge density, volumic electric charge
     * symbol(s): `ρ`, `ρ_V`
     * application domain: General
     * name: ElectricChargeDensity
     * quantity dimension: L^-3*T^1*I^1
     * measurement unit(s): C/m^3
     * definition: `ρ = (dQ)/(dV)` where `Q` is electric charge (item 6-2) and `V` is volume (ISO 80000-3, item 3-4)
     * remarks: See IEC 60050-121, item 121-11-07.
     */
    attribute def ElectricChargeDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricChargeDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricChargeDensityUnit :>> QuantityValue::mRef;
    }
    attribute electricChargeDensity: ElectricChargeDensityValue :> quantity;

    alias ElectricChargeDensityUnit as VolumicElectricChargeUnit;
    alias ElectricChargeDensityValue as VolumicElectricChargeValue;
    alias electricChargeDensity as volumicElectricCharge;

    /**
     * source: item 6-4 surface density of electric charge, areic electric charge
     * symbol(s): `ρ_A`, `sigma`
     * application domain: General
     * name: SurfaceDensityOfElectricCharge
     * quantity dimension: L^-2*T^1*I^1
     * measurement unit(s): C/m^2
     * definition: `ρ_A = (dQ)/(dA)` where `Q` is electric charge (item 6-2) and `A` is area (ISO 80000-3, item 3-3)`
     * remarks: See IEC 60050-121, item 121-11-08.
     */
    attribute def SurfaceDensityOfElectricChargeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def SurfaceDensityOfElectricChargeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SurfaceDensityOfElectricChargeUnit :>> QuantityValue::mRef;
    }
    attribute surfaceDensityOfElectricCharge: SurfaceDensityOfElectricChargeValue :> quantity;

    alias SurfaceDensityOfElectricChargeUnit as AreicElectricChargeUnit;
    alias SurfaceDensityOfElectricChargeValue as AreicElectricChargeValue;
    alias surfaceDensityOfElectricCharge as areicElectricCharge;

    /**
     * source: item 6-5 linear density of electric charge, lineic electric charge
     * symbol(s): `ρ_l`, `tau`
     * application domain: General
     * name: LinearDensityOfElectricCharge
     * quantity dimension: L^-1*T^1*I^1
     * measurement unit(s): C/m
     * definition: `ρ_l = (dQ)/(dl)` where `Q` is electric charge (item 6-2) and `l` is length (ISO 80000-3, item 3-1.1)
     * remarks: See IEC 60050-121, item121-11-09.
     */
    attribute def LinearDensityOfElectricChargeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def LinearDensityOfElectricChargeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearDensityOfElectricChargeUnit :>> QuantityValue::mRef;
    }
    attribute linearDensityOfElectricCharge: LinearDensityOfElectricChargeValue :> quantity;

    alias LinearDensityOfElectricChargeUnit as LineicElectricChargeUnit;
    alias LinearDensityOfElectricChargeValue as LineicElectricChargeValue;
    alias linearDensityOfElectricCharge as lineicElectricCharge;

    /**
     * source: item 6-6 electric dipole moment
     * symbol(s): `p`
     * application domain: General
     * name: ElectricDipoleMoment
     * quantity dimension: L^1*T^1*I^1
     * measurement unit(s): C*m
     * definition: `vec(p) = q (vec(r_+) - vec(r_-))` where `vec(r_+)` and `vec(r_-)` are the position vectors (ISO 80000-3, item 3-1.11) to carriers of electric charges `q` and `-q` (item 6-2), respectively
     * remarks: The electric dipole moment of a substance within a domain is the vector sum of electric dipole moments of electric dipoles included in the domain. See IEC 60050-121, items 121-11-35 and 121-11-36.
     */
    attribute def ElectricDipoleMomentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricDipoleMomentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricDipoleMomentUnit :>> QuantityValue::mRef;
    }
    attribute electricDipoleMoment: ElectricDipoleMomentValue :> quantity;

    /**
     * source: item 6-7 electric polarization
     * symbol(s): `P`
     * application domain: General
     * name: ElectricPolarization
     * quantity dimension: L^-2*T^1*I^1
     * measurement unit(s): C/m^2
     * definition: `vec(P) = (d vec(p))/(dV)` where `vec(p)` is electric dipole moment (item 6-6) of a substance within a domain with volume `V` (ISO 80000-3, item 3-4)
     * remarks: See IEC 60050-121, item 121-11-37.
     */
    attribute def ElectricPolarizationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricPolarizationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricPolarizationUnit :>> QuantityValue::mRef;
    }
    attribute electricPolarization: ElectricPolarizationValue :> quantity;

    /**
     * source: item 6-8 electric current density, areic electric current
     * symbol(s): `J`
     * application domain: General
     * name: ElectricCurrentDensity
     * quantity dimension: L^-2*I^1
     * measurement unit(s): A/m^2
     * definition: `vec(J) = ρ vec(v)` where `ρ` is electric charge density (item 6-3) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
     * remarks: Electric current `I` (item 6-1) through a surface `S` is `I = int_S vec(J) * vec(e_n) dA` where `vec(e_n) dA` is vector surface element. See IEC 60050-121, item 121-11-11.
     */
    attribute def ElectricCurrentDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricCurrentDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricCurrentDensityUnit :>> QuantityValue::mRef;
    }
    attribute electricCurrentDensity: ElectricCurrentDensityValue :> quantity;

    alias ElectricCurrentDensityUnit as AreicElectricCurrentUnit;
    alias ElectricCurrentDensityValue as AreicElectricCurrentValue;
    alias electricCurrentDensity as areicElectricCurrent;

    /**
     * source: item 6-9 linear electric current density, lineic electric current
     * symbol(s): `J_S`
     * application domain: General
     * name: LinearElectricCurrentDensity
     * quantity dimension: L^-1*I^1
     * measurement unit(s): A/m
     * definition: `vec(J_S) = ρ_A vec(v)` where `ρ_A` is surface density of electric charge (item 6-4) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
     * remarks: Electric current `I` (item 6-1) through a curve `C` on a surface is `I = int_C vec(J_S) xx vec(e_n) * d vec(r)` where `e_n` is a unit vector perpendicular to the surface and line vector element and `d vec(r)` is the differential of position vector `vec(r)`. See IEC 60050-121, item 121-11-12.
     */
    attribute def LinearElectricCurrentDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def LinearElectricCurrentDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearElectricCurrentDensityUnit :>> QuantityValue::mRef;
    }
    attribute linearElectricCurrentDensity: LinearElectricCurrentDensityValue :> quantity;

    alias LinearElectricCurrentDensityUnit as LineicElectricCurrentUnit;
    alias LinearElectricCurrentDensityValue as LineicElectricCurrentValue;
    alias linearElectricCurrentDensity as lineicElectricCurrent;

    /**
     * source: item 6-10 electric field strength
     * symbol(s): `E`
     * application domain: General
     * name: ElectricFieldStrength
     * quantity dimension: L^1*M^1*T^-3*I^-1
     * measurement unit(s): V/m
     * definition: `vec(E) = vec(F)/q` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `q` is electric charge (item 6-2)
     * remarks: See IEC 60050, item 121-11-18. `q` is the charge of a test particle at rest.
     */
    attribute def ElectricFieldStrengthUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ElectricFieldStrengthValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricFieldStrengthUnit :>> QuantityValue::mRef;
    }
    attribute electricFieldStrength: ElectricFieldStrengthValue :> quantity;

    /**
     * source: item 6-11.1 electric potential
     * symbol(s): `V`, `φ`
     * application domain: General
     * name: ElectricPotential
     * quantity dimension: L^2*M^1*T^-3*I^-1
     * measurement unit(s): V
     * definition: `-grad(V) = vec(E) + (del A)/(del t)` where `vec(E)` is electric field strength (item 610), `A` is magnetic vector potential (item 6-32) and `t` is time (ISO 80000-3, item 3-7)
     * remarks: The electric potential is not unique, since any constant scalar field quantity can be added to it without changing its gradient. See IEC 60050-121, item 121-11-25.
     */
    attribute def ElectricPotentialUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ElectricPotentialValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricPotentialUnit :>> QuantityValue::mRef;
    }
    attribute electricPotential: ElectricPotentialValue :> quantity;

    /**
     * source: item 6-11.2 electric potential difference
     * symbol(s): `V_(ab)`
     * application domain: General
     * name: ElectricPotentialDifference
     * quantity dimension: L^2*M^1*T^-3*I^-1
     * measurement unit(s): V
     * definition: `V_(ab) = int_(vec(r_a))^(vec(r_b)) (vec(E) + (del A)/(del t)) * d vec(r)` where `vec(E)` is electric field strength (item 610), `A` is magnetic vector potential (item 6-32), `t` is time (ISO 80000-3, item 3-7), and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`
     * remarks: `V_(ab) = V_a - V_b` where `V_a` and `V_b` are the potentials at points `a` and `b`, respectively. See IEC 60050-121, item 121-11-26.
     */
    attribute def ElectricPotentialDifferenceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ElectricPotentialDifferenceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricPotentialDifferenceUnit :>> QuantityValue::mRef;
    }
    attribute electricPotentialDifference: ElectricPotentialDifferenceValue :> quantity;

    /**
     * source: item 6-11.3 voltage, electric tension
     * symbol(s): `U`, `U_(ab)`
     * application domain: General
     * name: Voltage
     * quantity dimension: L^2*M^1*T^-3*I^-1
     * measurement unit(s): V
     * definition: in electric circuit theory, `U_(ab) = V_a - V_b` where `V_a` and `V_b` are the electric potentials (item 6-11.1) at points `a` and `b`, respectively
     * remarks: For an electric field within a medium `U_(ab) = int_(vec(r_a) (C))^(vec(r_b)) vec(E) * d vec(r)` where `vec(E)` is electric field strength (item 6-10) and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`. For an irrotational electric field, the voltage is independent of the path between the two points `a` and `b`. See IEC 60050-121, item 121-11-27.
     */
    attribute def VoltageUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VoltageValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VoltageUnit :>> QuantityValue::mRef;
    }
    attribute voltage: VoltageValue :> quantity;

    alias VoltageUnit as ElectricTensionUnit;
    alias VoltageValue as ElectricTensionValue;
    alias voltage as electricTension;

    /**
     * source: item 6-12 electric flux density, electric displacement
     * symbol(s): `vec(D)`
     * application domain: General
     * name: ElectricFluxDensity
     * quantity dimension: L^-2*T^1*I^1
     * measurement unit(s): C/m^2
     * definition: `vec(D) = ε_0 vec(E) + vec(P)` where `ε_0` is the electric constant (item 6-14.1 ), `vec(E)` is electric field strength (item 6-10), and `vec(P)` is electric polarization (item 6-7)
     * remarks: The electric flux density is related to electric charge density via `nabla * vec(D) = ρ` where `nabla * vec(D)` denotes the divergence of `vec(D)`. See IEC 60050-121, item 121-11-40.
     */
    attribute def ElectricFluxDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricFluxDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricFluxDensityUnit :>> QuantityValue::mRef;
    }
    attribute electricFluxDensity: ElectricFluxDensityValue :> quantity;

    alias ElectricFluxDensityUnit as ElectricDisplacementUnit;
    alias ElectricFluxDensityValue as ElectricDisplacementValue;
    alias electricFluxDensity as electricDisplacement;

    /**
     * source: item 6-13 capacitance
     * symbol(s): `C`
     * application domain: General
     * name: Capacitance
     * quantity dimension: L^-2*M^-1*T^4*I^2
     * measurement unit(s): F
     * definition: `C = Q/U` where `Q` is electric charge (item 6-2) and `U` is voltage (6-11.3)
     * remarks: See IEC 60050-131, item 131-12-13.
     */
    attribute def CapacitanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def CapacitanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CapacitanceUnit :>> QuantityValue::mRef;
    }
    attribute capacitance: CapacitanceValue :> quantity;

    /**
     * source: item 6-14.1 electric constant, permittivity of vacuum
     * symbol(s): `ε_0`
     * application domain: General
     * name: ElectricConstant
     * quantity dimension: L^-3*M^-1*T^4*I^2
     * measurement unit(s): F/m
     * definition: `ε_0 = 1 / (μ_0 * c_0^2)` where `μ_0` is the magnetic constant (item 6-26.1) and `c_0` is the speed of light (item 6-35.2)
     * remarks: `ε_0 = 8.854188 * 10^-12` F/m. See IEC 60050-121, item 121-11-03.
     */
    attribute def ElectricConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def ElectricConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricConstantUnit :>> QuantityValue::mRef;
    }
    attribute electricConstant: ElectricConstantValue :> quantity;

    alias ElectricConstantUnit as PermittivityOfVacuumUnit;
    alias ElectricConstantValue as PermittivityOfVacuumValue;
    alias electricConstant as permittivityOfVacuum;

    /**
     * source: item 6-14.2 permittivity
     * symbol(s): `ε`
     * application domain: General
     * name: Permittivity
     * quantity dimension: L^-3*M^-1*T^4*I^2
     * measurement unit(s): F/m
     * definition: `vec(D) = ε vec(E)` where `vec(D)` is electric flux density (item 6-12) and `vec(E)` is electric field strength (item 6-10)
     * remarks: This definition applies to an isotropic medium. For an anisotropic medium, permittivity is a second order tensor. See IEC 60050-121, item 121-12-12.
     */
    attribute def PermittivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def PermittivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PermittivityUnit :>> QuantityValue::mRef;
    }
    attribute permittivity: PermittivityValue :> quantity;

    /**
     * source: item 6-15 relative permittivity
     * symbol(s): `ε_r`
     * application domain: General
     * name: RelativePermittivity
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `ε_r = ε / ε_0` where `ε` is permittivity (item 6-14.2) and `ε_0` is the electric constant (item 6-14.1)
     * remarks: See IEC 60050-121, item 121-12-13.
     */
    attribute def RelativePermittivityUnit :> DimensionOneUnit {
    }
    attribute def RelativePermittivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativePermittivityUnit :>> QuantityValue::mRef;
    }
    attribute relativePermittivity: RelativePermittivityValue :> quantity;

    /**
     * source: item 6-16 electric susceptibility
     * symbol(s): `χ`
     * application domain: General
     * name: ElectricSusceptibility
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `vec(P) = ε_0 χ vec(E)` where `vec(P)` is electric polarization (item 6-7), `ε_0` is the electric constant (item 6-14. 1) and `vec(E)` is electric field strength (item 6-10)
     * remarks: `χ = ε_r - 1`. The definition applies to an isotropic medium. For an anisotropic medium, electric susceptibility is a second order tensor. See IEC 60050-121, item 121-12-19.
     */
    attribute def ElectricSusceptibilityUnit :> DimensionOneUnit {
    }
    attribute def ElectricSusceptibilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricSusceptibilityUnit :>> QuantityValue::mRef;
    }
    attribute electricSusceptibility: ElectricSusceptibilityValue :> quantity;

    /**
     * source: item 6-17 electric flux
     * symbol(s): `Ψ`
     * application domain: General
     * name: ElectricFlux
     * quantity dimension: T^1*I^1
     * measurement unit(s): C
     * definition: `Ψ = int_S vec(D) * vec(e_n) dA` over a surface `S`, where `vec(D)` is electric flux (item 6-12) en `vec(e_n) dA` is the vector surface element (ISO 80000-3 item 3-3)
     * remarks: See IEC 60050-121, item 121-11-41.
     */
    attribute def ElectricFluxUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ElectricFluxValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectricFluxUnit :>> QuantityValue::mRef;
    }
    attribute electricFlux: ElectricFluxValue :> quantity;

    /**
     * source: item 6-18 displacement current density
     * symbol(s): `vec(J_D)`
     * application domain: General
     * name: DisplacementCurrentDensity
     * quantity dimension: L^-2*I^1
     * measurement unit(s): A/m^2
     * definition: `vec(J_D) = (del vec(D))/(del t)` where `vec(D)` is electric flux density (item 6-12) and `t` is time (ISO 80000-3, item 3-7) 
     * remarks: See IEC 60050-121, item 121-11-42.
     */
    attribute def DisplacementCurrentDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def DisplacementCurrentDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DisplacementCurrentDensityUnit :>> QuantityValue::mRef;
    }
    attribute displacementCurrentDensity: DisplacementCurrentDensityValue :> quantity;

    /**
     * source: item 6-19.1 displacement current
     * symbol(s): `I_D`
     * application domain: General
     * name: DisplacementCurrent (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: `I = int_S vec(J_D) * vec(e_n) dA` over a surface `S`, where `vec(J_D)` is displacement current density (item 6-18) en `vec(e_n) dA` is the vector surface element (ISO 80000-3 item 3-3)
     * remarks: See IEC 60050-121, item 121-11-43.
     */
    attribute displacementCurrent :> electricCurrent;

    /**
     * source: item 6-19.2 total current
     * symbol(s): `I_(tot)`, `I_t`
     * application domain: General
     * name: TotalCurrent (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: `I_(tot) = I + I_D` where `I` is electric current (item 6-1) and `I_D` is displacement current (item 6-19.1)
     * remarks: See IEC 60050-121, item 121-11-45.
     */
    attribute totalCurrent :> electricCurrent;

    /**
     * source: item 6-20 total current density
     * symbol(s): `J_(tot)`, `J_t`
     * application domain: General
     * name: TotalCurrentDensity
     * quantity dimension: L^-2*I^1
     * measurement unit(s): A/m^2
     * definition: `vec(J_(tot)) = vec(J) +vec(J_D)` where `vec(J)` is electric current density (item 6-8) and `vec(J_D)` is displacement current density (item 6-18)
     * remarks: See IEC 60050-121, item 121-11-44.
     */
    attribute def TotalCurrentDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def TotalCurrentDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TotalCurrentDensityUnit :>> QuantityValue::mRef;
    }
    attribute totalCurrentDensity: TotalCurrentDensityValue :> quantity;

    /**
     * source: item 6-21 magnetic flux density
     * symbol(s): `vec(B)`
     * application domain: General
     * name: MagneticFluxDensity
     * quantity dimension: M^1*T^-2*I^-1
     * measurement unit(s): T
     * definition: `vec(F) = q vec(v) xx vec(B)` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1) of any test particle with electric charge `q` (item 6-2)
     * remarks: The magnetic flux density has zero divergence, `nabla * vec(B) = 0`. See IEC 60050-121, item 121-11-19.
     */
    attribute def MagneticFluxDensityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MagneticFluxDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticFluxDensityUnit :>> QuantityValue::mRef;
    }
    attribute magneticFluxDensity: MagneticFluxDensityValue :> quantity;

    /**
     * source: item 6-22.1 magnetic flux
     * symbol(s): `Φ`
     * application domain: General
     * name: MagneticFlux
     * quantity dimension: L^2*M^1*T^-2*I^-1
     * measurement unit(s): Wb
     * definition: `Φ = int_S vec(B) * vec(e_n) dA` over a surface `S`, where `vec(B)` is magnetic flux density (item 6-21) and `vec(e_n) dA` is vector surface element (ISO 80000-3, item 3-3)
     * remarks: See IEC 60050-121, item 121-11-21.
     */
    attribute def MagneticFluxUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MagneticFluxValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticFluxUnit :>> QuantityValue::mRef;
    }
    attribute magneticFlux: MagneticFluxValue :> quantity;

    /**
     * source: item 6-22.2 linked flux
     * symbol(s): `Ψ_m`, `Ψ`
     * application domain: General
     * name: LinkedFlux
     * quantity dimension: L^2*M^1*T^-2*I^-1
     * measurement unit(s): Wb
     * definition: `Ψ_m = int_C vec(A) * d vec(r)` where `vec(A)` is magnetic vector potential (item 6-32) and `d vec(r)` is line vector element of the curve `C`
     * remarks: Line vector element `d vec(r)` is the differential of position vector `vec(r)` (ISO 80000-3, item 3-1.11). See IEC 60050-121, item 121-11-24.
     */
    attribute def LinkedFluxUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def LinkedFluxValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinkedFluxUnit :>> QuantityValue::mRef;
    }
    attribute linkedFlux: LinkedFluxValue :> quantity;

    /**
     * source: item 6-23 magnetic moment, magnetic area moment
     * symbol(s): `vec(m)`
     * application domain: General
     * name: MagneticMoment
     * quantity dimension: L^2*I^1
     * measurement unit(s): A*m^2
     * definition: `vec(m) = I vec(e_n) A` where `I` is electric current (item 6-1) in a small closed loop, `vec(e_n)` is a unit vector perpendicular to the loop, and `A` is area (ISO 80000-3, item 3-3) of the loop
     * remarks: The magnetic moment of a substance within a domain is the vector sum of the magnetic moments of all entities included in the domain. See IEC 60050-121, items 121-11-49 and 121-11-50.
     */
    attribute def MagneticMomentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MagneticMomentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticMomentUnit :>> QuantityValue::mRef;
    }
    attribute magneticMoment: MagneticMomentValue :> quantity;

    alias MagneticMomentUnit as MagneticAreaMomentUnit;
    alias MagneticMomentValue as MagneticAreaMomentValue;
    alias magneticMoment as magneticAreaMoment;

    /**
     * source: item 6-24 magnetization
     * symbol(s): `vec(M)`, `vec(H_i)`
     * application domain: General
     * name: Magnetization
     * quantity dimension: L^-1*I^1
     * measurement unit(s): A/m
     * definition: `vec(M) = (d vec(m)) / (dV)` where `vec(m)` is magnetic moment (item 6-23) of a substance in a domain with volume `V` (ISO 80000-3, item 3-4)
     * remarks: See IEC 60050-121, item 121-11-52.
     */
    attribute def MagnetizationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MagnetizationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagnetizationUnit :>> QuantityValue::mRef;
    }
    attribute magnetization: MagnetizationValue :> quantity;

    /**
     * source: item 6-25 magnetic field strength, magnetizing field
     * symbol(s): `vec(H)`
     * application domain: General
     * name: MagneticFieldStrength
     * quantity dimension: L^-1*I^1
     * measurement unit(s): A/m
     * definition: `vec(H) = vec(B)/μ_0 - vec(M)` where `vec(B)` is magnetic flux density (item 6-21), `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
     * remarks: The magnetic field strength is related to the total current density `vec(J_(t ot))` (item 6-20) via `rot vec(H) = vec(J_(t ot))`. See IEC 60050-121, item 121-11-56.
     */
    attribute def MagneticFieldStrengthUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MagneticFieldStrengthValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticFieldStrengthUnit :>> QuantityValue::mRef;
    }
    attribute magneticFieldStrength: MagneticFieldStrengthValue :> quantity;

    alias MagneticFieldStrengthUnit as MagnetizingFieldUnit;
    alias MagneticFieldStrengthValue as MagnetizingFieldValue;
    alias magneticFieldStrength as magnetizingField;

    /**
     * source: item 6-26.1 magnetic constant, permeability of vacuum
     * symbol(s): `μ_0`
     * application domain: General
     * name: MagneticConstant
     * quantity dimension: L^1*M^1*T^-2*I^-2
     * measurement unit(s): H/m
     * definition: `μ_0 = 4 π * 10^-7` H/m
     * remarks: For this definition of `μ_0` see item 6-1.a. `μ_0 ~~ 1.256637 * 10^-6` H/m. See IEC 60050-121, item 121-11-14.
     */
    attribute def MagneticConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def MagneticConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticConstantUnit :>> QuantityValue::mRef;
    }
    attribute magneticConstant: MagneticConstantValue :> quantity;

    alias MagneticConstantUnit as PermeabilityOfVacuumUnit;
    alias MagneticConstantValue as PermeabilityOfVacuumValue;
    alias magneticConstant as permeabilityOfVacuum;

    /**
     * source: item 6-26.2 permeability
     * symbol(s): `μ`
     * application domain: General
     * name: Permeability
     * quantity dimension: L^1*M^1*T^-2*I^-2
     * measurement unit(s): H/m
     * definition: `vec(B) = μ vec(H)` where `vec(B)` is magnetic flux density (item 6-21) and `vec(H)` is magnetic field strength (item 6-25)
     * remarks: This definition applies to an isotropic medium. For an anisotropic medium permeability is a second order tensor. See IEC 60050-121, item 121-12-28.
     */
    attribute def PermeabilityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def PermeabilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PermeabilityUnit :>> QuantityValue::mRef;
    }
    attribute permeability: PermeabilityValue :> quantity;

    /**
     * source: item 6-27 relative permeability
     * symbol(s): `μ_r`
     * application domain: General
     * name: RelativePermeability
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `μ_r = μ / μ_0`  where `μ` is permeability (item 6-24) and `μ_0` is the magnetic constant (item 6-26.1)
     * remarks: See IEC 60050-121, item 121-12-29.
     */
    attribute def RelativePermeabilityUnit :> DimensionOneUnit {
    }
    attribute def RelativePermeabilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativePermeabilityUnit :>> QuantityValue::mRef;
    }
    attribute relativePermeability: RelativePermeabilityValue :> quantity;

    /**
     * source: item 6-28 magnetic susceptibility
     * symbol(s): `κ`, `χ_m`
     * application domain: General
     * name: MagneticSusceptibility
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `vec(M) = κ vec(H)` where `vec(M)` is magnetization (item 6-24) and `vec(H)` is magnetic field strength (item 6-25)
     * remarks: `κ = μ_r - 1` This definition applies to an isotropic medium. For an anisotropic medium magnetic susceptibility is a second order tensor. See IEC 60050-121, item 121-12-37.
     */
    attribute def MagneticSusceptibilityUnit :> DimensionOneUnit {
    }
    attribute def MagneticSusceptibilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticSusceptibilityUnit :>> QuantityValue::mRef;
    }
    attribute magneticSusceptibility: MagneticSusceptibilityValue :> quantity;

    /**
     * source: item 6-29 magnetic polarization
     * symbol(s): `vec(J_m)`
     * application domain: General
     * name: MagneticPolarization
     * quantity dimension: M^1*T^-2*I^-1
     * measurement unit(s): T
     * definition: `vec(J_m) = μ_0 vec(M)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
     * remarks: See IEC 60050-121, item 121-11-54.
     */
    attribute def MagneticPolarizationUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MagneticPolarizationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticPolarizationUnit :>> QuantityValue::mRef;
    }
    attribute magneticPolarization: MagneticPolarizationValue :> quantity;

    /**
     * source: item 6-30 magnetic dipole moment
     * symbol(s): `vec(j_m)`, `vec(j)`
     * application domain: General
     * name: MagneticDipoleMoment
     * quantity dimension: L^3*M^1*T^-2*I^-1
     * measurement unit(s): Wb*m
     * definition: `vec(j_m) = μ_0 vec(m)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(m)` is magnetic moment (item 6-23)
     * remarks: See IEC 60050-121, item 121-11-55.
     */
    attribute def MagneticDipoleMomentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MagneticDipoleMomentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticDipoleMomentUnit :>> QuantityValue::mRef;
    }
    attribute magneticDipoleMoment: MagneticDipoleMomentValue :> quantity;

    /**
     * source: item 6-31 coercivity
     * symbol(s): `H_(c,B)`
     * application domain: General
     * name: Coercivity
     * quantity dimension: L^-1*I^1
     * measurement unit(s): A/m
     * definition: magnetic field strength (item 6-25) to be applied to bring the magnetic flux density (item 6-21) in a substance from its remaining magnetic flux density to zero
     * remarks: See IEC 60050-121, item 121-12-69. Also called coercive field strength.
     */
    attribute def CoercivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def CoercivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CoercivityUnit :>> QuantityValue::mRef;
    }
    attribute coercivity: CoercivityValue :> quantity;

    /**
     * source: item 6-32 magnetic vector potential
     * symbol(s): `vec(A)`
     * application domain: General
     * name: MagneticVectorPotential
     * quantity dimension: L^1*M^1*T^-2*I^-1
     * measurement unit(s): Wb/m
     * definition: `vec(B) = rot vec(A)` where `vec(B)` is magnetic flux density (item 6-21)
     * remarks: The magnetic vector potential is not unique since any irrotational vector field can be added to it without changing its rotation. See IEC 60050-121, item 121-11-23.
     */
    attribute def MagneticVectorPotentialUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MagneticVectorPotentialValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagneticVectorPotentialUnit :>> QuantityValue::mRef;
    }
    attribute magneticVectorPotential: MagneticVectorPotentialValue :> quantity;

    /**
     * source: item 6-33 electromagnetic energy density, volumic electromagnetic energy
     * symbol(s): `w`
     * application domain: General
     * name: ElectromagneticEnergyDensity
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): J/m^3
     * definition: `ω = 1/2*(vec(E)*vec(D) + vec(B) * vec(H))` where `vec(E)` is electric field strength (item 6-10), `vec(D)` is electric flux density (item 6-12), `vec(B)` is magnetic flux density (item 6-21), and `vec(H)` is magnetic field strength (item 6-25)
     * remarks: See IEC 60050-121, item 121-11-65.
     */
    attribute def ElectromagneticEnergyDensityUnit :> SIDerivedUnit {
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
    attribute def ElectromagneticEnergyDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ElectromagneticEnergyDensityUnit :>> QuantityValue::mRef;
    }
    attribute electromagneticEnergyDensity: ElectromagneticEnergyDensityValue :> quantity;

    alias ElectromagneticEnergyDensityUnit as VolumicElectromagneticEnergyUnit;
    alias ElectromagneticEnergyDensityValue as VolumicElectromagneticEnergyValue;
    alias electromagneticEnergyDensity as volumicElectromagneticEnergy;

    /**
     * source: item 6-34 Poynting vector
     * symbol(s): `vec(S)`
     * application domain: General
     * name: PoyntingVector
     * quantity dimension: M^1*T^-3
     * measurement unit(s): W/m^2
     * definition: `vec(S) = vec(E) xx vec(H)` where `vec(E)` is electric field strength (item 6-10) and `vec(H)` is magnetic field strength (item 6-25)
     * remarks: See IEC 60050-121, item 121-11-66.
     */
    attribute def PoyntingVectorUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def PoyntingVectorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PoyntingVectorUnit :>> QuantityValue::mRef;
    }
    attribute poyntingVector: PoyntingVectorValue :> quantity;

    /**
     * source: item 6-35.1 phase speed of electromagnetic waves
     * symbol(s): `c`
     * application domain: General
     * name: PhaseSpeedOfElectromagneticWaves
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m/s
     * definition: `c = ω/k` where `ω` is angular frequency (ISO 80000-3, item 3-16) and `k` is angular wavenumber (ISO 80000-3, item 3-19)
     * remarks: See ISO 80000-3, item 3-20.1.
     */
    attribute def PhaseSpeedOfElectromagneticWavesUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def PhaseSpeedOfElectromagneticWavesValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PhaseSpeedOfElectromagneticWavesUnit :>> QuantityValue::mRef;
    }
    attribute phaseSpeedOfElectromagneticWaves: PhaseSpeedOfElectromagneticWavesValue :> quantity;

    /**
     * source: item 6-35.2 speed of light, light speed
     * symbol(s): `c_0`
     * application domain: General
     * name: SpeedOfLight
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m/s
     * definition: speed of electromagnetic waves in vacuum; `c_0 = 299792458` m/s
     * remarks: For this value of `c_0` see ISO 80000-3, item 3-1.a. `c_0 = 1/sqrt(ε_0 μ_0)`. See IEC 60050-111, item 111-13-07.
     */
    attribute def SpeedOfLightUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpeedOfLightValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpeedOfLightUnit :>> QuantityValue::mRef;
    }
    attribute speedOfLight: SpeedOfLightValue :> quantity;

    alias SpeedOfLightUnit as LightSpeedUnit;
    alias SpeedOfLightValue as LightSpeedValue;
    alias speedOfLight as lightSpeed;

    /**
     * source: item 6-36 source voltage, source tension
     * symbol(s): `U_s`
     * application domain: General
     * name: SourceVoltage
     * quantity dimension: L^2*M^1*T^-3*I^-1
     * measurement unit(s): V
     * definition: voltage (item 6-11.3) between the two terminals of a voltage source when there is no electric current (item 6-1) through the source
     * remarks: The name "electromotive force" with the abbreviation EMF and the symbol `E` is deprecated. See IEC 60050-131, item 131-12-22.
     */
    attribute def SourceVoltageUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SourceVoltageValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SourceVoltageUnit :>> QuantityValue::mRef;
    }
    attribute sourceVoltage: SourceVoltageValue :> quantity;

    alias SourceVoltageUnit as SourceTensionUnit;
    alias SourceVoltageValue as SourceTensionValue;
    alias sourceVoltage as sourceTension;

    /**
     * source: item 6-37.1 scalar magnetic potential
     * symbol(s): `V_m`, `φ`
     * application domain: General
     * name: ScalarMagneticPotential (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: for an irrotational magnetic field strength `vec(H) =  - nabla V_m` where `vec(H)` is magnetic field strength (item 6-25)
     * remarks: The magnetic scalar potential is not unique since any constant scalar field can be added to it without changing its gradient. See IEC 60050-121, item 121-11-58.
     */
    attribute scalarMagneticPotential :> electricCurrent;

    /**
     * source: item 6-37.2 magnetic tension
     * symbol(s): `U_m`
     * application domain: General
     * name: MagneticTension (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: `U_m = int_(vec(r_a) (C))^(vec(r_b)) vec(H) * d(vec(r))` where `vec(H)` is magnetic field strength (item 6-25) and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`
     * remarks: For an irrotational magnetic field strength this quantity is equal to the magnetic potential difference. See IEC 60050-121, item121-11-57.
     */
    attribute magneticTension :> electricCurrent;

    /**
     * source: item 6-37.3 magnetomotive force
     * symbol(s): `F_m`
     * application domain: General
     * name: MagnetomotiveForce
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: `F_m = oint_C vec(H) * d vec(r)` where `vec(H)` is magnetic field strength (item 6-25) and `vec(r)` is position vector (ISO 80000-3, item 3-1 .11) along a closed curve `C`
     * remarks: This quantity name is under consideration . Compare remark to item 6-36. See IEC 60050-121, item 121-11-60.
     */
    attribute def MagnetomotiveForceUnit :> SIDerivedUnit {
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MagnetomotiveForceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MagnetomotiveForceUnit :>> QuantityValue::mRef;
    }
    attribute magnetomotiveForce: MagnetomotiveForceValue :> quantity;

    /**
     * source: item 6-37.4 current linkage
     * symbol(s): `Θ`
     * application domain: General
     * name: CurrentLinkage (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: net electric current (item 6-1) through a surface delimited by a closed loop
     * remarks: When `Θ` results from `N` (item 6-38) equal electric currents `I` (item 6-1 ), then `Θ = N I`. See IEC 60050-121 , item 121 -11-46.
     */
    attribute currentLinkage :> electricCurrent;

    /**
     * source: item 6-38 number of turns in a winding
     * symbol(s): `N`
     * application domain: General
     * name: NumberOfTurnsInAWinding
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of turns in a winding (same as the quantity name)
     * remarks: N may be non-integer number, see ISO 80000-3, item 3-14.
     */
    attribute def NumberOfTurnsInAWindingUnit :> DimensionOneUnit {
    }
    attribute def NumberOfTurnsInAWindingValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NumberOfTurnsInAWindingUnit :>> QuantityValue::mRef;
    }
    attribute numberOfTurnsInAWinding: NumberOfTurnsInAWindingValue :> quantity;

    /**
     * source: item 6-39 reluctance
     * symbol(s): `R_m`, `R`
     * application domain: General
     * name: Reluctance
     * quantity dimension: L^-2*M^-1*T^2*I^2
     * measurement unit(s): H^-1
     * definition: `R_m = U_m/Φ` where `U_m` is magnetic tension (item 6-37.2) and `Φ` is magnetic flux (item 6-22 .1)
     * remarks: See IEC 60050-131 , item 131-12-28.
     */
    attribute def ReluctanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def ReluctanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ReluctanceUnit :>> QuantityValue::mRef;
    }
    attribute reluctance: ReluctanceValue :> quantity;

    /**
     * source: item 6-40 permeance
     * symbol(s): `Λ`
     * application domain: General
     * name: Permeance
     * quantity dimension: L^2*M^1*T^-2*I^-2
     * measurement unit(s): H
     * definition: `Λ = 1/R_m` where `R_m` is reluctance (item 6-39)
     * remarks: See IEC 60050-131 , item 131-12-29.
     */
    attribute def PermeanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def PermeanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PermeanceUnit :>> QuantityValue::mRef;
    }
    attribute permeance: PermeanceValue :> quantity;

    /**
     * source: item 6-41.1 inductance, self inductance
     * symbol(s): `L`, `L_m`
     * application domain: General
     * name: Inductance
     * quantity dimension: L^2*M^1*T^-2*I^-2
     * measurement unit(s): H
     * definition: `L = Ψ / I` where `I` is an electric current (item 6-1) in a thin conducting loop and `Ψ` is the linked flux (item 6-22.2) caused by that electric current
     * remarks: The name "self inductance" is used for the quantity associated to mutual inductance when `n = m`. See IEC 60050-131 , items 131-12-19 and 131 -12-35.
     */
    attribute def InductanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def InductanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: InductanceUnit :>> QuantityValue::mRef;
    }
    attribute inductance: InductanceValue :> quantity;

    alias InductanceUnit as SelfInductanceUnit;
    alias InductanceValue as SelfInductanceValue;
    alias inductance as selfInductance;

    /**
     * source: item 6-41.2 mutual inductance
     * symbol(s): `L_(mn)`
     * application domain: General
     * name: MutualInductance
     * quantity dimension: L^2*M^1*T^-2*I^-2
     * measurement unit(s): H
     * definition: `L_(mn) = Ψ_m / I_n` where `I_n` is an electric current (item 6-1) in a thin conducting loop `n` and `Ψ_m` is the linked flux (item 6-22.2) caused by that electric current in another loop `m`
     * remarks: `L_(mn) = L_(nm)`. For two loops , the symbol `M` is used for `L_(12)`. See IEC 60050-131, items 131-12-36.
     */
    attribute def MutualInductanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def MutualInductanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MutualInductanceUnit :>> QuantityValue::mRef;
    }
    attribute mutualInductance: MutualInductanceValue :> quantity;

    /**
     * source: item 6-42.1 coupling factor
     * symbol(s): `k`
     * application domain: General
     * name: CouplingFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for inductive coupling between two inductive elements `k = |L_(mn)| / sqrt(L_m L_n)` where `L_m` and `L_n` are their self inductances (item 6-41 .1 ), and `L_(mn)` is their mutual inductance (item 6-41.2)
     * remarks: See IEC 60050-131 , item 131-12-41.
     */
    attribute def CouplingFactorUnit :> DimensionOneUnit {
    }
    attribute def CouplingFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CouplingFactorUnit :>> QuantityValue::mRef;
    }
    attribute couplingFactor: CouplingFactorValue :> quantity;

    /**
     * source: item 6-42.2 leakage factor
     * symbol(s): `σ`
     * application domain: General
     * name: LeakageFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `σ = 1 - k^2` where `k` is the coupling factor (item 6-42 .1)
     * remarks: See IEC 60050-131 , item 131-12-42.
     */
    attribute def LeakageFactorUnit :> DimensionOneUnit {
    }
    attribute def LeakageFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LeakageFactorUnit :>> QuantityValue::mRef;
    }
    attribute leakageFactor: LeakageFactorValue :> quantity;

    /**
     * source: item 6-43 conductivity
     * symbol(s): `σ`, `γ`
     * application domain: General
     * name: Conductivity
     * quantity dimension: L^-3*M^-1*T^3*I^2
     * measurement unit(s): S/m
     * definition: `vec(J) = σ vec(E)` where `vec(J)` is electric current density (item 6-8) and `vec(E)` is electric field strength (item 6-10)
     * remarks: This definition applies to an isotropic medium. For an anisotropic medium `σ` is a second order tensor. `κ` is used in electrochemistry. See IEC 60050-121 , item 121-12-03.
     */
    attribute def ConductivityUnit :> SIDerivedUnit {
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
    attribute def ConductivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ConductivityUnit :>> QuantityValue::mRef;
    }
    attribute conductivity: ConductivityValue :> quantity;

    /**
     * source: item 6-44 resistivity
     * symbol(s): `ρ`
     * application domain: General
     * name: Resistivity
     * quantity dimension: L^3*M^1*T^-3*I^-2
     * measurement unit(s): Ω*m
     * definition: `ρ = 1/σ` if is exists, where `σ` is conductivity (item 6-43)
     * remarks: See IEC 60050-121, item 121-12-04.
     */
    attribute def ResistivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ResistivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ResistivityUnit :>> QuantityValue::mRef;
    }
    attribute resistivity: ResistivityValue :> quantity;

    /**
     * source: item 6-45 power, instantaneous power
     * symbol(s): `p`
     * application domain: General
     * name: Power
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): W
     * definition: `p = ui` where `u` is instantaneous voltage (item 6-11 .3) and `i` is instantaneous electric current (item 6-1)
     * remarks: See IEC 60050-131 , item 131-11-30.
     */
    attribute def PowerUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def PowerValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PowerUnit :>> QuantityValue::mRef;
    }
    attribute power: PowerValue :> quantity;

    alias PowerUnit as InstantaneousPowerUnit;
    alias PowerValue as InstantaneousPowerValue;
    alias power as instantaneousPower;

    /**
     * source: item 6-46 resistance
     * symbol(s): `R`
     * application domain: General
     * name: Resistance
     * quantity dimension: L^2*M^1*T^-3*I^-2
     * measurement unit(s): Ω
     * definition: for resistive component `R = u i` where `u` is instantaneous voltage (item 6-11.3) and `i` is instantaneous electric current (item 6-1)
     * remarks: For alternating current, see item 6-51.2. See IEC 60050-131, item 131-12-04.
     */
    attribute def ResistanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ResistanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ResistanceUnit :>> QuantityValue::mRef;
    }
    attribute resistance: ResistanceValue :> quantity;

    /**
     * source: item 6-47 conductance
     * symbol(s): `G`
     * application domain: General
     * name: Conductance
     * quantity dimension: L^-2*M^-1*T^3*I^2
     * measurement unit(s): S
     * definition: for resistive component `G = 1/R` where `R` is resistance (item 6-46)
     * remarks: For alternating current, see item 6-52.2. See IEC 60050-131, item 131-12-06.
     */
    attribute def ConductanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
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
    attribute def ConductanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ConductanceUnit :>> QuantityValue::mRef;
    }
    attribute conductance: ConductanceValue :> quantity;

    /**
     * source: item 6-48 phase difference
     * symbol(s): `φ`
     * application domain: General
     * name: PhaseDifference
     * quantity dimension: 1
     * measurement unit(s): rad
     * definition: `φ = φ_u - φ_i` where `φ_u` is the initial phase of the voltage (item 6-11 .3) and `φ_i` is the initial phase of the electric current (item 6-1)
     * remarks: When `u = hat(U) cos(ωt - φ_u)`, `i = hat(I) cos(ωt - φ_i)` where `u` is the voltage (item 6-11 . 3) and `i` is the electric current (item 6-1 ), `ω` is angular frequency (ISO 80000-3, item 3-16) and `t` is time (ISO 80000-3, item 3-7), then `φ` is phase difference. For phase angle, see items 6-49 and 6-50.
     */
    attribute def PhaseDifferenceUnit :> DimensionOneUnit {
    }
    attribute def PhaseDifferenceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PhaseDifferenceUnit :>> QuantityValue::mRef;
    }
    attribute phaseDifference: PhaseDifferenceValue :> quantity;

    /**
     * source: item 6-49 electric current phasor
     * symbol(s): `underline(I)`
     * application domain: General
     * name: ElectricCurrentPhasor (specializes ElectricCurrent)
     * quantity dimension: I^1
     * measurement unit(s): A
     * definition: when `i = hat(I) cos(ωt + α)`, where `i` is the electric current (item 6-1 ), `ω` is angular frequency (ISO 80000-3, item 3-16), `t` is time (ISO 80000-3, item 3-7), and `α` is initial phase (ISO 80000-3, item 3-5), then `underline(l) = I e^(jα)`
     * remarks: `underline(l)` is the complex representation of the electric current `i = hat(I) cos(ωt + α)`. `j` is the imaginary unit.
     */
    attribute electricCurrentPhasor :> electricCurrent;

    /**
     * source: item 6-50 voltage phasor
     * symbol(s): `underline(U)`
     * application domain: General
     * name: VoltagePhasor
     * quantity dimension: L^2*M^1*T^-3*I^-1
     * measurement unit(s): V
     * definition: when `u = hat(U) cos(ωt + α)`, where `u` is the voltage (item 6-11.3 ), `ω` is angular frequency (ISO 80000-3, item 3-16), `t` is time (ISO 80000-3, item 3-7), and `α` is initial phase (ISO 80000-3, item 3-5), then `underline(U) = U e^(jα)`
     * remarks: `underline(U)` is the complex representation of the voltage `u = hat(U) cos(ωt + α)`. `j` is the imaginary unit.
     */
    attribute def VoltagePhasorUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VoltagePhasorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VoltagePhasorUnit :>> QuantityValue::mRef;
    }
    attribute voltagePhasor: VoltagePhasorValue :> quantity;

    /**
     * source: item 6-51.1 impedance, complex impedance
     * symbol(s): `underline(Z)`
     * application domain: General
     * name: Impedance
     * quantity dimension: L^2*M^1*T^-3*I^-2
     * measurement unit(s): Ω
     * definition: `underline(Z) = underline(U)/underline(I)` where `underline(U)` is the voltage phasor (item 6-50), and `underline(I)` is the electric current phasor (item 6-49)
     * remarks: `underline(Z) = R + jX`, where `R` is resistance (item 6-51.2) and `X` is reactance (item 6-51 .3). `j` is the imaginary unit. `underline(Z) = |underline(Z)| e^(jφ)`. See IEC 60050-131 , item 131-12-43.
     */
    attribute def ImpedanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ImpedanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ImpedanceUnit :>> QuantityValue::mRef;
    }
    attribute impedance: ImpedanceValue :> quantity;

    alias ImpedanceUnit as ComplexImpedanceUnit;
    alias ImpedanceValue as ComplexImpedanceValue;
    alias impedance as complexImpedance;

    /**
     * source: item 6-51.2 resistance to alterating current
     * symbol(s): `R`
     * application domain: General
     * name: ResistanceToAlteratingCurrent
     * quantity dimension: L^2*M^1*T^-3*I^-2
     * measurement unit(s): Ω
     * definition: `R = "Re" underline(Z)` where `underline(Z)`, is impedance (item 6-5.1) and `"Re"` denotes the real part
     * remarks: See IEC 60050-131, item 131-12-45.
     */
    attribute def ResistanceToAlteratingCurrentUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ResistanceToAlteratingCurrentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ResistanceToAlteratingCurrentUnit :>> QuantityValue::mRef;
    }
    attribute resistanceToAlteratingCurrent: ResistanceToAlteratingCurrentValue :> quantity;

    /**
     * source: item 6-51.3 reactance
     * symbol(s): `X`
     * application domain: General
     * name: Reactance
     * quantity dimension: L^2*M^1*T^-3*I^-2
     * measurement unit(s): Ω
     * definition: `X = "Im" underline(Z)` where `underline(Z)`, is impedance (item 6-5.1) and `"Im"` denotes the imaginary part
     * remarks: `X = ωL - -1/(ωC)`. See IEC 60050-131 , item 131-12-46.
     */
    attribute def ReactanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ReactanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ReactanceUnit :>> QuantityValue::mRef;
    }
    attribute reactance: ReactanceValue :> quantity;

    /**
     * source: item 6-51.4 modulus of impedance
     * symbol(s): `Z`
     * application domain: General
     * name: ModulusOfImpedance
     * quantity dimension: L^2*M^1*T^-3*I^-2
     * measurement unit(s): Ω
     * definition: `Z = |underline(Z)|` where `underline(Z)` is impedance (item 6-51.1)
     * remarks: See IEC 60050-131 , item 131-12-44. Apparent impedance is defined more generally as the quotient of rms voltage and rms electric  current; it is often denoted by `Z`.
     */
    attribute def ModulusOfImpedanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute electricCurrentPowerFactor :>> SIDerivedUnit::electricCurrentPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def ModulusOfImpedanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ModulusOfImpedanceUnit :>> QuantityValue::mRef;
    }
    attribute modulusOfImpedance: ModulusOfImpedanceValue :> quantity;

    /**
     * source: item 6-52.1 admittance, complex admittance
     * symbol(s): `underline(Y)`
     * application domain: General
     * name: Admittance
     * quantity dimension: L^-2*M^-1*T^3*I^2
     * measurement unit(s): S
     * definition: `underline(Y) = 1/underline(Z)` where `underline(Z)` is impedance (item 6-51.1)
     * remarks: `underline(Y) = G + jB`, where `G` is conductance (item 6-52 .2) and `B` is susceptance (item 6-52 .3). `j` is the imaginary unit. `underline(Y) = |underline(Y)| e^-(jφ)`. See IEC 60050-131, item 131 -12-51.
     */
    attribute def AdmittanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
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
    attribute def AdmittanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AdmittanceUnit :>> QuantityValue::mRef;
    }
    attribute admittance: AdmittanceValue :> quantity;

    alias AdmittanceUnit as ComplexAdmittanceUnit;
    alias AdmittanceValue as ComplexAdmittanceValue;
    alias admittance as complexAdmittance;

    /**
     * source: item 6-52.2 conductance for alternating current
     * symbol(s): `G`
     * application domain: General
     * name: ConductanceForAlternatingCurrent (specializes Conductance)
     * quantity dimension: L^-2*M^-1*T^3*I^2
     * measurement unit(s): S
     * definition: `G = "Re" underline(Y)` where I is admittance (item 6-52.1)
     * remarks: See IEC 60050-131, item 131-12-53.
     */
    attribute conductanceForAlternatingCurrent :> conductance;

    /**
     * source: item 6-52.3 susceptance
     * symbol(s): `B`
     * application domain: General
     * name: Susceptance
     * quantity dimension: L^-2*M^-1*T^3*I^2
     * measurement unit(s): S
     * definition: `B = "Im" underline(Y)` where `underline(Y)` is admittance (item 6-52.1)
     * remarks: See IEC 60050-131, item 131-12-54.
     */
    attribute def SusceptanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
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
    attribute def SusceptanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SusceptanceUnit :>> QuantityValue::mRef;
    }
    attribute susceptance: SusceptanceValue :> quantity;

    /**
     * source: item 6-52.4 modulus of admittance
     * symbol(s): `Y`
     * application domain: General
     * name: ModulusOfAdmittance
     * quantity dimension: L^-2*M^-1*T^3*I^2
     * measurement unit(s): S
     * definition: `Y = |underline(Y)|` where `underline(Y)` is admittance (item 6-52.1)
     * remarks: Apparent admittance is defined more generally as the quotient of rms electric current voltage and rms voltage; it is often denoted by `Y`.
     */
    attribute def ModulusOfAdmittanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
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
    attribute def ModulusOfAdmittanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ModulusOfAdmittanceUnit :>> QuantityValue::mRef;
    }
    attribute modulusOfAdmittance: ModulusOfAdmittanceValue :> quantity;

    /**
     * source: item 6-53 quality factor
     * symbol(s): `Q`
     * application domain: General
     * name: QualityFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: for non-radiating systems, if `underline(Z) = R + jX`, then `Q = |X|/R` where `underline(Z)` is impedance (item 6-51. 1), `R` is resistance (item 6-51 .2), and `X` is reactance (item 6-51.3)
     * remarks: 
     */
    attribute def QualityFactorUnit :> DimensionOneUnit {
    }
    attribute def QualityFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: QualityFactorUnit :>> QuantityValue::mRef;
    }
    attribute qualityFactor: QualityFactorValue :> quantity;

    /**
     * source: item 6-54 loss factor
     * symbol(s): `d`
     * application domain: General
     * name: LossFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `d = 1/Q` where `Q` quality factor (item 6-53)
     * remarks: It is also named dissipation factor.
     */
    attribute def LossFactorUnit :> DimensionOneUnit {
    }
    attribute def LossFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LossFactorUnit :>> QuantityValue::mRef;
    }
    attribute lossFactor: LossFactorValue :> quantity;

    /**
     * source: item 6-55 loss angle
     * symbol(s): `δ`
     * application domain: General
     * name: LossAngle
     * quantity dimension: 1
     * measurement unit(s): rad
     * definition: `δ = arctan d` where `d` is loss factor (item 6-54)
     * remarks: See IEC 60050-131 , item 131-12-49.
     */
    attribute def LossAngleUnit :> DimensionOneUnit {
    }
    attribute def LossAngleValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LossAngleUnit :>> QuantityValue::mRef;
    }
    attribute lossAngle: LossAngleValue :> quantity;

    /**
     * source: item 6-56 active power
     * symbol(s): `P`
     * application domain: General
     * name: ActivePower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): W
     * definition: `P = 1/T int_0^T p dt` where `T` is the period (ISO 80000-3, item 3-12) and `p` is instantaneous power (item 6-45)
     * remarks: In complex notation, `P = "Re" underline(S)` where `underline(S)` is complex power (item 6-59).
     */
    attribute activePower :> power;

    /**
     * source: item 6-57 apparent power
     * symbol(s): ``, `underline(S)`, ``
     * application domain: General
     * name: ApparentPower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): V*A
     * definition: `|underline(S)| = U I` where `U` is rms value of voltage (item 6-11.3 and `I` is rms value of electric current (item 6-1)
     * remarks: `U = sqrt(1/T int_0^T u^2 dt)` and `I = sqrt(1/T int_0^T i^2 dt)`. When `u = sqrt 2 U cos(ωt)` and `i = sqrt 2 I cos(ωt - φ)`, then `P = U I cos(φ)`, `Q = U I sin(φ)` and `λ = cos(φ)` . See IEC 60050-131, item 131-11-41 .
     */
    attribute apparentPower :> power;

    /**
     * source: item 6-58 power factor
     * symbol(s): `λ`
     * application domain: General
     * name: PowerFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: `λ = |P|/|S|` where `P`  is active power (item 6-56) and `S` is apparent power (item 6-57)
     * remarks: See I EC 60050-131, item 131-11-46.
     */
    attribute def PowerFactorUnit :> DimensionOneUnit {
    }
    attribute def PowerFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PowerFactorUnit :>> QuantityValue::mRef;
    }
    attribute powerFactor: PowerFactorValue :> quantity;

    /**
     * source: item 6-59 complex power
     * symbol(s): `underline(S)`
     * application domain: General
     * name: ComplexPower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): V*A
     * definition: `underline(S) = underline(U) * underline(I)^**` where `underline(U)` is voltage phasor (item 6-50) and `underline(I)^**` is the complex conjugate of the current phasor (item 6-49)
     * remarks: `underline(S) = P + jQ` where `P` is active power (item 6-56) and `Q` is reactive power (item 6-60). See IEC 60050-131, item 131-11-39.
     */
    attribute complexPower :> power;

    /**
     * source: item 6-60 reactive power
     * symbol(s): `Q`
     * application domain: General
     * name: ReactivePower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): V*A, var
     * definition: `Q = "Im" underline(S)` where `underline(S)` is complex power (item 6-59)
     * remarks: See IEC 60050-131, item 131-11-44.
     */
    attribute reactivePower :> power;

    /**
     * source: item 6-61 non-active power
     * symbol(s): `Q'`
     * application domain: General
     * name: NonActivePower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): V*A
     * definition: `Q' = sqrt(|underline(S)|^2 - P^2)` where `|underline(S)|` is apparent power (item 6-57) and `P` is active power (item 6-56)
     * remarks: See IEC 60050-131, item 131-11-43.
     */
    attribute nonActivePower :> power;

    /**
     * source: item 6-62 active energy
     * symbol(s): `W`
     * application domain: General
     * name: ActiveEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, W*h
     * definition: `W = int_(t_1)^(t_2) p dt` where `p` is instantaneous power (item 6-45), and the integral interval is the time interval from `t_1` to `t_2`
     * remarks: 
     */
    attribute activeEnergy :> energy;

}
