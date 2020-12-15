/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard ISO-80000-4:2019 "Mechanics"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-4:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQMechanics {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    private import ISQThermodynamics::EnergyValue;
    private import ISQThermodynamics::energy;

    /**    
     * source: item 4-1 mass
     * symbol(s): `m`
     * application domain: General
     * name: Mass
     * quantity dimension: M^1
     * measurement unit(s): kg
     * definition: property of a body which expresses itself in terms of inertia with regard to changes in its state of motion as well as its gravitational attraction to other bodies
     * remarks: The kilogram (kg) is one of the seven base units (see ISO 80000-1) of the International System of Units, the SI. See also IEC 60050-113.
     */
    attribute def MassUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: MassUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def MassValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassUnit :>> QuantityValue::mRef;
    }    
    attribute mass: MassValue :> quantity;

    /**
     * source: item 4-2 mass density, density
     * symbol(s): `ρ`, `ρ_m`
     * application domain: General
     * name: MassDensity
     * quantity dimension: L^-3*M^1
     * measurement unit(s): kg*m^-3
     * definition: quantity representing the spatial distribution of mass of a continuous material: `ρ(vec(r)) = (dm)/(dV)` where `m` is mass of the material contained in an infinitesimal domain at point `vec(r)` and `V` is volume of this domain
     * remarks: 
     */
    attribute def MassDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MassDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassDensityUnit :>> QuantityValue::mRef;
    }
    attribute massDensity: MassDensityValue :> quantity;

    alias MassDensityUnit as DensityUnit;
    alias MassDensityValue as DensityValue;
    alias massDensity as density;

    /**
     * source: item 4-3 specific volume
     * symbol(s): `v`
     * application domain: General
     * name: SpecificVolume
     * quantity dimension: L^3*M^-1
     * measurement unit(s): kg^-1*m^3
     * definition: reciprocal of mass density `ρ` (item 4-2): `v = 1/ρ`
     * remarks: 
     */
    attribute def SpecificVolumeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificVolumeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificVolumeUnit :>> QuantityValue::mRef;
    }
    attribute specificVolume: SpecificVolumeValue :> quantity;

    /**
     * source: item 4-4 relative mass density, relative density
     * symbol(s): `d`
     * application domain: General
     * name: RelativeMassDensity
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass density of a substance `ρ` and mass density of a reference substance `ρ_0` : `d = ρ/ρ_0`
     * remarks: Conditions and material should be specified for the reference substance.
     */
    attribute def RelativeMassDensityUnit :> DimensionOneUnit {
    }
    attribute def RelativeMassDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeMassDensityUnit :>> QuantityValue::mRef;
    }
    attribute relativeMassDensity: RelativeMassDensityValue :> quantity;

    alias RelativeMassDensityUnit as RelativeDensityUnit;
    alias RelativeMassDensityValue as RelativeDensityValue;
    alias relativeMassDensity as relativeDensity;

    /**
     * source: item 4-5 surface mass density, surface density
     * symbol(s): `ρ_A`
     * application domain: General
     * name: SurfaceMassDensity
     * quantity dimension: L^-2*M^1
     * measurement unit(s): kg*m^-2
     * definition: quantity representing the areal distribution of mass of a continuous material: `ρ_A(vec(r)) = (dm)/(dA)` where `m` is the mass of the material at position `vec(r)` and `A` is area
     * remarks: The name “grammage” should not be used for this quantity.
     */
    attribute def SurfaceMassDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def SurfaceMassDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SurfaceMassDensityUnit :>> QuantityValue::mRef;
    }
    attribute surfaceMassDensity: SurfaceMassDensityValue :> quantity;

    alias SurfaceMassDensityUnit as SurfaceDensityUnit;
    alias SurfaceMassDensityValue as SurfaceDensityValue;
    alias surfaceMassDensity as surfaceDensity;

    /**
     * source: item 4-6 linear mass density, linear density
     * symbol(s): `ρ_I`
     * application domain: General
     * name: LinearMassDensity
     * quantity dimension: L^-1*M^1
     * measurement unit(s): kg*m^-1
     * definition: quantity representing the linear distribution of mass of a continuous material: `ρ_I(vec(r)) = (dm)/(dI)` where `m` is the mass of the material at position `vec(r)` and `l` is length
     * remarks: 
     */
    attribute def LinearMassDensityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def LinearMassDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearMassDensityUnit :>> QuantityValue::mRef;
    }
    attribute linearMassDensity: LinearMassDensityValue :> quantity;

    alias LinearMassDensityUnit as LinearDensityUnit;
    alias LinearMassDensityValue as LinearDensityValue;
    alias linearMassDensity as linearDensity;

    /**
     * source: item 4-7 moment of inertia
     * symbol(s): `vec(vec(J))`
     * application domain: General
     * name: MomentOfInertia
     * quantity dimension: L^2*M^1
     * measurement unit(s): kg*m^2
     * definition: tensor (ISO 80000-2) quantity representing rotational inertia of a rigid body relative to a fixed centre of rotation expressed by the tensor product: `vec(L) = vec(vec(J)) vec(ω)` where `vec(vec(L))` is angular momentum (ISO 80000-3) of the body relative to the reference point and `vec(ω)` is its angular velocity (ISO 80000-3)
     * remarks: The calculation of the value requires an integration.
     */
    attribute def MomentOfInertiaUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MomentOfInertiaValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MomentOfInertiaUnit :>> QuantityValue::mRef;
    }
    attribute momentOfInertia: MomentOfInertiaValue :> quantity;

    /**
     * source: item 4-8 momentum
     * symbol(s): `vec(p)`
     * application domain: General
     * name: Momentum
     * quantity dimension: L^1*M^1*T^-1
     * measurement unit(s): kg*m*s^-1
     * definition: product of mass `m` (item 4-1) of a body and velocity `vec(v)` (ISO 80000-3) of its centre of mass: `vec(p) = m  vec(v)`
     * remarks: 
     */
    attribute def MomentumUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MomentumValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MomentumUnit :>> QuantityValue::mRef;
    }
    attribute momentum: MomentumValue :> quantity;

    /**
     * source: item 4-9.1 force
     * symbol(s): `vec(F)`
     * application domain: General
     * name: Force
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: vector (ISO 80000-2) quantity describing interaction between bodies or particles
     * remarks: 
     */
    attribute def ForceUnit :> SIDerivedUnit {
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
    attribute def ForceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ForceUnit :>> QuantityValue::mRef;
    }
    attribute force: ForceValue :> quantity;

    /**
     * source: item 4-9.2 weight
     * symbol(s): `vec(F_g)`
     * application domain: General
     * name: Weight (specializes Force)
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: force (item 4-9.1) acting on a body in the gravitational field of Earth: `vec(F_g) = m vec(g)` where `m` (item 4-1) is the mass of the body and `vec(g)` is the local acceleration of free fall (ISO 80000-3)
     * remarks: In colloquial language, the name “weight” continues to be used where “mass” is meant. This practice should be avoided. Weight is an example of a gravitational force. Weight comprises not only the local gravitational force but also the local centrifugal force due to the rotation of the Earth.
     */
    attribute weight :> force;

    /**
     * source: item 4-9.3 static friction force, static friction
     * symbol(s): `vec(F_s)`
     * application domain: General
     * name: StaticFrictionForce (specializes Force)
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: force (item 4-9.1) resisting the motion before a body starts to slide on a surface
     * remarks: For the static friction coefficient, see item 4-23.1.
     */
    attribute staticFrictionForce :> force;

    alias staticFrictionForce as staticFriction;

    /**
     * source: item 4-9.4 kinetic friction force, dynamic friction force
     * symbol(s): `vec(F_μ)`
     * application domain: General
     * name: KineticFrictionForce (specializes Force)
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: force (item 4-9.1) resisting the motion when a body slides on a surface
     * remarks: For the kinetic friction factor, see item 4-23.2.
     */
    attribute kineticFrictionForce :> force;

    alias kineticFrictionForce as dynamicFrictionForce;

    /**
     * source: item 4-9.5 rolling resistance, rolling drag, rolling friction force
     * symbol(s): `vec(F_(rr))`
     * application domain: General
     * name: RollingResistance (specializes Force)
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: force (item 4-9.1) resisting the motion when a body rolls on a surface
     * remarks: For the rolling resistance factor, see item 4-23.3.
     */
    attribute rollingResistance :> force;

    alias rollingResistance as rollingDrag;

    alias rollingResistance as rollingFrictionForce;

    /**
     * source: item 4-9.6 drag force
     * symbol(s): `vec(F_D)`
     * application domain: General
     * name: DragForce (specializes Force)
     * quantity dimension: L^1*M^1*T^-2
     * measurement unit(s): N, kg*m*s^-2
     * definition: force (item 4-9.1) resisting the motion of a body in a fluid
     * remarks: For the drag coefficient, see item 4-23.4.
     */
    attribute dragForce :> force;

    /**
     * source: item 4-10 impulse
     * symbol(s): `vec(I)`
     * application domain: General
     * name: Impulse
     * quantity dimension: L^1*M^1*T^-1
     * measurement unit(s): N*s, kg*m*s^-1
     * definition: vector (ISO 80000-2) quantity describing the effect of force acting during a time interval: `vec(I) = int_(t_1)^(t_2) vec(F)*dt` where `vec(F)` is force (item 4-9.1), `t` is time (ISO 80000-3) and [`t`_1, `t`_2] is considered time interval
     * remarks: For a time interval [`t`_1, `t`_2], `vec(I)(t_1, t_2) = vec(p)(t_1) - vec(p)(t_2) = Δ vec(p)` where `vec(p)` is momentum (item 4-8).
     */
    attribute def ImpulseUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ImpulseValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ImpulseUnit :>> QuantityValue::mRef;
    }
    attribute impulse: ImpulseValue :> quantity;

    /**
     * source: item 4-11 angular momentum
     * symbol(s): `vec(L)`
     * application domain: General
     * name: AngularMomentum
     * quantity dimension: L^2*M^1*T^-1
     * measurement unit(s): kg*m^2*s^-1
     * definition: vector (ISO 80000-2) quantity described by the vector product: `vec(L) = vec(r) xx vec(p)` where `vec(r)` is position vector (ISO 80000-3) with respect to the axis of rotation and `vec(p)` is momentum (item 4-8)
     * remarks: 
     */
    attribute def AngularMomentumUnit :> SIDerivedUnit {
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
    attribute def AngularMomentumValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularMomentumUnit :>> QuantityValue::mRef;
    }
    attribute angularMomentum: AngularMomentumValue :> quantity;

    /**
     * source: item 4-12.1 moment of force
     * symbol(s): `vec(M)`
     * application domain: General
     * name: MomentOfForce
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): N*m, kg*m^2*s^-2
     * definition: vector (ISO 80000-2) quantity described by the vector product: `vec(M) = vec(r) xx vec(F)` where `vec(r)` is position vector (ISO 80000-3) with respect to the axis of rotation and `vec(F)` is force (item 4-9.1)
     * remarks: The bending moment of force is denoted by `vec(M)_b`.
     */
    attribute def MomentOfForceUnit :> SIDerivedUnit {
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
    attribute def MomentOfForceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MomentOfForceUnit :>> QuantityValue::mRef;
    }
    attribute momentOfForce: MomentOfForceValue :> quantity;

    /**
     * source: item 4-12.2 torque
     * symbol(s): `T`, `M_Q`
     * application domain: General
     * name: Torque
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): N*m, kg*m^2*s^-2
     * definition: quantity described by the scalar product: `T = vec(M)*vec(e_Q)` where `vec(M)` is moment of force (item 4-12.1) and `vec(e_Q)` is unit vector of direction with respect to which the torque is considered
     * remarks: For example, torque is the twisting moment of force with respect to the longitudinal axis of a beam or shaft.
     */
    attribute def TorqueUnit :> SIDerivedUnit {
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
    attribute def TorqueValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TorqueUnit :>> QuantityValue::mRef;
    }
    attribute torque: TorqueValue :> quantity;

    /**
     * source: item 4-13 angular impulse
     * symbol(s): `vec(H)`
     * application domain: General
     * name: AngularImpulse
     * quantity dimension: L^2*M^1*T^-1
     * measurement unit(s): N*m*s, kg*m^2*s^-1
     * definition: vector (ISO 80000-2) quantity describing the effect of moment of force during a time interval: `vec(H)(t_1; t_2) = int_(t_1)^(t_2) vec(M)*dt` where `vec(M)` is moment of force (item 4-12.1), `t` is time (ISO 80000-3) and [`t`_1, `t`_2] is considered time interval
     * remarks: For a time interval [`t`_1, `t`_2], `vec(H)(t_1, t_2) = vec(L)(t_1) - vec(L)(t_2) = Δ vec(L)` where `vec(L)` is angular momentum.
     */
    attribute def AngularImpulseUnit :> SIDerivedUnit {
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
    attribute def AngularImpulseValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularImpulseUnit :>> QuantityValue::mRef;
    }
    attribute angularImpulse: AngularImpulseValue :> quantity;

    /**
     * source: item 4-14.1 pressure
     * symbol(s): `p`
     * application domain: General
     * name: Pressure
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: quotient of the component of a force normal to a surface and its area: `p = (vec(e_n) * vec(F)) / A` where `vec(e_n)` is unit vector of the surface normal, `vec(F)` is force (item 4-9.1) and `A` is area (ISO 80000-3)
     * remarks: 
     */
    attribute def PressureUnit :> SIDerivedUnit {
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
    attribute def PressureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PressureUnit :>> QuantityValue::mRef;
    }
    attribute pressure: PressureValue :> quantity;

    /**
     * source: item 4-14.2 gauge pressure
     * symbol(s): `p_e`
     * application domain: General
     * name: GaugePressure (specializes Pressure)
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: pressure `p` (item 4-14.1) decremented by ambient pressure `p_amb` : `p_e = p - p_amb`
     * remarks: Often, `p_amb` is chosen as a standard pressure. Gauge pressure is positive or negative.
     */
    attribute gaugePressure :> pressure;

    /**
     * source: item 4-15 stress
     * symbol(s): `vec(vec(σ))`
     * application domain: General
     * name: Stress
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: tensor (ISO 80000-2) quantity representing state of tension of matter
     * remarks: Stress tensor is symmetric and has three normal-stress and three shear-stress (Cartesian) components.
     */
    attribute def StressUnit :> SIDerivedUnit {
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
    attribute def StressValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StressUnit :>> QuantityValue::mRef;
    }
    attribute stress: StressValue :> quantity;

    /**
     * source: item 4-16.1 normal stress
     * symbol(s): `σ_n`, `σ`
     * application domain: General
     * name: NormalStress
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: scalar (ISO 80000-2) quantity describing surface action of a force into a body equal to: `σ_n = (d F_n)/(dA)` where `F_n` is the normal component of force (item 4-9.1) and `A` is the area (ISO 80000-3) of the surface element
     * remarks: A couple of mutually opposite forces of magnitude `F` acting on the opposite surfaces of a slice (layer) of homogenous solid matter normal to it, and evenly distributed, cause a constant normal stress `σ_n = F A` in the slice (layer).
     */
    attribute def NormalStressUnit :> SIDerivedUnit {
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
    attribute def NormalStressValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: NormalStressUnit :>> QuantityValue::mRef;
    }
    attribute normalStress: NormalStressValue :> quantity;

    /**
     * source: item 4-16.2 shear stress
     * symbol(s): `τ_s`, `τ`
     * application domain: General
     * name: ShearStress
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: scalar (ISO 80000-2) quantity describing surface action of a force into a body equal to: `τ_s = (d F_t)/(dA)` where `F_t` is the tangential component of force (item 4-9.1) and `A` is the area (ISO 80000-3) of the surface element
     * remarks: A couple of mutually opposite forces of magnitude `F` acting on the opposite surfaces of a slice (layer) of homogenous solid matter parallel to it, and evenly distributed, cause a constant shear stress `τ = F/A` in the slice (layer).
     */
    attribute def ShearStressUnit :> SIDerivedUnit {
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
    attribute def ShearStressValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ShearStressUnit :>> QuantityValue::mRef;
    }
    attribute shearStress: ShearStressValue :> quantity;

    /**
     * source: item 4-17.1 strain
     * symbol(s): `vec(vec(ε))`
     * application domain: General
     * name: Strain
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: tensor (ISO 80000-2) quantity representing the deformation of matter caused by stress
     * remarks: Strain tensor is symmetric and has three linear-strain and three shear strain (Cartesian) components.
     */
    attribute def StrainUnit :> DimensionOneUnit {
    }
    attribute def StrainValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StrainUnit :>> QuantityValue::mRef;
    }
    attribute strain: StrainValue :> quantity;

    /**
     * source: item 4-17.2 relative linear strain
     * symbol(s): `ε`, `(e)`
     * application domain: General
     * name: RelativeLinearStrain
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of change in length `Δ I` (ISO 80000-3) of an object and its length `l` (ISO 80000-3): `ε = (Δ I)/I`
     * remarks: 
     */
    attribute def RelativeLinearStrainUnit :> DimensionOneUnit {
    }
    attribute def RelativeLinearStrainValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeLinearStrainUnit :>> QuantityValue::mRef;
    }
    attribute relativeLinearStrain: RelativeLinearStrainValue :> quantity;

    /**
     * source: item 4-17.3 shear strain
     * symbol(s): `γ`
     * application domain: General
     * name: ShearStrain
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of parallel displacement `Δ x` (ISO 80000-3) of two surfaces of a layer and the thickness `d` (ISO 80000-3) of the layer: `γ = (Δ x)/d`
     * remarks: 
     */
    attribute def ShearStrainUnit :> DimensionOneUnit {
    }
    attribute def ShearStrainValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ShearStrainUnit :>> QuantityValue::mRef;
    }
    attribute shearStrain: ShearStrainValue :> quantity;

    /**
     * source: item 4-17.4 relative volume strain
     * symbol(s): `θ`
     * application domain: General
     * name: RelativeVolumeStrain
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of change in volume `Δ V` (ISO 80000-3) of an object and its volume `V_0` (ISO 80000-3): `θ = (Δ V)/V_0`
     * remarks: 
     */
    attribute def RelativeVolumeStrainUnit :> DimensionOneUnit {
    }
    attribute def RelativeVolumeStrainValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeVolumeStrainUnit :>> QuantityValue::mRef;
    }
    attribute relativeVolumeStrain: RelativeVolumeStrainValue :> quantity;

    /**
     * source: item 4-18 Poisson number
     * symbol(s): `μ`, `(v)`
     * application domain: General
     * name: PoissonNumber
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of change in width `Δ b` (width is defined in ISO 80000-3) and change in length `Δ I` (length is defined in ISO 80000-3) of an object: `μ = (Δ b)/(Δ I)`
     * remarks: 
     */
    attribute def PoissonNumberUnit :> DimensionOneUnit {
    }
    attribute def PoissonNumberValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PoissonNumberUnit :>> QuantityValue::mRef;
    }
    attribute poissonNumber: PoissonNumberValue :> quantity;

    /**
     * source: item 4-19.1 modulus of elasticity, Young modulus
     * symbol(s): `E`, `E_m`, `Y`
     * application domain: General
     * name: ModulusOfElasticity
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: quotient of normal stress `σ` (item 4-16.1) and relative linear strain `ε` (item 4-17.2): `E = σ / ε`
     * remarks: Conditions should be specified (e.g. adiabatic or isothermal process).
     */
    attribute def ModulusOfElasticityUnit :> SIDerivedUnit {
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
    attribute def ModulusOfElasticityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ModulusOfElasticityUnit :>> QuantityValue::mRef;
    }
    attribute modulusOfElasticity: ModulusOfElasticityValue :> quantity;

    alias ModulusOfElasticityUnit as YoungModulusUnit;
    alias ModulusOfElasticityValue as YoungModulusValue;
    alias modulusOfElasticity as youngModulus;

    /**
     * source: item 4-19.2 modulus of rigidity, shear modulus
     * symbol(s): `G`
     * application domain: General
     * name: ModulusOfRigidity
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: quotient of shear stress `τ` (item 4-16.2) and shear strain `γ` (item 4-17.3): `G = τ/γ`
     * remarks: Conditions should be specified (e.g. isentropic or isothermal process).
     */
    attribute def ModulusOfRigidityUnit :> SIDerivedUnit {
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
    attribute def ModulusOfRigidityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ModulusOfRigidityUnit :>> QuantityValue::mRef;
    }
    attribute modulusOfRigidity: ModulusOfRigidityValue :> quantity;

    alias ModulusOfRigidityUnit as ShearModulusUnit;
    alias ModulusOfRigidityValue as ShearModulusValue;
    alias modulusOfRigidity as shearModulus;

    /**
     * source: item 4-19.3 modulus of compression, bulk modulus
     * symbol(s): `K`, `K_m`, `B`
     * application domain: General
     * name: ModulusOfCompression
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, N*m^-2, kg*m^-1*s^-2
     * definition: negative of the quotient of pressure `p` (item 4-14.1) and relative volume strain `θ` (item 4-17.4): `K = -(p/θ)`
     * remarks: Conditions should be specified (e.g. isentropic or isothermal process).
     */
    attribute def ModulusOfCompressionUnit :> SIDerivedUnit {
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
    attribute def ModulusOfCompressionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ModulusOfCompressionUnit :>> QuantityValue::mRef;
    }
    attribute modulusOfCompression: ModulusOfCompressionValue :> quantity;

    alias ModulusOfCompressionUnit as BulkModulusUnit;
    alias ModulusOfCompressionValue as BulkModulusValue;
    alias modulusOfCompression as bulkModulus;

    /**
     * source: item 4-20 compressibility
     * symbol(s): `ϰ`
     * application domain: General
     * name: Compressibility
     * quantity dimension: L^1*M^-1*T^2
     * measurement unit(s): Pa^-1, kg^-1*m*s^2
     * definition: negative relative change of volume `V` (ISO 80000-3) of an object under pressure `p` (item 4-14.1) expressed by: `ϰ` `=-(1/V)(dV)/(dp)`
     * remarks: Conditions should be specified (e.g. isentropic or isothermal process). See also ISO 80000-5.
     */
    attribute def CompressibilityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def CompressibilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CompressibilityUnit :>> QuantityValue::mRef;
    }
    attribute compressibility: CompressibilityValue :> quantity;

    /**
     * source: item 4-21.1 second axial moment of area
     * symbol(s): `I_a`
     * application domain: General
     * name: SecondAxialMomentOfArea
     * quantity dimension: L^4
     * measurement unit(s): m^4
     * definition: geometrical characteristic of a shape of a body equal to: `I_a = int int_M r_Q^2 * dA` where `M` is the two-dimensional domain of the cross-section of a plane and considered body, `r_Q` is radial distance (ISO 80000-3) from a Q-axis in the plane of the surface considered and `A` is area (ISO 80000-3)
     * remarks: This quantity is often referred to wrongly as “moment of inertia” (item 4-7). The subscript, `a`, may be omitted when there is no risk of confusion.
     */
    attribute def SecondAxialMomentOfAreaUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
    }
    attribute def SecondAxialMomentOfAreaValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SecondAxialMomentOfAreaUnit :>> QuantityValue::mRef;
    }
    attribute secondAxialMomentOfArea: SecondAxialMomentOfAreaValue :> quantity;

    /**
     * source: item 4-21.2 second polar moment of area
     * symbol(s): `I_p`
     * application domain: General
     * name: SecondPolarMomentOfArea
     * quantity dimension: L^4
     * measurement unit(s): m^4
     * definition: geometrical characteristic of a shape of a body equal to: `I_p = int int_M r_Q^2 * dA` where `M` is the two-dimensional domain of the cross-section of a plane and considered body, `r_Q` is radial distance (ISO 80000-3) from a Q-axis perpendicular to the plane of the surface considered and `A` is area (ISO 80000-3)
     * remarks: This quantity is often referred to wrongly as “moment of inertia” (item 4-7). The subscript, p, may be omitted when there is no risk of confusion.
     */
    attribute def SecondPolarMomentOfAreaUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 4;
        }
    }
    attribute def SecondPolarMomentOfAreaValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SecondPolarMomentOfAreaUnit :>> QuantityValue::mRef;
    }
    attribute secondPolarMomentOfArea: SecondPolarMomentOfAreaValue :> quantity;

    /**
     * source: item 4-22 section modulus
     * symbol(s): `Z`, `(W)`
     * application domain: General
     * name: SectionModulus
     * quantity dimension: L^3
     * measurement unit(s): m^3
     * definition: geometrical characteristic of a shape of a body equal to: `Z = I_a/r_(Q_max)` where `I_a` is the second axial moment of area (item 4-21.1) and `r_(Q,max)` is the maximum radial distance (ISO 80000-3) of any point in the surface considered from the Q-axis with respect to which `I_a` is defined
     * remarks: 
     */
    attribute def SectionModulusUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
    }
    attribute def SectionModulusValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SectionModulusUnit :>> QuantityValue::mRef;
    }
    attribute sectionModulus: SectionModulusValue :> quantity;

    /**
     * source: item 4-23.1 static friction coefficient, static friction factor, coefficient of static friction
     * symbol(s): `μ_s`, `(f_s)`
     * application domain: General
     * name: StaticFrictionCoefficient
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: proportionality factor between the maximum magnitude of the tangential component `F_max` of the static friction force (item 4-9.3) and the magnitude of the normal component `N` of the contact force (item 4-9.1) between two bodies at relative rest with respect to each other: `F_max = μ_s * N`
     * remarks: When it is not necessary to distinguish between dynamic friction factor and static friction factor, the name friction factor may be used for both.
     */
    attribute def StaticFrictionCoefficientUnit :> DimensionOneUnit {
    }
    attribute def StaticFrictionCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: StaticFrictionCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute staticFrictionCoefficient: StaticFrictionCoefficientValue :> quantity;

    alias StaticFrictionCoefficientUnit as StaticFrictionFactorUnit;
    alias StaticFrictionCoefficientValue as StaticFrictionFactorValue;
    alias staticFrictionCoefficient as staticFrictionFactor;

    alias StaticFrictionCoefficientUnit as CoefficientOfStaticFrictionUnit;
    alias StaticFrictionCoefficientValue as CoefficientOfStaticFrictionValue;
    alias staticFrictionCoefficient as coefficientOfStaticFriction;

    /**
     * source: item 4-23.2 kinetic friction factor, dynamic friction factor
     * symbol(s): `μ`, `(f)`
     * application domain: General
     * name: KineticFrictionFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: proportionality factor between the magnitudes of the kinetic friction force, `F_μ` (item 4-9.4) and the normal component `N` of the contact force (item 4-9.1): `F_μ = μ * N`
     * remarks: When it is not necessary to distinguish between dynamic friction factor and static friction factor, the name friction factor may be used for both. The dynamic friction factor `µ` is independent in first approximation of the contact surface.
     */
    attribute def KineticFrictionFactorUnit :> DimensionOneUnit {
    }
    attribute def KineticFrictionFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: KineticFrictionFactorUnit :>> QuantityValue::mRef;
    }
    attribute kineticFrictionFactor: KineticFrictionFactorValue :> quantity;

    alias KineticFrictionFactorUnit as DynamicFrictionFactorUnit;
    alias KineticFrictionFactorValue as DynamicFrictionFactorValue;
    alias kineticFrictionFactor as dynamicFrictionFactor;

    /**
     * source: item 4-23.3 rolling resistance factor
     * symbol(s): `C_(rr)`
     * application domain: General
     * name: RollingResistanceFactor
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: proportionality factor between the magnitude of the tangential component `F` and the magnitude of the normal component `N` of the force applied to a body rolling on a surface at constant speed: `F = C_(rr)*N`
     * remarks: Also known as rolling resistance coefficient, RRC.
     */
    attribute def RollingResistanceFactorUnit :> DimensionOneUnit {
    }
    attribute def RollingResistanceFactorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RollingResistanceFactorUnit :>> QuantityValue::mRef;
    }
    attribute rollingResistanceFactor: RollingResistanceFactorValue :> quantity;

    /**
     * source: item 4-23.4 drag coefficient, drag factor
     * symbol(s): `C_D`
     * application domain: General
     * name: DragCoefficient
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: factor proportional to magnitude `F_D` of the drag force (item 4-9.6) of a body moving in a fluid, dependent on the shape and speed `v` (ISO 80000-3) of a body: `F_D = 1/2 * C_D * ρ * v^2 * A` where `ρ` is mass density (item 4-2) of the fluid and `A` is cross-section area (ISO 80000-3) of the body
     * remarks: 
     */
    attribute def DragCoefficientUnit :> DimensionOneUnit {
    }
    attribute def DragCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DragCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute dragCoefficient: DragCoefficientValue :> quantity;

    alias DragCoefficientUnit as DragFactorUnit;
    alias DragCoefficientValue as DragFactorValue;
    alias dragCoefficient as dragFactor;

    /**
     * source: item 4-24 dynamic viscosity, viscosity
     * symbol(s): `η`
     * application domain: General
     * name: DynamicViscosity
     * quantity dimension: L^-1*M^1*T^-1
     * measurement unit(s): Pa*s, kg*m^-1*s^-1
     * definition: for laminar flows, proportionality constant between shear stress `τ_(xz)` (item 4-16.2) in a fluid moving with a velocity `v_x` (ISO 80000-3) and gradient `(d v_x)/dz` perpendicular to the plane of shear: `τ_(xz) = η (d v_x)/(dz)`
     * remarks: 
     */
    attribute def DynamicViscosityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def DynamicViscosityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DynamicViscosityUnit :>> QuantityValue::mRef;
    }
    attribute dynamicViscosity: DynamicViscosityValue :> quantity;

    alias DynamicViscosityUnit as ViscosityUnit;
    alias DynamicViscosityValue as ViscosityValue;
    alias dynamicViscosity as viscosity;

    /**
     * source: item 4-25 kinematic viscosity
     * symbol(s): `v`
     * application domain: General
     * name: KinematicViscosity
     * quantity dimension: L^2*T^-1
     * measurement unit(s): m^2*s^-1
     * definition: quotient of dynamic viscosity `η` (item 4-24) and mass density `ρ` (item 4-2) of a fluid: `v = η/ρ`
     * remarks: 
     */
    attribute def KinematicViscosityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def KinematicViscosityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: KinematicViscosityUnit :>> QuantityValue::mRef;
    }
    attribute kinematicViscosity: KinematicViscosityValue :> quantity;

    /**
     * source: item 4-26 surface tension
     * symbol(s): `γ`, `σ`
     * application domain: General
     * name: SurfaceTension
     * quantity dimension: M^1*T^-2
     * measurement unit(s): N*m^-1, kg*s^-2
     * definition: magnitude of a force acting against the enlargement of area portion of a surface separating a liquid from its surrounding
     * remarks: The concept of surface energy is closely related to surface tension and has the same dimension.
     */
    attribute def SurfaceTensionUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def SurfaceTensionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SurfaceTensionUnit :>> QuantityValue::mRef;
    }
    attribute surfaceTension: SurfaceTensionValue :> quantity;

    /**
     * source: item 4-27 power
     * symbol(s): `P`
     * application domain: mechanics
     * name: Power
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): W, N*m*s^-1, kg*m^2*s^-3
     * definition: scalar product of force `vec(F)` (item 4-9.1) acting to a body and its velocity `vec(v)` (ISO 80000-3): `P = vec(F) * vec(v)`
     * remarks: 
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

    /**
     * source: item 4-28.1 potential energy
     * symbol(s): `V`, `E_p`
     * application domain: General
     * name: PotentialEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: for conservative force `vec(F)`, scalar additive quantity obeying condition `vec(F) = - nabla F`, if it exists
     * remarks: For the definition of energy, see ISO 80000-5. A force is conservative when the force field is irrotational, i.e. `rot(F) = 0` , or `vec(F)` is perpendicular to the speed of the body to ensure `vec(F) * d vec(r) = 0` .
     */
    attribute potentialEnergy :> energy;

    /**
     * source: item 4-28.2 kinetic energy
     * symbol(s): `T`, `E_k`
     * application domain: General
     * name: KineticEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: scalar (ISO 80000-2) quantity characterizing a moving body expressed by: `T = 1/2 m v^2` where `m` is mass (item 4-1) of the body and `v` is its speed (ISO 80000-3)
     * remarks: For the definition of energy, see ISO 80000-5.
     */
    attribute kineticEnergy :> energy;

    /**
     * source: item 4-28.3 mechanical energy
     * symbol(s): `E`, `W`
     * application domain: General
     * name: MechanicalEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: sum of kinetic energy `T` (item 4-28.2) and potential energy `V` (item 4-28.1): `E = T+V`
     * remarks: The symbols `E` and `W` are also used for other kinds of energy. This definition is understood in a classical way and it does not include thermal motion.
     */
    attribute mechanicalEnergy :> energy;

    /**
     * source: item 4-28.4 mechanical work, work
     * symbol(s): `A`, `W`
     * application domain: General
     * name: MechanicalWork
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: process quantity describing the total action of a force `vec(F)` (item 4-9.1) along a continuous curve `Γ` in three-dimensional space with infinitesimal displacement (ISO 80000-3) d`vec(r)`, as a line integral of their scalar product: `A = int_Γ vec(F) * d vec(r)`
     * remarks: The definition covers the case `A = - int_Γ p*dV` where `Γ` is a curve in the phase space and implies that work generally depends upon `Γ` , and that type of process must be defined (e.g. isentropic or isothermic).
     */
    attribute def MechanicalWorkUnit :> SIDerivedUnit {
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
    attribute def MechanicalWorkValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MechanicalWorkUnit :>> QuantityValue::mRef;
    }
    attribute mechanicalWork: MechanicalWorkValue :> quantity;

    alias MechanicalWorkUnit as WorkUnit;
    alias MechanicalWorkValue as WorkValue;
    alias mechanicalWork as work;

    /**
     * source: item 4-29 efficiency
     * symbol(s): `η`
     * application domain: mechanics
     * name: Efficiency
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of output power `P_"out"` (item 4-27) from a system and input power `P_"in"` (item 4-27) to this system: `η = P_"out"/P_"in"`
     * remarks: The system must be specified. This quantity is often expressed by the unit percent, symbol %.
     */
    attribute def EfficiencyUnit :> DimensionOneUnit {
    }
    attribute def EfficiencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EfficiencyUnit :>> QuantityValue::mRef;
    }
    attribute efficiency: EfficiencyValue :> quantity;

    /**
     * source: item 4-30.1 mass flow
     * symbol(s): `vec(j)_m`
     * application domain: General
     * name: MassFlow
     * quantity dimension: L^-2*M^1*T^-1
     * measurement unit(s): kg*m^-2*s^-1
     * definition: vector (ISO 80000-2) quantity characterizing a flowing fluid by the product of its local mass density `ρ` (item 4-2) and local velocity `vec(v)` (ISO 80000-3): `vec(j)_m = ρ vec(v)`
     * remarks: 
     */
    attribute def MassFlowUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassFlowValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassFlowUnit :>> QuantityValue::mRef;
    }
    attribute massFlow: MassFlowValue :> quantity;

    /**
     * source: item 4-30.2 mass flow rate
     * symbol(s): `q_m`
     * application domain: General
     * name: MassFlowRate
     * quantity dimension: M^1*T^-1
     * measurement unit(s): kg*s^-1
     * definition: scalar (ISO 80000-2) quantity characterizing the total flow through the two-dimensional domain A with normal vector `vec(e)_n` of a flowing fluid with mass flow `vec(j)_m` (item 4-30.1) as an integral: `q_m = int int_A vec(j)_m * vec(e)_n dA` where `dA` is the area (ISO 80000-3) of an element of the two-dimensional domain `A`
     * remarks: 
     */
    attribute def MassFlowRateUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassFlowRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassFlowRateUnit :>> QuantityValue::mRef;
    }
    attribute massFlowRate: MassFlowRateValue :> quantity;

    /**
     * source: item 4-30.3 mass change rate
     * symbol(s): `q_m`
     * application domain: General
     * name: MassChangeRate
     * quantity dimension: M^1*T^-1
     * measurement unit(s): kg*s^-1
     * definition: rate of increment of mass `m` (item 4-1): `q_m = (dm)/(dt)` where d`m` is the infinitesimal mass (item 4-1) increment and `dt` is the infinitesimal duration (ISO 80000-3)
     * remarks: 
     */
    attribute def MassChangeRateUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassChangeRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassChangeRateUnit :>> QuantityValue::mRef;
    }
    attribute massChangeRate: MassChangeRateValue :> quantity;

    /**
     * source: item 4-31 volume flow rate
     * symbol(s): `q_v`
     * application domain: General
     * name: VolumeFlowRate
     * quantity dimension: L^3*T^-1
     * measurement unit(s): m^3*s^-1
     * definition: scalar (ISO 80000-2) quantity characterizing the total flow through the two-dimensional domain `A` with the normal vector `vec(e)_n` of a flowing fluid with velocity `vec(v)` (ISO 80000-3) as an integral: `q_v = int int_A vec(v) * vec(e)_n dA` where `dA` is the area (ISO 80000-3) of an element of the two-dimensional domain `A`
     * remarks: 
     */
    attribute def VolumeFlowRateUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VolumeFlowRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VolumeFlowRateUnit :>> QuantityValue::mRef;
    }
    attribute volumeFlowRate: VolumeFlowRateValue :> quantity;

    /**
     * source: item 4-32 action quantity
     * symbol(s): `S`
     * application domain: General
     * name: ActionQuantity
     * quantity dimension: L^2*M^1*T^-1
     * measurement unit(s): J*s, kg*m^2*s^-1
     * definition: time integral of energy `E` over a time interval (`t`_1, `t`_2): `S = int_(t_1)^(t_2) E dt`
     * remarks: The energy may be expressed by a Lagrangian or Hamiltonian function.
     */
    attribute def ActionQuantityUnit :> SIDerivedUnit {
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
    attribute def ActionQuantityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ActionQuantityUnit :>> QuantityValue::mRef;
    }
    attribute actionQuantity: ActionQuantityValue :> quantity;

}
