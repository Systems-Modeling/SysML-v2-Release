standard library package ISQCondensedMatter {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard ISO-80000-12:2019 "Condensed matter physics"
     * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-12:ed-2:v1:en
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
    private import ISQElectromagnetism::ElectricPotentialDifferenceValue;
    private import ISQElectromagnetism::MagneticFluxDensityValue;
    private import ISQElectromagnetism::ResistivityValue;
    private import ISQSpaceTime::AngularFrequencyValue;
    private import ISQSpaceTime::AngularMeasureValue;
    private import ISQSpaceTime::RepetencyValue;
    private import ISQThermodynamics::EnergyValue;

    /* ISO-80000-12 item 12-1.1 lattice vector */
    attribute def Cartesian3dLatticeVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-1.1 lattice vector
         * symbol(s): `vec(R)`
         * application domain: generic
         * name: LatticeVector (specializes Displacement)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: translation vector that maps the crystal lattice on itself
         * remarks: The non-SI unit ångström (Å) is widely used by x-ray crystallographers and structural chemists.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute latticeVector: Cartesian3dLatticeVector :> vectorQuantities;

    /* ISO-80000-12 item 12-1.2 fundamental lattice vector */
    attribute def Cartesian3dFundamentalLatticeVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-1.2 fundamental lattice vector
         * symbol(s): `vec(a_1),vec(a_2),vec(a_3)`, `vec(a),vec(b),vec(c)`
         * application domain: generic
         * name: FundamentalLatticeVector (specializes Displacement)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: fundamental translation vectors for the crystal lattice
         * remarks: The lattice vector (item 12-1.1) can be given as `vec(R) = n_1 vec(a_1) + n_2 vec(a_2) + n_3 vec(a_3)` where `n_1`, `n_2` and `n_3` are integers.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute fundamentalLatticeVector: Cartesian3dFundamentalLatticeVector :> vectorQuantities;

    /* ISO-80000-12 item 12-2.1 angular reciprocal lattice vector */
    attribute def AngularReciprocalLatticeVectorMagnitudeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-2.1 angular reciprocal lattice vector (magnitude)
         * symbol(s): `G`
         * application domain: generic
         * name: AngularReciprocalLatticeVectorMagnitude
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: vector whose scalar products with all fundamental lattice vectors are integral multiples of  `2π`
         * remarks: In crystallography, however, the quantity `G/(2π)` is sometimes used.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AngularReciprocalLatticeVectorMagnitudeUnit[1];
    }

    attribute angularReciprocalLatticeVectorMagnitude: AngularReciprocalLatticeVectorMagnitudeValue[*] nonunique :> scalarQuantities;

    attribute def AngularReciprocalLatticeVectorMagnitudeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    attribute def Cartesian3dAngularReciprocalLatticeVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-2.1 angular reciprocal lattice vector
         * symbol(s): `vec(G)`
         * application domain: generic
         * name: AngularReciprocalLatticeVector
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 1
         * definition: vector whose scalar products with all fundamental lattice vectors are integral multiples of  `2π`
         * remarks: In crystallography, however, the quantity `G/(2π)` is sometimes used.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dAngularReciprocalLatticeCoordinateFrame[1];
    }

    attribute angularReciprocalLatticeVector: Cartesian3dAngularReciprocalLatticeVector :> vectorQuantities;

    attribute def Cartesian3dAngularReciprocalLatticeCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: AngularReciprocalLatticeVectorMagnitudeUnit[3];
    }

    /* ISO-80000-12 item 12-2.2 fundamental reciprocal lattice vector */
    attribute def FundamentalReciprocalLatticeVectorMagnitudeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-2.2 fundamental reciprocal lattice vector (magnitude)
         * symbol(s): `b_1,b_2,b_3`
         * application domain: generic
         * name: FundamentalReciprocalLatticeVectorMagnitude
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: fundamental translation vectors for the reciprocal lattice
         * remarks: `vec(a_i) * vec(b_i) = 2π δ_(ij)`. In crystallography, however, the quantities `vec(b_j)/(2π)` are also often used.
         */
        attribute :>> num: Real;
        attribute :>> mRef: FundamentalReciprocalLatticeVectorMagnitudeUnit[1];
    }

    attribute fundamentalReciprocalLatticeVectorMagnitude: FundamentalReciprocalLatticeVectorMagnitudeValue[*] nonunique :> scalarQuantities;

    attribute def FundamentalReciprocalLatticeVectorMagnitudeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    attribute def Cartesian3dFundamentalReciprocalLatticeVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-2.2 fundamental reciprocal lattice vector
         * symbol(s): `vec(b_1),vec(b_2),vec(b_3)`
         * application domain: generic
         * name: FundamentalReciprocalLatticeVector
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 1
         * definition: fundamental translation vectors for the reciprocal lattice
         * remarks: `vec(a_i) * vec(b_i) = 2π δ_(ij)`. In crystallography, however, the quantities `vec(b_j)/(2π)` are also often used.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dFundamentalReciprocalLatticeCoordinateFrame[1];
    }

    attribute fundamentalReciprocalLatticeVector: Cartesian3dFundamentalReciprocalLatticeVector :> vectorQuantities;

    attribute def Cartesian3dFundamentalReciprocalLatticeCoordinateFrame :> VectorMeasurementReference {
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> isOrthogonal = true;
        attribute :>> mRefs: FundamentalReciprocalLatticeVectorMagnitudeUnit[3];
    }

    /* ISO-80000-12 item 12-3 lattice plane spacing */
    attribute latticePlaneSpacing: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-3 lattice plane spacing
         * symbol(s): `d`
         * application domain: generic
         * name: LatticePlaneSpacing (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: distance (ISO 80000-3) between successive lattice planes
         * remarks: The non-SI unit ångström (Å) is widely used by x-ray crystallographers and structural chemists.
         */
    }

    /* ISO-80000-12 item 12-4 Bragg angle */
    attribute braggAngle: AngularMeasureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-4 Bragg angle
         * symbol(s): `ϑ`
         * application domain: generic
         * name: BraggAngle (specializes AngularMeasure)
         * quantity dimension: 1
         * measurement unit(s): °, 1
         * tensor order: 0
         * definition: angle between the scattered ray and the lattice plane
         * remarks: Bragg angle `ϑ` is given by `2d sin ϑ = nλ`, where `d` is the lattice plane spacing (item 12-3), `λ` is the wavelength (ISO 80000-7) of the radiation, and `n` is the order of reflexion which is an integer.
         */
    }

    /* ISO-80000-12 item 12-5.1 short-range order parameter */
    attribute def ShortRangeOrderParameterValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-5.1 short-range order parameter
         * symbol(s): `r`, `σ`
         * application domain: generic
         * name: ShortRangeOrderParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: fraction of nearest-neighbour atom pairs in an Ising ferromagnet having magnetic moments in one direction, minus the fraction having magnetic moments in the opposite direction
         * remarks: Similar definitions apply to other order-disorder phenomena. Other symbols are frequently used.
         */
    }
    attribute shortRangeOrderParameter: ShortRangeOrderParameterValue :> scalarQuantities;

    /* ISO-80000-12 item 12-5.2 long-range order parameter */
    attribute def LongRangeOrderParameterValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-5.2 long-range order parameter
         * symbol(s): `R`, `s`
         * application domain: generic
         * name: LongRangeOrderParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: fraction of atoms in an Ising ferromagnet having magnetic moments in one direction, minus the fraction having magnetic moments in the opposite direction
         * remarks: Similar definitions apply to other order-disorder phenomena. Other symbols are frequently used.
         */
    }
    attribute longRangeOrderParameter: LongRangeOrderParameterValue :> scalarQuantities;

    /* ISO-80000-12 item 12-5.3 atomic scattering factor */
    attribute def AtomicScatteringFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-5.3 atomic scattering factor
         * symbol(s): `f`
         * application domain: generic
         * name: AtomicScatteringFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of radiation amplitude scattered by the atom and radiation amplitude scattered by a single electron
         * remarks: The atomic scattering factor can be expressed by: `f = E_a/(E_e`, where `E_a` is the radiation amplitude scattered by the atom and `E_e` is the radiation amplitude scattered by a single electron.
         */
    }
    attribute atomicScatteringFactor: AtomicScatteringFactorValue :> scalarQuantities;

    /* ISO-80000-12 item 12-5.4 structure factor */
    attribute def StructureFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-5.4 structure factor
         * symbol(s): `F(h,k,l)`
         * application domain: generic
         * name: StructureFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `F(h,k,l) = sum_(n=1)^N f_n exp[2π i (h x_n + k y_n + l z_n)]`, where `f_n` is the atomic scattering factor (item 12-5.3) for atom `n`, `x_n`, `y_n`, `z_n` are fractional coordinates of its position, `N` is the total number of atoms in the unit cell and `h`, `k`, `l` are the Miller indices
         * remarks: For the Miller indices `h`, `k`, `l`, see Annex A.
         */
    }
    attribute structureFactor: StructureFactorValue :> scalarQuantities;

    /* ISO-80000-12 item 12-6 Burgers vector */
    attribute def Cartesian3dBurgersVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-6 Burgers vector
         * symbol(s): `vec(b)`
         * application domain: generic
         * name: BurgersVector (specializes Displacement)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: closing vector in a sequence of vectors encircling a dislocation
         * remarks: None.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute burgersVector: Cartesian3dBurgersVector :> vectorQuantities;

    /* ISO-80000-12 item 12-7.1 particle position vector */
    attribute def Cartesian3dParticlePositionVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-7.1 particle position vector
         * symbol(s): `vec(r)`, `vec(R)`
         * application domain: generic
         * name: ParticlePositionVector (specializes PositionVector)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: position vector (ISO 80000-3) of a particle
         * remarks: Often, `r` is used for electrons and `R` is used for atoms and other heavier particles.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = true;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute particlePositionVector: Cartesian3dParticlePositionVector :> vectorQuantities;

    /* ISO-80000-12 item 12-7.2 equilibrium position vector */
    attribute def Cartesian3dEquilibriumPositionVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-7.2 equilibrium position vector
         * symbol(s): `vec(R_0)`
         * application domain: condensed matter physics
         * name: EquilibriumPositionVector (specializes PositionVector)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: position vector (ISO 80000-3) of an ion or atom in equilibrium
         * remarks: None.
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = true;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute equilibriumPositionVector: Cartesian3dEquilibriumPositionVector :> vectorQuantities;

    /* ISO-80000-12 item 12-7.3 displacement vector */
    attribute def Cartesian3dDisplacementVector :> VectorQuantityValue {
        doc
        /*
         * source: item 12-7.3 displacement vector
         * symbol(s): `vec(u)`
         * application domain: condensed matter physics
         * name: DisplacementVector (specializes Displacement)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 1
         * definition: difference between the position vector (ISO 80000-3) of an ion or atom and its position vector in equilibrium
         * remarks: The displacement vector can be expressed by: `vec(u) = vec(R) − vec(R_0)`, where `vec(R)` is particle position vector (item 12-7.1) and `vec(R_0)` is position vector of an ion or atom in equilibrium (item 12-7.2).
         */
        attribute :>> dimensions = 3;
        attribute :>> isBound = false;
        attribute :>> num: Real[3];
        attribute :>> mRef: Cartesian3dSpatialCoordinateFrame[1];
    }

    attribute displacementVector: Cartesian3dDisplacementVector :> vectorQuantities;

    /* ISO-80000-12 item 12-8 Debye-Waller factor */
    attribute def DebyeWallerFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-8 Debye-Waller factor
         * symbol(s): `D`, `B`
         * application domain: generic
         * name: DebyeWallerFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: factor by which the intensity of a diffraction line is reduced because of the lattice vibrations
         * remarks: `D` is sometimes expressed as `D = exp(−2W)`; in Mössbauer spectroscopy, it is also called the `f` factor and denoted by `f`.
         */
    }
    attribute debyeWallerFactor: DebyeWallerFactorValue :> scalarQuantities;

    /* ISO-80000-12 item 12-9.1 angular wavenumber, angular repetency */
    attribute angularWavenumber: RepetencyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-9.1 angular wavenumber, angular repetency
         * symbol(s): `k`, `q`
         * application domain: condensed matter physics
         * name: AngularWavenumber (specializes Repetency)
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: quotient of momentum (ISO 80000-4) and the reduced Planck constant (ISO 80000-1)
         * remarks: The corresponding vector (ISO 80000-2) quantity is called wave vector (ISO 80000-3), expressed by: `vec(k) = vec(p)/ħ`, where `vec(p)` is the momentum (ISO 80000-4) of quasi free electrons in an electron gas, and `ħ` is the reduced Planck constant (ISO 80000-1); for phonons, its magnitude is `k = 2π/λ`, where `λ` is the wavelength (ISO 80000-3) of the lattice vibrations. When a distinction is needed between `k` and the symbol for the Boltzmann constant (ISO 80000-1), `k_B` can be used for the latter. When a distinction is needed, `q` should be used for phonons, and `k` for particles such as electrons and neutrons. The method of cut-off must be specified. In condensed matter physics, angular wavenumber is often called wavenumber.
         */
    }

    alias angularRepetency for angularWavenumber;

    /* ISO-80000-12 item 12-9.2 Fermi angular wavenumber, Fermi angular repetency */
    attribute fermiAngularWavenumber: RepetencyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-9.2 Fermi angular wavenumber, Fermi angular repetency
         * symbol(s): `k_F`
         * application domain: generic
         * name: FermiAngularWavenumber (specializes Repetency)
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: angular wavenumber (item 12-9.1) of electrons in states on the Fermi sphere
         * remarks: In condensed matter physics, angular wavenumber is often called wavenumber.
         */
    }

    alias fermiAngularRepetency for fermiAngularWavenumber;

    /* ISO-80000-12 item 12-9.3 Debye angular wavenumber, Debye angular repetency */
    attribute debyeAngularWavenumber: RepetencyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-9.3 Debye angular wavenumber, Debye angular repetency
         * symbol(s): `q_D`
         * application domain: generic
         * name: DebyeAngularWavenumber (specializes Repetency)
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: cut-off angular wavenumber (item 12-9.1) in the Debye model of the vibrational spectrum of a solid
         * remarks: The method of cut-off must be specified. In condensed matter physics, angular wavenumber is often called wavenumber.
         */
    }

    alias debyeAngularRepetency for debyeAngularWavenumber;

    /* ISO-80000-12 item 12-10 Debye angular frequency */
    attribute debyeAngularFrequency: AngularFrequencyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-10 Debye angular frequency
         * symbol(s): `ω_D`
         * application domain: generic
         * name: DebyeAngularFrequency (specializes AngularFrequency)
         * quantity dimension: T^-1
         * measurement unit(s): s^-1
         * tensor order: 0
         * definition: cut-off angular frequency (ISO 80000-3) in the Debye model of the vibrational spectrum of a solid
         * remarks: The method of cut-off must be specified.
         */
    }

    /* ISO-80000-12 item 12-11 Debye temperature */
    attribute debyeTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-11 Debye temperature
         * symbol(s): `Θ_D`
         * application domain: generic
         * name: DebyeTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: in the Debye model, quantity given by: `Θ_D = ħ*ω_D/k`, where `k` is the Boltzmann constant, (ISO 80000-1), `ħ` is the reduced Planck constant (ISO 80000-1), and `ω_D` is Debye angular frequency (item 12-10)
         * remarks: A Debye temperature can also be defined by fitting a Debye model result to a certain quantity, for instance, the heat capacity at a certain temperature.
         */
    }

    /* ISO-80000-12 item 12-12 density of vibrational states */
    attribute def DensityOfVibrationalStatesValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-12 density of vibrational states
         * symbol(s): `g`
         * application domain: angular frequency
         * name: DensityOfVibrationalStates
         * quantity dimension: L^-3*T^1
         * measurement unit(s): m^-3*s
         * tensor order: 0
         * definition: quotient of the number of vibrational modes in an infinitesimal interval of angular frequency (ISO 80000-3), and the product of the width of that interval and volume (ISO 80000-3)
         * remarks: `g(ω) = n_ω = (dn(ω))/(dω)`, where `n(ω)` is the total number of vibrational modes per volume with angular frequency less than `ω`. The density of states may also be normalized in other ways instead of with respect to volume. See also item 12-16.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DensityOfVibrationalStatesUnit[1];
    }

    attribute densityOfVibrationalStates: DensityOfVibrationalStatesValue[*] nonunique :> scalarQuantities;

    attribute def DensityOfVibrationalStatesUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-12 item 12-13 thermodynamic Grüneisen parameter */
    attribute def 'ThermodynamicGrüneisenParameterValue' :> DimensionOneValue {
        doc
        /*
         * source: item 12-13 thermodynamic Grüneisen parameter
         * symbol(s): `γ_G`, `Γ_G`
         * application domain: generic
         * name: ThermodynamicGrüneisenParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `γ_G = (α_V)/(κ_T c_V ρ)`, where `α_V` is cubic expansion coefficient (ISO 80000-5), `κ_T` is isothermal compressibility (ISO 80000-5), `c_V` is specific heat capacity at constant volume (ISO 80000-5), and `ρ` is mass density (ISO 80000-4)
         * remarks: None.
         */
    }
    attribute 'thermodynamicGrüneisenParameter': 'ThermodynamicGrüneisenParameterValue' :> scalarQuantities;

    /* ISO-80000-12 item 12-14 Grüneisen parameter */
    attribute def 'GrüneisenParameterValue' :> DimensionOneValue {
        doc
        /*
         * source: item 12-14 Grüneisen parameter
         * symbol(s): `γ`
         * application domain: generic
         * name: GrüneisenParameter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by minus the partial differential quotient: `γ = -(del ln ω)/(del ln V)`, where `ω` is a lattice vibration frequency (ISO 80000-3), and `V` is volume (ISO 80000-3)
         * remarks: `ω` can also refer to an average of the vibrational spectrum, for instance as represented by a Debye angular frequency (item 12-10).
         */
    }
    attribute 'grüneisenParameter': 'GrüneisenParameterValue' :> scalarQuantities;

    /* ISO-80000-12 item 12-15.1 mean free path of phonons */
    attribute meanFreePathOfPhonons: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-15.1 mean free path of phonons
         * symbol(s): `l_p`
         * application domain: generic
         * name: MeanFreePathOfPhonons (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: average distance (ISO 80000-3) that phonons travel between two successive interactions
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-15.2 mean free path of electrons */
    attribute meanFreePathOfElectrons: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-15.2 mean free path of electrons
         * symbol(s): `l_e`
         * application domain: generic
         * name: MeanFreePathOfElectrons (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: average distance (ISO 80000-3) that electrons travel between two successive interactions
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-16 energy density of states */
    attribute def EnergyDensityOfStatesValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-16 energy density of states
         * symbol(s): `n_E(E)`, `ρ(E)`
         * application domain: generic
         * name: EnergyDensityOfStates
         * quantity dimension: L^-5*M^-1*T^2
         * measurement unit(s): J^-1*m^-3*eV^-1*m^-3, kg^-1*m^-5*s^2
         * tensor order: 0
         * definition: quantity given by the differential quotient with respect to energy: `n_E(E) = (dn(E))/(dE)`, where `n_E(E)` is the total number of one-electron states per volume (ISO 80000-3) with energy less than `E` (ISO 80000-5)
         * remarks: Density of states refers to electrons or other entities, e.g. phonons. It may be normalized in other ways instead of with respect to volume, e.g. with respect to amount of substance. See also item 12-12.
         */
        attribute :>> num: Real;
        attribute :>> mRef: EnergyDensityOfStatesUnit[1];
    }

    attribute energyDensityOfStates: EnergyDensityOfStatesValue[*] nonunique :> scalarQuantities;

    attribute def EnergyDensityOfStatesUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -5; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-12 item 12-17 residual resistivity */
    attribute residualResistivity: ResistivityValue :> scalarQuantities {
        doc
        /*
         * source: item 12-17 residual resistivity
         * symbol(s): `ρ_0`
         * application domain: generic
         * name: ResidualResistivity (specializes Resistivity)
         * quantity dimension: L^3*M^1*T^-3*I^-2
         * measurement unit(s): Ω*m, kg*m^3*s^-3*A^-2
         * tensor order: 0
         * definition: for metals, the resistivity (IEC 80000-6) extrapolated to zero thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-18 Lorenz coefficient */
    attribute def LorenzCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-18 Lorenz coefficient
         * symbol(s): `L`
         * application domain: generic
         * name: LorenzCoefficient
         * quantity dimension: L^4*M^2*T^-6*I^-2*Θ^-2
         * measurement unit(s): V^2/K^2, kg^2*m^4*s^-6*A^-2*K^-2
         * tensor order: 0
         * definition: quotient of thermal conductivity (ISO 80000-5), and the product of electric conductivity (IEC 80000-6) and thermodynamic temperature (ISO 80000-3)
         * remarks: The Lorenz coefficient can be expressed by `L = λ/(σT)`, where `λ` is thermal conductivity (ISO 80000-5), `σ` is electric conductivity (IEC 80000-6), and `T` is thermodynamic temperature (ISO 80000-5).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LorenzCoefficientUnit[1];
    }

    attribute lorenzCoefficient: LorenzCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def LorenzCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 4; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -6; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-12 item 12-19 Hall coefficient */
    attribute def HallCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-19 Hall coefficient
         * symbol(s): `R_H`, `A_H`
         * application domain: generic
         * name: HallCoefficient
         * quantity dimension: 1
         * measurement unit(s): m^3/C*m^3*s^-1*A^-1
         * tensor order: 0
         * definition: in an isotropic conductor, relation between electric field strength, `vec(E)`, (IEC 80000-6) and electric current density, `vec(J)`, (IEC 80000-6) expressed as: `vec(E) = ρ vec(J) + R_H (vec(B) xx vec(J))`, where `ρ` is resistivity (IEC 80000-6), and `vec(B)` is magnetic flux density (IEC 80000-6)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: HallCoefficientUnit[1];
    }

    attribute hallCoefficient: HallCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def HallCoefficientUnit :> DimensionOneUnit {
    }

    /* ISO-80000-12 item 12-20 thermoelectric voltage (between substances a and b) */
    attribute thermoelectricVoltageBetweenSubstancesAAndB: ElectricPotentialDifferenceValue :> scalarQuantities {
        doc
        /*
         * source: item 12-20 thermoelectric voltage (between substances a and b)
         * symbol(s): `E_(ab)`
         * application domain: generic
         * name: ThermoelectricVoltageBetweenSubstancesAAndB (specializes ElectricPotentialDifference)
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V, kg*m^2*s^-3*A^-1
         * tensor order: 0
         * definition: voltage (IEC 80000-6) between substances `a` and `b` caused by the thermoelectric effect
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-21 Seebeck coefficient (for substances a and b) */
    attribute def SeebeckCoefficientForSubstancesAAndBValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-21 Seebeck coefficient (for substances a and b)
         * symbol(s): `S_(ab)`
         * application domain: generic
         * name: SeebeckCoefficientForSubstancesAAndB
         * quantity dimension: L^2*M^1*T^-3*I^-1*Θ^-1
         * measurement unit(s): V/K, kg*m^2*s^-3*A^-1*K^-1
         * tensor order: 0
         * definition: differential quotient of thermoelectric voltage with respect to thermodynamic temperature: `S_(ab) =      (dE_(ab))/(dT)`, where `E_(ab)` is the thermoelectric voltage between substances `a` and `b` (item 12-20) and `T` is thermodynamic temperature (ISO 80000-5)
         * remarks: This term is also called "thermoelectric power".
         */
        attribute :>> num: Real;
        attribute :>> mRef: SeebeckCoefficientForSubstancesAAndBUnit[1];
    }

    attribute seebeckCoefficientForSubstancesAAndB: SeebeckCoefficientForSubstancesAAndBValue[*] nonunique :> scalarQuantities;

    attribute def SeebeckCoefficientForSubstancesAAndBUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-12 item 12-22 Peltier coefficient (for substances a and b) */
    attribute peltierCoefficientForSubstancesAAndB: ElectricPotentialDifferenceValue :> scalarQuantities {
        doc
        /*
         * source: item 12-22 Peltier coefficient (for substances a and b)
         * symbol(s): `Π_(ab)`
         * application domain: generic
         * name: PeltierCoefficientForSubstancesAAndB (specializes ElectricPotentialDifference)
         * quantity dimension: L^2*M^1*T^-3*I^-1
         * measurement unit(s): V, kg*m^2*s^-3*A^-1
         * tensor order: 0
         * definition: quotient of Peltier heat power (ISO 80000-5) developed at a junction, and the electric current (IEC 80000-6) flowing from substance `a` to substance `b`
         * remarks: `Π_(ab) = Π_a - Π_b`, where `Π_a` and `Π_b` are the Peltier coefficients of substances `a` and `b`, respectively.
         */
    }

    /* ISO-80000-12 item 12-23 Thomson coefficient */
    attribute def ThomsonCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-23 Thomson coefficient
         * symbol(s): `μ`
         * application domain: generic
         * name: ThomsonCoefficient
         * quantity dimension: L^2*M^1*T^-3*I^-1*Θ^-1
         * measurement unit(s): V/K, kg*m^2*s^-3*A^-1*K^-1
         * tensor order: 0
         * definition: quotient of Thomson heat power (ISO 80000-5) developed, and the electric current (IEC 80000-6) and temperature (ISO 80000-5) difference
         * remarks: `μ` is positive if heat is developed when the temperature decreases in the direction of the electric current.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThomsonCoefficientUnit[1];
    }

    attribute thomsonCoefficient: ThomsonCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def ThomsonCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = -1; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, electricCurrentPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-12 item 12-24.1 work function */
    attribute workFunction: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-24.1 work function
         * symbol(s): `ϕ`
         * application domain: generic
         * name: WorkFunction (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference between energy (ISO 80000-5) of an electron at rest at infinity and the Fermi energy (item 12-27.1)
         * remarks: The term "energy level" is often used for the state of the electron, not only for its energy. The contact potential difference between substances `a` and `b` is given by `V_a - V_b = (ϕ_a - ϕ_b)/e`, where `e` is the elementary charge (ISO 80000-1). A set of energy levels, the energies of which occupy an interval practically continuously, is called an energy band. In semi-conductors `E_d` and `E_a` are used for donors and acceptors, respectively.
         */
    }

    /* ISO-80000-12 item 12-24.2 ionization energy */
    attribute ionizationEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-24.2 ionization energy
         * symbol(s): `E_i`
         * application domain: generic
         * name: IonizationEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference between energy (ISO 80000-5) of an electron at rest at infinity and a certain energy level which is the energy of an electron in the interior of a substance
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-25 electron affinity */
    attribute electronAffinity: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-25 electron affinity
         * symbol(s): `χ`
         * application domain: condensed matter physics
         * name: ElectronAffinity (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: energy (ISO 80000-5) difference between an electron at rest at infinity and an electron at the lowest level of the conduction band in an insulator or semiconductor
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-26 Richardson constant */
    attribute def RichardsonConstantValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-26 Richardson constant
         * symbol(s): `A`
         * application domain: generic
         * name: RichardsonConstant
         * quantity dimension: L^-2*I^1*Θ^-2
         * measurement unit(s): A*m^-2*K^-2
         * tensor order: 0
         * definition: parameter in the expression for the thermionic emission current density `J` (IEC 80000-6) for a metal in terms of the thermodynamic temperature `T` (ISO 80000-5) and work function `ϕ`, (item 12-24.1): `J = AT^2 exp(ϕ/(kT))`, where `k` is the Boltzmann constant (ISO 80000-1)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: RichardsonConstantUnit[1];
    }

    attribute richardsonConstant: RichardsonConstantValue[*] nonunique :> scalarQuantities;

    attribute def RichardsonConstantUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute electricCurrentPF: QuantityPowerFactor[1] { :>> quantity = isq.I; :>> exponent = 1; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, electricCurrentPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-12 item 12-27.1 Fermi energy */
    attribute fermiEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-27.1 Fermi energy
         * symbol(s): `E_F`
         * application domain: generic
         * name: FermiEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: in a metal, highest occupied energy level at zero thermodynamic temperature (ISO 80000-5), where energy level means the energy (ISO 80000-5) of an electron in the interior of a substance
         * remarks: The term "energy level" is often used for the state of the electron, not only for its energy. At `T = 0 [K]`, `E_F` is equal to the chemical potential per electron. In condensed matter physics, the reference level for the energy is sometimes chosen so that, for instance, `E_F = 0`.
         */
    }

    /* ISO-80000-12 item 12-27.2 gap energy */
    attribute gapEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-27.2 gap energy
         * symbol(s): `E_g`
         * application domain: generic
         * name: GapEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference in energy (ISO 80000-5) between the lowest level of conduction band and the highest level of valence band at zero thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-28 Fermi temperature */
    attribute fermiTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-28 Fermi temperature
         * symbol(s): `T_F`
         * application domain: generic
         * name: FermiTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: in the free electron model, the Fermi energy (item 12-27.1) divided by the Boltzmann constant (ISO 80000-1)
         * remarks: The Fermi temperature is expressed by: `T_F = E_F/k`, where `E_F` is Fermi energy (item 12-27.1) and `k` is the Boltzmann constant (ISO 80000-1). `E_F` is relative to the lowest occupied state.
         */
    }

    /* ISO-80000-12 item 12-29.1 electron density */
    attribute def ElectronDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-29.1 electron density
         * symbol(s): `n`
         * application domain: generic
         * name: ElectronDensity
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quotient of number of electrons in conduction band and volume (ISO 80000-3)
         * remarks: Subscripts `n` and `p` or `-` and `+` are often used to denote electrons and holes, respectively. `n_n` and `n_p` are also used for electron densities, and `p_n` and `p_p` for hole densities, in `n`-type and `p`-type regions, respectively, of a `n`-`p` junction.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ElectronDensityUnit[1];
    }

    attribute electronDensity: ElectronDensityValue[*] nonunique :> scalarQuantities;

    attribute def ElectronDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-12 item 12-29.2 hole density */
    attribute def HoleDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-29.2 hole density
         * symbol(s): `p`
         * application domain: generic
         * name: HoleDensity
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quotient of number of holes in valence band and volume (ISO 80000-3)
         * remarks: Subscripts `n` and `p` or `-` and `+` are often used to denote electrons and holes, respectively. `n_n` and `n_p` are also used for electron densities, and `p_n` and `p_p` for hole densities, in `n`-type and `p`-type regions, respectively, of a `n`-`p` junction.
         */
        attribute :>> num: Real;
        attribute :>> mRef: HoleDensityUnit[1];
    }

    attribute holeDensity: HoleDensityValue[*] nonunique :> scalarQuantities;

    attribute def HoleDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-12 item 12-29.3 intrinsic carrier density */
    attribute def IntrinsicCarrierDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-29.3 intrinsic carrier density
         * symbol(s): `n_i`
         * application domain: generic
         * name: IntrinsicCarrierDensity
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quantity given by: `n_i = sqrt(n p)`, where `n` is electron density (item 12-29.1), and `p` is hole
         * remarks: Subscripts `n` and `p` or `-` and `+` are often used to denote electrons and holes, respectively. `n_n` and `n_p` are also used for electron densities, and `p_n` and `p_p` for hole densities, in `n`-type and `p`-type regions, respectively, of a `n`-`p` junction.
         */
        attribute :>> num: Real;
        attribute :>> mRef: IntrinsicCarrierDensityUnit[1];
    }

    attribute intrinsicCarrierDensity: IntrinsicCarrierDensityValue[*] nonunique :> scalarQuantities;

    attribute def IntrinsicCarrierDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-12 item 12-29.4 donor density */
    attribute def DonorDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-29.4 donor density
         * symbol(s): `n_d`
         * application domain: generic
         * name: DonorDensity
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quotient of number of donor levels and volume (ISO 80000-3)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DonorDensityUnit[1];
    }

    attribute donorDensity: DonorDensityValue[*] nonunique :> scalarQuantities;

    attribute def DonorDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-12 item 12-29.5 acceptor density */
    attribute def AcceptorDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 12-29.5 acceptor density
         * symbol(s): `n_a`
         * application domain: generic
         * name: AcceptorDensity
         * quantity dimension: L^-3
         * measurement unit(s): m^-3
         * tensor order: 0
         * definition: quotient of number of acceptor levels and volume (ISO 80000-3)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: AcceptorDensityUnit[1];
    }

    attribute acceptorDensity: AcceptorDensityValue[*] nonunique :> scalarQuantities;

    attribute def AcceptorDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-12 item 12-30 effective mass */
    attribute effectiveMass: MassValue :> scalarQuantities {
        doc
        /*
         * source: item 12-30 effective mass
         * symbol(s): `m"*"`
         * application domain: generic
         * name: EffectiveMass (specializes Mass)
         * quantity dimension: M^1
         * measurement unit(s): kg
         * tensor order: 0
         * definition: quantity given by: `m^"*" = (ħ^2 k) / ((dε)/(dk))`, where `k` is wavenumber (ISO 80000-3), `ε` is the energy (ISO 80000-5) of an electron in the interior of a substance, and `ħ` is the reduced Planck constant (ISO 80000-1)
         * remarks: When `k` refers to a state where `ε` has an extremum, `m"*" = (ħ^2 k) / ((d^2ε)/(dk^2))`. The effective mass can be generalized to refer to an anisotropic system with `ε = ε(k)`.
         */
    }

    /* ISO-80000-12 item 12-31 mobility ratio */
    attribute def MobilityRatioValue :> DimensionOneValue {
        doc
        /*
         * source: item 12-31 mobility ratio
         * symbol(s): `b`
         * application domain: generic
         * name: MobilityRatio (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mobilities (ISO 80000-10) of electrons and holes, respectively
         * remarks: The mobility ratio can be expressed by: `b = μ_n/μ_p`, where `μ_n` and `μ_p` are mobilities (ISO 80000-10) for electrons and holes, respectively.
         */
    }
    attribute mobilityRatio: MobilityRatioValue :> scalarQuantities;

    /* ISO-80000-12 item 12-32.1 relaxation time */
    attribute relaxationTime: DurationValue :> scalarQuantities {
        doc
        /*
         * source: item 12-32.1 relaxation time
         * symbol(s): `τ`
         * application domain: condensed matter physics
         * name: RelaxationTime (specializes Duration)
         * quantity dimension: T^1
         * measurement unit(s): s
         * tensor order: 0
         * definition: time constant (ISO 80000-3) for scattering, trapping or annihilation of charge carriers, phonons or other quasiparticles
         * remarks: For electrons in metals, `τ = l/v_F`, where `l` is mean free path (item 12-15.2) and `v_F` is speed (ISO 80000-3) of electrons on the Fermi surface.
         */
    }

    /* ISO-80000-12 item 12-32.2 carrier lifetime */
    attribute carrierLifetime: DurationValue :> scalarQuantities {
        doc
        /*
         * source: item 12-32.2 carrier lifetime
         * symbol(s): `τ`, `τ_n`, `τ_p`
         * application domain: semiconductors
         * name: CarrierLifetime (specializes Duration)
         * quantity dimension: T^1
         * measurement unit(s): s
         * tensor order: 0
         * definition: time constant (ISO 80000-3) for recombination or trapping of minority charge carriers in semiconductors
         * remarks: Indices "n" and "p" denote negative and positive charge carriers, respectively. Positive charge carriers can also be holes.
         */
    }

    /* ISO-80000-12 item 12-33 diffusion length */
    attribute diffusionLengthForCondensedMatterPhysics: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-33 diffusion length
         * symbol(s): `L`, `L_n`, `L_p`
         * application domain: condensed matter physics
         * name: DiffusionLength (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: square root of the product of diffusion coefficient (ISO 80000-10) and lifetime (ISO 80000-10)
         * remarks: The diffusion length can be expressed by: `L = sqrt(Dτ)`, where `D` is the diffusion coefficient (ISO 80000-9) and `τ` is lifetime (ISO 80000-3).
         */
    }

    /* ISO-80000-12 item 12-34 exchange integral */
    attribute exchangeIntegral: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-34 exchange integral
         * symbol(s): `K`, `J`
         * application domain: generic
         * name: ExchangeIntegral (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: constituent of the interaction energy (ISO 80000-5) between the spins of adjacent electrons in matter arising from the overlap of electron state functions
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-35.1 Curie temperature */
    attribute curieTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-35.1 Curie temperature
         * symbol(s): `T_C`
         * application domain: generic
         * name: CurieTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: critical thermodynamic temperature (ISO 80000-5) of a ferromagnet
         * remarks: `T_(cr)` is used for critical thermodynamic temperature in general.
         */
    }

    /* ISO-80000-12 item 12-35.2 Néel temperature */
    attribute 'néelTemperature': ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-35.2 Néel temperature
         * symbol(s): `T_N`
         * application domain: generic
         * name: NéelTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: critical thermodynamic temperature (ISO 80000-5) of an antiferromagnet
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-35.3 superconduction transition temperature */
    attribute superconductionTransitionTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 12-35.3 superconduction transition temperature
         * symbol(s): `T_c`
         * application domain: generic
         * name: SuperconductionTransitionTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: critical thermodynamic temperature (ISO 80000-5) of a superconductor
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-36.1 thermodynamic critical magnetic flux density */
    attribute thermodynamicCriticalMagneticFluxDensity: MagneticFluxDensityValue :> scalarQuantities {
        doc
        /*
         * source: item 12-36.1 thermodynamic critical magnetic flux density
         * symbol(s): `B_c`
         * application domain: generic
         * name: ThermodynamicCriticalMagneticFluxDensity (specializes MagneticFluxDensity)
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T, kg*s^-2*A^-1
         * tensor order: 0
         * definition: quantity given by: `B_c = sqrt((2μ_0 (G_n - G_s))/V)`, where `G_n` and `G_s` are the Gibbs energies (ISO 80000-5) at zero magnetic flux density (IEC 80000-6) in a normal conductor and superconductor, respectively, `μ_0` is the magnetic constant (IEC 80000-6), and `V` is volume (ISO 80000-3)
         * remarks: In type I superconductors, `B_c` is the critical magnetic flux density for disappearance of superconductivity. The symbol `B_(c3)` is used for the critical magnetic flux density for disappearance of surface superconductivity.
         */
    }

    /* ISO-80000-12 item 12-36.2 lower critical magnetic flux density */
    attribute lowerCriticalMagneticFluxDensity: MagneticFluxDensityValue :> scalarQuantities {
        doc
        /*
         * source: item 12-36.2 lower critical magnetic flux density
         * symbol(s): `B_(c1)`
         * application domain: generic
         * name: LowerCriticalMagneticFluxDensity (specializes MagneticFluxDensity)
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T, kg*s^-2*A^-1
         * tensor order: 0
         * definition: for type II superconductors, the threshold magnetic flux density (IEC 80000-6) for magnetic flux (IEC 80000-6) entering the superconductor
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-36.3 upper critical magnetic flux density */
    attribute upperCriticalMagneticFluxDensity: MagneticFluxDensityValue :> scalarQuantities {
        doc
        /*
         * source: item 12-36.3 upper critical magnetic flux density
         * symbol(s): `B_(c2)`
         * application domain: generic
         * name: UpperCriticalMagneticFluxDensity (specializes MagneticFluxDensity)
         * quantity dimension: M^1*T^-2*I^-1
         * measurement unit(s): T, kg*s^-2*A^-1
         * tensor order: 0
         * definition: for type II superconductors, the threshold magnetic flux density (IEC 80000-6) for disappearance of bulk superconductivity
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-37 superconductor energy gap */
    attribute superconductorEnergyGap: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 12-37 superconductor energy gap
         * symbol(s): `Δ`
         * application domain: generic
         * name: SuperconductorEnergyGap (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, eV, kg*m^2*s^-2
         * tensor order: 0
         * definition: width of the forbidden energy band (item 12-24.2) in a superconductor
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-38.1 London penetration depth */
    attribute londonPenetrationDepth: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-38.1 London penetration depth
         * symbol(s): `λ_L`
         * application domain: generic
         * name: LondonPenetrationDepth (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: distance (ISO 80000-3) a magnetic field penetrates the plane surface of a semi-finite superconductor according to the expression: `B(x) = B(0) exp(-x/λ_L)`, where `B` is magnetic flux density (IEC 80000-6) and `x` is distance (ISO 80000-3) from the surface
         * remarks: None.
         */
    }

    /* ISO-80000-12 item 12-38.2 coherence length */
    attribute coherenceLength: LengthValue :> scalarQuantities {
        doc
        /*
         * source: item 12-38.2 coherence length
         * symbol(s): `ξ`
         * application domain: generic
         * name: CoherenceLength (specializes Length)
         * quantity dimension: L^1
         * measurement unit(s): m
         * tensor order: 0
         * definition: distance (ISO 80000-3) in a superconductor over which the effect of a perturbation is appreciable at zero thermodynamic temperature (ISO 80000-5)
         * remarks: None.
         */
    }

}
