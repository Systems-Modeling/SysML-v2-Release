standard library package ISQCharacteristicNumbers {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T19:40:39Z from standard ISO-80000-11:2019 "Characteristic numbers"
     * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-11:ed-2:v1:en
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

    /* ISO-80000-11 item 11-4.1 Reynolds number */
    attribute def ReynoldsNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.1 Reynolds number
         * symbol(s): `Re`
         * application domain: generic
         * name: ReynoldsNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of inertial forces and viscous forces in a fluid flow, expressed by `Re = (ρ*v*l)/η = (v*l)/ν`, where `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), `η` is dynamic viscosity (ISO 80000-4), and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: The value of the Reynolds number gives an estimate on the flow state: laminar flow or turbulent flow. In rotating movement, the speed `v = ω*l`, where `l` is the distance from the rotation axis and `ω` is the angular velocity.
         */
    }
    attribute reynoldsNumber: ReynoldsNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.2 Euler number */
    attribute def EulerNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.2 Euler number
         * symbol(s): `Eu`
         * application domain: generic
         * name: EulerNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relationship between pressure drop in a flow and the kinetic energy per volume for flow of fluids in a pipe, expressed by `Eu = (Δp)/(ρ*v^2)`, where `Δp` is drop of pressure (ISO 80000-4), `ρ` is mass density (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: The Euler number is used to characterize losses in the flow. A modification of the Euler number is considering the dimensions of the containment (pipe): `Eu^"'" = d/l*Eu`, where `d` is inner diameter (ISO 80000-3) of the pipe, and `l` is length (ISO 80000-3).
         */
    }
    attribute eulerNumber: EulerNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.3 Froude number */
    attribute def FroudeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.3 Froude number
         * symbol(s): `Fr`
         * application domain: generic
         * name: FroudeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of a body’s inertial forces and its gravitational forces for flow of fluids, expressed by `Fr = v/sqrt(l*g)`, where `v` is speed (ISO 80000-3) of flow, `l` is characteristic length (ISO 80000-3), and `g` is acceleration of free fall (ISO 80000-3)
         * remarks: The Froude number can be modified by buoyancy. Sometimes the square and sometimes the inverse of the Froude number as defined here is wrongly used.
         */
    }
    attribute froudeNumber: FroudeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.4 Grashof number */
    attribute def GrashofNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.4 Grashof number
         * symbol(s): `Gr`
         * application domain: generic
         * name: GrashofNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of buoyancy forces due to thermal expansion which results in a change of mass density and viscous forces for free convection due to temperature differences, expressed by `Gr = l^3*g*α_V*(ΔT)/ν^2`, where `l` is characteristic length (ISO 80000-3), `g` is acceleration of free fall (ISO 80000-3), `α_V` is thermal cubic expansion coefficient (ISO 80000-5), `ΔT` is difference of thermodynamic temperature `T` (ISO 80000-5) between surface of the body and the fluid far away from the body, and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: Heating can occur near hot vertical walls, in pipes, or by a bluff body. The characteristic length can be the vertical height of a hot plate, the diameter of a pipe, or the effective length of a body. See also Rayleigh number (item 11-5.3).
         */
    }
    attribute grashofNumber: GrashofNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.5 Weber number */
    attribute def WeberNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.5 Weber number
         * symbol(s): `We`
         * application domain: generic
         * name: WeberNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertial forces and capillary forces due to surface tension at the interface between two different fluids, expressed by `We = (ρ*v^2*l)/γ`, where `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `γ` is surface tension (ISO 80000-4)
         * remarks: The fluids can be gases or liquids. The different fluids often are drops moving in a gas or bubbles in a liquid. The characteristic length is commonly the diameter of bubbles or drops. The square root of the Weber number is called Rayleigh number. Sometimes the square root of the Weber number as defined here is called the Weber number. That definition is deprecated. Interfaces only exist between two fluids which are not miscible.
         */
    }
    attribute weberNumber: WeberNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.6 Mach number */
    attribute def MachNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.6 Mach number
         * symbol(s): `Ma`
         * application domain: generic
         * name: MachNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the speed of flow and the speed of sound, expressed by `Ma = v/c`, where `v` is speed (ISO 80000-3) of the body, and `c` is speed of sound (ISO 80000-8) in the fluid
         * remarks: The Mach number represents the relationship of inertial forces compared to compression forces. For an ideal gas `c = sqrt(γ p/rho) = sqrt(γ (RT)/M) = sqrt(γ (kT)/m)`, where `γ` is ratio of the specific heat capacity (ISO 80000-5).
         */
    }
    attribute machNumber: MachNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.7 Knudsen number */
    attribute def KnudsenNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.7 Knudsen number
         * symbol(s): `Kn`
         * application domain: generic
         * name: KnudsenNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of free path length of a particle and a characteristic length, expressed by `Kn = λ/l`, where `λ` is mean free path (ISO 80000-9), and `l` is characteristic length (ISO 80000-3)
         * remarks: The Knudsen number is a measure to estimate whether the gas in flow behaves like a continuum. The characteristic length, `l`, can be a characteristic size of the gas flow region like a pipe diameter.
         */
    }
    attribute knudsenNumber: KnudsenNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.8 Strouhal number, Thomson number */
    attribute def StrouhalNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.8 Strouhal number, Thomson number
         * symbol(s): `Sr`, `Sh`
         * application domain: generic
         * name: StrouhalNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between a characteristic frequency and a characteristic speed for unsteady flow with periodic behaviour, expressed by `Sr = f*l/v`, where `f` is frequency (ISO 80000-3) of vortex shedding, `l` is characteristic length (ISO 80000-3), and `v` is speed (ISO 80000-3) of flow
         * remarks: The characteristic length, `l`, can be the diameter of an obstacle in the flow which can cause vortex shedding, or the length of it.
         */
    }
    attribute strouhalNumber: StrouhalNumberValue :> scalarQuantities;

    alias thomsonNumber for strouhalNumber;

    /* ISO-80000-11 item 11-4.9 drag coefficient */
    /* Refer to declaration for DragCoefficient in ISQMechanics item 4-23.4 drag coefficient */

    /* ISO-80000-11 item 11-4.10 Bagnold number */
    attribute def BagnoldNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.10 Bagnold number
         * symbol(s): `Bg`
         * application domain: generic
         * name: BagnoldNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of drag force and gravitational force for a body moving in a fluid, expressed by `Bg = (c_D*ρ*v^2)/(l*g*ρ_b)`, where `c_D` is drag coefficient (item 11-4.9) of the body, `ρ` is mass density (ISO 80000-4) of the fluid, `v` is speed (ISO 80000-3) of the body, `l` is characteristic length (ISO 80000-3), `g` is acceleration of free fall (ISO 80000-3), and `ρ_b` is mass density (ISO 80000-4) of the body
         * remarks: The characteristic length, `l`, is the body’s volume divided by its cross-sectional area.
         */
    }
    attribute bagnoldNumber: BagnoldNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.11 Bagnold number */
    attribute def BagnoldNumberForSolidParticlesValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.11 Bagnold number
         * symbol(s): `Ba_2`
         * application domain: solid particles
         * name: BagnoldNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of drag force and viscous force in a fluid transferring solid particles, expressed by `Ba_2 = (ρ_s*d^2*dot(γ))/η*sqrt(1/(f_s^(1/2) - 1))`, where `ρ_s` is mass density (ISO 80000-4) of particles, `d` is diameter (ISO 80000-3) of particles, `dot(γ) = v/d` is shear rate time-derivative of shear strain (ISO 80000-4), `η` is dynamic viscosity (ISO 80000-4) of fluid, and `f_s` is volumic fraction of solid particles
         * remarks: None.
         */
    }
    attribute bagnoldNumberForSolidParticles: BagnoldNumberForSolidParticlesValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.12 lift coefficient */
    attribute def LiftCoefficientValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.12 lift coefficient
         * symbol(s): `c_l`, `c_A`
         * application domain: generic
         * name: LiftCoefficient (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the lift force available from a wing at a given angle and the inertial force for a wing shaped body moving in a fluid, expressed by `c_l = ( 2*F_l)/(ρ*v^2*S) = F_l/(q*S)`, where `F_l` is lift force (ISO 80000-4) on the wing, `ρ` is mass density (ISO 80000-4) of the fluid, `v` is speed (ISO 80000-3) of the body, `S = A*cos(α)` is effective area (ISO 80000-3) when `α` is the angle of attack and `A` is area of the wing, and `q = 1/2*ρ*v^2` is dynamic pressure
         * remarks: The lift coefficient is dependant on the shape of the wing.
         */
    }
    attribute liftCoefficient: LiftCoefficientValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.13 thrust coefficient */
    attribute def ThrustCoefficientValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.13 thrust coefficient
         * symbol(s): `c_t`
         * application domain: generic
         * name: ThrustCoefficient (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the effective thrust force available from a propeller and the inertial force in a fluid, expressed by `c_t = F_T/(ρ*n^2*d^4)`, where `F_T` is thrust force (ISO 80000-4) of the propeller, `ρ` is mass density (ISO 80000-4) of the fluid, `n` is rotational frequency (ISO 80000-3), and `d` is tip diameter (ISO 80000-3) of the propeller
         * remarks: The thrust coefficient is dependant on the shape of the propeller.
         */
    }
    attribute thrustCoefficient: ThrustCoefficientValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.14 Dean number */
    attribute def DeanNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.14 Dean number
         * symbol(s): `Dn`
         * application domain: generic
         * name: DeanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between centrifugal force and inertial force, for flows of fluids in curved pipes, expressed by `Dn = (2*v*r)/ν*sqrt(r/R)`, where `v` is (axial) speed (ISO 80000-3), `r` is radius (ISO 80000-3) of the pipe, `ν` is kinematic viscosity (ISO 80000-4) of the fluid, and `R` is radius of curvature (ISO 80000-3) of the path of the pipe
         * remarks: None.
         */
    }
    attribute deanNumber: DeanNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.15 Bejan number */
    attribute def BejanNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.15 Bejan number
         * symbol(s): `Be`
         * application domain: generic
         * name: BejanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mechanical work and frictional energy loss in fluid dynamics in a pipe, expressed by `Be = (Δp*ρ*l^2)/(η*ν)`, where `p` is drop of pressure (ISO 80000-4) along the pipe, `l` is characteristic length (ISO 80000-3), `η` is dynamic viscosity (ISO 80000-4), `ν` is kinematic viscosity (ISO 80000-4), and `ρ` is mass density (ISO 80000-4)
         * remarks: A similar number exists for heat transfer (item 11-5.9). The kinematic viscosity is also called momentum diffusivity.
         */
    }
    attribute bejanNumber: BejanNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.16 Lagrange number */
    attribute def LagrangeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.16 Lagrange number
         * symbol(s): `Lg`
         * application domain: generic
         * name: LagrangeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mechanical work and frictional energy loss in fluid dynamics in a pipe, expressed by `Lg = (l*Δp)/(η*v)`, where `l` is length (ISO 80000-3) of the pipe, `Δp` is drop of pressure (ISO 80000-4) along the pipe, `η` is dynamic viscosity (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: The Lagrange number is also given by `Lg = Re*Eu`, where `Re` is the Reynolds number (item 11-4.1), and `Eu` is the Euler number (item 11-4.2).
         */
    }
    attribute lagrangeNumber: LagrangeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.17 Bingham number, plasticity number */
    attribute def BinghamNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.17 Bingham number, plasticity number
         * symbol(s): `Bm`, `Bn`
         * application domain: generic
         * name: BinghamNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of yield stress and viscous stress in a viscous material for flow of viscoplastic material in channels, expressed by `Bm = (τ*d)/(η*v)`, where `τ` is shear stress (ISO 80000-4), `d` is characteristic diameter (ISO 80000-3), e.g. effective channel width, `η` is dynamic viscosity (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: None.
         */
    }
    attribute binghamNumber: BinghamNumberValue :> scalarQuantities;

    alias plasticityNumber for binghamNumber;

    /* ISO-80000-11 item 11-4.18 Hedström number */
    attribute def 'HedströmNumberValue' :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.18 Hedström number
         * symbol(s): `He`, `Hd`
         * application domain: generic
         * name: HedströmNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of yield stress and viscous stress of a viscous material at flow limit for visco-plastic material in a channel, expressed by `He = (τ_0*d^2*ρ)/η^2`, where `τ_0` is shear stress (ISO 80000-4) at flow limit, `d` is characteristic diameter (ISO 80000-3), e.g. effective channel width, `ρ` is mass density (ISO 80000-4), and `η` is dynamic viscosity (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute 'hedströmNumber': 'HedströmNumberValue' :> scalarQuantities;

    /* ISO-80000-11 item 11-4.19 Bodenstein number */
    attribute def BodensteinNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.19 Bodenstein number
         * symbol(s): `Bd`
         * application domain: generic
         * name: BodensteinNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: mathematical expression of the transfer of matter by convection in reactors with respect to diffusion, `Bd = (v*l)/D`, where `v` is speed (ISO 80000-3), `l` is length (ISO 80000-3) of the reactor, and `D` is diffusion coefficient (ISO 80000-9)
         * remarks: The Bodenstein number is also given by `Bd = Pe^"*" = Re*Sc`, where `Pe^"*"` is the Péclet number for mass transfer (item 11-6.2), `Re` is the Reynolds number (item 11-4.1), and `Sc = η/(ρ*D) = ν/D` is the Schmidt number (item 11-7.2).
         */
    }
    attribute bodensteinNumber: BodensteinNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.20 Rossby number, Kiebel number */
    attribute def RossbyNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.20 Rossby number, Kiebel number
         * symbol(s): `Ro`
         * application domain: generic
         * name: RossbyNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of inertial forces and Coriolis forces in the context of transfer of matter in geophysics, expressed by `Ro = v/(2*l*ω_E*sin(φ)`, where `v` is speed (ISO 80000-3) of motion, `l` is characteristic length (ISO 80000-3), the scale of the phenomenon, `ω_E` is angular velocity (ISO 80000-3) of the Earth's rotation, and `φ` is angle (ISO 80000-3) of latitude
         * remarks: The Rossby number represents the effect of Earth's rotation on flow in pipes, rivers, ocean currents, tornadoes, etc. The quantity `ω_E*sin(φ)` is called Coriolis frequency.
         */
    }
    attribute rossbyNumber: RossbyNumberValue :> scalarQuantities;

    alias kiebelNumber for rossbyNumber;

    /* ISO-80000-11 item 11-4.21 Ekman number */
    attribute def EkmanNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.21 Ekman number
         * symbol(s): `Ek`
         * application domain: generic
         * name: EkmanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of viscous forces and Coriolis forces in the context of transfer of matter for the flow of a rotating fluid, expressed by `Ek = ν/(2*l^2*ω_E*sin(φ))`, where `ν` is kinematic viscosity (ISO 80000-4), `l` is characteristic length (ISO 80000-3), the scale of the phenomenon, `ω_E` is angular frequency (ISO 80000-3) of the Earth’s rotation, and `φ` is angle of latitude
         * remarks: In plasma physics, the square root of this number is used. The Ekman number is also given by `Ek = (Ro)/(Re)`, where `Ro` is the Rossby number (item 11-4.20), and `Re` is the Reynolds number (item 11-4.1).
         */
    }
    attribute ekmanNumber: EkmanNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.22 elasticity number */
    attribute def ElasticityNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.22 elasticity number
         * symbol(s): `El`
         * application domain: generic
         * name: ElasticityNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between relaxation time and diffusion time in viscoelastic flows, expressed by `El = (t_r*ν)/r^2`, where `t_r` is relaxation time (ISO 80000-12), `ν` is kinematic viscosity (ISO 80000-4), and `r` is radius (ISO 80000-3) of pipe
         * remarks: See also Deborah number (item 11-7.8).
         */
    }
    attribute elasticityNumber: ElasticityNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.23 Darcy friction factor, Moody friction factor */
    attribute def DarcyFrictionFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.23 Darcy friction factor, Moody friction factor
         * symbol(s): `f_D`
         * application domain: generic
         * name: DarcyFrictionFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: representation of pressure loss in a pipe due to friction within a laminar or turbulent flow of a fluid in a pipe, expressed by `f_D = (2*Δp)/(ρ*v^2)*d/l`, where `Δp` is drop of pressure (ISO 80000-4) due to friction, `ρ` is mass density (ISO 80000-4) of the fluid, `v` is (average) speed (ISO 80000-3) of the fluid in the pipe, `d` is diameter (ISO 80000-3) of the pipe, and `l` is length (ISO 80000-3) of the pipe
         * remarks: None.
         */
    }
    attribute darcyFrictionFactor: DarcyFrictionFactorValue :> scalarQuantities;

    alias moodyFrictionFactor for darcyFrictionFactor;

    /* ISO-80000-11 item 11-4.24 Fanning number */
    attribute def FanningNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.24 Fanning number
         * symbol(s): `f_n`, `f`
         * application domain: generic
         * name: FanningNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between shear stress and dynamic pressure in the flow of a fluid in a containment, expressed by `f_n = (2*τ)/(ρ*v^2)`, where `τ` is shear stress (ISO 80000-4) at the wall, `ρ` is mass density (ISO 80000-4) of the fluid, and `v` is speed (ISO 80000-3) of the fluid in the pipe
         * remarks: The Fanning number describes the flow of fluids in a pipe with friction at the walls represented by its shear stress. Symbol `f` may be used where no conflicts are possible.
         */
    }
    attribute fanningNumber: FanningNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.25 Goertler number, Goertler parameter */
    attribute def GoertlerNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.25 Goertler number, Goertler parameter
         * symbol(s): `Go`
         * application domain: generic
         * name: GoertlerNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: characterization of the stability of laminar boundary layer flows in transfer of matter in a boundary layer on curved surfaces, expressed by `Go = (v*l_b)/ν * sqrt(l_b/r_c)`, where `v` is speed (ISO 80000-3), `l_b` is boundary layer thickness (ISO 80000-3), `ν` is kinematic viscosity (ISO 80000-4), and `r_c` is radius of curvature (ISO 80000-3)
         * remarks: The Goertler number represents the ratio of centrifugal effects to viscous effects.
         */
    }
    attribute goertlerNumber: GoertlerNumberValue :> scalarQuantities;

    alias goertlerParameter for goertlerNumber;

    /* ISO-80000-11 item 11-4.26 Hagen number */
    attribute def HagenNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.26 Hagen number
         * symbol(s): `Hg`, `Ha`
         * application domain: generic
         * name: HagenNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: generalization of the Grashof number for forced or free convection in laminar flow, expressed by `Hg = -1/ρ*(dp)/(dx)*l^3/ν^2`, where `ρ` is mass density (ISO 80000-4) of fluid, `(dp)/(dx)` is gradient of pressure (ISO 80000-4), `l` is characteristic length (ISO 80000-3), and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: For free thermal convection with `(dp)/(dx) = ρ*g*α_V*ΔT`, the Hagen number then coincides with the Grashof number (item 11-4.4). See also the Poiseuille number (item 11-4.28).
         */
    }
    attribute hagenNumber: HagenNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.27 Laval number */
    attribute def LavalNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.27 Laval number
         * symbol(s): `La`
         * application domain: generic
         * name: LavalNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of speed and the (critical) sound speed at the throat of a nozzle, expressed by `La = v/sqrt((R_s*T*2*γ)/(γ+1))`, where `v` is speed (ISO 80000-3),  `R_s = R/M` is specific gas constant, where `R` is molar gas constant (ISO 80000-9), and `M` is molar mass (ISO 80000-9), `T` is thermodynamic temperature (ISO 80000-5), and `γ` is ratio of the specific heat capacities (ISO 80000-5)
         * remarks: The Laval number is a specific kind of Mach number (item 11-4.6).
         */
    }
    attribute lavalNumber: LavalNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.28 Poiseuille number */
    attribute def PoiseuilleNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.28 Poiseuille number
         * symbol(s): `Poi`
         * application domain: generic
         * name: PoiseuilleNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of propulsive force by pressure and viscous force for a flow of fluids in a pipe, expressed by `Poi = -(Δp)/l*d^2/(η*v)`, where `Δp` is drop of pressure (ISO 80000-4) along the pipe, `l` is length (ISO 80000-3) of the pipe, `d` is diameter (ISO 80000-3) of the pipe, `η` is dynamic viscosity (ISO 80000-4) of the fluid, and `v` is characteristic speed (ISO 80000-3) of the fluid
         * remarks: The Poiseuille number is `Poi=32` for laminar flow in a round pipe. See also the Hagen number (item 11-4.26).
         */
    }
    attribute poiseuilleNumber: PoiseuilleNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.29 power number */
    attribute def PowerNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.29 power number
         * symbol(s): `Pn`
         * application domain: generic
         * name: PowerNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of power consumption by agitators due to drag and rotational inertial power in fluids, expressed by `Pn = P/(ρ*n^3*d^5)`, where `P` is active power (IEC 80000-6) consumed by a stirrer, `ρ` is mass density (ISO 80000-4) of fluid, `n` is rotational frequency (ISO 80000-3), and `d` is diameter (ISO 80000-3) of stirrer
         * remarks: None.
         */
    }
    attribute powerNumber: PowerNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.30 Richardson number */
    attribute def RichardsonNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.30 Richardson number
         * symbol(s): `Ri`
         * application domain: generic
         * name: RichardsonNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of potential energy and kinetic energy for a falling body, expressed by `Ri = (g*h)/v^2`, where `g` is acceleration of free fall (ISO 80000-3), `h` is characteristic height (ISO 80000-3), and `v` is characteristic speed (ISO 80000-3)
         * remarks: In geophysics differences of these quantities are of interest.
         */
    }
    attribute richardsonNumber: RichardsonNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.31 Reech number */
    attribute def ReechNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.31 Reech number
         * symbol(s): `Ree`
         * application domain: generic
         * name: ReechNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between the speed of an object submerged in water relative to the water, and wave propagation speed, expressed by `Ree = (g*l)/v`, where `g` is acceleration of free fall (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `v` is speed (ISO 80000-3) of the object relative to the water
         * remarks: The Reech number can be used to determine the resistance of a partially submerged object (e.g. a ship) of length `l` (in direction of the motion) moving through water. A similar quantity is defined as the Boussinesq number `Bs = v/sqrt(2*g*l)` .
         */
    }
    attribute reechNumber: ReechNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.32 Stokes number */
    attribute def StokesNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.32 Stokes number
         * symbol(s): `Stk`
         * application domain: time-related
         * name: StokesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of friction and inertia forces for particles in a fluid or in a plasma, expressed by `Stk = t_r/t_a`, where `t_r` is relaxation time (ISO 80000-12) of particles to achieve fluid’s velocity due to friction (viscosity), and `t_a` is time (ISO 80000-3) of fluid to alter its velocity under external influence
         * remarks: In most cases `t_r = l/v`, where `l` is characteristic length, and `v` is speed of fluid. The characteristic length can be the diameter of an obstacle or hole.
         */
    }
    attribute stokesNumber: StokesNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.33 Stokes number */
    attribute def StokesNumberForVibratingParticlesValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.33 Stokes number
         * symbol(s): `Stk_1`
         * application domain: vibrating particles
         * name: StokesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of friction and inertia forces for the special case of particles vibrating in a fluid or plasma, expressed by `Stk_1 = ν/(d^2*f)`, where `ν` is kinematic viscosity (ISO 80000-4) of the fluid or plasma, `d` is diameter (ISO 80000-3) of particle, and `f` is frequency (ISO 80000-3) of particle vibrations
         * remarks: Sometimes the inverse of this number is wrongly used.
         */
    }
    attribute stokesNumberForVibratingParticles: StokesNumberForVibratingParticlesValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.34 Stokes number, power coefficient */
    attribute def StokesNumberForRotameterValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.34 Stokes number, power coefficient
         * symbol(s): `Stk_2`
         * application domain: rotameter
         * name: StokesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: Stokes number for calibration of rotameters metering vertical flows of fluids by means of a floating body, expressed by `Stk_2 = (r^3*g*m*ρ)/(η^2) * (ρ_b-ρ)/(ρ_b) = (r^3*g*m)/ν^2 * (1/ρ-1/ρ_b)`, where `r` is ratio of pipe and float radii, `g` is acceleration of free fall (ISO 80000-3), `m` is mass (ISO 80000-4) of the body, `ρ` is mass density (ISO 80000-4) of the fluid, `η` is dynamic viscosity (ISO 80000-4) of the fluid, `ρ_b` is mass density (ISO 80000-4) of the body, and `ν` is kinematic viscosity (ISO 80000-4) of the fluid
         * remarks: In general use, this value is multiplied by 1,042. See also the Archimedes number (item 11-6.12).
         */
    }
    attribute stokesNumberForRotameter: StokesNumberForRotameterValue :> scalarQuantities;

    alias powerCoefficient for stokesNumber;

    /* ISO-80000-11 item 11-4.35 Stokes number */
    attribute def StokesNumberForGravityValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.35 Stokes number
         * symbol(s): `Stk_3`
         * application domain: gravity
         * name: StokesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between viscous forces and gravity forces for particles falling in a fluid, expressed by `Stk_3 = (v*ν)/(g*l^2)`, where `v` is characteristic speed (ISO 80000-3) of particles, `ν` is kinematic viscosity (ISO 80000-4) of the fluid, `g` is acceleration of free fall (ISO 80000-3), and `l` is length (ISO 80000-3) of fall
         * remarks: None.
         */
    }
    attribute stokesNumberForGravity: StokesNumberForGravityValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.36 Stokes number */
    attribute def StokesNumberForDragValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.36 Stokes number
         * symbol(s): `Stk_4`
         * application domain: drag
         * name: StokesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of drag force and internal friction forces for particles dragged in a fluid `Stk_4 = F_D/(η*v*l)`, where `F_D` is drag force (ISO 80000-4), `η` is dynamic viscosity (ISO 80000-4), `v` is speed (ISO 80000-3), and `l` is characteristic length (ISO 80000-3)
         * remarks: None.
         */
    }
    attribute stokesNumberForDrag: StokesNumberForDragValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.37 Laplace number, Suratman number */
    attribute def LaplaceNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.37 Laplace number, Suratman number
         * symbol(s): `La`, `Su`
         * application domain: generic
         * name: LaplaceNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between capillary forces and viscous forces when characterizing free surface flow, expressed by `La = Su = (γ*ρ*l)/η^2`, where `γ` is surface tension (ISO 80000-4), `ρ` is mass density (ISO 80000-4) of the fluid, `l` is characteristic length (ISO 80000-3), and `η` is dynamic viscosity (ISO 80000-4) of the fluid
         * remarks: The Laplace number is also the ratio of surface tension to momentum transfer, especially dissipation, inside a fluid. The Laplace number is also given by `La = Su = 1/(Oh)^2 = (Re)^2/(We)`, where `Oh` is the Ohnesorge number (item 11-7.4), `Re` is the Reynolds number (item 11-4.1), and `We` is the Weber number (item 11-4.5).
         */
    }
    attribute laplaceNumber: LaplaceNumberValue :> scalarQuantities;

    alias suratmanNumber for laplaceNumber;

    /* ISO-80000-11 item 11-4.38 Blake number */
    attribute def BlakeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.38 Blake number
         * symbol(s): `Bl`
         * application domain: generic
         * name: BlakeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertial forces and viscous forces in a porous material, expressed by `Bl = (v*ρ*l)/(η*(1-ε))`, where `v` is speed (ISO 80000-3) of the fluid, `ρ` is mass density (ISO 80000-4) of the fluid, `l` is characteristic length (ISO 80000-3) defined as the volume of a particle divided by its surface area, `η` is dynamic viscosity (ISO 80000-4) of the fluid, and `ε` is porosity of the material (=void fraction)
         * remarks: The Blake number can be interpreted as a Reynolds number for flow in porous material.
         */
    }
    attribute blakeNumber: BlakeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.39 Sommerfeld number */
    attribute def SommerfeldNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.39 Sommerfeld number
         * symbol(s): `So`, `Sm`
         * application domain: generic
         * name: SommerfeldNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between viscous force and load force in a lubrication boundary, expressed by `So = (η*n)/p*(r/c)^2`, where `η` is dynamic viscosity (ISO 80000-4) of the lubricant, `n` is rotational frequency (ISO 80000-3), `p` is mean bearing pressure (ISO 80000-4), `r` is radius (ISO 80000-3) of the shaft, and `c` is radial distance (ISO 80000-3) between rotating shaft and annulus
         * remarks: Sometimes the inverse of this number is wrongly used.
         */
    }
    attribute sommerfeldNumber: SommerfeldNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.40 Taylor number */
    attribute def TaylorNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.40 Taylor number
         * symbol(s): `Ta`
         * application domain: momentum transfer
         * name: TaylorNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between centrifugal force and viscous force of a rotating shaft, expressed by `Ta = (4*ω^2*l^4)/ν^2`, where `ω` is angular velocity (ISO 80000-3) of rotation, `l` is length (ISO 80000-3) perpendicular to the rotation axis, and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: Sometimes the square root of this quantity is wrongly used. The Taylor number for a rotating shaft relative to an annulus is given by `Ta_a = (ω/nu)^2*r*a^3`, where `ω` is angular velocity (ISO 80000-3) of the shaft, `nu` is kinematic viscosity (ISO 80000-4), `r = (r_2+r_1)/2` is mean radius (ISO 80000-3) of the annulus, and `a = (r_2 - r_1)` is width of the annulus, where `r_1` is inner radius of the annulus, and `r_2` is outer radius of the annulus. Sometimes the square root of this quantity is used; this use is deprecated.
         */
    }
    attribute taylorNumber: TaylorNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.41 Galilei number */
    attribute def GalileiNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.41 Galilei number
         * symbol(s): `Ga`
         * application domain: generic
         * name: GalileiNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between gravitational force and viscous force in fluid films flowing over walls, expressed by `Ga = (g*l^3)/ν^2`, where `g` is acceleration of free fall (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `ν` is kinematic viscosity (ISO 80000-4) of the fluid
         * remarks: The Galilei number is also given by `Ga = Re^2*Ri` or `Ga = {:Re:}^2/{:Fr:}^2`, where `Re` is the Reynolds number (item 11-4.1), `Ri` is the Richardson number (item 11-4.30), and `Fr` is the Froude number (item 11-4.3).
         */
    }
    attribute galileiNumber: GalileiNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-4.42 Womersley number */
    attribute def WomersleyNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-4.42 Womersley number
         * symbol(s): `Wo`, `α`
         * application domain: generic
         * name: WomersleyNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertial forces and viscous forces in oscillating flows of fluids in pipes, expressed by `Wo = R*sqrt(ω/ν)`, where `R` is (effective) radius (ISO 80000-3) of the pipe, `ω` is angular frequency (ISO 80000-3) of oscillations, and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: The Womersley number is used for pulsating flows e.g. in blood flow.
         */
    }
    attribute womersleyNumber: WomersleyNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.1 Fourier number */
    attribute def FourierNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.1 Fourier number
         * symbol(s): `Fo`
         * application domain: heat transfer
         * name: FourierNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat conduction rate and the rate of thermal energy storage in a body for conductive heat transfer into a body, expressed by `Fo = (a*t)/l^2`, where `a` is thermal diffusivity (ISO 80000-5), `t` is time (ISO 80000-3), and `l` is characteristic length (ISO 80000-3)
         * remarks: The characteristic length `l` of the body is often defined as the quotient of the body’s volume and its heated surface. Sometimes the reciprocal of this number is wrongly used.
         */
    }
    attribute fourierNumber: FourierNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.2 Péclet number */
    attribute def 'PécletNumberValue' :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.2 Péclet number
         * symbol(s): `Pe`
         * application domain: heat transfer
         * name: PécletNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between convective heat transfer rate and conductive heat transfer rate, expressed by `Pe = (v*l)/a`, where `v` is speed (ISO 80000-3), `l` is length (ISO 80000-3) in the direction of heat transfer, and `a` is thermal diffusivity (ISO 80000-5)
         * remarks: The thermal Péclet number is also given by `Pe = Re*Pr`, where `Re` is the Reynolds number (item 11-4.1), and `Pr` is the Prandtl number (item 11-7.1). Compare with item 11-6.2, Péclet number for mass transfer.
         */
    }
    attribute 'pécletNumber': 'PécletNumberValue' :> scalarQuantities;

    /* ISO-80000-11 item 11-5.3 Rayleigh number */
    attribute def RayleighNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.3 Rayleigh number
         * symbol(s): `Ra`
         * application domain: generic
         * name: RayleighNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between buoyancy forces due to thermal expansion and viscous forces in free convection in buoyancy driven flow near a heated surface perpendicular to the gravity force, expressed by `Ra = (l^3*g*α_V*ΔT)/(ν*a)`, where `l` is distance (ISO 80000-3) from the wall, `g` is acceleration of free fall (ISO 80000-3), `α_V` is cubic expansion coefficient (ISO 80000-5) of the fluid, `ΔT` is difference of thermodynamic temperature (ISO 80000-5) between surface of the wall and the fluid far away from the wall, `ν` is kinematic viscosity (ISO 80000-4) of the fluid, and `a` is thermal diffusivity (ISO 80000-5) of the fluid
         * remarks: The Rayleigh number is also given by `Ra = Gr*Pr`, where `Gr` is the Grashof number (item 11-4.4), and `Pr` is the Prandtl number (item 11-7.1).
         */
    }
    attribute rayleighNumber: RayleighNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.4 Froude number */
    attribute def FroudeNumberForHeatTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.4 Froude number
         * symbol(s): `Fr^"*"`
         * application domain: heat transfer
         * name: FroudeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of gravitational forces and thermodiffusion forces for heat transfer in forced convection of fluids, expressed by `Fr^"*" = (g*l^3)/a^2`, where `g` is acceleration of free fall (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `a` is thermal diffusivity (ISO 80000-5)"
         * remarks: None.
         */
    }
    attribute froudeNumberForHeatTransfer: FroudeNumberForHeatTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.5 Nusselt number */
    attribute def NusseltNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.5 Nusselt number
         * symbol(s): `Nu`
         * application domain: heat transfer
         * name: NusseltNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between the internal thermal resistance of a body and its surface thermal resistance in a body transferring heat from a surface into its interior or vice versa, expressed by `Nu = (K*l)/λ = (K*l)/(a*ρ*c_p)`, where `K` is coefficient of heat transfer (ISO 80000-5) through the surface, `l` is length (ISO 80000-3) of the body in direction of heat flow, `λ` is thermal conductivity (ISO 80000-5) of the surface, `a` is thermal diffusivity (ISO 80000-5), `ρ` is mass density (ISO 80000-4), and `c_p` is specific heat capacity at constant pressure (ISO 80000-5)
         * remarks: The body under consideration can be a solid body, a fluid, or their combination, and additional heat transfer due to convective motion can occur. In case of merely conductive heat transfer especially in a solid body, the "Biot number for heat transfer" (item 11-5.6) is used.
         */
    }
    attribute nusseltNumber: NusseltNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.6 Biot number */
    attribute def BiotNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.6 Biot number
         * symbol(s): `Bi`
         * application domain: heat transfer
         * name: BiotNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: special case of the Nusselt number for heat transfer (item 11-5.5) in case of conductive heat transfer in a solid body, expressed by `Bi = (K*l)/λ`, where `K` is coefficient of heat transfer (ISO 80000-5) through the surface, `l` is characteristic length (ISO 80000-3), and `λ` is thermal conductivity (ISO 80000-5) of the body
         * remarks: The characteristic length is commonly defined as the volume of the body divided by its surface area.
         */
    }
    attribute biotNumber: BiotNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.7 Stanton number */
    attribute def StantonNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.7 Stanton number
         * symbol(s): `St`
         * application domain: heat transfer
         * name: StantonNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat transfer into a fluid from a surface and its heat transfer by convection, expressed by `St = K/(ρ*v*c_p)`, where `K` is coefficient of heat transfer (ISO 80000-5) through the surface, `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), and `c_p` is specific heat capacity at constant pressure (ISO 80000-5) of the fluid
         * remarks: The Stanton number is also given by `St = (Nu)/(Re*Pr) = (Nu)/(Pe)`, where `Nu` is Nusselt number for heat transfer (item 11-5.5), `Re` is the Reynolds number (item 11-4.1), `Pr` is the Prandtl number (item 11-7.1), and Pe  is the Péclet number (item 11-5.2). Sometimes this quantity is called Margoulis number, symbol `Ms` or `Mg`.
         */
    }
    attribute stantonNumber: StantonNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.8 j-factor, heat transfer factor, Colburn number */
    attribute def JFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.8 j-factor, heat transfer factor, Colburn number
         * symbol(s): `j`, `Co`, `Jq`
         * application domain: heat transfer
         * name: JFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat transfer and mass transfer in a fluid, expressed by `j = K/(c_p*ρ*v)*((c_p*η)/λ)^(2/3)`, where `K` is coefficient of heat transfer (ISO 80000-5), `c_p` is specific heat capacity at constant pressure (ISO 80000-5), `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), `η` is dynamic viscosity (ISO 80000-4), and `λ` is thermal conductivity (ISO 80000-5)
         * remarks: The heat transfer factor is also given by `j = St*Pr^(2/3)`, where `St` is the Stanton number for heat transfer (item 11-5.7), and `Pr` is the Prandtl number (item 11-7.1). See also mass transfer factor (item 11-6.7).
         */
    }
    attribute jFactor: JFactorValue :> scalarQuantities;

    alias heatTransferFactor for jFactor;

    alias colburnNumber for jFactor;

    /* ISO-80000-11 item 11-5.9 Bejan number */
    attribute def BejanNumberForHeatTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.9 Bejan number
         * symbol(s): `Be_1`
         * application domain: heat transfer
         * name: BejanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mechanical work and frictional and thermal diffusion energy losses for a forced flow, expressed by `Be_1 = (Δp*l^2)/(η*a)`, where `Δp` is drop of pressure (ISO 80000-4) along a pipe, `l` is length (ISO 80000-3) of the pipe, `η` is dynamic viscosity (ISO 80000-4), and `a` is thermal diffusivity (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute bejanNumberForHeatTransfer: BejanNumberForHeatTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.10 Bejan number */
    attribute def BejanNumberForEntropyValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.10 Bejan number
         * symbol(s): `Be_S`
         * application domain: entropy
         * name: BejanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: efficiency of heat transfer by a fluid, expressed by `Be_S = (S(ΔT))/(S(ΔT)+S(Δp))`, where `S(ΔT)` is entropy generation contributed by heat transfer, and `S(Δp)` is entropy generation contributed by fluid friction
         * remarks: None.
         */
    }
    attribute bejanNumberForEntropy: BejanNumberForEntropyValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.11 Stefan number */
    attribute def StefanNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.11 Stefan number
         * symbol(s): `Ste`, `Stf`
         * application domain: phase transition
         * name: StefanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat content and latent heat content in a binary mixture undergoing a phase transition, expressed by `Ste = (c_p*ΔT)/Q`, where `c_p` is specific heat capacity at constant pressure (ISO 80000-5), `ΔT` is difference of thermodynamic temperature T (ISO 80000-5) between the phases, and `Q` is quotient of latent heat of phase transition (ISO 80000-5) and mass (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute stefanNumber: StefanNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.12 Brinkman number */
    attribute def BrinkmanNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.12 Brinkman number
         * symbol(s): `Br`, `N_(Br)`
         * application domain: generic
         * name: BrinkmanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat produced by viscosity and heat conducted from a wall adjacent to a fluid moving relative to it, expressed by `Br = (η*v^2)/(λ*ΔT)`, where `η` is dynamic viscosity (ISO 80000-4), `v` is characteristic speed (ISO 80000-3), `λ` is thermal conductivity (ISO 80000-5), and `ΔT = T_W - T_0` is difference of thermodynamic temperature `T` (ISO 80000-5), where `T_0` is bulk fluid temperature, and `T_W` is wall temperature
         * remarks: None.
         */
    }
    attribute brinkmanNumber: BrinkmanNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.13 Clausius number */
    attribute def ClausiusNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.13 Clausius number
         * symbol(s): `Cl`
         * application domain: generic
         * name: ClausiusNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between energy transfer associated with fluid momentum and energy transfer by thermal conduction in forced heating, expressed by `Cl = (v^3*l*ρ)/(λ*ΔT)`, where `v` is speed (ISO 80000-3), `l` is length (ISO 80000-3) of the path of energy transfer, `ρ` is mass density (ISO 80000-4), `λ` is thermal conductivity (ISO 80000-5), and `ΔT` is difference of thermodynamic temperature `T` (ISO 80000-5) along length `l`
         * remarks: None.
         */
    }
    attribute clausiusNumber: ClausiusNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.14 Carnot number */
    attribute def CarnotNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.14 Carnot number
         * symbol(s): `Ca`
         * application domain: generic
         * name: CarnotNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: theoretical maximum efficiency (ISO 80000-5) of a Carnot cycle operating between temperature reservoirs `Ca = (T_2 - T_1)/T_2`, where `T` is thermodynamic temperature (ISO 80000-5), and `T_2`, `T_1` are the thermodynamic temperatures of a heat source and a heat sink, respectively
         * remarks: None.
         */
    }
    attribute carnotNumber: CarnotNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.15 Eckert number, Dulong number */
    attribute def EckertNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.15 Eckert number, Dulong number
         * symbol(s): `Ec`
         * application domain: generic
         * name: EckertNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between the kinetic energy of a flow and its enthalpy change in fluid dynamics exhibiting dissipation, expressed by `Ec = v^2/(c_p*ΔT)`, where `v` is characteristic speed (ISO 80000-3), `c_p` is specific heat capacity at constant pressure (ISO 80000-5) of the flow, and `ΔT` is difference of thermodynamic temperature `T` (ISO 80000-5) due to dissipation (by friction)
         * remarks: None.
         */
    }
    attribute eckertNumber: EckertNumberValue :> scalarQuantities;

    alias dulongNumber for eckertNumber;

    /* ISO-80000-11 item 11-5.16 Graetz number */
    attribute def GraetzNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.16 Graetz number
         * symbol(s): `Gz`
         * application domain: heat transfer
         * name: GraetzNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat transferred by convection and heat transferred by conduction in a laminar flow in a pipe, expressed by `Gz = (v*d^2)/(a*l)`, where `v` is speed (ISO 80000-3) of the fluid, `d` is diameter (ISO 80000-3) of the pipe, `a` is thermal diffusivity (ISO 80000-5) of the fluid, and `l` is length (ISO 80000-3) of the pipe
         * remarks: None.
         */
    }
    attribute graetzNumber: GraetzNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.17 heat transfer number */
    attribute def HeatTransferNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.17 heat transfer number
         * symbol(s): `K_Q`
         * application domain: generic
         * name: HeatTransferNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat transferred by a flow and its kinetic energy, expressed by `K_Q = Φ/(v^3*l^2*ρ)`, where `Φ` is heat flow rate (ISO 80000-5), `v` is characteristic speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `ρ` is mass density (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute heatTransferNumber: HeatTransferNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.18 Pomerantsev number */
    attribute def PomerantsevNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.18 Pomerantsev number
         * symbol(s): `Po`, `Pov`
         * application domain: heat transfer
         * name: PomerantsevNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between heat generated in a body and conducted heat in the body, expressed by `Po = (Q_m*l^2)/(λ*ΔT)`, where `Q_m` is (constant) volumic heat generation rate, `l` is characteristic length (ISO 80000-3), `λ` is thermal conductivity (ISO 80000-5), and `ΔT = T_m - T_0` is difference of thermodynamic temperature (ISO 80000-5) between that of the medium (T_m) and the initial temperature of the body (T_0)
         * remarks: Similar numbers are known for areic, lineic and point sources of heat, each with decreasing power of length `l` respectively.
         */
    }
    attribute pomerantsevNumber: PomerantsevNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.19 Boltzmann number */
    attribute def BoltzmannNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.19 Boltzmann number
         * symbol(s): `Bz`, `Bol`, `Bo`
         * application domain: generic
         * name: BoltzmannNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between convective heat and radiant heat for a fluid in a channel, expressed by `Bz = (ρ*v*c_p)/(ε*σ*T^3)`, where `ρ` is mass density (ISO 80000-4) of the fluid, `v` is characteristic speed (ISO 80000-3) of the fluid, `c_p` is specific heat capacity at constant pressure (ISO 80000-5), `ε` is emissivity (ISO 80000-7), `σ` is the Stefan-Boltzmann constant (ISO 80000-7), and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute boltzmannNumber: BoltzmannNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-5.20 Stark number */
    attribute def StarkNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-5.20 Stark number
         * symbol(s): `Sk`
         * application domain: generic
         * name: StarkNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between radiant heat and conductive heat multiplied by the relative temperature difference for a body, expressed by `Sk = (ε*σ*T^3*l)/λ`, where `ε` is emissivity (ISO 80000-7) of the surface, `σ` is the Stefan-Boltzmann constant (ISO 80000-7), `T` is thermodynamic temperature (ISO 80000-5), `l` is characteristic length (ISO 80000-3), and `λ` is thermal conductivity (ISO 80000-5)
         * remarks: The relative temperature difference is defined by `(ΔT)/T`, where `ΔT = T_s - T_l` is the difference of the temperature at the surface, `T_s`, and the temperature at a layer at a distance `l` from the surface, `T_l`. Sometimes this characteristic number is wrongly defined without the factor `ε`. Deprecated names are: Stefan number and Biot radiation number.
         */
    }
    attribute starkNumber: StarkNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.1 Fourier number */
    attribute def FourierNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.1 Fourier number
         * symbol(s): `Fo^"*"`
         * application domain: mass transfer
         * name: FourierNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between diffusive mass transfer within a given duration and mass storage rate in transient mass transfer, expressed by `Fo^"*" = (D*t)/l^2`, where `D` is diffusion coefficient (ISO 80000-9), `t` is duration (ISO 80000-3) of observation, and `l` is length (ISO 80000-3) of transfer"
         * remarks: The Fourier number for mass transfer is also given by `Fo^*" = (Fo)/(Le)`, where `Fo` is the Fourier number for heat transfer (item 11-5.1), and `Le` is the Lewis number (item 11-7.3). See also the Fourier number for heat transfer (item 11-5.1)."
         */
    }
    attribute fourierNumberForMassTransfer: FourierNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.2 Péclet number */
    attribute def 'PécletNumberForMassTransferValue' :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.2 Péclet number
         * symbol(s): `Pe^"*"`, `Bd`, `Bod`
         * application domain: mass transfer
         * name: PécletNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between advective mass transfer rate and longitudinal diffusive mass transfer rate for mass transfer in reactors, expressed by `Pe^*" = (v*l)/D`, where `v` is speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `D` is diffusion coefficient (ISO 80000-9)"
         * remarks: The Péclet number for mass transfer is also given by `Pe^"*" = Pe*Le = Re*Sc`, where `Pe` is the Péclet number for heat transfer, `Le` is the Lewis number (item 11-7.3), `Re` is the Reynolds number (item 11-4.1), and `Sc` is the Schmidt number (item 11-7.2). Compare with item 11-5.2, the Péclet number for heat transfer.
         */
    }
    attribute 'pécletNumberForMassTransfer': 'PécletNumberForMassTransferValue' :> scalarQuantities;

    /* ISO-80000-11 item 11-6.3 Grashof number */
    attribute def GrashofNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.3 Grashof number
         * symbol(s): `Gr^"*"`
         * application domain: mass transfer
         * name: GrashofNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between buoyancy forces and viscous forces in natural convection of fluids, expressed by `Gr^"*" = (l^3*g*β*Δx)/ν^2`, where `l` is characteristic length (ISO 80000-3), `g` is acceleration of free fall (ISO 80000-3), `β = -1/ρ*((del ρ)/(del x))_(T,p)`, where `ρ` is mass density (ISO 80000-4) of the fluid, and `x` is amount-of-substance fraction (ISO 80000-9), `Δx` is difference of amount-of-substance fraction (ISO 80000-9) along length `l`, and `ν` is kinematic viscosity (ISO 80000-4)"
         * remarks: Instead of "amount-of-substance fraction" the "amount-of-substance concentration" (ISO 80000-9) is used also. Compare with item 11-4.4, the Grashof number.
         */
    }
    attribute grashofNumberForMassTransfer: GrashofNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.4 Nusselt number */
    attribute def NusseltNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.4 Nusselt number
         * symbol(s): `Nu^"*"`
         * application domain: mass transfer
         * name: NusseltNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between mass flux at an interface and specific flux by pure molecular diffusion in a layer of thickness `l` for mass transfer at the boundary of a fluid, expressed by `Nu^"*" = (k’*l)/(ρ*D)`, where `k’` is mass flux density `q_m/A` through the surface, where `q_m` is mass flow rate (ISO 80000-4), and `A` is area (ISO 80000-3), `l` is thickness (ISO 80000-3), `ρ` is mass density (ISO 80000-4) of the fluid, and `D` is diffusion coefficient (ISO 80000-9)"
         * remarks: Sometimes this quantity is called the Sherwood number, `Sh`. Compare with item 11-5.5, Nusselt number for heat transfer.
         */
    }
    attribute nusseltNumberForMassTransfer: NusseltNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.5 Stanton number */
    attribute def StantonNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.5 Stanton number
         * symbol(s): `St^"*"`
         * application domain: mass transfer
         * name: StantonNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between mass transfer perpendicular to the surface of a fluid flow and mass transfer parallel to the surface in a free surface flow, expressed by `St^"*" = k^"*"
         * remarks: The Stanton number for mass transfer is also given by `St^*" = (Nu^"*")/(Pe^"*"*)`, where `Nu^"*"` is the Nusselt number for mass transfer (item 11-6.4), and `Pe^"*"` is the Péclet number for mass transfer (item 11-6.2). Compare with item 11-5.7, the Stanton number for heat transfer."
         */
    }
    attribute stantonNumberForMassTransfer: StantonNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.6 Graetz number */
    attribute def GraetzNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.6 Graetz number
         * symbol(s): `Gz^"*"`
         * application domain: mass transfer
         * name: GraetzNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of advective mass transfer rate and radial diffusive mass transfer rate for mass transfer in pipes, expressed by `Gz^"*" = (v*d)/D = d/l*Pe^"*"`, where `v` is characteristic speed (ISO 80000-3) of the fluid, `d` is hydraulic diameter (ISO 80000-3) of the pipe, `D` is diffusion coefficient (ISO 80000-9), `l` is length (ISO 80000-3) of the pipe, and `Pe^"*"` is the Péclet number for mass transfer (item 11-6.2)"
         * remarks: None.
         */
    }
    attribute graetzNumberForMassTransfer: GraetzNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.7 mass transfer factor */
    attribute def MassTransferFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.7 mass transfer factor
         * symbol(s): `j^"*"`
         * application domain: mass transfer
         * name: MassTransferFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between mass transfer perpendicular to the surface of a fluid and mass transfer parallel to the surface in an open flow of fluids, expressed by `j^*" = k/v * (ν/D)^(2/3)`, where `k` is the mass transfer coefficient through the surface, `k = k^'/ρ`, where `ρ` is mass density (ISO 80000-4), `k^'` is mass flux density `q_m/A` through the surface, where `q_m` is mass flow rate (ISO 80000-4), and `A` is area (ISO 80000-3), `v` is speed (ISO 80000-3), `ν` is kinematic viscosity (ISO 80000-4), and `D` is diffusion coefficient (ISO 80000-9)"
         * remarks: The mass transfer factor is also given by `j_m = j^*" = St^"*" * (Sc)^(2/3)` where `St^"*"` is the Stanton number for mass transfer (item 11-6.5), and `Sc` is the Schmidt number (item 11-7.2). See also heat transfer factor (item 11-5.17)."
         */
    }
    attribute massTransferFactor: MassTransferFactorValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.8 Atwood number */
    attribute def AtwoodNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.8 Atwood number
         * symbol(s): `At`
         * application domain: generic
         * name: AtwoodNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: scaled density difference of heavier and lighter fluids, expressed by `At = (ρ_1 - ρ_2)/(ρ_1 + ρ_2)`, where `ρ_1` is density of heavier fluid, and `ρ_2` is density of lighter fluid
         * remarks: The Atwood number is used in the study of hydrodynamic instabilities in density stratified flows.
         */
    }
    attribute atwoodNumber: AtwoodNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.9 Biot number */
    attribute def BiotNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.9 Biot number
         * symbol(s): `Bi^"*"`
         * application domain: mass transfer
         * name: BiotNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between mass transfer rate at the interface and mass transfer rate in the interior of a body, expressed by `Bi^*" = (k*l)/D_"int"`, where `k` is the mass transfer coefficient through the surface, `k = k^'/ρ`, where `ρ` is mass density (ISO 80000-4), `k^'` is mass flux density `q_m/A` through the surface, where `q_m` is mass flow rate (ISO 80000-4), and `A` is area (ISO 80000-3), `l` is thickness (ISO 80000-3) of layer, and `D_"int"` is diffusion coefficient (ISO 80000-9) at the interface"
         * remarks: None.
         */
    }
    attribute biotNumberForMassTransfer: BiotNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.10 Morton number */
    attribute def MortonNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.10 Morton number
         * symbol(s): `Mo`
         * application domain: generic
         * name: MortonNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of gravitational forces and viscous forces for gas bubbles in a liquid, or liquid drops in a gas, expressed by `Mo = (g*η^4)/(ρ*γ^3)*(ρ_b/ρ - 1)`, where `g` is acceleration of free fall (ISO 80000-3), `η` is dynamic viscosity (ISO 80000-4) of the surrounding fluid, `ρ` is mass density (ISO 80000-4) of the surrounding fluid, `γ` is surface tension (ISO 80000-4) of the interface, and `ρ_b` is mass density (ISO 80000-4) of the bubble or drop
         * remarks: The Morton number is used to determine the shape of bubbles or drops. The Morton number is also given by `Mo = We^3*Fr^-2*Re^-4`, where `We` is the Weber number (item 11-4.5), `Fr` is the Froude number (item 11-4.3), and `Re` is the Reynolds number (item 11-4.1). 
         */
    }
    attribute mortonNumber: MortonNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.11 Bond number, Eötvös number */
    attribute def BondNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.11 Bond number, Eötvös number
         * symbol(s): `Bo`, `Eo`
         * application domain: generic
         * name: BondNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of inertial force and capillary force for gas bubbles or liquid drops in a fluid, expressed by `Bo = a/γ * ρ*l^2*(ρ_b/ρ - 1)`, where `a` is the acceleration of the body (ISO 80000-3), mostly acceleration of free fall, `g` (ISO 80000-3), `γ` is surface tension (ISO 80000-4) of the interface, `ρ` is density (ISO 80000-4) of the medium, `l` is characteristic length (ISO 80000-3) (radius of a drop or radius of a capillary tube), and `ρ_b` is mass density (ISO 80000-4) of the drop or bubble
         * remarks: In the case of gravity `a = g` acceleration of free fall (ISO 80000-3), the name Eötvös number is mostly used. The Bond number is also given by `Bo = (We)/(Fr)`, where `We` is the Weber number (item 11-4.5), and `Fr` is the Froude number (item11-4.3). The Bond number is also used for capillary action driven by buoyancy.
         */
    }
    attribute bondNumber: BondNumberValue :> scalarQuantities;

    alias 'eötvösNumber' for bondNumber;

    /* ISO-80000-11 item 11-6.12 Archimedes number */
    attribute def ArchimedesNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.12 Archimedes number
         * symbol(s): `Ar`
         * application domain: generic
         * name: ArchimedesNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of buoyancy forces and viscous forces in fluids motion due to density differences for a body in a fluid, expressed by `Ar = (g*l^3)/v^2*(ρ_b/ρ - 1)`, where `g` is acceleration of free fall (ISO 80000-3), `l` is characteristic length (ISO 80000-3) of the body, `ν` is kinematic viscosity (ISO 80000-4) of the fluid, `ρ_b` is mass density (ISO 80000-4) of the body, and `ρ` is mass density (ISO 80000-4) of the fluid
         * remarks: In this definition, the body can be replaced by an immiscible fluid. See also Stokes number <rotameter> (item 11-4.34).
         */
    }
    attribute archimedesNumber: ArchimedesNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.13 expansion number */
    attribute def ExpansionNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.13 expansion number
         * symbol(s): `Ex`
         * application domain: generic
         * name: ExpansionNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of buoyancy force and inertial force in moving fluids due to density differences for gas bubbles rising in a liquid, expressed by `Ex = (g*d)/v^2*(1-ρ_b/ρ)`, where `g` is acceleration of free fall (ISO 80000-3), `d` is diameter (ISO 80000-3) of bubbles, `v` is speed (ISO 80000-3) of bubbles, `ρ_b` is mass density (ISO 80000-4) of bubbles, and `ρ` is mass density (ISO 80000-4) of the liquid
         * remarks: None.
         */
    }
    attribute expansionNumber: ExpansionNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.14 Marangoni number */
    attribute def MarangoniNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.14 Marangoni number
         * symbol(s): `Mg`, `Mar`
         * application domain: generic
         * name: MarangoniNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of heat transferred by Marangoni convection and heat transferred by thermal diffusivity in thermo-capillary convection of liquid films on a free surface, expressed by `Mg = l*ΔT/(η*a)*((dγ)/(dT))`, where `l` is characteristic thickness (ISO 80000-3) of the film, `ΔT` is difference of thermodynamic temperature `T` (ISO 80000-5) between surface and outer surface of the film, `η` is dynamic viscosity (ISO 80000-4) of the liquid, `a` is thermal diffusivity (ISO 80000-5) of the liquid, and `γ` is surface tension (ISO 80000-4) of the film
         * remarks: The Marangoni convection is free surface flow due to different surface tensions caused by a temperature gradient. This quantity is sometimes called Thompson number.
         */
    }
    attribute marangoniNumber: MarangoniNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.15 Lockhart-Martinelli parameter */
    attribute def LockhartMartinelliParameterValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.15 Lockhart-Martinelli parameter
         * symbol(s): `Lp`
         * application domain: generic
         * name: LockhartMartinelliParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mass flow rates multiplied by the square root of density in a two-phase flow, expressed by `Lp = dot(m)_l/dot(m)_g*sqrt(ρ_m/ρ_l)`, where `dot(m)_l = q_m` is liquid phase mass flow rate (ISO 80000-4), `dot(m)_g` is gas phase mass flow rate, `ρ_g` is gas density (ISO 80000-4), and `ρ_l` is liquid density
         * remarks: The Lockhart-Martinelli parameter is used, for example, in boiling or condensing.
         */
    }
    attribute lockhartMartinelliParameter: LockhartMartinelliParameterValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.16 Bejan number */
    attribute def BejanNumberForMassTransferValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.16 Bejan number
         * symbol(s): `Be^"*"`, `Be_2`
         * application domain: mass transfer
         * name: BejanNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mechanical work and frictional and diffusion energy loss in viscous flow of fluids in pipes, expressed by `Be^*" = (Δp*l^2)/(η*D)`, where `Δp` is drop of pressure (ISO 80000-4) along a pipe or channel, `l` is length (ISO 80000-3) of channel, `η` is dynamic viscosity (ISO 80000-4) of the fluid, and `D` is diffusion coefficient (ISO 80000-9), mass diffusivity"
         * remarks: A similar quantity exists for heat transfer (item 11-5.9).
         */
    }
    attribute bejanNumberForMassTransfer: BejanNumberForMassTransferValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.17 cavitation number */
    attribute def CavitationNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.17 cavitation number
         * symbol(s): `Ca`, `Cn`
         * application domain: generic
         * name: CavitationNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the excess of local static head over vapour pressure head and velocity head for fast flow in liquids, expressed by `Ca = (p-p_v)/(1/2*ρ*v^2)`, where `p` is local static pressure (ISO 80000-4), `p_v` is vapour pressure (ISO 80000-4) of the fluid, `ρ` is mass density (ISO 80000-4) of the fluid, and `v` is characteristic speed (ISO 80000-3) of the flow
         * remarks: The cavitation number represents the ratio of the excess of local static head over vapour pressure head to velocity head.
         */
    }
    attribute cavitationNumber: CavitationNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.18 absorption number */
    attribute def AbsorptionNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.18 absorption number
         * symbol(s): `Ab`
         * application domain: generic
         * name: AbsorptionNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between mass flow rate and surface area for gas absorption at wetted walls, expressed by `Ab = k*sqrt((l*d)/(D*q_V))`, where `k` is the mass transfer coefficient through the surface, `k = k^'/ρ`, where `ρ` is mass density (ISO 80000-4), and `k^'` is mass flux density through the surface, `k^' = q_m/A`, where `q_m` is mass flow rate (ISO 80000-4), and `A` is area (ISO 80000-3), `l` is length (ISO 80000-3) of wetted surface, `d` is thickness (ISO 80000-3) of liquid film, `D` is diffusion coefficient (ISO 80000-9), and `q_V` is volume flow rate (ISO 80000-4) per wetted perimeter
         * remarks: None.
         */
    }
    attribute absorptionNumber: AbsorptionNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.19 capillary number */
    attribute def CapillaryNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.19 capillary number
         * symbol(s): `Ca`
         * application domain: generic
         * name: CapillaryNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of gravitational forces and capillary forces for fluids in narrow pipes, expressed by `Ca = (d^2*ρ*g)/γ`, where `d` is diameter (ISO 80000-3) of the pipe, `ρ` is mass density (ISO 80000-4) of the fluid, `g` is acceleration of free fall (ISO 80000-3), and `γ` is surface tension (ISO 80000-4) of the fluid
         * remarks: None.
         */
    }
    attribute capillaryNumber: CapillaryNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-6.20 dynamic capillary number */
    attribute def DynamicCapillaryNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-6.20 dynamic capillary number
         * symbol(s): `Ca^"*"`, `Cn`
         * application domain: generic
         * name: DynamicCapillaryNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of viscous force and capillary force acting across an interface between a liquid and a gas, or between two immiscible liquids for a flow of fluid influenced by interfacial tension, expressed by `Ca^*" = (η*v)/γ`, where `η` is dynamic viscosity (ISO 80000-4) of the fluid, `v` is characteristic speed (ISO 80000-3), and `γ` is surface or interfacial tension (ISO 80000-4)"
         * remarks: The dynamic capillary number is also given by the quotient of the Weber number and the Reynolds number.
         */
    }
    attribute dynamicCapillaryNumber: DynamicCapillaryNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.1 Prandtl number */
    attribute def PrandtlNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.1 Prandtl number
         * symbol(s): `Pr`
         * application domain: generic
         * name: PrandtlNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of kinematic viscosity and thermal diffusivity for a fluid, expressed by `Pr = ν/a`, where `ν` is kinematic viscosity (ISO 80000-4), and `a` is thermal diffusivity (ISO 80000-5)
         * remarks: The Prandtl number also represents the quotient of heat produced by viscosity and heat transferred by thermal diffusivity. The mass transfer analogue of the Prandtl number is the Schmidt number (item 11-7.2). The Prandtl number is also given by `Pr = (Pe)/(Re)`; where `Pe` is the Péclet number (item 11-5.2), and `Re` is the Reynolds number (item 11-4.1). 
         */
    }
    attribute prandtlNumber: PrandtlNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.2 Schmidt number */
    attribute def SchmidtNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.2 Schmidt number
         * symbol(s): `Sc`
         * application domain: generic
         * name: SchmidtNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of kinematic viscosity and diffusion coefficient for a fluid, expressed by `Sc = ν/D`, where `ν` is kinematic viscosity (ISO 80000-4), and `D` is diffusion coefficient (ISO 80000-9)
         * remarks: The heat transfer analogue of the Schmidt number is the Prandtl number (item 11-7.1). A deprecated name is Colburn number.
         */
    }
    attribute schmidtNumber: SchmidtNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.3 Lewis number */
    attribute def LewisNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.3 Lewis number
         * symbol(s): `Le`
         * application domain: generic
         * name: LewisNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of thermal diffusivity and diffusion coefficient for heat transfer in a fluid, expressed by `Le = a/D`, where `a` is thermal diffusivity (ISO 80000-5), and `D` is diffusion coefficient (ISO 80000-9)
         * remarks: The Lewis number is also given by `Le = (Sc)/(Pr)`, where `Sc` is the Schmidt number (item 11-7.2), and `Pr` is the Prandtl number (item 11-7.1). Compare with item 11-5.2. The Lewis number is sometimes defined as reciprocal of this quantity. 
         */
    }
    attribute lewisNumber: LewisNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.4 Ohnesorge number */
    attribute def OhnesorgeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.4 Ohnesorge number
         * symbol(s): `Oh`
         * application domain: generic
         * name: OhnesorgeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between viscous force and the square root of the product of inertia force and capillary force for atomization of liquids, expressed by `Oh = η/sqrt(γ*ρ*l)`, where `η` is dynamic viscosity (ISO 80000-4), `γ` is surface tension (ISO 80000-4), `ρ` is mass density (ISO 80000-4), and `l` is characteristic length (ISO 80000-3)
         * remarks: The Ohnesorge number is also given by `Oh = sqrt(We)/(Re)` where `We` is the Weber number (item 11-4.5), and `Re` is the Reynolds number (item 11-4.1). See also Laplace number (item 11-4.37). The characteristic length typically is the drop diameter.
         */
    }
    attribute ohnesorgeNumber: OhnesorgeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.5 Cauchy number, aeroelasticity parameter */
    attribute def CauchyNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.5 Cauchy number, aeroelasticity parameter
         * symbol(s): `Cy`
         * application domain: generic
         * name: CauchyNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertia forces and compression forces in compressible fluids, expressed by `Cy = `, where `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), and `K` is modulus of compression, bulk modulus (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute cauchyNumber: CauchyNumberValue :> scalarQuantities;

    alias aeroelasticityParameter for cauchyNumber;

    /* ISO-80000-11 item 11-7.6 Hooke number */
    attribute def HookeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.6 Hooke number
         * symbol(s): `Ho_2`
         * application domain: generic
         * name: HookeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertia forces and linear stress forces in elastic fluids, expressed by `Ho_2 = (ρ*v^2)/E`, where `ρ` is mass density (ISO 80000-4), `v` is speed (ISO 80000-3), and `E` is modulus of elasticity (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute hookeNumber: HookeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.7 Weissenberg number */
    attribute def WeissenbergNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.7 Weissenberg number
         * symbol(s): `Wi`
         * application domain: generic
         * name: WeissenbergNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: product of time derivative of shear rate and relaxation time in viscoelastic flows, expressed by `Wi = dot(γ)*t_r`, where `dot(γ)` is time derivative of shear strain (ISO 80000-4), and `t_r` is relaxation time (ISO 80000-12)
         * remarks: The Weissenberg number represents the relative importance of viscous forces when compared to elastic forces. The time derivative of shear strain is sometimes called the shear rate.
         */
    }
    attribute weissenbergNumber: WeissenbergNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.8 Deborah number */
    attribute def DeborahNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.8 Deborah number
         * symbol(s): `De`
         * application domain: generic
         * name: DeborahNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of relaxation time of viscoelastic fluids and observation duration in rheology of viscoelastic fluids, expressed by `De = t_c/t_p`, where `t_c` is stress relaxation time, and `t_p` is observation duration (ISO 80000-3)
         * remarks: The stress relaxation time is sometimes called the Maxwell relaxation time.
         */
    }
    attribute deborahNumber: DeborahNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.9 Lorentz number */
    attribute def LorentzNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.9 Lorentz number
         * symbol(s): `Lo`
         * application domain: generic
         * name: LorentzNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of electrical conductivity and thermal conductivity, expressed by `Lo = (σ*(ΔU)^2)/(λ*ΔT)`, where `σ` is electrical conductivity (IEC 80000-6), `ΔU` is difference of voltage `U` (ISO 80000-6) between two reference points, `λ` is thermal conductivity (ISO 80000-5), and `ΔT` is difference in thermodynamic temperature `T` (ISO 80000-5) between the reference points
         * remarks: None.
         */
    }
    attribute lorentzNumber: LorentzNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-7.10 compressibility number */
    attribute def CompressibilityNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-7.10 compressibility number
         * symbol(s): `Z`
         * application domain: generic
         * name: CompressibilityNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of isothermal compressibility (ISO 80000-5) of a gas and that of an ideal gas, expressed by `Z = p/(ρ*R_s*T)`, where `p` is pressure (ISO 80000-4), `ρ` is mass density (ISO 80000-4), `R_s` is specific gas constant (ISO 80000-5), and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute compressibilityNumber: CompressibilityNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.1 Reynolds magnetic number */
    attribute def ReynoldsMagneticNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.1 Reynolds magnetic number
         * symbol(s): `Rm`
         * application domain: generic
         * name: ReynoldsMagneticNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertial force and magneto-dynamic viscous force in an electrically conducting fluid, expressed by `Rm = v*l*μ*σ = (v*l)/ν_m`, where `v` is speed (ISO 80000-3) of the fluid, `l` is characteristic length (ISO 80000-3), `μ` is magnetic permeability (IEC 80000-6), `σ` is electrical conductivity (IEC 80000-6), and `ν_m = 1/(μ*σ)` is magnetic viscosity (magnetic diffusivity)
         * remarks: This number is also called magnetic Reynolds number. The Reynolds magnetic number is also given by `Rm = Re*Pr_m`, where `Re` is the Reynolds number (item 11-4.1), and `Pr_m` is the Prandtl magnetic number (item 11-8.10).
         */
    }
    attribute reynoldsMagneticNumber: ReynoldsMagneticNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.2 Batchelor number */
    attribute def BatchelorNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.2 Batchelor number
         * symbol(s): `Bt`
         * application domain: generic
         * name: BatchelorNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between inertia and magneto-dynamic diffusion in an electrically conducting liquid, expressed by `Bt = (v*l*σ*μ)/(ε_r*μ_r)`, where `v` is speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), `μ` is magnetic permeability (IEC 80000-6), `ε_r` is relative permittivity (IEC 80000-6), and `μ_r` is relative permeability (IEC 80000-6)
         * remarks: None.
         */
    }
    attribute batchelorNumber: BatchelorNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.3 Nusselt electric number */
    attribute def NusseltElectricNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.3 Nusselt electric number
         * symbol(s): `Ne`
         * application domain: generic
         * name: NusseltElectricNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between convective current and diffusive current of ions in electrochemistry, expressed by `Ne = (v*l)/D^*"`, where `v` is speed (ISO 80000-3), `l` is characteristic length (ISO 80000-3), and `D^"*" = D^"+" + D^"-"`, where `D^"+"`, `D^"-"` are diffusion coefficients (ISO 80000-9) of positive or negative ions respectively"
         * remarks: This number is also called electric Nusselt number. Sometimes this quantity is called the Reynolds electric number.
         */
    }
    attribute nusseltElectricNumber: NusseltElectricNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.4 Alfvén number, Mach magnetic number, Kárman number */
    attribute def 'AlfvénNumberValue' :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.4 Alfvén number, Mach magnetic number, Kárman number
         * symbol(s): `Al`
         * application domain: generic
         * name: AlfvénNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between speed of a plasma and the Alfvén wave speed, expressed by `Al = v/(B/sqrt(ρ*μ))`, where `v` is speed (ISO 80000-3), `B` is magnetic flux density (IEC 80000-6), `ρ` is mass density (ISO 80000-4), and `μ` is magnetic permeability (IEC 80000-6)
         * remarks: Often, the inverse of this number is wrongly used. The name "Alfvén Mach number" is used in investigations on the solar wind. The quantity `v_A = B/sqrt(ρ*μ)` is called Alfvén wave speed, where `B` is magnetic flux density (IEC 80000-6), `ρ` is mass density (ISO 80000-4), and `μ` is magnetic permeability (IEC 80000-6).
         */
    }
    attribute 'alfvénNumber': 'AlfvénNumberValue' :> scalarQuantities;

    alias machMagneticNumber for 'alfvénNumber';

    alias 'kármanNumber' for 'alfvénNumber';

    /* ISO-80000-11 item 11-8.5 Hartmann number */
    attribute def HartmannNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.5 Hartmann number
         * symbol(s): `Ha`
         * application domain: generic
         * name: HartmannNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between magnetically induced stress and hydrodynamic shear stress in an electrically conducting fluid, expressed by `Ha = B*l*sqrt(σ/η)`, where `B` is magnetic flux density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), and `η` is dynamic viscosity (ISO 80000-4)
         * remarks: The Hartmann number represents also the ratio of magnetic force to viscous force.
         */
    }
    attribute hartmannNumber: HartmannNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.6 Cowling number, Euler magnetic number */
    attribute def CowlingNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.6 Cowling number, Euler magnetic number
         * symbol(s): `Co`
         * application domain: magnetism
         * name: CowlingNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of magnetic and kinematic energy density in a plasma, expressed by `Co = B^2/(μ*ρ*v^2)`, where `B` is magnetic flux density (IEC 80000-6), `μ` is magnetic permeability (IEC 80000-6), `ρ` is mass density (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: The Cowling number also represents the ratio of magnetic to dynamic pressure. This quantity is equal to the square of the inverse of the Alfvén number. This quantity is often called the second Cowling number, `Co_2`. The first Cowling number is then defined as `Co_1 = Co*Rm`, where `Rm` is the Reynolds magnetic number (item 11-8.1).
         */
    }
    attribute cowlingNumber: CowlingNumberValue :> scalarQuantities;

    alias eulerMagneticNumber for cowlingNumber;

    /* ISO-80000-11 item 11-8.7 Stuart electrical number */
    attribute def StuartElectricalNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.7 Stuart electrical number
         * symbol(s): `Se`
         * application domain: generic
         * name: StuartElectricalNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of electric energy density and kinematic energy density in a plasma, expressed by `Se = (ε*E^2)/(ρ*v^2)`, where `ε` is electric permittivity (IEC 80000-6), E is electric field strength (IEC 80000-6), ρ is mass density (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: The Stuart electrical number is the electrical counterpart of the Cowling number (item 11-8.6).
         */
    }
    attribute stuartElectricalNumber: StuartElectricalNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.8 magnetic pressure number */
    attribute def MagneticPressureNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.8 magnetic pressure number
         * symbol(s): `N_(mp)`
         * application domain: generic
         * name: MagneticPressureNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of gas pressure and magnetic pressure in a gas or plasma, expressed by `N_(mp) = p*(2*μ)/B^2`, where `p` is pressure (ISO 80000-4), `μ` is magnetic permeability (IEC 80000-6), and `B` is magnetic flux density (IEC 80000-6)
         * remarks: The quantity `p_m = B^2/(2*μ)` is called magnetic pressure, where `B` is magnetic flux density (IEC 80000-6), and `μ` is magnetic permeability (IEC 80000-6).
         */
    }
    attribute magneticPressureNumber: MagneticPressureNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.9 Chandrasekhar number */
    attribute def ChandrasekharNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.9 Chandrasekhar number
         * symbol(s): `Q`, `Ch`
         * application domain: generic
         * name: ChandrasekharNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of Lorentz force and viscous force in magnetic convection in a fluid, expressed by `Q = ((B*l)^2*σ)/(ρ*ν)`, where `B` is magnetic flux density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), a length scale of the system, `σ` is electrical conductivity (IEC 80000-6), `ρ` is mass density (ISO 80000-4), and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: The Chandrasekhar number is also given by `Q = Ha^2` where `Ha` is the Hartmann number (item 11-8.5).
         */
    }
    attribute chandrasekharNumber: ChandrasekharNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.10 Prandtl magnetic number */
    attribute def PrandtlMagneticNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.10 Prandtl magnetic number
         * symbol(s): `Pr_m`
         * application domain: generic
         * name: PrandtlMagneticNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of kinematic viscosity and magnetic viscosity in an electrically conducting liquid, expressed by `Pr_m = ν*σ*μ`, where `ν` is kinematic viscosity (ISO 80000-4), `σ` is electrical conductivity (IEC 80000-6), and `μ` is magnetic permeability (IEC 80000-6)
         * remarks: The quantity `ν_m = 1/(μ*σ)` is called magnetic viscosity or magnetic diffusivity. See item 11-8.11. The Prandtl magnetic number is also given by `Pr_m = (Rm)/(Re)`, where `Rm` is the Reynolds magnetic number (item 11-8.1), and `Re` is the Reynolds number (item 11-4.1). This number is also called magnetic Prandtl number.
         */
    }
    attribute prandtlMagneticNumber: PrandtlMagneticNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.11 Roberts number */
    attribute def RobertsNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.11 Roberts number
         * symbol(s): `Ro`
         * application domain: generic
         * name: RobertsNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of thermal diffusivity and magnetic viscosity in an electrically conducting liquid, expressed by `Ro = a*σ*μ`, where `a` is thermal diffusivity (ISO 80000-5), `σ` is electrical conductivity (IEC 80000-6), and `μ` is magnetic permeability (IEC 80000-6)
         * remarks: The quantity `ν_m = 1/(μ*σ)` is called magnetic viscosity or magnetic diffusivity; where `μ` is magnetic permeability (IEC 80000-6), and `σ` is electrical conductivity (IEC 80000-6).
         */
    }
    attribute robertsNumber: RobertsNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.12 Stuart number */
    attribute def StuartNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.12 Stuart number
         * symbol(s): `Stw`
         * application domain: generic
         * name: StuartNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of magnetic forces and inertia forces in an electrically conducting liquid, expressed by `Stw = (B^2*l*σ)/(v*ρ)`, where `B` is magnetic flux density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), `v` is characteristic speed (ISO 80000-3), and `ρ` is mass density (ISO 80000-4)
         * remarks: The Stuart number sometimes is called magnetic force parameter. Sometimes the square root is wrongly used. The Stuart number is also given by `Stw = (Ha^2)/(Re)`, where `Ha` is the Hartmann number, and `Re` is the Reynolds number. 
         */
    }
    attribute stuartNumber: StuartNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.13 magnetic number */
    attribute def MagneticNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.13 magnetic number
         * symbol(s): `N_(mg)`
         * application domain: generic
         * name: MagneticNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of magnetic forces and viscous forces in an electrically conducting fluid, expressed by `N_(mg) = B*sqrt((l*σ)/(η*v))`, where `B` is magnetic flux density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), `η` is dynamic viscosity (ISO 80000-4), and `v` is speed (ISO 80000-3)
         * remarks: None.
         */
    }
    attribute magneticNumber: MagneticNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.14 electric field parameter */
    attribute def ElectricFieldParameterValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.14 electric field parameter
         * symbol(s): `Ef`
         * application domain: generic
         * name: ElectricFieldParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of Coulomb force and Lorentz force on moving electrically charged material or particles, expressed by `Ef = E/(v*B)`, where `E` is electric field strength (IEC 80000-6), `v` is speed (ISO 80000-3), and `B` is magnetic flux density (IEC 80000-6)
         * remarks: None.
         */
    }
    attribute electricFieldParameter: ElectricFieldParameterValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.15 Hall number */
    attribute def HallNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.15 Hall number
         * symbol(s): `Hc`, `CH`
         * application domain: generic
         * name: HallNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of gyro frequency and collision frequency in a plasma, expressed by `H_c = (ω_c*λ)/(2*π*v)`, where `ω_c` is cyclotron angular frequency (ISO 80000-10), `λ` is mean free path (ISO 80000-9), and `v` is average speed (ISO 80000-3)
         * remarks: Sometimes the inverse of this number is wrongly used. `2*π` times this quantity is called the Hall parameter.
         */
    }
    attribute hallNumber: HallNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.16 Lundquist number */
    attribute def LundquistNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.16 Lundquist number
         * symbol(s): `Lu`
         * application domain: generic
         * name: LundquistNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of Alfvén speed and magneto-dynamic speed in a plasma, expressed by `Lu = B*l*σ*sqrt(μ/ρ)`, where `B` is magnetic flux density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), `μ` is magnetic permeability (IEC 80000-6), and `ρ` is mass density (ISO 80000-4)
         * remarks: The quantity `v_A = B/sqrt(ρ*μ)` is called Alfvén wave speed. See item 11-8.4. The quantity `v_m = 1/(l*σ*μ)` is called magneto dynamic speed, where `l` is characteristic length (ISO 80000-3), `σ` is electrical conductivity (IEC 80000-6), and `μ` is magnetic permeability (IEC 80000-6). The Lundquist number is also given by `Lu = (Rm)/(Al)`, where `Rm` is the Reynolds magnetic number (item 11-8.1), and `Al` is the Alfvén number (item 11-8.4). See also Hartmann number (item 11-8.5).
         */
    }
    attribute lundquistNumber: LundquistNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.17 Joule magnetic number */
    attribute def JouleMagneticNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.17 Joule magnetic number
         * symbol(s): `Jo_m`
         * application domain: generic
         * name: JouleMagneticNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of Joule heating energy and magnetic field energy in a plasma, expressed by `Jo_m = (2*ρ*μ*c_p*ΔT)/B^2`, where `ρ` is mass density (ISO 80000-4), `μ` is magnetic permeability (IEC 80000-6), `c_p` is specific heat capacity at constant pressure (ISO 80000-5), `T` is thermodynamic temperature (ISO 80000-5), and `B` is magnetic flux density (IEC 80000-6)
         * remarks: This number is also called magnetic Joule number.
         */
    }
    attribute jouleMagneticNumber: JouleMagneticNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.18 Grashof magnetic number */
    attribute def GrashofMagneticNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.18 Grashof magnetic number
         * symbol(s): `Gr_m`
         * application domain: generic
         * name: GrashofMagneticNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: mathematical expression for the heat transfer by free thermo-magnetic convection of a paramagnetic fluid under gravity, `Gr_m = (4*π*σ_e*μ_e*g*α_V*ΔT*l^3)/ν`, where `σ_e` is electrical conductivity (IEC 80000-6), `μ_e` is magnetic permeability (IEC 80000-6), `g` is acceleration of free fall (ISO 80000-3), `α_V` is cubic expansion coefficient (ISO 80000-5), `ΔT = T_S - T_∞` is difference of thermodynamic temperature `T` (ISO 80000-5), where `T_S` is surface temperature and `T_∞` is bulk temperature, `l` is characteristic length (ISO 80000-3), and `ν` is kinematic viscosity (ISO 80000-4)
         * remarks: This number is also called magnetic Grashof number. See also Grashof number (item 11-4.4).
         */
    }
    attribute grashofMagneticNumber: GrashofMagneticNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.19 Naze number */
    attribute def NazeNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.19 Naze number
         * symbol(s): `Na`
         * application domain: generic
         * name: NazeNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of velocity of Alfvén waves and velocity of sound in a plasma, expressed by `Na = B/(c*sqrt(ρ*μ))`, where `B` is magnetic flux density (IEC 80000-6), `c` is speed of sound (ISO 80000-8), `ρ` is mass density (ISO 80000-4), and `μ` is magnetic permeability (IEC 80000-6)
         * remarks: The quantity `v_A = B/sqrt(ρ*μ)` is called Alfvén wave speed. See item 11-8.4.
         */
    }
    attribute nazeNumber: NazeNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.20 Reynolds electric number */
    attribute def ReynoldsElectricNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.20 Reynolds electric number
         * symbol(s): `Re_e`
         * application domain: generic
         * name: ReynoldsElectricNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of speed of a fluid and average drift speed of the charged particles in an electrically conducting fluid, expressed by `Re_e = (v*ε_e)/(ρ_e*l*μ)`, where `v` is characteristic speed (ISO 80000-3) of the fluid, `ε_e` is electric permittivity (IEC 80000-6), `ρ_e` is electric charge density (IEC 80000-6), `l` is characteristic length (ISO 80000-3), and `μ` is mobility (ISO 80000-10) of charge carriers
         * remarks: This number is also called electrical Reynolds number. The drift speed of the charged particles in an electric field is given by `v_d = 1/(μ*E)`, where `E` is electric field strength (IEC 80000-6), and `μ` is mobility (ISO 80000-10) of charge carriers.
         */
    }
    attribute reynoldsElectricNumber: ReynoldsElectricNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-8.21 Ampère number */
    attribute def 'AmpèreNumberValue' :> DimensionOneValue {
        doc
        /*
         * source: item 11-8.21 Ampère number
         * symbol(s): `Am`
         * application domain: generic
         * name: AmpèreNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: relation between electric surface current and magnetic field strength in an electrically conducting liquid, expressed by `Am = I_A/(l*H)`, where `I_A` is electric surface current, `l` is characteristic length (ISO 80000-3), and `H` is magnetic field strength (IEC 80000-6)
         * remarks: This number is also called magnetic field number. The electric surface current is given by `I_A = ρ_A*l*µ*E`, where `ρ_A` is surface density of electric charge (IEC 80000-6), `l` is characteristic length (ISO 80000-3), `µ` is mobility (ISO 80000-10) of charge carriers, and `E` is electric field strength (IEC 80000-6).
         */
    }
    attribute 'ampèreNumber': 'AmpèreNumberValue' :> scalarQuantities;

    /* ISO-80000-11 item 11-9.1 Arrhenius number */
    attribute def ArrheniusNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-9.1 Arrhenius number
         * symbol(s): `α`
         * application domain: generic
         * name: ArrheniusNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of chemical activation energy and thermal energy; in a chemical reaction it is the exponential factor of the reaction rate constant, `k`, expressed by `k ~ exp(α)`, with `α = E_0/(R*T)`, where `E_0` is activation energy (ISO 80000-5), `R` is molar gas constant (ISO 80000-9), and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute arrheniusNumber: ArrheniusNumberValue :> scalarQuantities;

    /* ISO-80000-11 item 11-9.2 Landau-Ginzburg number */
    attribute def LandauGinzburgNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 11-9.2 Landau-Ginzburg number
         * symbol(s): `κ`
         * application domain: generic
         * name: LandauGinzburgNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of penetration depth of a magnetic field into a superconductor and the coherence length of thermodynamic fluctuations within a superconducting phase in a material at zero thermodynamic temperature, expressed by `κ = λ_L/(ξ*sqrt(2))`, where `λ_L` is London penetration depth (ISO 80000-12), and `ξ` is coherence length (ISO 80000-12)
         * remarks: None.
         */
    }
    attribute landauGinzburgNumber: LandauGinzburgNumberValue :> scalarQuantities;

}
