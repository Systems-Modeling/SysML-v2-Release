standard library package ISQElectromagnetism {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard IEC-80000-6:2008 "Electromagnetism"
     * see also https://www.iso.org/obp/ui/#iso:std:iec:80000:-6:ed-1:v1:en,fr
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
    private import ISQMechanics::PowerValue;
    private import ISQSpaceTime::AngularMeasureValue;
    private import ISQThermodynamics::EnergyValue;

    /* IEC-80000-6 item 6-1 electric current */
    /* See package ISQBase for the declarations of ElectricCurrentValue and ElectricCurrentUnit */

    /* IEC-80000-6 item 6-2 electric charge */
    attribute def ElectricChargeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-2 electric charge
         * symbol(s): `Q`, `q`
         * application domain: generic
         * name: ElectricCharge
         * quantity dimension: T^1*I^1
         * measurement unit(s): C
         * tensor order: 0
         * definition: `d(Q) = I dt` where `I` is electric current (item 6-1) and `t` is time (ISO 80000-3, item 3-7)
         * remarks: Electric charge is carried by discrete particles and can be positive or negative. The sign convention is such that the elementary electric charge `e`, i.e. the charge of the proton, is positive. See IEC 60050-121, item121-11-01. To denote a point charge `q` is often used, and that is done in the present document.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricChargeUnit[1];
    }

    attribute electricCharge: ElectricChargeValue[*] nonunique :> scalarQuantities;

    attribute def ElectricChargeUnit :> DerivedUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-3 electric charge density, volumic electric charge */
    attribute def ElectricChargeDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-3 electric charge density, volumic electric charge
         * symbol(s): `ρ`, `ρ_V`
         * application domain: generic
         * name: ElectricChargeDensity
         * quantity dimension: L^-3*T^1*I^1
         * measurement unit(s): C/m^3
         * tensor order: 0
         * definition: `ρ = (dQ)/(dV)` where `Q` is electric charge (item 6-2) and `V` is volume (ISO 80000-3, item 3-4)
         * remarks: See IEC 60050-121, item 121-11-07.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricChargeDensityUnit[1];
    }

    attribute electricChargeDensity: ElectricChargeDensityValue[*] nonunique :> scalarQuantities;

    attribute def ElectricChargeDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    alias VolumicElectricChargeUnit for ElectricChargeDensityUnit;
    alias VolumicElectricChargeValue for ElectricChargeDensityValue;
    alias volumicElectricCharge for electricChargeDensity;

    /* IEC-80000-6 item 6-4 surface density of electric charge, areic electric charge */
    attribute def SurfaceDensityOfElectricChargeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-4 surface density of electric charge, areic electric charge
         * symbol(s): `ρ_A`, `sigma`
         * application domain: generic
         * name: SurfaceDensityOfElectricCharge
         * quantity dimension: L^-2*T^1*I^1
         * measurement unit(s): C/m^2
         * tensor order: 0
         * definition: `ρ_A = (dQ)/(dA)` where `Q` is electric charge (item 6-2) and `A` is area (ISO 80000-3, item 3-3)`
         * remarks: See IEC 60050-121, item 121-11-08.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SurfaceDensityOfElectricChargeUnit[1];
    }

    attribute surfaceDensityOfElectricCharge: SurfaceDensityOfElectricChargeValue[*] nonunique :> scalarQuantities;

    attribute def SurfaceDensityOfElectricChargeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    alias AreicElectricChargeUnit for SurfaceDensityOfElectricChargeUnit;
    alias AreicElectricChargeValue for SurfaceDensityOfElectricChargeValue;
    alias areicElectricCharge for surfaceDensityOfElectricCharge;

    /* IEC-80000-6 item 6-5 linear density of electric charge, lineic electric charge */
    attribute def LinearDensityOfElectricChargeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-5 linear density of electric charge, lineic electric charge
         * symbol(s): `ρ_l`, `tau`
         * application domain: generic
         * name: LinearDensityOfElectricCharge
         * quantity dimension: L^-1*T^1*I^1
         * measurement unit(s): C/m
         * tensor order: 0
         * definition: `ρ_l = (dQ)/(dl)` where `Q` is electric charge (item 6-2) and `l` is length (ISO 80000-3, item 3-1.1)
         * remarks: See IEC 60050-121, item121-11-09.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinearDensityOfElectricChargeUnit[1];
    }

    attribute linearDensityOfElectricCharge: LinearDensityOfElectricChargeValue[*] nonunique :> scalarQuantities;

    attribute def LinearDensityOfElectricChargeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    alias LineicElectricChargeUnit for LinearDensityOfElectricChargeUnit;
    alias LineicElectricChargeValue for LinearDensityOfElectricChargeValue;
    alias lineicElectricCharge for linearDensityOfElectricCharge;

    /* IEC-80000-6 item 6-6 electric dipole moment */
    attribute def ElectricDipoleMomentValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-6 electric dipole moment (magnitude)
         * symbol(s): `p`
         * application domain: generic
         * name: ElectricDipoleMoment
         * quantity dimension: L^1*T^1*I^1
         * measurement unit(s): C*m
         * tensor order: 0
         * definition: `vec(p) = q (vec(r_+) - vec(r_-))` where `vec(r_+)` and `vec(r_-)` are the position vectors (ISO 80000-3, item 3-1.11) to carriers of electric charges `q` and `-q` (item 6-2), respectively
         * remarks: The electric dipole moment of a substance within a domain is the vector sum of electric dipole moments of electric dipoles included in the domain. See IEC 60050-121, items 121-11-35 and 121-11-36.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricDipoleMomentUnit[1];
    }

    attribute electricDipoleMoment: ElectricDipoleMomentValue[*] nonunique :> scalarQuantities;

    attribute def ElectricDipoleMomentUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dElectricDipoleMomentVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-6 electric dipole moment (vector)
         * symbol(s): `vec(p)`
         * application domain: generic
         * name: ElectricDipoleMoment
         * quantity dimension: L^1*T^1*I^1
         * measurement unit(s): C*m
         * tensor order: 1
         * definition: `vec(p) = q (vec(r_+) - vec(r_-))` where `vec(r_+)` and `vec(r_-)` are the position vectors (ISO 80000-3, item 3-1.11) to carriers of electric charges `q` and `-q` (item 6-2), respectively
         * remarks: The electric dipole moment of a substance within a domain is the vector sum of electric dipole moments of electric dipoles included in the domain. See IEC 60050-121, items 121-11-35 and 121-11-36.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dElectricDipoleMomentCoordinateFrame[1];
    }

    attribute electricDipoleMomentVector: Cartesian3dElectricDipoleMomentVector :> vectorQuantities;

    attribute def Cartesian3dElectricDipoleMomentCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: ElectricDipoleMomentUnit[3];
    }

    /* IEC-80000-6 item 6-7 electric polarization */
    attribute def ElectricPolarizationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-7 electric polarization (magnitude)
         * symbol(s): `P`
         * application domain: generic
         * name: ElectricPolarization
         * quantity dimension: L^-2*T^1*I^1
         * measurement unit(s): C/m^2
         * tensor order: 0
         * definition: `vec(P) = (d vec(p))/(dV)` where `vec(p)` is electric dipole moment (item 6-6) of a substance within a domain with volume `V` (ISO 80000-3, item 3-4)
         * remarks: See IEC 60050-121, item 121-11-37.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricPolarizationUnit[1];
    }

    attribute electricPolarization: ElectricPolarizationValue[*] nonunique :> scalarQuantities;

    attribute def ElectricPolarizationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dElectricPolarizationVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-7 electric polarization (vector)
         * symbol(s): `vec(P)`
         * application domain: generic
         * name: ElectricPolarization
         * quantity dimension: L^-2*T^1*I^1
         * measurement unit(s): C/m^2
         * tensor order: 1
         * definition: `vec(P) = (d vec(p))/(dV)` where `vec(p)` is electric dipole moment (item 6-6) of a substance within a domain with volume `V` (ISO 80000-3, item 3-4)
         * remarks: See IEC 60050-121, item 121-11-37.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dElectricPolarizationCoordinateFrame[1];
    }

    attribute electricPolarizationVector: Cartesian3dElectricPolarizationVector :> vectorQuantities;

    attribute def Cartesian3dElectricPolarizationCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: ElectricPolarizationUnit[3];
    }

    /* IEC-80000-6 item 6-8 electric current density, areic electric current */
    attribute def ElectricCurrentDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-8 electric current density, areic electric current (magnitude)
         * symbol(s): `J`
         * application domain: generic
         * name: ElectricCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 0
         * definition: `vec(J) = ρ vec(v)` where `ρ` is electric charge density (item 6-3) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
         * remarks: Electric current `I` (item 6-1) through a surface `S` is `I = int_S vec(J) * vec(e_n) dA` where `vec(e_n) dA` is vector surface element. See IEC 60050-121, item 121-11-11.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricCurrentDensityUnit[1];
    }

    attribute electricCurrentDensity: ElectricCurrentDensityValue[*] nonunique :> scalarQuantities;

    attribute def ElectricCurrentDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dElectricCurrentDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-8 electric current density, areic electric current (vector)
         * symbol(s): `vec(J)`
         * application domain: generic
         * name: ElectricCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 1
         * definition: `vec(J) = ρ vec(v)` where `ρ` is electric charge density (item 6-3) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
         * remarks: Electric current `I` (item 6-1) through a surface `S` is `I = int_S vec(J) * vec(e_n) dA` where `vec(e_n) dA` is vector surface element. See IEC 60050-121, item 121-11-11.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dElectricCurrentDensityCoordinateFrame[1];
    }

    attribute electricCurrentDensityVector: Cartesian3dElectricCurrentDensityVector :> vectorQuantities;

    attribute def Cartesian3dElectricCurrentDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: ElectricCurrentDensityUnit[3];
    }

    alias Cartesian3dAreicElectricCurrentCoordinateFrame for Cartesian3dElectricCurrentDensityCoordinateFrame;
    alias areicElectricCurrentVector for electricCurrentDensityVector;

    /* IEC-80000-6 item 6-9 linear electric current density, lineic electric current */
    attribute def LinearElectricCurrentDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-9 linear electric current density, lineic electric current (magnitude)
         * symbol(s): `J_S`
         * application domain: generic
         * name: LinearElectricCurrentDensity
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 0
         * definition: `vec(J_S) = ρ_A vec(v)` where `ρ_A` is surface density of electric charge (item 6-4) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
         * remarks: Electric current `I` (item 6-1) through a curve `C` on a surface is `I = int_C vec(J_S) xx vec(e_n) * d vec(r)` where `vec(e_n)` is a unit vector perpendicular to the surface and line vector element and `d vec(r)` is the differential of position vector `vec(r)`. See IEC 60050-121, item 121-11-12.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinearElectricCurrentDensityUnit[1];
    }

    attribute linearElectricCurrentDensity: LinearElectricCurrentDensityValue[*] nonunique :> scalarQuantities;

    attribute def LinearElectricCurrentDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dLinearElectricCurrentDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-9 linear electric current density, lineic electric current (vector)
         * symbol(s): `vec(J_S)`
         * application domain: generic
         * name: LinearElectricCurrentDensity
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 1
         * definition: `vec(J_S) = ρ_A vec(v)` where `ρ_A` is surface density of electric charge (item 6-4) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1)
         * remarks: Electric current `I` (item 6-1) through a curve `C` on a surface is `I = int_C vec(J_S) xx vec(e_n) * d vec(r)` where `vec(e_n)` is a unit vector perpendicular to the surface and line vector element and `d vec(r)` is the differential of position vector `vec(r)`. See IEC 60050-121, item 121-11-12.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dLinearElectricCurrentDensityCoordinateFrame[1];
    }

    attribute linearElectricCurrentDensityVector: Cartesian3dLinearElectricCurrentDensityVector :> vectorQuantities;

    attribute def Cartesian3dLinearElectricCurrentDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: LinearElectricCurrentDensityUnit[3];
    }

    alias Cartesian3dLineicElectricCurrentCoordinateFrame for Cartesian3dLinearElectricCurrentDensityCoordinateFrame;
    alias lineicElectricCurrentVector for linearElectricCurrentDensityVector;

    /* IEC-80000-6 item 6-10 electric field strength */
    attribute def ElectricFieldStrengthValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-10 electric field strength (magnitude)
         * symbol(s): `E`
         * application domain: generic
         * name: ElectricFieldStrength
         * quantity dimension: L^1*M^1*T^-3*I^-1
         * measurement unit(s): V/m
         * tensor order: 0
         * definition: `vec(E) = vec(F)/q` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `q` is electric charge (item 6-2)
         * remarks: See IEC 60050, item 121-11-18. `q` is the charge of a test particle at rest.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricFieldStrengthUnit[1];
    }

    attribute electricFieldStrength: ElectricFieldStrengthValue[*] nonunique :> scalarQuantities;

    attribute def ElectricFieldStrengthUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dElectricFieldStrengthVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-10 electric field strength (vector)
         * symbol(s): `vec(E)`
         * application domain: generic
         * name: ElectricFieldStrength
         * quantity dimension: L^1*M^1*T^-3*I^-1
         * measurement unit(s): V/m
         * tensor order: 1
         * definition: `vec(E) = vec(F)/q` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `q` is electric charge (item 6-2)
         * remarks: See IEC 60050, item 121-11-18. `q` is the charge of a test particle at rest.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dElectricFieldStrengthCoordinateFrame[1];
    }

    attribute electricFieldStrengthVector: Cartesian3dElectricFieldStrengthVector :> vectorQuantities;

    attribute def Cartesian3dElectricFieldStrengthCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: ElectricFieldStrengthUnit[3];
    }

    /* IEC-80000-6 item 6-11.1 electric potential */
    attribute def ElectricPotentialValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-11.1 electric potential
         * symbol(s): `V`, `φ`
         * application domain: generic
         * name: ElectricPotential
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V
         * tensor order: 0
         * definition: `-grad(V) = vec(E) + (del A)/(del t)` where `vec(E)` is electric field strength (item 610), `A` is magnetic vector potential (item 6-32) and `t` is time (ISO 80000-3, item 3-7)
         * remarks: The electric potential is not unique, since any constant scalar field quantity can be added to it without changing its gradient. See IEC 60050-121, item 121-11-25.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricPotentialUnit[1];
    }

    attribute electricPotential: ElectricPotentialValue[*] nonunique :> scalarQuantities;

    attribute def ElectricPotentialUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-11.2 electric potential difference */
    attribute def ElectricPotentialDifferenceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-11.2 electric potential difference
         * symbol(s): `V_(ab)`
         * application domain: generic
         * name: ElectricPotentialDifference
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V
         * tensor order: 0
         * definition: `V_(ab) = int_(vec(r_a))^(vec(r_b)) (vec(E) + (del A)/(del t)) * d vec(r)` where `vec(E)` is electric field strength (item 610), `A` is magnetic vector potential (item 6-32), `t` is time (ISO 80000-3, item 3-7), and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`
         * remarks: `V_(ab) = V_a - V_b` where `V_a` and `V_b` are the potentials at points `a` and `b`, respectively. See IEC 60050-121, item 121-11-26.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricPotentialDifferenceUnit[1];
    }

    attribute electricPotentialDifference: ElectricPotentialDifferenceValue[*] nonunique :> scalarQuantities;

    attribute def ElectricPotentialDifferenceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-11.3 voltage, electric tension */
    attribute voltage: ElectricPotentialDifferenceValue :> scalarQuantities {
        doc
        /*
         * source: item 6-11.3 voltage, electric tension
         * symbol(s): `U`, `U_(ab)`
         * application domain: generic
         * name: Voltage (specializes ElectricPotentialDifference)
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V
         * tensor order: 0
         * definition: in electric circuit theory, `U_(ab) = V_a - V_b` where `V_a` and `V_b` are the electric potentials (item 6-11.1) at points `a` and `b`, respectively
         * remarks: For an electric field within a medium `U_(ab) = int_(vec(r_a) (C))^(vec(r_b)) vec(E) * d vec(r)` where `vec(E)` is electric field strength (item 6-10) and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`. For an irrotational electric field, the voltage is independent of the path between the two points `a` and `b`. See IEC 60050-121, item 121-11-27.
         */
    }

    alias electricTension for voltage;

    /* IEC-80000-6 item 6-12 electric flux density, electric displacement */
    attribute def ElectricFluxDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-12 electric flux density, electric displacement (magnitude)
         * symbol(s): `D`
         * application domain: generic
         * name: ElectricFluxDensity
         * quantity dimension: L^-2*T^1*I^1
         * measurement unit(s): C/m^2
         * tensor order: 0
         * definition: `vec(D) = ε_0 vec(E) + vec(P)` where `ε_0` is the electric constant (item 6-14.1 ), `vec(E)` is electric field strength (item 6-10), and `vec(P)` is electric polarization (item 6-7)
         * remarks: The electric flux density is related to electric charge density via `nabla * vec(D) = ρ` where `nabla * vec(D)` denotes the divergence of `vec(D)`. See IEC 60050-121, item 121-11-40.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricFluxDensityUnit[1];
    }

    attribute electricFluxDensity: ElectricFluxDensityValue[*] nonunique :> scalarQuantities;

    attribute def ElectricFluxDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dElectricFluxDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-12 electric flux density, electric displacement (vector)
         * symbol(s): `vec(D)`
         * application domain: generic
         * name: ElectricFluxDensity
         * quantity dimension: L^-2*T^1*I^1
         * measurement unit(s): C/m^2
         * tensor order: 1
         * definition: `vec(D) = ε_0 vec(E) + vec(P)` where `ε_0` is the electric constant (item 6-14.1 ), `vec(E)` is electric field strength (item 6-10), and `vec(P)` is electric polarization (item 6-7)
         * remarks: The electric flux density is related to electric charge density via `nabla * vec(D) = ρ` where `nabla * vec(D)` denotes the divergence of `vec(D)`. See IEC 60050-121, item 121-11-40.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dElectricFluxDensityCoordinateFrame[1];
    }

    attribute electricFluxDensityVector: Cartesian3dElectricFluxDensityVector :> vectorQuantities;

    attribute def Cartesian3dElectricFluxDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: ElectricFluxDensityUnit[3];
    }

    alias Cartesian3dElectricDisplacementCoordinateFrame for Cartesian3dElectricFluxDensityCoordinateFrame;
    alias electricDisplacementVector for electricFluxDensityVector;

    /* IEC-80000-6 item 6-13 capacitance */
    attribute def CapacitanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-13 capacitance
         * symbol(s): `C`
         * application domain: generic
         * name: Capacitance
         * quantity dimension: L^-2*M^-1*T^4*I^2
         * measurement unit(s): F
         * tensor order: 0
         * definition: `C = Q/U` where `Q` is electric charge (item 6-2) and `U` is voltage (6-11.3)
         * remarks: See IEC 60050-131, item 131-12-13.
         */
        attribute :>> num: Real;
        attribute :>> mRef: CapacitanceUnit[1];
    }

    attribute capacitance: CapacitanceValue[*] nonunique :> scalarQuantities;

    attribute def CapacitanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 4; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-14.1 electric constant, permittivity of vacuum */
    attribute def ElectricConstantValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-14.1 electric constant, permittivity of vacuum
         * symbol(s): `ε_0`
         * application domain: generic
         * name: ElectricConstant
         * quantity dimension: L^-3*M^-1*T^4*I^2
         * measurement unit(s): F/m
         * tensor order: 0
         * definition: `ε_0 = 1 / (μ_0 * c_0^2)` where `μ_0` is the magnetic constant (item 6-26.1) and `c_0` is the speed of light (item 6-35.2)
         * remarks: `ε_0 = 8.854188 * 10^-12` F/m. See IEC 60050-121, item 121-11-03.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricConstantUnit[1];
    }

    attribute electricConstant: ElectricConstantValue[*] nonunique :> scalarQuantities;

    attribute def ElectricConstantUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 4; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias PermittivityOfVacuumUnit for ElectricConstantUnit;
    alias PermittivityOfVacuumValue for ElectricConstantValue;
    alias permittivityOfVacuum for electricConstant;

    /* IEC-80000-6 item 6-14.2 permittivity */
    attribute def PermittivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-14.2 permittivity
         * symbol(s): `ε`
         * application domain: generic
         * name: Permittivity
         * quantity dimension: L^-3*M^-1*T^4*I^2
         * measurement unit(s): F/m
         * tensor order: 0
         * definition: `vec(D) = ε vec(E)` where `vec(D)` is electric flux density (item 6-12) and `vec(E)` is electric field strength (item 6-10)
         * remarks: This definition applies to an isotropic medium. For an anisotropic medium, permittivity is a second order tensor. See IEC 60050-121, item 121-12-12.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PermittivityUnit[1];
    }

    attribute permittivity: PermittivityValue[*] nonunique :> scalarQuantities;

    attribute def PermittivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 4; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-15 relative permittivity */
    attribute def RelativePermittivityValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-15 relative permittivity
         * symbol(s): `ε_r`
         * application domain: generic
         * name: RelativePermittivity (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `ε_r = ε / ε_0` where `ε` is permittivity (item 6-14.2) and `ε_0` is the electric constant (item 6-14.1)
         * remarks: See IEC 60050-121, item 121-12-13.
         */
    }
    attribute relativePermittivity: RelativePermittivityValue :> scalarQuantities;

    /* IEC-80000-6 item 6-16 electric susceptibility */
    attribute def ElectricSusceptibilityValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-16 electric susceptibility
         * symbol(s): `χ`
         * application domain: generic
         * name: ElectricSusceptibility (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `vec(P) = ε_0 χ vec(E)` where `vec(P)` is electric polarization (item 6-7), `ε_0` is the electric constant (item 6-14. 1) and `vec(E)` is electric field strength (item 6-10)
         * remarks: `χ = ε_r - 1`. The definition applies to an isotropic medium. For an anisotropic medium, electric susceptibility is a second order tensor. See IEC 60050-121, item 121-12-19.
         */
    }
    attribute electricSusceptibility: ElectricSusceptibilityValue :> scalarQuantities;

    /* IEC-80000-6 item 6-17 electric flux */
    attribute def ElectricFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-17 electric flux
         * symbol(s): `Ψ`
         * application domain: generic
         * name: ElectricFlux
         * quantity dimension: T^1*I^1
         * measurement unit(s): C
         * tensor order: 0
         * definition: `Ψ = int_S vec(D) * vec(e_n) dA` over a surface `S`, where `vec(D)` is electric flux (item 6-12) en `vec(e_n) dA` is the vector surface element (ISO 80000-3 item 3-3)
         * remarks: See IEC 60050-121, item 121-11-41.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectricFluxUnit[1];
    }

    attribute electricFlux: ElectricFluxValue[*] nonunique :> scalarQuantities;

    attribute def ElectricFluxUnit :> DerivedUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-18 displacement current density */
    attribute def DisplacementCurrentDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-18 displacement current density (magnitude)
         * symbol(s): `J_D`
         * application domain: generic
         * name: DisplacementCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 0
         * definition: `vec(J_D) = (del vec(D))/(del t)` where `vec(D)` is electric flux density (item 6-12) and `t` is time (ISO 80000-3, item 3-7) 
         * remarks: See IEC 60050-121, item 121-11-42.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DisplacementCurrentDensityUnit[1];
    }

    attribute displacementCurrentDensity: DisplacementCurrentDensityValue[*] nonunique :> scalarQuantities;

    attribute def DisplacementCurrentDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dDisplacementCurrentDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-18 displacement current density (vector)
         * symbol(s): `vec(J_D)`
         * application domain: generic
         * name: DisplacementCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 1
         * definition: `vec(J_D) = (del vec(D))/(del t)` where `vec(D)` is electric flux density (item 6-12) and `t` is time (ISO 80000-3, item 3-7) 
         * remarks: See IEC 60050-121, item 121-11-42.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dDisplacementCurrentDensityCoordinateFrame[1];
    }

    attribute displacementCurrentDensityVector: Cartesian3dDisplacementCurrentDensityVector :> vectorQuantities;

    attribute def Cartesian3dDisplacementCurrentDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: DisplacementCurrentDensityUnit[3];
    }

    /* IEC-80000-6 item 6-19.1 displacement current */
    attribute displacementCurrent: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-19.1 displacement current
         * symbol(s): `I_D`
         * application domain: generic
         * name: DisplacementCurrent (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: `I = int_S vec(J_D) * vec(e_n) dA` over a surface `S`, where `vec(J_D)` is displacement current density (item 6-18) en `vec(e_n) dA` is the vector surface element (ISO 80000-3 item 3-3)
         * remarks: See IEC 60050-121, item 121-11-43.
         */
    }

    /* IEC-80000-6 item 6-19.2 total current */
    attribute totalCurrent: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-19.2 total current
         * symbol(s): `I_"tot"`, `I_t`
         * application domain: generic
         * name: TotalCurrent (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: `I_(tot) = I + I_D` where `I` is electric current (item 6-1) and `I_D` is displacement current (item 6-19.1)
         * remarks: See IEC 60050-121, item 121-11-45.
         */
    }

    /* IEC-80000-6 item 6-20 total current density */
    attribute def TotalCurrentDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-20 total current density (magnitude)
         * symbol(s): `J_"tot"`, `J_t`
         * application domain: generic
         * name: TotalCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 0
         * definition: `vec(J_(tot)) = vec(J) +vec(J_D)` where `vec(J)` is electric current density (item 6-8) and `vec(J_D)` is displacement current density (item 6-18)
         * remarks: See IEC 60050-121, item 121-11-44.
         */
        attribute :>> num: Real;
        attribute :>> mRef: TotalCurrentDensityUnit[1];
    }

    attribute totalCurrentDensity: TotalCurrentDensityValue[*] nonunique :> scalarQuantities;

    attribute def TotalCurrentDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dTotalCurrentDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-20 total current density (vector)
         * symbol(s): `vec(J_"tot")`, `vec(J_t)`
         * application domain: generic
         * name: TotalCurrentDensity
         * quantity dimension: L^-2*I^1
         * measurement unit(s): A/m^2
         * tensor order: 1
         * definition: `vec(J_(tot)) = vec(J) +vec(J_D)` where `vec(J)` is electric current density (item 6-8) and `vec(J_D)` is displacement current density (item 6-18)
         * remarks: See IEC 60050-121, item 121-11-44.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dTotalCurrentDensityCoordinateFrame[1];
    }

    attribute totalCurrentDensityVector: Cartesian3dTotalCurrentDensityVector :> vectorQuantities;

    attribute def Cartesian3dTotalCurrentDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: TotalCurrentDensityUnit[3];
    }

    /* IEC-80000-6 item 6-21 magnetic flux density */
    attribute def MagneticFluxDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-21 magnetic flux density (magnitude)
         * symbol(s): `B`
         * application domain: generic
         * name: MagneticFluxDensity
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T
         * tensor order: 0
         * definition: `vec(F) = q vec(v) xx vec(B)` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1) of any test particle with electric charge `q` (item 6-2)
         * remarks: The magnetic flux density has zero divergence, `nabla * vec(B) = 0`. See IEC 60050-121, item 121-11-19.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticFluxDensityUnit[1];
    }

    attribute magneticFluxDensity: MagneticFluxDensityValue[*] nonunique :> scalarQuantities;

    attribute def MagneticFluxDensityUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticFluxDensityVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-21 magnetic flux density (vector)
         * symbol(s): `vec(B)`
         * application domain: generic
         * name: MagneticFluxDensity
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T
         * tensor order: 1
         * definition: `vec(F) = q vec(v) xx vec(B)` where `vec(F)` is force (ISO 80000-4, item 4-9.1) and `vec(v)` is velocity (ISO 80000-3, item 3-8.1) of any test particle with electric charge `q` (item 6-2)
         * remarks: The magnetic flux density has zero divergence, `nabla * vec(B) = 0`. See IEC 60050-121, item 121-11-19.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticFluxDensityCoordinateFrame[1];
    }

    attribute magneticFluxDensityVector: Cartesian3dMagneticFluxDensityVector :> vectorQuantities;

    attribute def Cartesian3dMagneticFluxDensityCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticFluxDensityUnit[3];
    }

    /* IEC-80000-6 item 6-22.1 magnetic flux */
    attribute def MagneticFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-22.1 magnetic flux
         * symbol(s): `Φ`
         * application domain: generic
         * name: MagneticFlux
         * quantity dimension: L^2*M^1*T^-2*I^-1
         * measurement unit(s): Wb
         * tensor order: 0
         * definition: `Φ = int_S vec(B) * vec(e_n) dA` over a surface `S`, where `vec(B)` is magnetic flux density (item 6-21) and `vec(e_n) dA` is vector surface element (ISO 80000-3, item 3-3)
         * remarks: See IEC 60050-121, item 121-11-21.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticFluxUnit[1];
    }

    attribute magneticFlux: MagneticFluxValue[*] nonunique :> scalarQuantities;

    attribute def MagneticFluxUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-22.2 linked flux */
    attribute def LinkedFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-22.2 linked flux
         * symbol(s): `Ψ_m`, `Ψ`
         * application domain: generic
         * name: LinkedFlux
         * quantity dimension: L^2*M^1*T^-2*I^-1
         * measurement unit(s): Wb
         * tensor order: 0
         * definition: `Ψ_m = int_C vec(A) * d vec(r)` where `vec(A)` is magnetic vector potential (item 6-32) and `d vec(r)` is line vector element of the curve `C`
         * remarks: Line vector element `d vec(r)` is the differential of position vector `vec(r)` (ISO 80000-3, item 3-1.11). See IEC 60050-121, item 121-11-24.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinkedFluxUnit[1];
    }

    attribute linkedFlux: LinkedFluxValue[*] nonunique :> scalarQuantities;

    attribute def LinkedFluxUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-23 magnetic moment, magnetic area moment */
    attribute def MagneticMomentValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-23 magnetic moment, magnetic area moment (magnitude)
         * symbol(s): `m`
         * application domain: generic
         * name: MagneticMoment
         * quantity dimension: L^2*I^1
         * measurement unit(s): A*m^2
         * tensor order: 0
         * definition: `vec(m) = I vec(e_n) A` where `I` is electric current (item 6-1) in a small closed loop, `vec(e_n)` is a unit vector perpendicular to the loop, and `A` is area (ISO 80000-3, item 3-3) of the loop
         * remarks: The magnetic moment of a substance within a domain is the vector sum of the magnetic moments of all entities included in the domain. See IEC 60050-121, items 121-11-49 and 121-11-50.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticMomentUnit[1];
    }

    attribute magneticMoment: MagneticMomentValue[*] nonunique :> scalarQuantities;

    attribute def MagneticMomentUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticMomentVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-23 magnetic moment, magnetic area moment (vector)
         * symbol(s): `vec(m)`
         * application domain: generic
         * name: MagneticMoment
         * quantity dimension: L^2*I^1
         * measurement unit(s): A*m^2
         * tensor order: 1
         * definition: `vec(m) = I vec(e_n) A` where `I` is electric current (item 6-1) in a small closed loop, `vec(e_n)` is a unit vector perpendicular to the loop, and `A` is area (ISO 80000-3, item 3-3) of the loop
         * remarks: The magnetic moment of a substance within a domain is the vector sum of the magnetic moments of all entities included in the domain. See IEC 60050-121, items 121-11-49 and 121-11-50.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticMomentCoordinateFrame[1];
    }

    attribute magneticMomentVector: Cartesian3dMagneticMomentVector :> vectorQuantities;

    attribute def Cartesian3dMagneticMomentCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticMomentUnit[3];
    }

    alias Cartesian3dMagneticAreaMomentCoordinateFrame for Cartesian3dMagneticMomentCoordinateFrame;
    alias magneticAreaMomentVector for magneticMomentVector;

    /* IEC-80000-6 item 6-24 magnetization */
    attribute def MagnetizationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-24 magnetization (magnitude)
         * symbol(s): `M`, `H_i`
         * application domain: generic
         * name: Magnetization
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 0
         * definition: `vec(M) = (d vec(m)) / (dV)` where `vec(m)` is magnetic moment (item 6-23) of a substance in a domain with volume `V` (ISO 80000-3, item 3-4)
         * remarks: See IEC 60050-121, item 121-11-52.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagnetizationUnit[1];
    }

    attribute magnetization: MagnetizationValue[*] nonunique :> scalarQuantities;

    attribute def MagnetizationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagnetizationVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-24 magnetization (vector)
         * symbol(s): `vec(M)`, `vec(H_i)`
         * application domain: generic
         * name: Magnetization
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 1
         * definition: `vec(M) = (d vec(m)) / (dV)` where `vec(m)` is magnetic moment (item 6-23) of a substance in a domain with volume `V` (ISO 80000-3, item 3-4)
         * remarks: See IEC 60050-121, item 121-11-52.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagnetizationCoordinateFrame[1];
    }

    attribute magnetizationVector: Cartesian3dMagnetizationVector :> vectorQuantities;

    attribute def Cartesian3dMagnetizationCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagnetizationUnit[3];
    }

    /* IEC-80000-6 item 6-25 magnetic field strength, magnetizing field */
    attribute def MagneticFieldStrengthValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-25 magnetic field strength, magnetizing field (magnitude)
         * symbol(s): `H`
         * application domain: generic
         * name: MagneticFieldStrength
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 0
         * definition: `vec(H) = vec(B)/μ_0 - vec(M)` where `vec(B)` is magnetic flux density (item 6-21), `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
         * remarks: The magnetic field strength is related to the total current density `vec(J_(t ot))` (item 6-20) via `rot vec(H) = vec(J_(t ot))`. See IEC 60050-121, item 121-11-56.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticFieldStrengthUnit[1];
    }

    attribute magneticFieldStrength: MagneticFieldStrengthValue[*] nonunique :> scalarQuantities;

    attribute def MagneticFieldStrengthUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticFieldStrengthVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-25 magnetic field strength, magnetizing field (vector)
         * symbol(s): `vec(H)`
         * application domain: generic
         * name: MagneticFieldStrength
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 1
         * definition: `vec(H) = vec(B)/μ_0 - vec(M)` where `vec(B)` is magnetic flux density (item 6-21), `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
         * remarks: The magnetic field strength is related to the total current density `vec(J_(t ot))` (item 6-20) via `rot vec(H) = vec(J_(t ot))`. See IEC 60050-121, item 121-11-56.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticFieldStrengthCoordinateFrame[1];
    }

    attribute magneticFieldStrengthVector: Cartesian3dMagneticFieldStrengthVector :> vectorQuantities;

    attribute def Cartesian3dMagneticFieldStrengthCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticFieldStrengthUnit[3];
    }

    alias Cartesian3dMagnetizingFieldCoordinateFrame for Cartesian3dMagneticFieldStrengthCoordinateFrame;
    alias magnetizingFieldVector for magneticFieldStrengthVector;

    /* IEC-80000-6 item 6-26.1 magnetic constant, permeability of vacuum */
    attribute def MagneticConstantValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-26.1 magnetic constant, permeability of vacuum
         * symbol(s): `μ_0`
         * application domain: generic
         * name: MagneticConstant
         * quantity dimension: L^1*M^1*T^-2*I^-2
         * measurement unit(s): H/m
         * tensor order: 0
         * definition: `μ_0 = 4 π * 10^-7` H/m
         * remarks: For this definition of `μ_0` see item 6-1.a. `μ_0 ~~ 1.256637 * 10^-6` H/m. See IEC 60050-121, item 121-11-14.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticConstantUnit[1];
    }

    attribute magneticConstant: MagneticConstantValue[*] nonunique :> scalarQuantities;

    attribute def MagneticConstantUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias PermeabilityOfVacuumUnit for MagneticConstantUnit;
    alias PermeabilityOfVacuumValue for MagneticConstantValue;
    alias permeabilityOfVacuum for magneticConstant;

    /* IEC-80000-6 item 6-26.2 permeability */
    attribute def PermeabilityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-26.2 permeability
         * symbol(s): `μ`
         * application domain: generic
         * name: Permeability
         * quantity dimension: L^1*M^1*T^-2*I^-2
         * measurement unit(s): H/m
         * tensor order: 0
         * definition: `vec(B) = μ vec(H)` where `vec(B)` is magnetic flux density (item 6-21) and `vec(H)` is magnetic field strength (item 6-25)
         * remarks: This definition applies to an isotropic medium. For an anisotropic medium permeability is a second order tensor. See IEC 60050-121, item 121-12-28.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PermeabilityUnit[1];
    }

    attribute permeability: PermeabilityValue[*] nonunique :> scalarQuantities;

    attribute def PermeabilityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-27 relative permeability */
    attribute def RelativePermeabilityValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-27 relative permeability
         * symbol(s): `μ_r`
         * application domain: generic
         * name: RelativePermeability (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `μ_r = μ / μ_0`  where `μ` is permeability (item 6-24) and `μ_0` is the magnetic constant (item 6-26.1)
         * remarks: See IEC 60050-121, item 121-12-29.
         */
    }
    attribute relativePermeability: RelativePermeabilityValue :> scalarQuantities;

    /* IEC-80000-6 item 6-28 magnetic susceptibility */
    attribute def MagneticSusceptibilityValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-28 magnetic susceptibility
         * symbol(s): `κ`, `χ_m`
         * application domain: generic
         * name: MagneticSusceptibility (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `vec(M) = κ vec(H)` where `vec(M)` is magnetization (item 6-24) and `vec(H)` is magnetic field strength (item 6-25)
         * remarks: `κ = μ_r - 1` This definition applies to an isotropic medium. For an anisotropic medium magnetic susceptibility is a second order tensor. See IEC 60050-121, item 121-12-37.
         */
    }
    attribute magneticSusceptibility: MagneticSusceptibilityValue :> scalarQuantities;

    /* IEC-80000-6 item 6-29 magnetic polarization */
    attribute def MagneticPolarizationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-29 magnetic polarization (magnitude)
         * symbol(s): `J_m`
         * application domain: generic
         * name: MagneticPolarization
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T
         * tensor order: 0
         * definition: `vec(J_m) = μ_0 vec(M)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
         * remarks: See IEC 60050-121, item 121-11-54.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticPolarizationUnit[1];
    }

    attribute magneticPolarization: MagneticPolarizationValue[*] nonunique :> scalarQuantities;

    attribute def MagneticPolarizationUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticPolarizationVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-29 magnetic polarization (vector)
         * symbol(s): `vec(J_m)`
         * application domain: generic
         * name: MagneticPolarization
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T
         * tensor order: 1
         * definition: `vec(J_m) = μ_0 vec(M)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(M)` is magnetization (item 6-24)
         * remarks: See IEC 60050-121, item 121-11-54.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticPolarizationCoordinateFrame[1];
    }

    attribute magneticPolarizationVector: Cartesian3dMagneticPolarizationVector :> vectorQuantities;

    attribute def Cartesian3dMagneticPolarizationCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticPolarizationUnit[3];
    }

    /* IEC-80000-6 item 6-30 magnetic dipole moment */
    attribute def MagneticDipoleMomentValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-30 magnetic dipole moment (magnitude)
         * symbol(s): `j_m`, `j`
         * application domain: generic
         * name: MagneticDipoleMoment
         * quantity dimension: L^3*M^1*T^-2*I^-1
         * measurement unit(s): Wb*m
         * tensor order: 0
         * definition: `vec(j_m) = μ_0 vec(m)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(m)` is magnetic moment (item 6-23)
         * remarks: See IEC 60050-121, item 121-11-55.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticDipoleMomentUnit[1];
    }

    attribute magneticDipoleMoment: MagneticDipoleMomentValue[*] nonunique :> scalarQuantities;

    attribute def MagneticDipoleMomentUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticDipoleMomentVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-30 magnetic dipole moment (vector)
         * symbol(s): `vec(j_m)`, `vec(j)`
         * application domain: generic
         * name: MagneticDipoleMoment
         * quantity dimension: L^3*M^1*T^-2*I^-1
         * measurement unit(s): Wb*m
         * tensor order: 1
         * definition: `vec(j_m) = μ_0 vec(m)` where `μ_0` is the magnetic constant (item 6-26.1), and `vec(m)` is magnetic moment (item 6-23)
         * remarks: See IEC 60050-121, item 121-11-55.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticDipoleMomentCoordinateFrame[1];
    }

    attribute magneticDipoleMomentVector: Cartesian3dMagneticDipoleMomentVector :> vectorQuantities;

    attribute def Cartesian3dMagneticDipoleMomentCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticDipoleMomentUnit[3];
    }

    /* IEC-80000-6 item 6-31 coercivity */
    attribute def CoercivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-31 coercivity
         * symbol(s): `H_(c,B)`
         * application domain: generic
         * name: Coercivity
         * quantity dimension: L^-1*I^1
         * measurement unit(s): A/m
         * tensor order: 0
         * definition: magnetic field strength (item 6-25) to be applied to bring the magnetic flux density (item 6-21) in a substance from its remaining magnetic flux density to zero
         * remarks: See IEC 60050-121, item 121-12-69. Also called coercive field strength.
         */
        attribute :>> num: Real;
        attribute :>> mRef: CoercivityUnit[1];
    }

    attribute coercivity: CoercivityValue[*] nonunique :> scalarQuantities;

    attribute def CoercivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-32 magnetic vector potential */
    attribute def MagneticVectorPotentialValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-32 magnetic vector potential (magnitude)
         * symbol(s): `A`
         * application domain: generic
         * name: MagneticVectorPotential
         * quantity dimension: L^1*M^1*T^-2*I^-1
         * measurement unit(s): Wb/m
         * tensor order: 0
         * definition: `vec(B) = rot vec(A)` where `vec(B)` is magnetic flux density (item 6-21)
         * remarks: The magnetic vector potential is not unique since any irrotational vector field can be added to it without changing its rotation. See IEC 60050-121, item 121-11-23.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagneticVectorPotentialUnit[1];
    }

    attribute magneticVectorPotential: MagneticVectorPotentialValue[*] nonunique :> scalarQuantities;

    attribute def MagneticVectorPotentialUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    attribute def Cartesian3dMagneticVectorPotentialVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-32 magnetic vector potential (vector)
         * symbol(s): `vec(A)`
         * application domain: generic
         * name: MagneticVectorPotential
         * quantity dimension: L^1*M^1*T^-2*I^-1
         * measurement unit(s): Wb/m
         * tensor order: 1
         * definition: `vec(B) = rot vec(A)` where `vec(B)` is magnetic flux density (item 6-21)
         * remarks: The magnetic vector potential is not unique since any irrotational vector field can be added to it without changing its rotation. See IEC 60050-121, item 121-11-23.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = true;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dMagneticVectorPotentialCoordinateFrame[1];
    }

    attribute magneticVectorPotentialVector: Cartesian3dMagneticVectorPotentialVector :> vectorQuantities;

    attribute def Cartesian3dMagneticVectorPotentialCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = true;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: MagneticVectorPotentialUnit[3];
    }

    /* IEC-80000-6 item 6-33 electromagnetic energy density, volumic electromagnetic energy */
    attribute def ElectromagneticEnergyDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-33 electromagnetic energy density, volumic electromagnetic energy
         * symbol(s): `w`
         * application domain: generic
         * name: ElectromagneticEnergyDensity
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): J/m^3
         * tensor order: 0
         * definition: `ω = 1/2*(vec(E)*vec(D) + vec(B) * vec(H))` where `vec(E)` is electric field strength (item 6-10), `vec(D)` is electric flux density (item 6-12), `vec(B)` is magnetic flux density (item 6-21), and `vec(H)` is magnetic field strength (item 6-25)
         * remarks: See IEC 60050-121, item 121-11-65.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectromagneticEnergyDensityUnit[1];
    }

    attribute electromagneticEnergyDensity: ElectromagneticEnergyDensityValue[*] nonunique :> scalarQuantities;

    attribute def ElectromagneticEnergyDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    alias VolumicElectromagneticEnergyUnit for ElectromagneticEnergyDensityUnit;
    alias VolumicElectromagneticEnergyValue for ElectromagneticEnergyDensityValue;
    alias volumicElectromagneticEnergy for electromagneticEnergyDensity;

    /* IEC-80000-6 item 6-34 Poynting vector */
    attribute def PoyntingVectorMagnitudeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-34 Poynting vector (magnitude)
         * symbol(s): `S`
         * application domain: generic
         * name: PoyntingVectorMagnitude
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/m^2
         * tensor order: 0
         * definition: `vec(S) = vec(E) xx vec(H)` where `vec(E)` is electric field strength (item 6-10) and `vec(H)` is magnetic field strength (item 6-25)
         * remarks: See IEC 60050-121, item 121-11-66.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PoyntingVectorMagnitudeUnit[1];
    }

    attribute poyntingVectorMagnitude: PoyntingVectorMagnitudeValue[*] nonunique :> scalarQuantities;

    attribute def PoyntingVectorMagnitudeUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    attribute def Cartesian3dPoyntingVector :> VectorQuantityValue {
        doc
        /*
         * source: item 6-34 Poynting vector
         * symbol(s): `vec(S)`
         * application domain: generic
         * name: PoyntingVector
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/m^2
         * tensor order: 1
         * definition: `vec(S) = vec(E) xx vec(H)` where `vec(E)` is electric field strength (item 6-10) and `vec(H)` is magnetic field strength (item 6-25)
         * remarks: See IEC 60050-121, item 121-11-66.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dPoyntingCoordinateFrame[1];
    }

    attribute poyntingVector: Cartesian3dPoyntingVector :> vectorQuantities;

    attribute def Cartesian3dPoyntingCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: PoyntingVectorMagnitudeUnit[3];
    }

    /* IEC-80000-6 item 6-35.1 phase speed of electromagnetic waves */
    attribute def PhaseSpeedOfElectromagneticWavesValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-35.1 phase speed of electromagnetic waves
         * symbol(s): `c`
         * application domain: generic
         * name: PhaseSpeedOfElectromagneticWaves
         * quantity dimension: L^1*T^-1
         * measurement unit(s): m/s
         * tensor order: 0
         * definition: `c = ω/k` where `ω` is angular frequency (ISO 80000-3, item 3-16) and `k` is angular wavenumber (ISO 80000-3, item 3-19)
         * remarks: See ISO 80000-3, item 3-20.1.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhaseSpeedOfElectromagneticWavesUnit[1];
    }

    attribute phaseSpeedOfElectromagneticWaves: PhaseSpeedOfElectromagneticWavesValue[*] nonunique :> scalarQuantities;

    attribute def PhaseSpeedOfElectromagneticWavesUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* IEC-80000-6 item 6-35.2 speed of light, light speed */
    attribute def SpeedOfLightValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-35.2 speed of light, light speed
         * symbol(s): `c_0`
         * application domain: generic
         * name: SpeedOfLight
         * quantity dimension: L^1*T^-1
         * measurement unit(s): m/s
         * tensor order: 0
         * definition: speed of electromagnetic waves in vacuum; `c_0 = 299792458` m/s
         * remarks: For this value of `c_0` see ISO 80000-3, item 3-1.a. `c_0 = 1/sqrt(ε_0 μ_0)`. See IEC 60050-111, item 111-13-07.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpeedOfLightUnit[1];
    }

    attribute speedOfLight: SpeedOfLightValue[*] nonunique :> scalarQuantities;

    attribute def SpeedOfLightUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    alias LightSpeedUnit for SpeedOfLightUnit;
    alias LightSpeedValue for SpeedOfLightValue;
    alias lightSpeed for speedOfLight;

    /* IEC-80000-6 item 6-36 source voltage, source tension */
    attribute def SourceVoltageValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-36 source voltage, source tension
         * symbol(s): `U_s`
         * application domain: generic
         * name: SourceVoltage
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V
         * tensor order: 0
         * definition: voltage (item 6-11.3) between the two terminals of a voltage source when there is no electric current (item 6-1) through the source
         * remarks: The name "electromotive force" with the abbreviation EMF and the symbol `E` is deprecated. See IEC 60050-131, item 131-12-22.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SourceVoltageUnit[1];
    }

    attribute sourceVoltage: SourceVoltageValue[*] nonunique :> scalarQuantities;

    attribute def SourceVoltageUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias SourceTensionUnit for SourceVoltageUnit;
    alias SourceTensionValue for SourceVoltageValue;
    alias sourceTension for sourceVoltage;

    /* IEC-80000-6 item 6-37.1 scalar magnetic potential */
    attribute scalarMagneticPotential: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-37.1 scalar magnetic potential
         * symbol(s): `V_m`, `φ`
         * application domain: generic
         * name: ScalarMagneticPotential (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: for an irrotational magnetic field strength `vec(H) =  -nabla V_m` where `vec(H)` is magnetic field strength (item 6-25)
         * remarks: The magnetic scalar potential is not unique since any constant scalar field can be added to it without changing its gradient. See IEC 60050-121, item 121-11-58.
         */
    }

    /* IEC-80000-6 item 6-37.2 magnetic tension */
    attribute magneticTension: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-37.2 magnetic tension
         * symbol(s): `U_m`
         * application domain: generic
         * name: MagneticTension (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: `U_m = int_(vec(r_a) (C))^(vec(r_b)) vec(H) * d(vec(r))` where `vec(H)` is magnetic field strength (item 6-25) and `vec(r)` is position vector (ISO 80000-3, item 3-1.11) along a given curve `C` from point `a` to point `b`
         * remarks: For an irrotational magnetic field strength this quantity is equal to the magnetic potential difference. See IEC 60050-121, item121-11-57.
         */
    }

    /* IEC-80000-6 item 6-37.3 magnetomotive force */
    attribute def MagnetomotiveForceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-37.3 magnetomotive force
         * symbol(s): `F_m`
         * application domain: generic
         * name: MagnetomotiveForce
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: `F_m = oint_C vec(H) * d vec(r)` where `vec(H)` is magnetic field strength (item 6-25) and `vec(r)` is position vector (ISO 80000-3, item 3-1 .11) along a closed curve `C`
         * remarks: This quantity name is under consideration . Compare remark to item 6-36. See IEC 60050-121, item 121-11-60.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MagnetomotiveForceUnit[1];
    }

    attribute magnetomotiveForce: MagnetomotiveForceValue[*] nonunique :> scalarQuantities;

    attribute def MagnetomotiveForceUnit :> DerivedUnit {
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = electricCurrentPF; }
    }

    /* IEC-80000-6 item 6-37.4 current linkage */
    attribute currentLinkage: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-37.4 current linkage
         * symbol(s): `Θ`
         * application domain: generic
         * name: CurrentLinkage (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: net electric current (item 6-1) through a surface delimited by a closed loop
         * remarks: When `Θ` results from `N` (item 6-38) equal electric currents `I` (item 6-1 ), then `Θ = N I`. See IEC 60050-121 , item 121 -11-46.
         */
    }

    /* IEC-80000-6 item 6-38 number of turns in a winding */
    attribute numberOfTurnsInAWinding: CountValue :> scalarQuantities {
        doc
        /*
         * source: item 6-38 number of turns in a winding
         * symbol(s): `N`
         * application domain: generic
         * name: NumberOfTurnsInAWinding (specializes Count)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: number of turns in a winding (same as the quantity name)
         * remarks: N may be non-integer number, see ISO 80000-3, item 3-14.
         */
    }

    /* IEC-80000-6 item 6-39 reluctance */
    attribute def ReluctanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-39 reluctance
         * symbol(s): `R_m`, `R`
         * application domain: generic
         * name: Reluctance
         * quantity dimension: L^-2*M^-1*T^2*I^2
         * measurement unit(s): H^-1
         * tensor order: 0
         * definition: `R_m = U_m/Φ` where `U_m` is magnetic tension (item 6-37.2) and `Φ` is magnetic flux (item 6-22 .1)
         * remarks: See IEC 60050-131 , item 131-12-28.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ReluctanceUnit[1];
    }

    attribute reluctance: ReluctanceValue[*] nonunique :> scalarQuantities;

    attribute def ReluctanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-40 permeance */
    attribute def PermeanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-40 permeance
         * symbol(s): `Λ`
         * application domain: generic
         * name: Permeance
         * quantity dimension: L^2*M^1*T^-2*I^-2
         * measurement unit(s): H
         * tensor order: 0
         * definition: `Λ = 1/R_m` where `R_m` is reluctance (item 6-39)
         * remarks: See IEC 60050-131 , item 131-12-29.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PermeanceUnit[1];
    }

    attribute permeance: PermeanceValue[*] nonunique :> scalarQuantities;

    attribute def PermeanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-41.1 inductance, self inductance */
    attribute def InductanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-41.1 inductance, self inductance
         * symbol(s): `L`, `L_m`
         * application domain: generic
         * name: Inductance
         * quantity dimension: L^2*M^1*T^-2*I^-2
         * measurement unit(s): H
         * tensor order: 0
         * definition: `L = Ψ / I` where `I` is an electric current (item 6-1) in a thin conducting loop and `Ψ` is the linked flux (item 6-22.2) caused by that electric current
         * remarks: The name "self inductance" is used for the quantity associated to mutual inductance when `n = m`. See IEC 60050-131 , items 131-12-19 and 131 -12-35.
         */
        attribute :>> num: Real;
        attribute :>> mRef: InductanceUnit[1];
    }

    attribute inductance: InductanceValue[*] nonunique :> scalarQuantities;

    attribute def InductanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias SelfInductanceUnit for InductanceUnit;
    alias SelfInductanceValue for InductanceValue;
    alias selfInductance for inductance;

    /* IEC-80000-6 item 6-41.2 mutual inductance */
    attribute mutualInductance: InductanceValue :> scalarQuantities {
        doc
        /*
         * source: item 6-41.2 mutual inductance
         * symbol(s): `L_(mn)`
         * application domain: generic
         * name: MutualInductance (specializes Inductance)
         * quantity dimension: L^2*M^1*T^-2*I^-2
         * measurement unit(s): H
         * tensor order: 0
         * definition: `L_(mn) = Ψ_m / I_n` where `I_n` is an electric current (item 6-1) in a thin conducting loop `n` and `Ψ_m` is the linked flux (item 6-22.2) caused by that electric current in another loop `m`
         * remarks: `L_(mn) = L_(nm)`. For two loops , the symbol `M` is used for `L_(12)`. See IEC 60050-131, items 131-12-36.
         */
    }

    /* IEC-80000-6 item 6-42.1 coupling factor */
    attribute def CouplingFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-42.1 coupling factor
         * symbol(s): `k`
         * application domain: generic
         * name: CouplingFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for inductive coupling between two inductive elements `k = |L_(mn)| / sqrt(L_m L_n)` where `L_m` and `L_n` are their self inductances (item 6-41 .1 ), and `L_(mn)` is their mutual inductance (item 6-41.2)
         * remarks: See IEC 60050-131 , item 131-12-41.
         */
    }
    attribute couplingFactor: CouplingFactorValue :> scalarQuantities;

    /* IEC-80000-6 item 6-42.2 leakage factor */
    attribute def LeakageFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-42.2 leakage factor
         * symbol(s): `σ`
         * application domain: generic
         * name: LeakageFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `σ = 1 - k^2` where `k` is the coupling factor (item 6-42 .1)
         * remarks: See IEC 60050-131 , item 131-12-42.
         */
    }
    attribute leakageFactor: LeakageFactorValue :> scalarQuantities;

    /* IEC-80000-6 item 6-43 conductivity */
    attribute def ConductivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-43 conductivity
         * symbol(s): `σ`, `γ`
         * application domain: generic
         * name: Conductivity
         * quantity dimension: L^-3*M^-1*T^3*I^2
         * measurement unit(s): S/m
         * tensor order: 0
         * definition: `vec(J) = σ vec(E)` where `vec(J)` is electric current density (item 6-8) and `vec(E)` is electric field strength (item 6-10)
         * remarks: This definition applies to an isotropic medium. For an anisotropic medium `σ` is a second order tensor. `κ` is used in electrochemistry. See IEC 60050-121 , item 121-12-03.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ConductivityUnit[1];
    }

    attribute conductivity: ConductivityValue[*] nonunique :> scalarQuantities;

    attribute def ConductivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-44 resistivity */
    attribute def ResistivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-44 resistivity
         * symbol(s): `ρ`
         * application domain: generic
         * name: Resistivity
         * quantity dimension: L^3*M^1*T^-3*I^-2
         * measurement unit(s): Ω*m
         * tensor order: 0
         * definition: `ρ = 1/σ` if is exists, where `σ` is conductivity (item 6-43)
         * remarks: See IEC 60050-121, item 121-12-04.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ResistivityUnit[1];
    }

    attribute resistivity: ResistivityValue[*] nonunique :> scalarQuantities;

    attribute def ResistivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-45 electric power, instantaneous power */
    attribute electricPower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-45 electric power, instantaneous power
         * symbol(s): `p`
         * application domain: generic
         * name: ElectricPower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): W
         * tensor order: 0
         * definition: `p = ui` where `u` is instantaneous voltage (item 6-11 .3) and `i` is instantaneous electric current (item 6-1)
         * remarks: See IEC 60050-131 , item 131-11-30.
         */
    }

    alias instantaneousPower for electricPower;

    /* IEC-80000-6 item 6-46 resistance */
    attribute def ResistanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-46 resistance
         * symbol(s): `R`
         * application domain: generic
         * name: Resistance
         * quantity dimension: L^2*M^1*T^-3*I^-2
         * measurement unit(s): Ω
         * tensor order: 0
         * definition: for resistive component `R = u i` where `u` is instantaneous voltage (item 6-11.3) and `i` is instantaneous electric current (item 6-1)
         * remarks: For alternating current, see item 6-51.2. See IEC 60050-131, item 131-12-04.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ResistanceUnit[1];
    }

    attribute resistance: ResistanceValue[*] nonunique :> scalarQuantities;

    attribute def ResistanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-47 conductance */
    attribute def ConductanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-47 conductance
         * symbol(s): `G`
         * application domain: generic
         * name: Conductance
         * quantity dimension: L^-2*M^-1*T^3*I^2
         * measurement unit(s): S
         * tensor order: 0
         * definition: for resistive component `G = 1/R` where `R` is resistance (item 6-46)
         * remarks: For alternating current, see item 6-52.2. See IEC 60050-131, item 131-12-06.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ConductanceUnit[1];
    }

    attribute conductance: ConductanceValue[*] nonunique :> scalarQuantities;

    attribute def ConductanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-48 phase difference */
    attribute def PhaseDifferenceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-48 phase difference
         * symbol(s): `φ`
         * application domain: generic
         * name: PhaseDifference
         * quantity dimension: 1
         * measurement unit(s): rad
         * tensor order: 0
         * definition: `φ = φ_u - φ_i` where `φ_u` is the initial phase of the voltage (item 6-11 .3) and `φ_i` is the initial phase of the electric current (item 6-1)
         * remarks: When `u = hat(U) cos(ωt - φ_u)`, `i = hat(I) cos(ωt - φ_i)` where `u` is the voltage (item 6-11 . 3) and `i` is the electric current (item 6-1 ), `ω` is angular frequency (ISO 80000-3, item 3-16) and `t` is time (ISO 80000-3, item 3-7), then `φ` is phase difference. For phase angle, see items 6-49 and 6-50.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhaseDifferenceUnit[1];
    }

    attribute phaseDifference: PhaseDifferenceValue[*] nonunique :> scalarQuantities;

    attribute def PhaseDifferenceUnit :> DimensionOneUnit {
    }

    /* IEC-80000-6 item 6-49 electric current phasor */
    attribute electricCurrentPhasor: ElectricCurrentValue :> scalarQuantities {
        doc
        /*
         * source: item 6-49 electric current phasor
         * symbol(s): `underline(I)`
         * application domain: generic
         * name: ElectricCurrentPhasor (specializes ElectricCurrent)
         * quantity dimension: I^1
         * measurement unit(s): A
         * tensor order: 0
         * definition: when `i = hat(I) cos(ωt + α)`, where `i` is the electric current (item 6-1 ), `ω` is angular frequency (ISO 80000-3, item 3-16), `t` is time (ISO 80000-3, item 3-7), and `α` is initial phase (ISO 80000-3, item 3-5), then `underline(l) = I e^(jα)`
         * remarks: `underline(l)` is the complex representation of the electric current `i = hat(I) cos(ωt + α)`. `j` is the imaginary unit.
         */
    }

    /* IEC-80000-6 item 6-50 voltage phasor */
    attribute voltagePhasor: ElectricPotentialDifferenceValue :> scalarQuantities {
        doc
        /*
         * source: item 6-50 voltage phasor
         * symbol(s): `underline(U)`
         * application domain: generic
         * name: VoltagePhasor (specializes ElectricPotentialDifference)
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V
         * tensor order: 0
         * definition: when `u = hat(U) cos(ωt + α)`, where `u` is the voltage (item 6-11.3 ), `ω` is angular frequency (ISO 80000-3, item 3-16), `t` is time (ISO 80000-3, item 3-7), and `α` is initial phase (ISO 80000-3, item 3-5), then `underline(U) = U e^(jα)`
         * remarks: `underline(U)` is the complex representation of the voltage `u = hat(U) cos(ωt + α)`. `j` is the imaginary unit.
         */
    }

    /* IEC-80000-6 item 6-51.1 impedance, complex impedance */
    attribute def ImpedanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-51.1 impedance, complex impedance
         * symbol(s): `underline(Z)`
         * application domain: generic
         * name: Impedance
         * quantity dimension: L^2*M^1*T^-3*I^-2
         * measurement unit(s): Ω
         * tensor order: 0
         * definition: `underline(Z) = underline(U)/underline(I)` where `underline(U)` is the voltage phasor (item 6-50), and `underline(I)` is the electric current phasor (item 6-49)
         * remarks: `underline(Z) = R + jX`, where `R` is resistance (item 6-51.2) and `X` is reactance (item 6-51 .3). `j` is the imaginary unit. `underline(Z) = |underline(Z)| e^(jφ)`. See IEC 60050-131 , item 131-12-43.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ImpedanceUnit[1];
    }

    attribute impedance: ImpedanceValue[*] nonunique :> scalarQuantities;

    attribute def ImpedanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias ComplexImpedanceUnit for ImpedanceUnit;
    alias ComplexImpedanceValue for ImpedanceValue;
    alias complexImpedance for impedance;

    /* IEC-80000-6 item 6-51.2 resistance to alternating current */
    attribute def ResistanceToAlternatingCurrentValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-51.2 resistance to alternating current
         * symbol(s): `R`
         * application domain: generic
         * name: ResistanceToAlternatingCurrent
         * quantity dimension: L^2*M^1*T^-3*I^-2
         * measurement unit(s): Ω
         * tensor order: 0
         * definition: `R = "Re" underline(Z)` where `underline(Z)`, is impedance (item 6-5.1) and `"Re"` denotes the real part
         * remarks: See IEC 60050-131, item 131-12-45.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ResistanceToAlternatingCurrentUnit[1];
    }

    attribute resistanceToAlternatingCurrent: ResistanceToAlternatingCurrentValue[*] nonunique :> scalarQuantities;

    attribute def ResistanceToAlternatingCurrentUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-51.3 reactance */
    attribute def ReactanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-51.3 reactance
         * symbol(s): `X`
         * application domain: generic
         * name: Reactance
         * quantity dimension: L^2*M^1*T^-3*I^-2
         * measurement unit(s): Ω
         * tensor order: 0
         * definition: `X = "Im" underline(Z)` where `underline(Z)`, is impedance (item 6-5.1) and `"Im"` denotes the imaginary part
         * remarks: `X = ωL - 1/(ωC)`. See IEC 60050-131 , item 131-12-46.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ReactanceUnit[1];
    }

    attribute reactance: ReactanceValue[*] nonunique :> scalarQuantities;

    attribute def ReactanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-51.4 modulus of impedance */
    attribute def ModulusOfImpedanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-51.4 modulus of impedance
         * symbol(s): `Z`
         * application domain: generic
         * name: ModulusOfImpedance
         * quantity dimension: L^2*M^1*T^-3*I^-2
         * measurement unit(s): Ω
         * tensor order: 0
         * definition: `Z = |underline(Z)|` where `underline(Z)` is impedance (item 6-51.1)
         * remarks: See IEC 60050-131 , item 131-12-44. Apparent impedance is defined more generally as the quotient of rms voltage and rms electric  current; it is often denoted by `Z`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ModulusOfImpedanceUnit[1];
    }

    attribute modulusOfImpedance: ModulusOfImpedanceValue[*] nonunique :> scalarQuantities;

    attribute def ModulusOfImpedanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-52.1 admittance, complex admittance */
    attribute def AdmittanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-52.1 admittance, complex admittance
         * symbol(s): `underline(Y)`
         * application domain: generic
         * name: Admittance
         * quantity dimension: L^-2*M^-1*T^3*I^2
         * measurement unit(s): S
         * tensor order: 0
         * definition: `underline(Y) = 1/underline(Z)` where `underline(Z)` is impedance (item 6-51.1)
         * remarks: `underline(Y) = G + jB`, where `G` is conductance (item 6-52 .2) and `B` is susceptance (item 6-52 .3). `j` is the imaginary unit. `underline(Y) = |underline(Y)| e^-(jφ)`. See IEC 60050-131, item 131 -12-51.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AdmittanceUnit[1];
    }

    attribute admittance: AdmittanceValue[*] nonunique :> scalarQuantities;

    attribute def AdmittanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    alias ComplexAdmittanceUnit for AdmittanceUnit;
    alias ComplexAdmittanceValue for AdmittanceValue;
    alias complexAdmittance for admittance;

    /* IEC-80000-6 item 6-52.2 conductance for alternating current */
    attribute conductanceForAlternatingCurrent: ConductanceValue :> scalarQuantities {
        doc
        /*
         * source: item 6-52.2 conductance for alternating current
         * symbol(s): `G`
         * application domain: generic
         * name: ConductanceForAlternatingCurrent (specializes Conductance)
         * quantity dimension: L^-2*M^-1*T^3*I^2
         * measurement unit(s): S
         * tensor order: 0
         * definition: `G = "Re" underline(Y)` where I is admittance (item 6-52.1)
         * remarks: See IEC 60050-131, item 131-12-53.
         */
    }

    /* IEC-80000-6 item 6-52.3 susceptance */
    attribute def SusceptanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-52.3 susceptance
         * symbol(s): `B`
         * application domain: generic
         * name: Susceptance
         * quantity dimension: L^-2*M^-1*T^3*I^2
         * measurement unit(s): S
         * tensor order: 0
         * definition: `B = "Im" underline(Y)` where `underline(Y)` is admittance (item 6-52.1)
         * remarks: See IEC 60050-131, item 131-12-54.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SusceptanceUnit[1];
    }

    attribute susceptance: SusceptanceValue[*] nonunique :> scalarQuantities;

    attribute def SusceptanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-52.4 modulus of admittance */
    attribute def ModulusOfAdmittanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 6-52.4 modulus of admittance
         * symbol(s): `Y`
         * application domain: generic
         * name: ModulusOfAdmittance
         * quantity dimension: L^-2*M^-1*T^3*I^2
         * measurement unit(s): S
         * tensor order: 0
         * definition: `Y = |underline(Y)|` where `underline(Y)` is admittance (item 6-52.1)
         * remarks: Apparent admittance is defined more generally as the quotient of rms electric current voltage and rms voltage; it is often denoted by `Y`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ModulusOfAdmittanceUnit[1];
    }

    attribute modulusOfAdmittance: ModulusOfAdmittanceValue[*] nonunique :> scalarQuantities;

    attribute def ModulusOfAdmittanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF); }
    }

    /* IEC-80000-6 item 6-53 quality factor */
    attribute def QualityFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-53 quality factor
         * symbol(s): `Q`
         * application domain: generic
         * name: QualityFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: for non-radiating systems, if `underline(Z) = R + jX`, then `Q = |X|/R` where `underline(Z)` is impedance (item 6-51. 1), `R` is resistance (item 6-51 .2), and `X` is reactance (item 6-51.3)
         * remarks: None.
         */
    }
    attribute qualityFactor: QualityFactorValue :> scalarQuantities;

    /* IEC-80000-6 item 6-54 loss factor */
    attribute def LossFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-54 loss factor
         * symbol(s): `d`
         * application domain: generic
         * name: LossFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `d = 1/Q` where `Q` quality factor (item 6-53)
         * remarks: It is also named dissipation factor.
         */
    }
    attribute lossFactor: LossFactorValue :> scalarQuantities;

    /* IEC-80000-6 item 6-55 loss angle */
    attribute lossAngle: AngularMeasureValue :> scalarQuantities {
        doc
        /*
         * source: item 6-55 loss angle
         * symbol(s): `δ`
         * application domain: generic
         * name: LossAngle (specializes AngularMeasure)
         * quantity dimension: 1
         * measurement unit(s): rad
         * tensor order: 0
         * definition: `δ = arctan d` where `d` is loss factor (item 6-54)
         * remarks: See IEC 60050-131 , item 131-12-49.
         */
    }

    /* IEC-80000-6 item 6-56 active power */
    attribute activePower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-56 active power
         * symbol(s): `P`
         * application domain: generic
         * name: ActivePower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): W
         * tensor order: 0
         * definition: `P = 1/T int_0^T p dt` where `T` is the period (ISO 80000-3, item 3-12) and `p` is instantaneous power (item 6-45)
         * remarks: In complex notation, `P = "Re" underline(S)` where `underline(S)` is complex power (item 6-59).
         */
    }

    /* IEC-80000-6 item 6-57 apparent power */
    attribute apparentPower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-57 apparent power
         * symbol(s): ``, `underline(S)`, ``
         * application domain: generic
         * name: ApparentPower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): V*A
         * tensor order: 0
         * definition: `|underline(S)| = U I` where `U` is rms value of voltage (item 6-11.3 and `I` is rms value of electric current (item 6-1)
         * remarks: `U = sqrt(1/T int_0^T u^2 dt)` and `I = sqrt(1/T int_0^T i^2 dt)`. When `u = sqrt 2 U cos(ωt)` and `i = sqrt 2 I cos(ωt - φ)`, then `P = U I cos(φ)`, `Q = U I sin(φ)` and `λ = cos(φ)` . See IEC 60050-131, item 131-11-41 .
         */
    }

    /* IEC-80000-6 item 6-58 power factor */
    attribute def PowerFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 6-58 power factor
         * symbol(s): `λ`
         * application domain: generic
         * name: PowerFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: `λ = |P|/|S|` where `P`  is active power (item 6-56) and `S` is apparent power (item 6-57)
         * remarks: See I EC 60050-131, item 131-11-46.
         */
    }
    attribute powerFactor: PowerFactorValue :> scalarQuantities;

    /* IEC-80000-6 item 6-59 complex power */
    attribute complexPower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-59 complex power
         * symbol(s): `underline(S)`
         * application domain: generic
         * name: ComplexPower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): V*A
         * tensor order: 0
         * definition: `underline(S) = underline(U) * underline(I)^"*"` where `underline(U)` is voltage phasor (item 6-50) and `underline(I)^"*"` is the complex conjugate of the current phasor (item 6-49)
         * remarks: `underline(S) = P + jQ` where `P` is active power (item 6-56) and `Q` is reactive power (item 6-60). See IEC 60050-131, item 131-11-39.
         */
    }

    /* IEC-80000-6 item 6-60 reactive power */
    attribute reactivePower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-60 reactive power
         * symbol(s): `Q`
         * application domain: generic
         * name: ReactivePower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): V*A, var
         * tensor order: 0
         * definition: `Q = "Im" underline(S)` where `underline(S)` is complex power (item 6-59)
         * remarks: See IEC 60050-131, item 131-11-44.
         */
    }

    /* IEC-80000-6 item 6-61 non-active power */
    attribute nonActivePower: PowerValue :> scalarQuantities {
        doc
        /*
         * source: item 6-61 non-active power
         * symbol(s): `Q'`
         * application domain: generic
         * name: NonActivePower (specializes Power)
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): V*A
         * tensor order: 0
         * definition: `Q' = sqrt(|underline(S)|^2 - P^2)` where `|underline(S)|` is apparent power (item 6-57) and `P` is active power (item 6-56)
         * remarks: See IEC 60050-131, item 131-11-43.
         */
    }

    /* IEC-80000-6 item 6-62 active energy */
    attribute activeEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 6-62 active energy
         * symbol(s): `W`
         * application domain: generic
         * name: ActiveEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, W*h
         * tensor order: 0
         * definition: `W = int_(t_1)^(t_2) p dt` where `p` is instantaneous power (item 6-45), and the integral interval is the time interval from `t_1` to `t_2`
         * remarks: None.
         */
    }

}
