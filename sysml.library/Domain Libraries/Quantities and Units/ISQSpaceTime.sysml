/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard ISO-80000-3:2019 "Space and Time"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-3:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQSpaceTime {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    /**    
     * source: item 3-1.1 length
     * symbol(s): `l`, `L`
     * application domain: General
     * name: Length
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: linear extent in space between any two points
     * remarks: Length does not need to be measured along a straight line. Length is one of the seven base quantities in the International System of Units (ISO 80000-1).
     */
    attribute def LengthUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: LengthUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def LengthValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LengthUnit :>> QuantityValue::mRef;
    }    
    attribute length: LengthValue :> quantity;

    /**
     * source: item 3-1.2 width, breadth
     * symbol(s): `b`, `B`
     * application domain: General
     * name: Width (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: minimum length of a straight line segment between two parallel straight lines (in two dimensions) or planes (in three dimensions) that enclose a given geometrical shape
     * remarks: This quantity is non-negative.
     */
    attribute width :> length;

    alias width as breadth;

    /**
     * source: item 3-1.3 height, depth, altitude
     * symbol(s): `h`, `H`
     * application domain: General
     * name: Height (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: minimum length of a straight line segment between a point and a reference line or reference surface
     * remarks: This quantity is usually signed. The sign expresses the position of the particular point with respect to the reference line or surface and is chosen by convention. The symbol `H` is often used to denote altitude, i.e. height above sea level.
     */
    attribute height :> length;

    alias height as depth;

    alias height as altitude;

    /**
     * source: item 3-1.4 thickness
     * symbol(s): `d`, `δ`
     * application domain: General
     * name: Thickness (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: width (item 3-1.2)
     * remarks: This quantity is non-negative.
     */
    attribute thickness :> length;

    /**
     * source: item 3-1.5 diameter
     * symbol(s): `d`, `D`
     * application domain: General
     * name: Diameter (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: width (item 3-1.2) of a circle, cylinder or sphere
     * remarks: This quantity is non-negative.
     */
    attribute diameter :> length;

    /**
     * source: item 3-1.6 radius
     * symbol(s): `r`, `R`
     * application domain: General
     * name: Radius (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: half of a diameter (item 3-1.5)
     * remarks: This quantity is non-negative.
     */
    attribute radius :> length;

    /**
     * source: item 3-1.7 path length, arc length
     * symbol(s): `s`
     * application domain: General
     * name: PathLength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: length of a rectifiable curve between two of its points
     * remarks: The differential path length at a given point of a curve is: `ds = sqrt(dx^2 + dy^2 + dz^2)` where `x`, `y`, and `z` denote the Cartesian coordinates (ISO 80000-2) of the particular point. There are curves which are not rectifiable, for example fractal curves.
     */
    attribute pathLength :> length;

    alias pathLength as arcLength;

    /**
     * source: item 3-1.8 distance
     * symbol(s): `d`, `r`
     * application domain: General
     * name: Distance (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: shortest path length (item 3-1.7) between two points in a metric space
     * remarks: A metric space might be curved. An example of a curved metric space is the surface of the Earth. In this case, distances are measured along great circles. A metric is not necessarily Euclidean.
     */
    attribute distance :> length;

    /**
     * source: item 3-1.9 radial distance
     * symbol(s): `r_Q`, `ρ`
     * application domain: General
     * name: RadialDistance (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: distance (item 3-1.8), where one point is located on an axis or within a closed non self-intersecting curve or surface
     * remarks: The subscript Q denotes the point from which the radial distance is measured. Examples of closed non self-intersecting curves are circles or ellipses. Examples of closed non self-intersecting surfaces are surfaces of spheres or egg-shaped objects.
     */
    attribute radialDistance :> length;

    /**
     * source: item 3-1.10 position vector
     * symbol(s): `vec(r)`
     * application domain: General
     * name: PositionVector (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: vector (ISO 80000-2) quantity from the origin of a coordinate system to a point in space
     * remarks: Position vectors are so-called bounded vectors, i.e. their magnitude (ISO 80000-2) and direction depend on the particular coordinate system used.
     */
    attribute positionVector :> length;

    /**
     * source: item 3-1.11 displacement
     * symbol(s): `vec(Δr)`
     * application domain: General
     * name: Displacement (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: vector (ISO 80000-2) quantity between any two points in space
     * remarks: Displacement vectors are so-called free vectors, i.e. their magnitude (ISO 80000-2) and direction do not depend on a particular coordinate system. The magnitude of this vector is also called displacement.
     */
    attribute displacement :> length;

    /**
     * source: item 3-1.12 radius of curvature
     * symbol(s): `ρ`
     * application domain: General
     * name: RadiusOfCurvature (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: radius (item 3-1.6) of the osculating circle of a planar curve at a particular point of the curve
     * remarks: The radius of curvature is only defined for curves which are at least twice continuously differentiable.
     */
    attribute radiusOfCurvature :> length;

    /**
     * source: item 3-2 curvature
     * symbol(s): `κ`
     * application domain: General
     * name: Curvature
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: inverse of the radius of curvature (item 3-1.12)
     * remarks: The curvature is given by: `κ = 1/ρ` where `ρ` denotes the radius of curvature (item 3-1.12).
     */
    attribute def CurvatureUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def CurvatureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CurvatureUnit :>> QuantityValue::mRef;
    }
    attribute curvature: CurvatureValue :> quantity;

    /**
     * source: item 3-3 area
     * symbol(s): `A`, `S`
     * application domain: General
     * name: Area
     * quantity dimension: L^2
     * measurement unit(s): m^2
     * definition: extent of a two-dimensional geometrical shape
     * remarks: The surface element at a given point of a surface is given by: `dA = g du dv` where `u` and `v` denote the Gaussian surface coordinates and `g` denotes the determinant of the metric tensor (ISO 80000-2) at the particular point. The symbol `dσ` is also used for the surface element.
     */
    attribute def AreaUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
    }
    attribute def AreaValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AreaUnit :>> QuantityValue::mRef;
    }
    attribute area: AreaValue :> quantity;

    /**
     * source: item 3-4 volume
     * symbol(s): `V`, `(S)`
     * application domain: General
     * name: Volume
     * quantity dimension: L^3
     * measurement unit(s): m^3
     * definition: extent of a three-dimensional geometrical shape
     * remarks: The volume element in Euclidean space is given by: `dV = dx dy dz` where `dx`, `dy`, and `dz` denote the differentials of the Cartesian coordinates (ISO 80000-2). The symbol `dτ` is also used for the volume element.
     */
    attribute def VolumeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
    }
    attribute def VolumeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VolumeUnit :>> QuantityValue::mRef;
    }
    attribute volume: VolumeValue :> quantity;

    /**
     * source: item 3-5 angular measure
     * symbol(s): `α`, `β`, `γ`
     * application domain: General
     * name: AngularMeasure
     * quantity dimension: 1
     * measurement unit(s): rad, 1
     * definition: measure of a geometric figure, called plane angle, formed by two rays, called the sides of the plane angle, emanating from a common point, called the vertex of the plane angle
     * remarks: The angular measure is given by: `α = s/r` where `s` denotes the arc length (item 3-1.7) of the included arc of a circle, centred at the vertex of the plane angle, and `r` the radius (item 3-1.6) of that circle. Other symbols are also used.
     */
    attribute def AngularMeasureUnit :> DimensionOneUnit {
    }
    attribute def AngularMeasureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularMeasureUnit :>> QuantityValue::mRef;
    }
    attribute angularMeasure: AngularMeasureValue :> quantity;

    /**
     * source: item 3-6 rotational displacement, angular displacement
     * symbol(s): `ϑ`, `φ`
     * application domain: General
     * name: RotationalDisplacement (specializes AngularMeasure)
     * quantity dimension: 1
     * measurement unit(s): rad, 1
     * definition: quotient of the traversed circular path length (item 3-1.7) of a point in space during a rotation and its distance (item 3-1.8) from the axis or centre of rotation
     * remarks: The rotational displacement is given by: `φ = s/r` where `s` denotes the traversed path length (item 3-1.7) along the periphery of a circle, centred at the vertex of the plane angle, and `r` the radius (item 3-1.6) of that circle. The rotational displacement is signed. The sign denotes the direction of rotation and is chosen by convention. Other symbols are also used.
     */
    attribute rotationalDisplacement :> angularMeasure;

    alias rotationalDisplacement as angularDisplacement;

    /**
     * source: item 3-7 phase angle
     * symbol(s): `φ`, `ϕ`
     * application domain: General
     * name: PhaseAngle (specializes AngularMeasure)
     * quantity dimension: 1
     * measurement unit(s): rad, 1
     * definition: angular measure (item 3-5) between the positive real axis and the radius of the polar representation of the complex number in the complex plane
     * remarks: The phase angle (often imprecisely referred to as the “phase”) is the argument of a complex number. Other symbols are also used.
     */
    attribute phaseAngle :> angularMeasure;

    /**
     * source: item 3-8 solid angular measure
     * symbol(s): `Ω`
     * application domain: General
     * name: SolidAngularMeasure
     * quantity dimension: 1
     * measurement unit(s): sr, 1
     * definition: measure of a conical geometric figure, called solid angle, formed by all rays, originating from a common point, called the vertex of the solid angle, and passing through the points of a closed, non-self-intersecting curve in space considered as the border of a surface
     * remarks: The differential solid angular measure expressed in spherical coordinates (ISO 80000-2) is given by: `dΩ = A/r^2 * sin(θ * dθ * dφ)` where `A` is area, `r` is radius, `θ` and `φ` are spherical coordinates.
     */
    attribute def SolidAngularMeasureUnit :> DimensionOneUnit {
    }
    attribute def SolidAngularMeasureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SolidAngularMeasureUnit :>> QuantityValue::mRef;
    }
    attribute solidAngularMeasure: SolidAngularMeasureValue :> quantity;

    /**    
     * source: item 3-9 time, duration
     * symbol(s): `t`
     * application domain: General
     * name: Time
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: measure of the time difference between two events
     * remarks: Duration is often just called time. Time is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). Duration is a measure of a time interval.
     */
    attribute def TimeUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: TimeUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def TimeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: TimeUnit :>> QuantityValue::mRef;
    }    
    attribute time: TimeValue :> quantity;

    alias TimeUnit as DurationUnit;
    alias TimeValue as DurationValue;
    alias time as duration;

    /**
     * source: item 3-10.1 velocity
     * symbol(s): `vec(v)`, `u,v,w`
     * application domain: General
     * name: Velocity
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m/s, m*s^-1
     * definition: vector (ISO 80000-2) quantity giving the rate of change of a position vector (item 3-1.10)
     * remarks: The velocity vector is given by: `vec(v) = (d vec(r)) / (dt)` where `vec(r)` denotes the position vector (item 3-1.10) and `t` the duration (item 3-9). When the general symbol `vec(v)` is not used for the velocity, the symbols `u`, `v`, `w` may be used for the components (ISO 80000-2) of the velocity.
     */
    attribute def VelocityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def VelocityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: VelocityUnit :>> QuantityValue::mRef;
    }
    attribute velocity: VelocityValue :> quantity;

    /**
     * source: item 3-10.2 speed
     * symbol(s): `v`
     * application domain: General
     * name: Speed
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m/s, m*s^-1
     * definition: magnitude (ISO 80000-2) of the velocity (item 3-10.1)
     * remarks: 
     */
    attribute def SpeedUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpeedValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpeedUnit :>> QuantityValue::mRef;
    }
    attribute speed: SpeedValue :> quantity;

    /**
     * source: item 3-11 acceleration
     * symbol(s): `vec(a)`
     * application domain: General
     * name: Acceleration
     * quantity dimension: L^1*T^-2
     * measurement unit(s): m*s^-2
     * definition: vector (ISO 80000-2) quantity giving the rate of change of velocity (item 3-10)
     * remarks: The acceleration vector is given by: `vec(a) = (d vec(v))/(dt)` where `vec(v)` denotes the velocity (item 3-10.1) and `t` the duration (item 3-9). The magnitude (ISO 80000-2) of the acceleration of free fall is usually denoted by `g`.
     */
    attribute def AccelerationUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def AccelerationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AccelerationUnit :>> QuantityValue::mRef;
    }
    attribute acceleration: AccelerationValue :> quantity;

    /**
     * source: item 3-12 angular velocity
     * symbol(s): `vec(ω)`
     * application domain: General
     * name: AngularVelocity
     * quantity dimension: T^-1
     * measurement unit(s): rad*s^-1, s^-1
     * definition: vector (ISO 80000-2) quantity giving the rate of change of the rotational displacement (item 3-6) as its magnitude (ISO 80000-2) and with a direction equal to the direction of the axis of rotation
     * remarks: The angular velocity vector is given by: `vec(ω) = (d φ) / (dt) vec(u)` where `φ` denotes the angular displacement (item 3-6), `t` the duration (item 3-9), and `vec(u)` the unit vector (ISO 80000-2) along the axis of rotation in the direction for which the rotation corresponds to a right-hand spiral.
     */
    attribute def AngularVelocityUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def AngularVelocityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularVelocityUnit :>> QuantityValue::mRef;
    }
    attribute angularVelocity: AngularVelocityValue :> quantity;

    /**
     * source: item 3-13 angular acceleration
     * symbol(s): `vec(α)`
     * application domain: General
     * name: AngularAcceleration
     * quantity dimension: T^-2
     * measurement unit(s): rad*s^-2, s^-2
     * definition: vector (ISO 80000-2) quantity giving the rate of change of angular velocity (item 3-12)
     * remarks: The angular acceleration vector is given by: `vec α = (d vec(ω))/(dt)` Where `vec(ω)` denotes the angular velocity (item 3-12) and `t` the duration (item 3-9).
     */
    attribute def AngularAccelerationUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def AngularAccelerationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularAccelerationUnit :>> QuantityValue::mRef;
    }
    attribute angularAcceleration: AngularAccelerationValue :> quantity;

    /**
     * source: item 3-14 period duration, period
     * symbol(s): `T`
     * application domain: General
     * name: PeriodDuration (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: duration (item 3-9) of one cycle of a periodic event
     * remarks: A periodic event is an event that occurs regularly with a fixed time interval.
     */
    attribute periodDuration :> time;

    alias periodDuration as period;

    /**
     * source: item 3-15 time constant
     * symbol(s): `τ`, `T`
     * application domain: General
     * name: TimeConstant (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: parameter characterizing the response to a step input of a first-order, linear time-invariant system
     * remarks: If a quantity is a function of the duration (item 3-9) expressed by: `F(t) prop e^(-t/τ)` where `t` denotes the duration (item 3-9), then `τ` denotes the time constant. Here the time constant `τ` applies to an exponentially decaying quantity.
     */
    attribute timeConstant :> time;

    /**
     * source: item 3-16 rotation
     * symbol(s): `N`
     * application domain: General
     * name: Rotation
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: number of revolutions
     * remarks: `N` is the number (not necessarily an integer) of revolutions, for example, of a rotating body about a given axis. Its value is given by: `N = φ/(2 π)` where `φ` denotes the measure of rotational displacement (item 3-6).
     */
    attribute def RotationUnit :> DimensionOneUnit {
    }
    attribute def RotationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RotationUnit :>> QuantityValue::mRef;
    }
    attribute rotation: RotationValue :> quantity;

    /**
     * source: item 3-17.1 frequency
     * symbol(s): `f`, `ν`
     * application domain: General
     * name: Frequency
     * quantity dimension: T^-1
     * measurement unit(s): Hz, s^-1
     * definition: inverse of period duration (item 3-14)
     * remarks: The frequency is given by: `f = 1/T` where `T` denotes the period duration (item 3-14).
     */
    attribute def FrequencyUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def FrequencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: FrequencyUnit :>> QuantityValue::mRef;
    }
    attribute frequency: FrequencyValue :> quantity;

    /**
     * source: item 3-17.2 rotational frequency
     * symbol(s): `n`
     * application domain: General
     * name: RotationalFrequency (specializes Frequency)
     * quantity dimension: T^-1
     * measurement unit(s): s^-1
     * definition: duration (item 3-9) of one cycle of a periodic event
     * remarks: The rotational frequency is given by: `n = (dN) / (dt)` where `N` denotes the rotation (item 3-16) and `t` is the duration (item 3-9).
     */
    attribute rotationalFrequency :> frequency;

    /**
     * source: item 3-18 angular frequency
     * symbol(s): `ω`
     * application domain: General
     * name: AngularFrequency
     * quantity dimension: T^-1
     * measurement unit(s): rad*s^-1, s^-1
     * definition: rate of change of the phase angle (item 3-7)
     * remarks: The angular frequency is given by: `ω = 2 π f` where `f` denotes the frequency (item 3-17.1).
     */
    attribute def AngularFrequencyUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def AngularFrequencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularFrequencyUnit :>> QuantityValue::mRef;
    }
    attribute angularFrequency: AngularFrequencyValue :> quantity;

    /**
     * source: item 3-19 wavelength
     * symbol(s): `λ`
     * application domain: General
     * name: Wavelength (specializes Length)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: length (item 3-1.1) of the repetition interval of a wave
     * remarks: 
     */
    attribute wavelength :> length;

    /**
     * source: item 3-20 repetency, wavenumber
     * symbol(s): `σ`, `ṽ`
     * application domain: General
     * name: Repetency
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: inverse of the wavelength (item 3-19)
     * remarks: The repetency is given by: `σ = 1 / λ` where `λ` denotes the wavelength (item 3-19).
     */
    attribute def RepetencyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def RepetencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RepetencyUnit :>> QuantityValue::mRef;
    }
    attribute repetency: RepetencyValue :> quantity;

    alias RepetencyUnit as WavenumberUnit;
    alias RepetencyValue as WavenumberValue;
    alias repetency as wavenumber;

    /**
     * source: item 3-21 wave vector
     * symbol(s): `k`
     * application domain: General
     * name: WaveVector
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: vector normal to the surfaces of constant phase angle (item 3-7) of a wave, with the magnitude (ISO 80000-2) of repetency (item 3-20)
     * remarks: 
     */
    attribute def WaveVectorUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def WaveVectorValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: WaveVectorUnit :>> QuantityValue::mRef;
    }
    attribute waveVector: WaveVectorValue :> quantity;

    /**
     * source: item 3-22 angular repetency, angular wavenumber
     * symbol(s): `k`
     * application domain: General
     * name: AngularRepetency
     * quantity dimension: L^-1
     * measurement unit(s): m^-1
     * definition: magnitude (ISO 80000-2) of the wave vector (item 3-21)
     * remarks: The angular repetency is given by: `κ = (2 π)/λ` where `λ` denotes the wavelength (item 3-19).
     */
    attribute def AngularRepetencyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def AngularRepetencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AngularRepetencyUnit :>> QuantityValue::mRef;
    }
    attribute angularRepetency: AngularRepetencyValue :> quantity;

    alias AngularRepetencyUnit as AngularWavenumberUnit;
    alias AngularRepetencyValue as AngularWavenumberValue;
    alias angularRepetency as angularWavenumber;

    /**
     * source: item 3-23.1 phase velocity, phase speed
     * symbol(s): `c`, `v`, `(ν)`, `c_φ`, `v_φ`, `(ν_φ)`
     * application domain: General
     * name: PhaseVelocity
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m*s^-1
     * definition: speed with which the phase angle (item 3-7) of a wave propagates in space
     * remarks: The phase velocity is given by: `c = ω/κ` where `ω` denotes the angular frequency (item 3-18) and `k` the angular repetency (item 3-22). If phase velocities of electromagnetic waves and other phase velocities are both involved, then `c` should be used for the former and `υ` for the latter. Phase velocity can also be written as `c = λ f`.
     */
    attribute def PhaseVelocityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def PhaseVelocityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PhaseVelocityUnit :>> QuantityValue::mRef;
    }
    attribute phaseVelocity: PhaseVelocityValue :> quantity;

    alias PhaseVelocityUnit as PhaseSpeedUnit;
    alias PhaseVelocityValue as PhaseSpeedValue;
    alias phaseVelocity as phaseSpeed;

    /**
     * source: item 3-23.2 group velocity, group speed
     * symbol(s): `c_g`, `v_g`, `(ν_g)`
     * application domain: General
     * name: GroupVelocity (specializes Speed)
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m*s^-1
     * definition: speed with which the envelope of a wave propagates in space
     * remarks: The group velocity is given by: `c_g = (d ω)/ (dk)` where `ω` denotes the angular frequency (item 3-18) and `k` the angular repetency (item 3-22).
     */
    attribute groupVelocity :> speed;

    alias groupVelocity as groupSpeed;

    /**
     * source: item 3-24 damping coefficient
     * symbol(s): `δ`
     * application domain: General
     * name: DampingCoefficient
     * quantity dimension: T^-1
     * measurement unit(s): s^-1
     * definition: inverse of the time constant (item 3-15) of an exponentially varying quantity
     * remarks: 
     */
    attribute def DampingCoefficientUnit :> SIDerivedUnit {
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def DampingCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DampingCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute dampingCoefficient: DampingCoefficientValue :> quantity;

    /**
     * source: item 3-25 logarithmic decrement
     * symbol(s): `Λ`
     * application domain: General
     * name: LogarithmicDecrement
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: product of damping coefficient (item 3-24) and period duration (item 3-14)
     * remarks: 
     */
    attribute def LogarithmicDecrementUnit :> DimensionOneUnit {
    }
    attribute def LogarithmicDecrementValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LogarithmicDecrementUnit :>> QuantityValue::mRef;
    }
    attribute logarithmicDecrement: LogarithmicDecrementValue :> quantity;

    /**
     * source: item 3-26.1 attenuation, extinction
     * symbol(s): `α`
     * application domain: General
     * name: Attenuation
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: gradual decrease in magnitude (ISO 80000-2) of any kind of flux through a medium
     * remarks: If a quantity is a function of distance (item 3-1.8) expressed by: `f(x) prop e^(-α x)` where `x` denotes distance (item 3-1.8), then `α` denotes attenuation. The inverse of attenuation is called attenuation length.
     */
    attribute def AttenuationUnit :> DimensionOneUnit {
    }
    attribute def AttenuationValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AttenuationUnit :>> QuantityValue::mRef;
    }
    attribute attenuation: AttenuationValue :> quantity;

    alias AttenuationUnit as ExtinctionUnit;
    alias AttenuationValue as ExtinctionValue;
    alias attenuation as extinction;

    /**
     * source: item 3-26.2 phase coefficient
     * symbol(s): `β`
     * application domain: General
     * name: PhaseCoefficient
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: change of phase angle (item 3-7) with the length (item 3-1.1) along the path travelled by a plane wave
     * remarks: If a quantity is a function of distance expressed by: `f(x) prop cos(β(x-x_0))` where `x` denotes distance (item 3-1.8), then `β` denotes the phase coefficient.
     */
    attribute def PhaseCoefficientUnit :> DimensionOneUnit {
    }
    attribute def PhaseCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PhaseCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute phaseCoefficient: PhaseCoefficientValue :> quantity;

    /**
     * source: item 3-26.3 propagation coefficient
     * symbol(s): `γ`
     * application domain: General
     * name: PropagationCoefficient
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: measure of the change of amplitude and phase angle (item 3-7) of a plane wave propagating in a given direction
     * remarks: The propagation coefficient is given by: `γ = α + iβ` where `α` denotes attenuation (item 3-26.1) and `β` the phase coefficient (item 3-26.2) of a plane wave.
     */
    attribute def PropagationCoefficientUnit :> DimensionOneUnit {
    }
    attribute def PropagationCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PropagationCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute propagationCoefficient: PropagationCoefficientValue :> quantity;

}
