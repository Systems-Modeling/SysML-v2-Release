standard library package ISQLight {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard ISO-80000-7:2019 "Light"
     * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-7:ed-2:v1:en
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
    private import ISQThermodynamics::EnergyValue;

    /* ISO-80000-7 item 7-1.1 speed of light in a medium */
    attribute def SpeedOfLightInAMediumValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-1.1 speed of light in a medium
         * symbol(s): `c`
         * application domain: generic
         * name: SpeedOfLightInAMedium
         * quantity dimension: L^1*T^-1
         * measurement unit(s): m*s^-1
         * tensor order: 0
         * definition: phase speed of an electromagnetic wave at a given point in a medium
         * remarks: See also ISO 80000-3. The value of the speed of light in a medium can depend on the frequency, polarization, and direction. For the definition of the speed of electromagnetic waves in vacuum, `c_0`, see ISO 80000-1.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpeedOfLightInAMediumUnit[1];
    }

    attribute speedOfLightInAMedium: SpeedOfLightInAMediumValue[*] nonunique :> scalarQuantities;

    attribute def SpeedOfLightInAMediumUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-7 item 7-1.2 refractive index */
    attribute def RefractiveIndexValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-1.2 refractive index
         * symbol(s): `n`
         * application domain: generic
         * name: RefractiveIndex (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of speed of light in vacuum (ISO 80000-1) and speed of light in a medium (item 7-1.1)
         * remarks: The value of the refractive index can depend on the frequency, polarization, and direction. The refractive index is expressed by n = c_0/c, where c_()_0 is the speed of light in vacuum and c is the speed of light in the medium. For a medium with absorption, the complex refractive index n is defined by n = n + ik where k is spectral absorption index (IEC 60050-845) and i is imaginary unit. The refractivity is expressed by n -1, where n is refractive index.
         */
    }
    attribute refractiveIndex: RefractiveIndexValue :> scalarQuantities;

    /* ISO-80000-7 item 7-2.1 radiant energy */
    attribute radiantEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 7-2.1 radiant energy
         * symbol(s): `Q_e`, `W`, `U`, `(Q)`
         * application domain: electromagnetism
         * name: RadiantEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: energy (ISO 80000-5) emitted, transferred or received in form of electromagnetic waves
         * remarks: Radiant energy can be expressed by the time integral of radiant flux (item 7-4.1), `Φ_e`, over a given duration (ISO 80000-3), `Δt`: `Q_e = int_(Δ t) Φ_e dt`. Radiant energy is expressed either as a function of wavelength (ISO 80000-3), `λ`, as a function of frequency (ISO 80000-3), `ν`, or as a function of wavenumber, `σ`. (See also 0.1.) The corresponding photometric quantity is "luminous energy" (item 7-12). The corresponding quantity for photons is "photon energy" (item 7-19.2).
         */
    }

    /* ISO-80000-7 item 7-2.2 spectral radiant energy */
    attribute def SpectralRadiantEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-2.2 spectral radiant energy
         * symbol(s): `Q_(e,λ)`, `W_λ`, `U_λ`, `(Q_λ)`
         * application domain: generic
         * name: SpectralRadiantEnergy
         * quantity dimension: L^1*M^1*T^-2
         * measurement unit(s): J/nm, kg*m*s^-2
         * tensor order: 0
         * definition: spectral density of radiant energy, expressed by `Q_(e,λ) = (dQ_e) / (dλ)`, where `Q_e` is radiant energy (item 7-2.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) radiant energy is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `Q_e = int_(λ_1)^(λ_2) Q_(e,λ) dλ`
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantEnergyUnit[1];
    }

    attribute spectralRadiantEnergy: SpectralRadiantEnergyValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantEnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-3.1 radiant energy density */
    attribute def RadiantEnergyDensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-3.1 radiant energy density
         * symbol(s): `w`, `(ρ_e)`
         * application domain: generic
         * name: RadiantEnergyDensity
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): J/m^3, kg*m^-1*s^-2
         * tensor order: 0
         * definition: volumetric density of radiant energy, expressed by `w = (dQ_e)/(dV)`, where `Q_e` is radiant energy (item 7-2.1) in an elementary three-dimensional domain and `V` is the volume (ISO 80000-3) of that domain
         * remarks: Radiant energy density within a Planckian radiator is given by `w = (4 σ)/(c_0) T^4` where `σ` is the Stefan-Boltzmann constant (ISO 80000-1), `c_0` is speed of light in vacuum (ISO 80000-1) and `T` is thermodynamic temperature (ISO 80000-5).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadiantEnergyDensityUnit[1];
    }

    attribute radiantEnergyDensity: RadiantEnergyDensityValue[*] nonunique :> scalarQuantities;

    attribute def RadiantEnergyDensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-3.2 spectral radiant energy density in terms of wavelength */
    attribute def SpectralRadiantEnergyDensityInTermsOfWavelengthValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-3.2 spectral radiant energy density in terms of wavelength
         * symbol(s): `w_λ`
         * application domain: generic
         * name: SpectralRadiantEnergyDensityInTermsOfWavelength
         * quantity dimension: L^-2*M^1*T^-2
         * measurement unit(s): J/(m^3*nm), kg*m^-2*s^-2
         * tensor order: 0
         * definition: change of radiant energy density with wavelength, expressed by `w_λ = (dw)/(dλ)`, where `w` is radiant energy density (item 7-3.1) as a function of wavelength `λ` (ISO 80000-3)
         * remarks: Spectral radiant energy density within a Planckian radiator is given by `w_λ = 8πhc_0*f(λ, T)`, where `h` is the Planck constant (ISO 80000-1), `c_0` is speed of light in vacuum (ISO 80000-1), `T` is thermodynamic temperature (ISO 80000-5) and `f(λ,T) = (λ^-5)/(exp(c_2 λ^-1 T^-1) - 1)`. For the radiation constant `c_2` in `f(λ,T)`, see ISO 80000-1.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantEnergyDensityInTermsOfWavelengthUnit[1];
    }

    attribute spectralRadiantEnergyDensityInTermsOfWavelength: SpectralRadiantEnergyDensityInTermsOfWavelengthValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantEnergyDensityInTermsOfWavelengthUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-3.3 spectral radiant energy density in terms of wavenumber */
    attribute def SpectralRadiantEnergyDensityInTermsOfWavenumberValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-3.3 spectral radiant energy density in terms of wavenumber
         * symbol(s): `w_ṽ`, `ρ_ṽ`
         * application domain: generic
         * name: SpectralRadiantEnergyDensityInTermsOfWavenumber
         * quantity dimension: M^1*T^-2
         * measurement unit(s): J/m^2, kg*s^-2
         * tensor order: 0
         * definition: change of radiant energy density with wavenumber, expressed by `w_ṽ = (dw)/(dṽ)`, where `w` is radiant energy density (item 7-3.1) as a function of wavenumber `ṽ` (ISO 80000-3)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantEnergyDensityInTermsOfWavenumberUnit[1];
    }

    attribute spectralRadiantEnergyDensityInTermsOfWavenumber: SpectralRadiantEnergyDensityInTermsOfWavenumberValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantEnergyDensityInTermsOfWavenumberUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-4.1 radiant flux, radiant power */
    attribute def RadiantFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-4.1 radiant flux, radiant power
         * symbol(s): `Φ_e`, `P_e`, `Φ`, `P`
         * application domain: generic
         * name: RadiantFlux
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): W, kg*m^2*s^-3
         * tensor order: 0
         * definition: change in radiant energy with time, expressed by `Φ_e = (dQ_e)/(dt)`, where `Q_e` is the radiant energy (item 7-2.1) emitted, transferred or received and `t` is time (ISO 80000-3)
         * remarks: The corresponding photometric quantity is "luminous flux" (item 7-13). The corresponding quantity for photons is "photon flux" (item 7-20).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadiantFluxUnit[1];
    }

    attribute radiantFlux: RadiantFluxValue[*] nonunique :> scalarQuantities;

    attribute def RadiantFluxUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    alias RadiantPowerUnit for RadiantFluxUnit;
    alias RadiantPowerValue for RadiantFluxValue;
    alias radiantPower for radiantFlux;

    /* ISO-80000-7 item 7-4.2 spectral radiant flux, spectral radiant power */
    attribute def SpectralRadiantFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-4.2 spectral radiant flux, spectral radiant power
         * symbol(s): `Φ_(e,λ)`, `P_(e,λ)`, `(Φ_λ)`, `(P_λ)`
         * application domain: generic
         * name: SpectralRadiantFlux
         * quantity dimension: L^1*M^1*T^-3
         * measurement unit(s): W/nm, kg*m*s^-3
         * tensor order: 0
         * definition: spectral density of radiant flux, expressed by `Φ_(e,λ) = (dQ_e)/(dλ)`, where `Φ_e` is radiant flux (item 7-4.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) radiant flux is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `Φ_e = int_(λ_1)^(λ_2) Φ_(e,λ) dλ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantFluxUnit[1];
    }

    attribute spectralRadiantFlux: SpectralRadiantFluxValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantFluxUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    alias SpectralRadiantPowerUnit for SpectralRadiantFluxUnit;
    alias SpectralRadiantPowerValue for SpectralRadiantFluxValue;
    alias spectralRadiantPower for spectralRadiantFlux;

    /* ISO-80000-7 item 7-5.1 radiant intensity */
    attribute def RadiantIntensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-5.1 radiant intensity
         * symbol(s): `I_e`, `(I)`
         * application domain: generic
         * name: RadiantIntensity
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): W/sr, kg*m^2*s^-3*sr^-1
         * tensor order: 0
         * definition: density of radiant flux with respect to solid angle in a specified direction, expressed by `I_e = (dΦ_e)/(dΩ)`, where `Φ_e` is the radiant flux (item 7-4.1) emitted in a specified direction, and `Ω` is the solid angle (ISO 80000-3) containing that direction
         * remarks: The definition holds strictly only for a point source. The distribution of the radiant intensities as a function of the direction of emission, e.g. given by the polar angles `(θ,φ)`, is used to determine the radiant flux (item 7-4.1) within a certain solid angle (ISO 80000-3), `Ω`, of a source: `Φ_e = int int_Ω I_e(θ, φ) sin(θ) dφ dθ`. The corresponding photometric quantity is "luminous intensity" (item 7-14). The corresponding quantity for photons is "photon intensity" (item 7-21).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadiantIntensityUnit[1];
    }

    attribute radiantIntensity: RadiantIntensityValue[*] nonunique :> scalarQuantities;

    attribute def RadiantIntensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-5.2 spectral radiant intensity */
    attribute def SpectralRadiantIntensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-5.2 spectral radiant intensity
         * symbol(s): `I_(e,λ)`, `(I_λ)`
         * application domain: generic
         * name: SpectralRadiantIntensity
         * quantity dimension: L^1*M^1*T^-3
         * measurement unit(s): W/(sr*nm), kg*m*s^-3*sr^-1
         * tensor order: 0
         * definition: spectral density of radiant intensity, expressed by `I_(e, λ) = (d I_e)/(dλ)`, where `I_e` is radiant intensity (item 7-5.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) radiant intensity is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `I_e = int_(λ_1)^(λ_2) I_(e,λ) dλ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantIntensityUnit[1];
    }

    attribute spectralRadiantIntensity: SpectralRadiantIntensityValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantIntensityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-6.1 radiance */
    attribute def RadianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-6.1 radiance
         * symbol(s): `L_e`, `(L)`
         * application domain: generic
         * name: Radiance
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/(sr*m^2), kg*s^-3*sr^-1
         * tensor order: 0
         * definition: density of radiant intensity with respect to projected area in a specified direction at a specified point on a real or imaginary surface, expressed by `L_e = (d I_e)/(dA) * 1/cos(α)`, where `I_e` is radiant intensity (item 7-5.1), `A` is area (ISO 80000-3), and `α` is the angle between the normal to the surface at the specified point and the specified direction
         * remarks: See also 0.1. For Planckian radiation, `L_e = σ/π T^4` where `T` is thermodynamic temperature (ISO 80000-5) and `σ` is the Stefan-Boltzmann constant (ISO 80000-1). The corresponding photometric quantity is "luminance" (item 7-15). The corresponding quantity for photons is "photon radiance" (item 7-22).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadianceUnit[1];
    }

    attribute radiance: RadianceValue[*] nonunique :> scalarQuantities;

    attribute def RadianceUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-6.2 spectral radiance */
    attribute def SpectralRadianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-6.2 spectral radiance
         * symbol(s): `L_(e,λ)`, `(L_λ)`
         * application domain: generic
         * name: SpectralRadiance
         * quantity dimension: L^-1*M^1*T^-3
         * measurement unit(s): W/(sr*m^2*nm), kg*m^-1*s^-3*sr^-1
         * tensor order: 0
         * definition: density of radiance with respect to wavelength, expressed by `L_(e, λ) = (d L_e)/(d λ)` where `L_e` is radiance (item 7-6.1) in terms of wavelength λ(ISO 80000-3)
         * remarks: For Planckian radiation, `L_(e, λ)(λ) = (c(λ))/(4 π) ω_λ(λ) = h c_0^2 * f(λ,T)`, where `c(λ)` is phase speed (ISO 80000-3) of electromagnetic radiation of a wavelength (ISO 80000-3) `λ` in a given medium, `ω_λ(λ)` is spectral radiant energy density in terms of wavelength, `c_0` is speed of light in vacuum (ISO 80000-1), `h` is the Planck constant (ISO 80000-1), and `f(λ,T) = λ^-5/(exp(c_2 λ^-1 T^-1) - 1)`, where the radiation constant `c_2 = (hc)/k`. The integral of (total) radiance is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `L_e = int_(λ_1)^(λ_2) L_(e,λ) dλ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadianceUnit[1];
    }

    attribute spectralRadiance: SpectralRadianceValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadianceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-7.1 irradiance */
    attribute def IrradianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-7.1 irradiance
         * symbol(s): `E_e`, `(E)`
         * application domain: generic
         * name: Irradiance
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/m^2, kg*s^-3
         * tensor order: 0
         * definition: density of incident radiant flux with respect to area at a point on a real or imaginary surface, expressed by `E_e = (d Φ_e)/(d A)`, where `Φ_e` is radiant flux (item 7-4.1) and `A` is the area (ISO 80000-3) on which the radiant flux is incident
         * remarks: The corresponding photometric quantity is "illuminance" (item 7-16). The corresponding quantity for photons is "photon irradiance" (item 7-23). The quantity "spherical irradiance" is defined by the mean value of irradiance on the outer curved surface of a very small (real or imaginary) sphere at a point in space. It can be expressed by `E_(e,0) = int_(4 π) L_e d Ω` where `Ω` is solid angle (ISO 80000-3) and `L_e` is radiance (item 7-6.1). (See CIE DIS 017/E:2016, term 17-21-054.) It can be expressed by the quotient of the radiant flux (item 7-4.1) of all the radiation incident on the outer surface of an infinitely small sphere centred at the specified point and the area (ISO 80000-3) of the diametrical cross-section of that sphere. Spherical irradiance is also called "fluence rate" or "radiant fluence rate". The corresponding photometric quantity to spherical irradiance is called "spherical illuminance".
         */
        attribute :>> num: Real;
        attribute :>> mRef: IrradianceUnit[1];
    }

    attribute irradiance: IrradianceValue[*] nonunique :> scalarQuantities;

    attribute def IrradianceUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-7.2 spectral irradiance */
    attribute def SpectralIrradianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-7.2 spectral irradiance
         * symbol(s): `E_(e,λ)`, `(E_λ)`
         * application domain: generic
         * name: SpectralIrradiance
         * quantity dimension: L^-1*M^1*T^-3
         * measurement unit(s): W/(m^2*nm), kg*m^-1*s^-3
         * tensor order: 0
         * definition: density of irradiance with respect to wavelength, expressed by `E_(e,λ) = (d E_e)/(dλ)`, where `E_e` is irradiance (item 7-7.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) irradiance is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `E_e = int_(λ_1)^(λ_2) E_(e,λ) d λ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralIrradianceUnit[1];
    }

    attribute spectralIrradiance: SpectralIrradianceValue[*] nonunique :> scalarQuantities;

    attribute def SpectralIrradianceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-8.1 radiant exitance , radiant emittance */
    attribute def RadiantExitanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-8.1 radiant exitance , radiant emittance
         * symbol(s): `M_e`, `(M)`
         * application domain: generic
         * name: RadiantExitance
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/m^2, kg*s^-3
         * tensor order: 0
         * definition: density of exiting radiant flux with respect to area at a point on a real or imaginary surface, expressed by `M_e = (d Φ_e)/(dA)`, where `Φ_e` is radiant flux (item 7-4.1) and `A` is the area (ISO 80000-3) from which the radiant flux leaves
         * remarks: For Planckian radiation, `M_e = σT^4`, where `T` is thermodynamic temperature (ISO 80000-5) and `σ` is the Stefan-Boltzmann constant (ISO 80000-1). The corresponding photometric quantity is "luminous exitance" (item 7-17). The corresponding quantity for photons is "photon exitance" (item 7-24).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadiantExitanceUnit[1];
    }

    attribute radiantExitance: RadiantExitanceValue[*] nonunique :> scalarQuantities;

    attribute def RadiantExitanceUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    alias RadiantEmittanceUnit for RadiantExitanceUnit;
    alias RadiantEmittanceValue for RadiantExitanceValue;
    alias radiantEmittance for radiantExitance;

    /* ISO-80000-7 item 7-8.2 spectral radiant exitance */
    attribute def SpectralRadiantExitanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-8.2 spectral radiant exitance
         * symbol(s): `M_(e,λ)`, `(M_λ)`
         * application domain: generic
         * name: SpectralRadiantExitance
         * quantity dimension: L^-1*M^1*T^-3
         * measurement unit(s): W/(m^2*nm), kg*m^-1*s^-3
         * tensor order: 0
         * definition: density of radiant exitance with respect to wavelength, expressed by `M_(e,λ) = (d M_e)/(dλ)`, where `M_e` is radiant exitance (item 7-8.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) radiant exitance is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `M_e = int_(λ_1)^(λ_2) M_(e,λ) d λ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantExitanceUnit[1];
    }

    attribute spectralRadiantExitance: SpectralRadiantExitanceValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantExitanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-9.1 radiant exposure */
    attribute def RadiantExposureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-9.1 radiant exposure
         * symbol(s): `H_e`, `(H)`
         * application domain: generic
         * name: RadiantExposure
         * quantity dimension: M^1*T^-2
         * measurement unit(s): J/m^2, kg*s^-2
         * tensor order: 0
         * definition: density of incident radiant energy with respect to area at a point on a real or imaginary surface, expressed by `H_e = (d Q_e)/(dA)`, where `Q_e` is radiant energy (item 7-2.1) and `A` is the area on which the radiant energy is incident (ISO 80000-3)
         * remarks: The corresponding photometric quantity is "luminous exposure" (item 7-18). The corresponding quantity for photons is "photon exposure" (item 7-25).
         */
        attribute :>> num: Real;
        attribute :>> mRef: RadiantExposureUnit[1];
    }

    attribute radiantExposure: RadiantExposureValue[*] nonunique :> scalarQuantities;

    attribute def RadiantExposureUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-9.2 spectral radiant exposure */
    attribute def SpectralRadiantExposureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-9.2 spectral radiant exposure
         * symbol(s): `H_(e,λ)`, `(H_λ)`
         * application domain: generic
         * name: SpectralRadiantExposure
         * quantity dimension: L^-1*M^1*T^-2
         * measurement unit(s): J/(m^2*nm), kg*m^-1*s^-2
         * tensor order: 0
         * definition: density of radiant exposure with respect to wavelength, expressed by `H_(e,λ) = (d H_e)/(dλ)`, where `H_e` is radiant exposure (item 7-9.1) in terms of wavelength `λ` (ISO 80000-3)
         * remarks: The integral of (total) radiant exposure is determined by the wavelength interval `(λ_1, λ_2)` under consideration: `H_e = int_(λ_1)^(λ_2) H_(e,λ) d λ` .
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralRadiantExposureUnit[1];
    }

    attribute spectralRadiantExposure: SpectralRadiantExposureValue[*] nonunique :> scalarQuantities;

    attribute def SpectralRadiantExposureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-7 item 7-10.1 luminous efficiency */
    attribute def LuminousEfficiencyValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-10.1 luminous efficiency
         * symbol(s): `V`
         * application domain: specified photometric condition
         * name: LuminousEfficiency (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of radiant flux (item 7-4.1) weighted by the spectral luminous efficiency (item 7-10.2) and the corresponding radiant flux for a specified photometric condition
         * remarks: Luminous efficiency for photopic vision is expressed by `V = (int_0^∞ Φ_(e,λ)(λ) V(λ) d λ)/(int_0^∞ Φ_(e,λ)(λ) d λ) = K/K_m`, where `Φ_(e,λ)` is spectral radiant flux (item 7-4.2), `V(λ)` is spectral luminous efficiency, `λ` is wavelength, `K` is luminous efficacy of radiation (item 7-11.1), and `K_m` is maximum luminous efficacy (item 7-11.3). For scotopic and mesopic vision see 0.4 and 0.5. Symbols for different photometric conditions: `V` for photopic vision; `V'` for scotopic vision; `V_(mes;m)` for mesopic vision; `V_10` for the CIE 10° photopic photometric observer; `V_M` for the CIE 1988 modified 2° spectral luminous efficiency function for photopic vision.
         */
    }
    attribute luminousEfficiency: LuminousEfficiencyValue :> scalarQuantities;

    /* ISO-80000-7 item 7-10.2 spectral luminous efficiency */
    attribute def SpectralLuminousEfficiencyValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-10.2 spectral luminous efficiency
         * symbol(s): `V(λ)`
         * application domain: specified photometric condition
         * name: SpectralLuminousEfficiency (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the radiant flux (item 7-4.1) at wavelength `λ_m` and that at wavelength `λ`, such that both produce equally intense luminous sensations for a specified photometric condition and `λ_m` is chosen so that the maximum value of this quotient is equal to 1
         * remarks: The spectral luminous efficiency of the human eye depends on a number of factors, particularly the state of visual adaptation and the size and position of the source in the visual field. The photometric condition should be specified (e.g. photopic, scotopic, mesopic). If it is not specified, photopic vision is assumed and the symbol `V(λ)` is used. For scotopic and mesopic vision see 0.4 and 0.5. Symbols for different photometric conditions: `V(λ)` for photopic vision; `V'(λ)` for scotopic vision; `V_(mes;m)(λ)` for mesopic vision; `V_10(λ)` for the CIE 10° photopic photometric observer; `V_M(λ)` for the CIE 1988 modified 2° spectral luminous efficiency function for photopic vision.
         */
    }
    attribute spectralLuminousEfficiency: SpectralLuminousEfficiencyValue :> scalarQuantities;

    /* ISO-80000-7 item 7-11.1 luminous efficacy of radiation */
    attribute def LuminousEfficacyOfRadiationValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-11.1 luminous efficacy of radiation
         * symbol(s): `K`
         * application domain: specified photometric condition
         * name: LuminousEfficacyOfRadiation
         * quantity dimension: L^-2*M^-1*T^3*J^1
         * measurement unit(s): lm/W, cd*sr*kg^-1*m^-2*s^3
         * tensor order: 0
         * definition: quotient of luminous flux (item 7-13) and the corresponding radiant flux (item 7-4.1) for a specified photometric condition
         * remarks: Luminous efficacy of radiation for photopic vision is expressed by `K = Φ_V/Φ_e`, where `Φ_v` is luminous flux (item 7-13) and `Φ_e` is radiant flux (item 7-4.1). For scotopic and mesopic vision see 0.4 and 0.5. Symbols for different photometric conditions: `K` for photopic vision; `K'` for scotopic vision; `K_(mes;m)` for mesopic vision; `K_10` for the CIE 10° photopic photometric observer; `K_M` for the CIE 1988 modified 2° spectral luminous efficiency function for photopic vision.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousEfficacyOfRadiationUnit[1];
    }

    attribute luminousEfficacyOfRadiation: LuminousEfficacyOfRadiationValue[*] nonunique :> scalarQuantities;

    attribute def LuminousEfficacyOfRadiationUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-11.2 spectral luminous efficacy */
    attribute def SpectralLuminousEfficacyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-11.2 spectral luminous efficacy
         * symbol(s): `K(λ)`
         * application domain: specified photometric condition
         * name: SpectralLuminousEfficacy
         * quantity dimension: L^-2*M^-1*T^3*J^1
         * measurement unit(s): lm/W, cd*sr*kg^-1*m^-2*s^3
         * tensor order: 0
         * definition: product of spectral luminous efficiency (item 7-10.2) and maximum luminous efficacy (item 7-11.3) for a specified photometric condition
         * remarks: Spectral luminous efficacy for photopic vision is expressed by `K(λ) = K_m V(λ)`, where `K_m` is maximum luminous efficacy (item 7-11.3), `V(λ)` is spectral luminous efficiency (item 7-10.2) and `λ` is wavelength. For scotopic and mesopic vision see 0.4 and 0.5. Symbols for different photometric conditions: `K(λ)` for photopic vision>; `K'(λ)` for scotopic vision; `K_(mes;m)(λ)` for mesopic vision; `K_10(λ)` for the CIE 10° photopic photometric observer; `K_M(λ)` for the CIE 1988 modified 2° spectral luminous efficiency function for photopic vision.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpectralLuminousEfficacyUnit[1];
    }

    attribute spectralLuminousEfficacy: SpectralLuminousEfficacyValue[*] nonunique :> scalarQuantities;

    attribute def SpectralLuminousEfficacyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-11.3 maximum luminous efficacy */
    attribute def MaximumLuminousEfficacyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-11.3 maximum luminous efficacy
         * symbol(s): `K_m`
         * application domain: specified photometric condition
         * name: MaximumLuminousEfficacy
         * quantity dimension: L^-2*M^-1*T^3*J^1
         * measurement unit(s): lm/W, cd*sr*kg^-1*m^-2*s^3
         * tensor order: 0
         * definition: maximum value of spectral luminous efficacy for a specified photometric condition
         * remarks: See also 0.4 and 0.5. The value of maximum luminous efficacy for photopic vision is calculated by `K_m = 683 / (V(λ_(cd))) ["cd"*"sr"*"W"^-1] = 683 ["lm"*"W"^-1]` where `V(λ)` is the spectral luminous efficiency for photopic vision and `λ_(cd)` is the wavelength in air corresponding to the frequency `540*10^12 ["Hz"]` specified in the definition of the SI unit candela. Symbols for different photometric conditions: `K_m` for photopic vision; `K'_m` for scotopic vision; `K_(m,mes;m)` for mesopic vision; `K_(m,10)` for the CIE 10° photopic photometric observer; `K_(m,M)` for the CIE 1988 modified 2° spectral luminous efficiency function for photopic vision.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MaximumLuminousEfficacyUnit[1];
    }

    attribute maximumLuminousEfficacy: MaximumLuminousEfficacyValue[*] nonunique :> scalarQuantities;

    attribute def MaximumLuminousEfficacyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-11.4 luminous efficacy of a source */
    attribute def LuminousEfficacyOfASourceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-11.4 luminous efficacy of a source
         * symbol(s): `η_v`, `(η)`
         * application domain: generic
         * name: LuminousEfficacyOfASource
         * quantity dimension: L^-2*M^-1*T^3*J^1
         * measurement unit(s): lm/W, cd*sr*kg^-1*m^-2*s^3
         * tensor order: 0
         * definition: quotient of the luminous flux emitted and the power consumed by the source, expressed by `η_v = Φ_v/P`, where `Φ_v` is luminous flux (item 7-13) and `P` is the power (ISO 80000-4) consumed by the source
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousEfficacyOfASourceUnit[1];
    }

    attribute luminousEfficacyOfASource: LuminousEfficacyOfASourceValue[*] nonunique :> scalarQuantities;

    attribute def LuminousEfficacyOfASourceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-12 luminous energy, quantity of light */
    attribute def LuminousEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-12 luminous energy, quantity of light
         * symbol(s): `Q_v`, `(Q)`
         * application domain: generic
         * name: LuminousEnergy
         * quantity dimension: T^1*J^1
         * measurement unit(s): lm*s, cd*sr*s
         * tensor order: 0
         * definition: energy of electromagnetic waves weighted by the spectral luminous efficiency (item 7-10.2) multiplied by maximum luminous efficacy (item 7-11.3) of a specified photometric condition
         * remarks: Luminous energy for photopic vision is expressed by `Q_v = K_m int_0^∞ Q_(e,λ)(λ) V(λ) dλ`, where `Q_(e,λ)(λ)` is the spectral radiant energy (item 7-2.2) at wavelength `λ` (ISO 80000-3), `V(λ)` is spectral luminous efficiency (item 7-10.2), and `K_m` is maximum luminous efficacy (7-11.3). Luminous energy can be emitted, transferred or received. Luminous energy can be expressed by the time integral of the luminous flux (item 7-13), `Φ_v`, over a given duration (ISO 80000-3), `Δt`: `Q_v = int_(Δt) Φ_v dt` . The corresponding radiometric quantity is "radiant energy" (item 7-2.1). The corresponding quantity for photons is "photon energy" (item 7-19.2).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousEnergyUnit[1];
    }

    attribute luminousEnergy: LuminousEnergyValue[*] nonunique :> scalarQuantities;

    attribute def LuminousEnergyUnit :> DerivedUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (durationPF, luminousIntensityPF); }
    }

    alias QuantityOfLightUnit for LuminousEnergyUnit;
    alias QuantityOfLightValue for LuminousEnergyValue;
    alias quantityOfLight for luminousEnergy;

    /* ISO-80000-7 item 7-13 luminous flux */
    attribute def LuminousFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-13 luminous flux
         * symbol(s): `Φ_v`, `(Φ)`
         * application domain: generic
         * name: LuminousFlux
         * quantity dimension: J^1
         * measurement unit(s): lm, cd*sr
         * tensor order: 0
         * definition: change in luminous energy with time, expressed by `Φ_v = (d Q_v)/(dt)`, where `Q_v` is the luminous energy (item 7-12) emitted, transferred or received and `t` is time (ISO 80000-3)
         * remarks: Luminous flux is a quantity derived from the radiant flux (item 7-4.1), `Φ_e`, by evaluating the radiation according to its action upon the CIE standard photometric observer. (See CIE S 017/E:2011, term 17-738.) Luminous flux can be derived from the spectral radiant flux distribution by `Φ_v = K_m int_0^oo Φ_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `Φ_(e,λ)(λ)` is spectral radiant flux (item 7-4.2), `V(λ)` is spectral luminous efficiency (item 7-10.2) and `λ` is wavelength (ISO 80000-3). The corresponding radiometric quantity is "radiant flux" (item 7-4.1). The corresponding quantity for photons is "photon flux" (item 7-20).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousFluxUnit[1];
    }

    attribute luminousFlux: LuminousFluxValue[*] nonunique :> scalarQuantities;

    attribute def LuminousFluxUnit :> DerivedUnit {
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = luminousIntensityPF; }
    }

    /* ISO-80000-7 item 7-14 luminous intensity */
    /* See package ISQBase for the declarations of LuminousIntensityValue and LuminousIntensityUnit */

    /* ISO-80000-7 item 7-15 luminance */
    attribute def LuminanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-15 luminance
         * symbol(s): `L_v`, `(L)`
         * application domain: generic
         * name: Luminance
         * quantity dimension: L^-2*J^1
         * measurement unit(s): cd*m^-2
         * tensor order: 0
         * definition: density of luminous intensity with respect to projected area in a specified direction at a specified point on a real or imaginary surface, expressed by `L_v = (dI_v)/(dA) 1/cos(α)`, where `I_v` is luminous intensity (item 7-14), `A` is area (ISO 80000-3) and `α` is the angle between the normal to the surface at the specified point and the specified direction
         * remarks: Luminance can be derived from the spectral radiance distribution by `L_v = K_m int_0^∞ L_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `L_(e,λ)(λ)` is the spectral radiance (item 7-6.2) at wavelength `λ` (ISO 80000-3), and `V(λ)` is spectral luminous efficiency (item 7-10.2). See also 0.1. Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. The corresponding radiometric quantity is "radiance" (item 7-6.1). The corresponding quantity for photons is "photon radiance" (item 7-22).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminanceUnit[1];
    }

    attribute luminance: LuminanceValue[*] nonunique :> scalarQuantities;

    attribute def LuminanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-16 illuminance */
    attribute def IlluminanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-16 illuminance
         * symbol(s): `E_v`, `(E)`
         * application domain: generic
         * name: Illuminance
         * quantity dimension: L^-2*J^1
         * measurement unit(s): lx, cd*sr*m^-2
         * tensor order: 0
         * definition: density of incident luminous flux with respect to area at a point on a real or imaginary surface, expressed by `E_v = (dΦ_v)/(dA)`, where `Φ_v` is luminous flux (item 7-13) and `A` is the area (ISO 80000-3) on which the luminous flux is incident
         * remarks: Illuminance can be derived from the spectral irradiance distribution by `E_v = K_m int_0^∞ E_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `E_(e,λ)(λ)` is the spectral irradiance (item 7-7.2) at wavelength `λ` (ISO 80000-3), and `V(λ)` is spectral luminous efficiency (item 7-10.2). Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. The corresponding radiometric quantity is "irradiance" (item 7-7.1). The corresponding quantity for photons is "photon irradiance" (item 7-23). The quantity "spherical illuminance" is defined by the mean value of illuminance on the outer curved surface of a very small (real or imaginary) sphere at a point in space. It can be expressed by `E_(v,0) = int_(4π) L_v dΩ`, where `Ω` is solid angle (ISO 80000-3) and `L_v` is luminance (item 7-15). It can be expressed by the quotient of the luminous flux (item 7-13) of all the light incident on the outer surface of an infinitely small sphere centred at the given point, and the area (ISO 80000-3) of the diametrical cross-section of that sphere.
         */
        attribute :>> num: Real;
        attribute :>> mRef: IlluminanceUnit[1];
    }

    attribute illuminance: IlluminanceValue[*] nonunique :> scalarQuantities;

    attribute def IlluminanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-17 luminous exitance */
    attribute def LuminousExitanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-17 luminous exitance
         * symbol(s): `M_v`, `(M)`
         * application domain: generic
         * name: LuminousExitance
         * quantity dimension: L^-2*J^1
         * measurement unit(s): lm/m^2, cd*sr*m^-2
         * tensor order: 0
         * definition: density of exiting luminous flux with respect to area at a point on a real or imaginary surface, expressed by `M_v = (dΦ_v)/(dA)`, where `Φ_v` is luminous flux (item 7-13) and `A` is the area (ISO 80000-3) from which the luminous flux leaves
         * remarks: Luminous exitance can be derived from the spectral radiant exitance distribution by `M_v = K_m int_0^∞ M_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `M_(e_λ)(λ)` is the spectral radiant exitance (item 7-8.2) at wavelength λ(ISO 80000-3), and `V(λ)` is spectral luminous efficiency (item 7-10.2). Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. The corresponding radiometric quantity is "radiant exitance" (item 7-8.1). The corresponding quantity for photons is "photon exitance" (item 7-24).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousExitanceUnit[1];
    }

    attribute luminousExitance: LuminousExitanceValue[*] nonunique :> scalarQuantities;

    attribute def LuminousExitanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-18 luminous exposure, quantity of illumination, light exposure */
    attribute def LuminousExposureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-18 luminous exposure, quantity of illumination, light exposure
         * symbol(s): `H_v`, `(H)`
         * application domain: generic
         * name: LuminousExposure
         * quantity dimension: L^-2*T^1*J^1
         * measurement unit(s): lx*s, cd*sr*m^-2*s
         * tensor order: 0
         * definition: density of incident luminous energy with respect to area at a point on a real or imaginary surface, expressed by `H_v = (dQ_v)/(dA)`, where `Q_v` is luminous energy (item 7-12) and `A` is the area on which the luminous energy is incident (ISO 80000-3)
         * remarks: Luminous exposure can be derived from the spectral radiant exposure distribution by `H_v = K_m int_0^∞ H_(e,λ)(λ) V(λ) dλ`, where `K_m` is maximum luminous efficacy (item 7-11.3), `H_(e_λ)(λ)` is the spectral radiant exposure (item 7-9.2) at wavelength λ(ISO 80000-3), and `V(λ)` is spectral luminous efficiency (item 7-10.2). Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. The corresponding radiometric quantity is "radiant exposure" (item 7-9.1). The corresponding quantity for photons is "photon exposure" (item 7-25).
         */
        attribute :>> num: Real;
        attribute :>> mRef: LuminousExposureUnit[1];
    }

    attribute luminousExposure: LuminousExposureValue[*] nonunique :> scalarQuantities;

    attribute def LuminousExposureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 1; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, luminousIntensityPF); }
    }

    alias QuantityOfIlluminationUnit for LuminousExposureUnit;
    alias QuantityOfIlluminationValue for LuminousExposureValue;
    alias quantityOfIllumination for luminousExposure;

    alias LightExposureUnit for LuminousExposureUnit;
    alias LightExposureValue for LuminousExposureValue;
    alias lightExposure for luminousExposure;

    /* ISO-80000-7 item 7-19.1 photon number, number of photons */
    attribute def PhotonNumberValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-19.1 photon number, number of photons
         * symbol(s): `N_p`
         * application domain: generic
         * name: PhotonNumber (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of radiant energy and photon energy, expressed by `N_p = Q_e/(h ν)`, where `Q_e` is radiant energy (item 7-2.1), `h` is the Planck constant (ISO 80000-1), and `ν` is the frequency (ISO 80000-3) of the corresponding electromagnetic wave
         * remarks: Photon number can also be expressed by the time integral of the photon flux (item 7-20), `Φ_p`, over a given duration, `Δt`, `N_p = int_(Δt) Φ_p dt`
         */
    }
    attribute photonNumber: PhotonNumberValue :> scalarQuantities;

    alias numberOfPhotons for photonNumber;

    /* ISO-80000-7 item 7-19.2 photon energy */
    attribute photonEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 7-19.2 photon energy
         * symbol(s): `Q_p`, `(Q)`
         * application domain: generic
         * name: PhotonEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: product of the Planck constant and frequency, expressed by `Q_p = h ν` where `h` is the Planck constant (ISO 80000-1) and `ν` is the frequency (ISO 80000-3) of the corresponding electromagnetic wave
         * remarks: Photon energy can be emitted, transferred or received. For monochromatic radiation, photon energy may be expressed by photon number (item 7-19.1). The corresponding radiometric quantity is "radiant energy" (item 7-2.1). The corresponding photometric quantity is "luminous energy" (item 7-12).
         */
    }

    /* ISO-80000-7 item 7-20 photon flux */
    attribute def PhotonFluxValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-20 photon flux
         * symbol(s): `Φ_p`, `(Φ)`
         * application domain: generic
         * name: PhotonFlux
         * quantity dimension: T^-1
         * measurement unit(s): s^-1
         * tensor order: 0
         * definition: rate of photon number per time interval, expressed by `Φ_p = (d N_p)/(dt)`, where `N_p` is photon number (e.g. given by item 7-19.1), transmitted or received, and `t` is time (ISO 80000-3)
         * remarks: Photon flux `Φ_p` is related to radiant flux (item 7-4.1), `Φ_e`, of monochromatic radiation, by `Φ_p = Φ_e/(h ν)` where `h` is the Planck constant (ISO 80000-1), and `ν` is the frequency (ISO 80000-3) of the corresponding electromagnetic wave. The corresponding radiometric quantity is "radiant flux" (item 7-4.1). The corresponding photometric quantity is "luminous flux" (item 7-13).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonFluxUnit[1];
    }

    attribute photonFlux: PhotonFluxValue[*] nonunique :> scalarQuantities;

    attribute def PhotonFluxUnit :> DerivedUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = durationPF; }
    }

    /* ISO-80000-7 item 7-21 photon intensity */
    attribute def PhotonIntensityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-21 photon intensity
         * symbol(s): `I_p`, `(I)`
         * application domain: generic
         * name: PhotonIntensity
         * quantity dimension: T^-1
         * measurement unit(s): s^-1*sr^-1
         * tensor order: 0
         * definition: density of photon flux with respect to solid angle in a specified direction, expressed by `I_p = (dΦ_p)/(dΩ)`, where `Φ_p` is the photon flux (item 7-20) emitted in the given direction, and `Ω` is the solid angle (ISO 80000-3) containing that direction
         * remarks: The distribution of the photon intensities as a function of the direction of emission, e.g. given by the polar angles `(θ,ϕ)` , is used to determine the photon flux (item 7-20) within a certain solid angle (ISO 80000-3) `Ω` of a source: `Φ_p = int int_Ω I_v(θ,ϕ) sin(θ) dϕ dθ`. The corresponding radiometric quantity is "radiant intensity" (item 7-5.1). The corresponding photometric quantity is "luminous intensity" (item 7-14).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonIntensityUnit[1];
    }

    attribute photonIntensity: PhotonIntensityValue[*] nonunique :> scalarQuantities;

    attribute def PhotonIntensityUnit :> DerivedUnit {
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = durationPF; }
    }

    /* ISO-80000-7 item 7-22 photon radiance */
    attribute def PhotonRadianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-22 photon radiance
         * symbol(s): `L_p`, `(L)`
         * application domain: generic
         * name: PhotonRadiance
         * quantity dimension: L^-2*T^-1
         * measurement unit(s): m^-2*s^-1*sr^-1
         * tensor order: 0
         * definition: density of photon intensity with respect to projected area in a specified direction at a specified point on a real or imaginary surface, expressed by `L_p = (dI_p)/(dA) 1/cos(α)`, where `I_p` is photon intensity (item 7-21), `A` is area (ISO 80000-3) and `α` the angle between the normal to the surface at the specified point and the specified direction
         * remarks: The corresponding radiometric quantity is "radiance" (item 7-6.1). The corresponding photometric quantity is "luminance" (item 7-15).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonRadianceUnit[1];
    }

    attribute photonRadiance: PhotonRadianceValue[*] nonunique :> scalarQuantities;

    attribute def PhotonRadianceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-7 item 7-23 photon irradiance */
    attribute def PhotonIrradianceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-23 photon irradiance
         * symbol(s): `E_p`, `(E)`
         * application domain: generic
         * name: PhotonIrradiance
         * quantity dimension: L^-2*T^-1
         * measurement unit(s): m^-2*s^-1
         * tensor order: 0
         * definition: density of incident photon flux with respect to area at a point on a real or imaginary surface, expressed by `E_p = (dΦ_p)/(dA)`, where `Φ_p` is photon flux (item 7-20) and `A` is the area (ISO 80000-3) on which the photon flux is incident
         * remarks: The corresponding radiometric quantity is "irradiance" (item 7-7.1). The corresponding photometric quantity is "illuminance" (item 7-16).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonIrradianceUnit[1];
    }

    attribute photonIrradiance: PhotonIrradianceValue[*] nonunique :> scalarQuantities;

    attribute def PhotonIrradianceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-7 item 7-24 photon exitance */
    attribute def PhotonExitanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-24 photon exitance
         * symbol(s): `M_p`, `(M)`
         * application domain: generic
         * name: PhotonExitance
         * quantity dimension: L^-2*T^-1
         * measurement unit(s): m^-2*s^-1
         * tensor order: 0
         * definition: density of exiting photon flux with respect to area at a point on a real or imaginary surface, expressed by `M_p = (dΦ_p)/(dA)`, where `Φ_p` is photon flux (item 7-20) and `A` is the area (ISO 80000-3) from which the photon flux leaves
         * remarks: The corresponding radiometric quantity is "radiant exitance" (item 7-8.1). The corresponding photometric quantity is "luminous exitance" (item 7-17).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonExitanceUnit[1];
    }

    attribute photonExitance: PhotonExitanceValue[*] nonunique :> scalarQuantities;

    attribute def PhotonExitanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-7 item 7-25 photon exposure */
    attribute def PhotonExposureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-25 photon exposure
         * symbol(s): `H_p`, `(H)`
         * application domain: generic
         * name: PhotonExposure
         * quantity dimension: L^-2
         * measurement unit(s): m^-2
         * tensor order: 0
         * definition: density of incident photon number with respect to area at a point on a real or imaginary surface, expressed by `H_p = (dN_p)/(dA)`, where `N_p` is photon number (item 7-19.1) and `A` is the area (ISO 80000-3) on which the photons are incident
         * remarks: The corresponding radiometric quantity is "radiant exposure" (item 7-9.1). The corresponding photometric quantity is "luminous exposure" (item 7-18).
         */
        attribute :>> num: Real;
        attribute :>> mRef: PhotonExposureUnit[1];
    }

    attribute photonExposure: PhotonExposureValue[*] nonunique :> scalarQuantities;

    attribute def PhotonExposureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-7 item 7-26.1 tristimulus values for the CIE 1931 standard colorimetric observer */
    attribute def TristimulusValuesForTheCie1931StandardColorimetricObserverValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-26.1 tristimulus values for the CIE 1931 standard colorimetric observer
         * symbol(s): `X,Y,Z`
         * application domain: generic
         * name: TristimulusValuesForTheCie1931StandardColorimetricObserver
         * quantity dimension: L^-2*J^1
         * measurement unit(s): cd*m^-2
         * tensor order: 0
         * definition: amounts of the three reference colour stimuli in the CIE 1931 standard colorimetric system, required to match the colour of the stimulus considered
         * remarks: For a given colour stimulus described by the colour stimulus function `φ_λ(λ)` of a radiometric quantity, `X = k int_0^∞ φ_λ(λ) overline x(λ) dλ`, `Y = k int_0^∞ φ_λ(λ) overline y(λ) dλ`, `Z = k int_0^∞ φ_λ(λ) overline z(λ) dλ`, where `overline x(λ)`, `overline y(λ)`, `overline z(λ)` are the CIE colour-matching functions for the CIE 1931 standard colorimetric observer (2° observer) (item 7-27.1). For sources, `k` may be chosen as `k = K_m` where `K_m` is the maximum luminous efficacy (item 7-11.3) so that `Y = L_v` (item 7-15) and the unit of `X`, `Y`, `Z` is `[cd*m^-2]`. For object colours, `φ_λ(λ)` is given by one of the three products `φ_λ(λ) = S_λ(λ) * {(ρ(λ)), (τ(λ)), (β(λ)):}` where `S_λ(λ)` is the relative spectral distribution of a quantity characterizing the source illuminating the object, `ρ(λ)` is the spectral reflectance, `τ(λ)` is the spectral transmittance, `β(λ)` is the spectral radiance factor, and `k` is chosen to be `k = 100 // int_0^∞ S_λ(λ) overline y(λ) dλ`. Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. In this case, the unit of `X`, `Y`, `Z` is `[1]`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: TristimulusValuesForTheCie1931StandardColorimetricObserverUnit[1];
    }

    attribute tristimulusValuesForTheCie1931StandardColorimetricObserver: TristimulusValuesForTheCie1931StandardColorimetricObserverValue[*] nonunique :> scalarQuantities;

    attribute def TristimulusValuesForTheCie1931StandardColorimetricObserverUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-26.2 tristimulus values for the CIE 1964 standard colorimetric observer */
    attribute def TristimulusValuesForTheCie1964StandardColorimetricObserverValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-26.2 tristimulus values for the CIE 1964 standard colorimetric observer
         * symbol(s): `X_10,Y_10,Z_10`
         * application domain: generic
         * name: TristimulusValuesForTheCie1964StandardColorimetricObserver
         * quantity dimension: L^-2*J^1
         * measurement unit(s): cd*m^-2
         * tensor order: 0
         * definition: amounts of the three reference colour stimuli in the CIE 1964 standard colorimetric system, required to match the colour of the stimulus considered
         * remarks: For a given colour stimulus described by the colour stimulus function `φ_λ(λ)` of a radiometric quantity, `X = k int_0^∞ φ_λ(λ) overline x(λ) dλ`, `Y = k int_0^∞ φ_λ(λ) overline y(λ) dλ`, `Z = k int_0^∞ φ_λ(λ) overline z(λ) dλ`, where `overline x(λ)`, `overline y(λ)`, `overline z(λ)` are the CIE colour-matching functions for the CIE 1931 standard colorimetric observer (2° observer) (item 7-27.1). For sources, `k` may be chosen as `k = K_m` where `K_m` is the maximum luminous efficacy (item 7-11.3) so that `Y = L_v` (item 7-15) and the unit of `X`, `Y`, `Z` is `["cd"*"m"^-2]`. For object colours, `φ_λ(λ)` is given by one of the three products `φ_λ(λ) = S_λ(λ) * {(ρ(λ)), (τ(λ)), (β(λ)):}` where `S_λ(λ)` is the relative spectral distribution of a quantity characterizing the source illuminating the object, `ρ(λ)` is the spectral reflectance, `τ(λ)` is the spectral transmittance, `β(λ)` is the spectral radiance factor, and `k` is chosen to be `k = 100 /( int_0^∞ S_λ(λ) overline y(λ) dλ)`. Integral limits can be confined depending on the spectral sensitivity of the detectors used as a sensor. In this case, the unit of `X`, `Y`, `Z` is `[1]`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: TristimulusValuesForTheCie1964StandardColorimetricObserverUnit[1];
    }

    attribute tristimulusValuesForTheCie1964StandardColorimetricObserver: TristimulusValuesForTheCie1964StandardColorimetricObserverValue[*] nonunique :> scalarQuantities;

    attribute def TristimulusValuesForTheCie1964StandardColorimetricObserverUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute luminousIntensityPF: QuantityPowerFactor[1] { :>> quantity = isq.J; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, luminousIntensityPF); }
    }

    /* ISO-80000-7 item 7-27.1 CIE colour-matching functions for the CIE 1931 standard colorimetric observer */
    attribute def CieColourMatchingFunctionsForTheCie1931StandardColorimetricObserverValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-27.1 CIE colour-matching functions for the CIE 1931 standard colorimetric observer
         * symbol(s): `overline x(λ)`, `overline y(λ)`, `overline z(λ)`
         * application domain: generic
         * name: CieColourMatchingFunctionsForTheCie1931StandardColorimetricObserver (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: functions `overline x(λ)` , `overline y(λ)` , `overline z(λ)` in the CIE 1931 standard colorimetric system
         * remarks: Values of `overline x(λ)` , `overline y(λ)` and `overline z(λ)` are defined in the CIE 1931 standard colorimetric system (2° observer) — applicable to fields of observation of angular opening from 1° to 4°.
         */
    }
    attribute cieColourMatchingFunctionsForTheCie1931StandardColorimetricObserver: CieColourMatchingFunctionsForTheCie1931StandardColorimetricObserverValue :> scalarQuantities;

    /* ISO-80000-7 item 7-27.2 CIE colour-matching functions for the CIE 1964 standard colorimetric observer */
    attribute def CieColourMatchingFunctionsForTheCie1964StandardColorimetricObserverValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-27.2 CIE colour-matching functions for the CIE 1964 standard colorimetric observer
         * symbol(s): `overline x_10(λ)`, `overline y_10(λ)`, `overline z_10(λ)`
         * application domain: generic
         * name: CieColourMatchingFunctionsForTheCie1964StandardColorimetricObserver (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: functions `overline x_10(λ)` , `overline y_10(λ)` , `overline z_10(λ)` in the CIE 1964 standard colorimetric system
         * remarks: Values of `overline x_10(λ)` , `overline y_10(λ)` and `overline z_10(λ)` are defined in the CIE 1964 standard colorimetric system (10° observer) — applicable to fields of observation with angles greater than 4°.
         */
    }
    attribute cieColourMatchingFunctionsForTheCie1964StandardColorimetricObserver: CieColourMatchingFunctionsForTheCie1964StandardColorimetricObserverValue :> scalarQuantities;

    /* ISO-80000-7 item 7-28.1 chromaticity coordinates in the CIE 1931 standard colorimetric system */
    attribute def ChromaticityCoordinatesInTheCie1931StandardColorimetricSystemValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-28.1 chromaticity coordinates in the CIE 1931 standard colorimetric system
         * symbol(s): `x,y,z`
         * application domain: generic
         * name: ChromaticityCoordinatesInTheCie1931StandardColorimetricSystem (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: coordinates expressing the quotients of each of a set of three tristimulus values for the CIE 1931 standard colorimetric observer (item 7-26.1) and their sum, expressed by `x = X / (X+Y+Z)` , `y = Y / (X+Y+Z)` , `z = Z / (X+Y+Z)`
         * remarks: Since `x + y + z = 1`, two variables are sufficient to express chromaticity.
         */
    }
    attribute chromaticityCoordinatesInTheCie1931StandardColorimetricSystem: ChromaticityCoordinatesInTheCie1931StandardColorimetricSystemValue :> scalarQuantities;

    /* ISO-80000-7 item 7-28.2 chromaticity coordinates in the CIE 1964 standard colorimetric system */
    attribute def ChromaticityCoordinatesInTheCie1964StandardColorimetricSystemValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-28.2 chromaticity coordinates in the CIE 1964 standard colorimetric system
         * symbol(s): `x_10,y_10,z_10`
         * application domain: generic
         * name: ChromaticityCoordinatesInTheCie1964StandardColorimetricSystem (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: coordinates expressing the quotients of each of a set of three tristimulus values for the CIE 1964 standard colorimetric observer (item 7-26.2) and their sum, expressed by `x_10 = X_10 / (X_10+Y_10+Z_10)`, `y_10 = Y_10 / (X_10+Y_10+Z_10)`, `z_10 = Z_10 / (X_10+Y_10+Z_10)`
         * remarks: Since `x_10 + y_10 + z_10 = 1`, two variables are sufficient to express chromaticity.
         */
    }
    attribute chromaticityCoordinatesInTheCie1964StandardColorimetricSystem: ChromaticityCoordinatesInTheCie1964StandardColorimetricSystemValue :> scalarQuantities;

    /* ISO-80000-7 item 7-29.1 colour temperature */
    attribute colourTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 7-29.1 colour temperature
         * symbol(s): `T_c`
         * application domain: generic
         * name: ColourTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: temperature of a Planckian radiator whose radiation has the same chromaticity as that of a given stimulus
         * remarks: None.
         */
    }

    /* ISO-80000-7 item 7-29.2 correlated colour temperature */
    attribute correlatedColourTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 7-29.2 correlated colour temperature
         * symbol(s): `T_"cp"`
         * application domain: generic
         * name: CorrelatedColourTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: temperature of a Planckian radiator having the chromaticity nearest the chromaticity associated with the given spectral distribution on a modified 1976 CIE Uniform Chromaticity Scale (UCS) diagram where `u',2/3 v'` are the coordinates of the Planckian locus and the test stimulus
         * remarks: None.
         */
    }

    /* ISO-80000-7 item 7-30.1 emissivity */
    attribute def EmissivityValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-30.1 emissivity
         * symbol(s): `ε`, `ε_T`
         * application domain: generic
         * name: Emissivity (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the radiant exitance of a radiator and the radiant exitance of a Planckian radiator at the same temperature, expressed by `ε = M/M_b`, where `M` is the radiant exitance (item 7-8.1) of a thermal radiator and `M_b` is the radiant exitance of a Planckian radiator at the same temperature (ISO 80000-5)
         * remarks: None.
         */
    }
    attribute emissivity: EmissivityValue :> scalarQuantities;

    /* ISO-80000-7 item 7-30.2 emissivity at a specified wavelength */
    attribute def EmissivityAtASpecifiedWavelengthValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-30.2 emissivity at a specified wavelength
         * symbol(s): `ε(λ)`
         * application domain: generic
         * name: EmissivityAtASpecifiedWavelength (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the radiant exitance of a radiator at a specified wavelength and the radiant exitance of a Planckian radiator at the same temperature and at the same wavelength, expressed by `ε(λ) = M(λ) / M_b(λ)`, where `M(λ)` is the radiant exitance (item 7-8.1) of a thermal radiator at a specified wavelength and `M_b(λ)` is the radiant exitance of a Planckian radiator at the same temperature at a specified wavelength (ISO 80000-3)
         * remarks: None.
         */
    }
    attribute emissivityAtASpecifiedWavelength: EmissivityAtASpecifiedWavelengthValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.1 absorptance */
    attribute def AbsorptanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.1 absorptance
         * symbol(s): `α`, `a`
         * application domain: generic
         * name: Absorptance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of absorbed radiant flux and incident radiant flux, expressed by `α = Φ_a/Φ_m`, where `Φ_a` is absorbed radiant flux (item 7-4.1) and `Φ_m` is incident radiant flux
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case "spectral" is added before the quantity name. Due to energy conservation, `α + ρ + τ = 1` except when polarized radiation is observed, where `ρ` is reflectance (item 7-31.3) and `τ` is transmittance (item 7-31.5).
         */
    }
    attribute absorptance: AbsorptanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.2 luminous absorptance */
    attribute def LuminousAbsorptanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.2 luminous absorptance
         * symbol(s): `α_v`
         * application domain: generic
         * name: LuminousAbsorptance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of absorbed luminous flux and incident luminous flux, expressed by `α_v = Φ_(v,a)/Φ_(v,m)`, where `Φ_(v,a)` is absorbed luminous flux (item 7-13) and `Φ_(v,m)` is incident luminous flux
         * remarks: From spectral absorptance, `α(λ)`, luminous absorptance can be calculated by `α_v = (int_0^∞ α(λ) Φ_(e,λ)(λ) V(λ) dλ)/(int_0^∞ Φ_(e,λ)(λ) V(λ) dλ)`, where `Φ_(e,λ)(λ)` is spectral radiant flux (or relative spectral distribution) of the source, and `V(λ)` is spectral luminous efficiency (item 7-10.2). See also item 7-31.1.
         */
    }
    attribute luminousAbsorptance: LuminousAbsorptanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.3 reflectance */
    attribute def ReflectanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.3 reflectance
         * symbol(s): `ρ`
         * application domain: generic
         * name: Reflectance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of reflected radiant flux and incident radiant flux, expressed by `ρ = Φ_r/Φ_m`, where `Φ_r` is reflected radiant flux (item 7-4.1) and `Φ_m` is incident radiant flux
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before the quantity name. Due to energy conservation, `α + ρ + τ = 1` except when polarized radiation is observed, where `α` is absorptance (item 7-31.1) and `τ` is transmittance (item 7-31.5).
         */
    }
    attribute reflectance: ReflectanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.4 luminous reflectance */
    attribute def LuminousReflectanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.4 luminous reflectance
         * symbol(s): `ρ_v`
         * application domain: generic
         * name: LuminousReflectance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of reflected luminous flux and incident luminous flux, is expressed by `ρ_v = Φ_(v,r)/Φ_(v,m)`, where `Φ_(v,r)` is reflected luminous flux (item 7-13) and `Φ_(v,m)` is incident luminous flux
         * remarks: From spectral reflectance, `ρ(λ)`, luminous reflectance can be calculated by `ρ_v = (int_0^∞ ρ(λ) Φ_(e,λ)(λ) V(λ) dλ)/(int_0^∞ Φ_(e,λ)(λ) V(λ) dλ)`, where `Φ_(e,λ)(λ)` is spectral radiant flux (or relative spectral distribution) of the source, and `V(λ)` is spectral luminous efficiency (item 7-10.2). See also item 7-31.3.
         */
    }
    attribute luminousReflectance: LuminousReflectanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.5 transmittance */
    attribute def TransmittanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.5 transmittance
         * symbol(s): `τ`, `T`
         * application domain: generic
         * name: Transmittance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of transmitted radiant flux and incident radiant flux, expressed by `τ = Φ_t/Φ_m`, where `Φ_t` is transmitted radiant flux (item 7-4.1) and `Φ_m` is incident radiant flux
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before the quantity name. Due to energy conservation, `α + ρ + τ = 1` except when polarized radiation is observed, where `α` is absorptance (item 7-31.1) and `ρ` is reflectance (item 7-31.3).
         */
    }
    attribute transmittance: TransmittanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-31.6 luminous transmittance */
    attribute def LuminousTransmittanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-31.6 luminous transmittance
         * symbol(s): `τ_v`
         * application domain: generic
         * name: LuminousTransmittance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of transmitted luminous flux and incident luminous flux, expressed by `τ_v = Φ_(v,t)/Φ_(v,m)`, where `Φ_(v,t)` is transmitted luminous flux (item 7-13) and `Φ_(v,m)` is luminous flux of the incident radiation
         * remarks: From the spectral transmittance `τ(λ)`, luminous transmittance can be calculated by `τ_v = (int_0^∞ τ(λ) Φ_(e,λ)(λ) V(λ) dλ)/(int_0^∞ Φ_(e,λ)(λ) V(λ) dλ)`, where `Φ_(e,λ)(λ)` is the spectral radiant flux (or relative spectral distribution) of the source, and `V(λ)` is the spectral luminous efficiency (item 7-10.2). See also item 7-31.5.
         */
    }
    attribute luminousTransmittance: LuminousTransmittanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-32.1 transmittance optical density, optical density, transmittance density, decadic absorbance */
    attribute def TransmittanceOpticalDensityValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-32.1 transmittance optical density, optical density, transmittance density, decadic absorbance
         * symbol(s): `D`, `A_10`, `D_τ`
         * application domain: generic
         * name: TransmittanceOpticalDensity (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: logarithm to base 10 of the reciprocal of the transmittance, `τ` (item 7-31.5)
         * remarks: If defined in terms of wavelength, the optical density can be expressed by `A_10(λ) = -log(τ(λ))`, where `τ(λ)` is the transmittance (item 7-31.5) in terms of wavelength. In spectroscopy, the name "absorbance" `A_10` is generally used.
         */
    }
    attribute transmittanceOpticalDensity: TransmittanceOpticalDensityValue :> scalarQuantities;

    alias opticalDensity for transmittanceOpticalDensity;

    alias transmittanceDensity for transmittanceOpticalDensity;

    alias decadicAbsorbance for transmittanceOpticalDensity;

    /* ISO-80000-7 item 7-32.2 Napierian absorbance */
    attribute def NapierianAbsorbanceValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-32.2 Napierian absorbance
         * symbol(s): `A_n`, `B`
         * application domain: generic
         * name: NapierianAbsorbance (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: natural (Napierian) logarithm of the reciprocal of the transmittance, `τ` (item 7-31.5)
         * remarks: If defined in terms of wavelength, the Napierian absorbance can be expressed by `A_n(λ) = B(λ) = -log(τ(λ))`. It can also be expressed as `A_n(λ) = l*α(λ)`, where `α` is linear absorption coefficient (item 7-35.2) and `l` is length (ISO 80000-3) traversed.
         */
    }
    attribute napierianAbsorbance: NapierianAbsorbanceValue :> scalarQuantities;

    /* ISO-80000-7 item 7-33.1 radiance factor */
    attribute def RadianceFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-33.1 radiance factor
         * symbol(s): `β_e`, `(β)`
         * application domain: generic
         * name: RadianceFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the radiance of a surface element in a specified direction and the radiance of the perfect reflecting diffuser or perfect transmitting diffuser identically irradiated and viewed, expressed by `β_e = L_(e,n)/L_(e,d)`, where `L_(e,n)` is the radiance (item 7-6.1) of a surface element in a given direction and `L_(e,d)` is the radiance of the perfect reflecting or transmitting diffuser identically irradiated and viewed
         * remarks: The definition holds for a surface element of a non-self-radiating medium, in a given direction and under specified conditions of irradiation. Radiance factor is equivalent to reflectance factor (item 7-34) or luminance factor (item 7-33.2) when the cone angle is infinitely small, and is equivalent to reflectance (item 7-31.3) when the cone angle is `2π ["sr"]`. These quantities are also defined spectrally and called spectral radiance factor `β(λ)` and spectral reflectance factor `R(λ)`. The ideal isotropic (Lambertian) diffuser with reflectance (item 7-31.3) or transmittance (item 7-31.5) equal to 1 is called "perfect diffuser".
         */
    }
    attribute radianceFactor: RadianceFactorValue :> scalarQuantities;

    /* ISO-80000-7 item 7-33.2 luminance factor */
    attribute def LuminanceFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-33.2 luminance factor
         * symbol(s): `β_v`, `(β)`
         * application domain: generic
         * name: LuminanceFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the luminance of a surface element in a specified direction and the luminance of the perfect reflecting diffuser or perfect transmitting diffuser identically illuminated and viewed, expressed by `β_v = L_(v,n)/L_(v,d)`, where `L_(v,n)` is the luminance (item 7-15) of a surface element in a given direction and `L_(v,d)` is the luminance of the perfect reflecting or transmitting diffuser identically illuminated and viewed
         * remarks: The definition holds for a surface element of a non-luminous medium, in a given direction and under specified conditions of irradiation. This quantity is also defined spectrally and is called "spectral luminance factor". For the analogous radiant quantity "radiance factor", see item 7-33.1.
         */
    }
    attribute luminanceFactor: LuminanceFactorValue :> scalarQuantities;

    /* ISO-80000-7 item 7-34 reflectance factor */
    attribute def ReflectanceFactorValue :> DimensionOneValue {
        doc
        /*
         * source: item 7-34 reflectance factor
         * symbol(s): `R`
         * application domain: generic
         * name: ReflectanceFactor (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of the flux reflected in the directions delimited by a given cone with apex at a surface element and the flux reflected in the same directions by a perfect reflecting diffuser identically irradiated or illuminated, expressed by `R = Φ_n/Φ_d`, where `Φ_n` is the flux reflected in the directions delimited by a given cone and `Φ_d` is the flux reflected in the same directions by an identically irradiated diffuser of reflectance (item 7-31.3) equal to 1
         * remarks: The flux can be a radiant flux (item 7‐4.1) or a luminous flux (item 7‐13). The definition holds for a surface element, for the part of the reflected radiation contained in a given cone with apex at the surface element, and for incident radiation of given spectral composition, polarization and geometric distribution. Reflectance factor is equivalent to radiance factor (item 7-33.1) or luminance factor (item 7-33.2) when the cone angle is infinitely small, and is equivalent to reflectance (item 7-31.3) when the cone angle is 2π sr. These quantities are also defined spectrally and called spectral radiance factor `β(λ)` and spectral reflectance factor `R(λ)`. The ideal isotropic (Lambertian) diffuser with reflectance (item 7-31.3) or transmittance (item 7-31.5) equal to 1 is called a perfect diffuser.
         */
    }
    attribute reflectanceFactor: ReflectanceFactorValue :> scalarQuantities;

    /* ISO-80000-7 item 7-35.1 linear attenuation coefficient, linear extinction coefficient */
    attribute def LinearAttenuationCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-35.1 linear attenuation coefficient, linear extinction coefficient
         * symbol(s): `μ`, `μ_l`
         * application domain: radiometry
         * name: LinearAttenuationCoefficient
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: relative decrease in radiant flux caused by absorption and scattering
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before this quantity name. The spectral linear attenuation coefficient can be expressed by the relative decrease in the spectral radiant flux, `Φ_(e,λ)(λ)`, with respect to propagation length, `l`, of a collimated beam at a point in an absorbing and scattering medium `μ(λ) = 1/(Φ_(e,λ)(λ)) (d Φ_(e,λ)(λ))/(dl)`. Similarly, luminous and photon quantities can be defined.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinearAttenuationCoefficientUnit[1];
    }

    attribute linearAttenuationCoefficient: LinearAttenuationCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def LinearAttenuationCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    alias LinearExtinctionCoefficientUnit for LinearAttenuationCoefficientUnit;
    alias LinearExtinctionCoefficientValue for LinearAttenuationCoefficientValue;
    alias linearExtinctionCoefficient for linearAttenuationCoefficient;

    /* ISO-80000-7 item 7-35.2 linear absorption coefficient */
    attribute def LinearAbsorptionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-35.2 linear absorption coefficient
         * symbol(s): `α_l`, `a_l`, `α`
         * application domain: radiometry
         * name: LinearAbsorptionCoefficient
         * quantity dimension: L^-1
         * measurement unit(s): m^-1
         * tensor order: 0
         * definition: relative decrease in radiant flux (item 7-4.1) caused by absorption
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before this quantity name. The spectral linear absorption coefficient can be expressed by the relative decrease in the spectral radiant flux, `Φ_(e,λ)(λ)`, with respect to propagation length, `l`, of a collimated beam at a point in an absorbing medium `α_l(λ) = 1/(Φ_(e,λ)(λ)) (d Φ_(e,λ)(λ))/(dl)`. It can also be expressed as a function of transmittance (item 7-31.5). `α_l = -ln(τ)/l = A_n/l`. The linear absorption coefficient is that part of the linear attenuation coefficient (item 7-35.1) that is due to absorption. Scattering might also contribute. Similarly, luminous and photon quantities can be defined.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinearAbsorptionCoefficientUnit[1];
    }

    attribute linearAbsorptionCoefficient: LinearAbsorptionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def LinearAbsorptionCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = lengthPF; }
    }

    /* ISO-80000-7 item 7-36.1 mass attenuation coefficient */
    attribute def MassAttenuationCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-36.1 mass attenuation coefficient
         * symbol(s): `μ_m`
         * application domain: radiometry
         * name: MassAttenuationCoefficient
         * quantity dimension: L^2*M^-1
         * measurement unit(s): kg^-1*m^2
         * tensor order: 0
         * definition: quotient of the linear attenuation coefficient (item 7-35.1), `μ`, and the mass density (ISO 80000-4), `ρ`, of the medium
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before this quantity name, which can be expressed by `μ_m(λ) = (μ(λ))/ρ_m`. Similarly, luminous and photon quantities can be defined.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassAttenuationCoefficientUnit[1];
    }

    attribute massAttenuationCoefficient: MassAttenuationCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def MassAttenuationCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

    /* ISO-80000-7 item 7-36.2 mass absorption coefficient */
    attribute def MassAbsorptionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-36.2 mass absorption coefficient
         * symbol(s): `α_m`
         * application domain: radiometry
         * name: MassAbsorptionCoefficient
         * quantity dimension: L^2*M^-1
         * measurement unit(s): kg^-1*m^2
         * tensor order: 0
         * definition: quotient of the linear absorption coefficient (item 7-35.2), `α`, and the mass density (ISO 80000-4), `ρ`, of the medium
         * remarks: This quantity is also defined spectrally in terms of wavelength, in which case, "spectral" is added before this quantity name, which can be expressed by `α_m(λ) = (α(λ))/ρ_m`. Similarly, luminous and photon quantities can be defined.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassAbsorptionCoefficientUnit[1];
    }

    attribute massAbsorptionCoefficient: MassAbsorptionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def MassAbsorptionCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

    /* ISO-80000-7 item 7-37 molar absorption coefficient */
    attribute def MolarAbsorptionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 7-37 molar absorption coefficient
         * symbol(s): `χ`
         * application domain: radiometry
         * name: MolarAbsorptionCoefficient
         * quantity dimension: L^2*N^-1
         * measurement unit(s): m^2*mol^-1
         * tensor order: 0
         * definition: product of linear absorption coefficient and molar volume, expressed by `χ = α V_m`, where `α` is linear absorption coefficient (item 7-35.2) and `V_m` is molar volume (ISO 80000-9)
         * remarks: The molar absorption coefficient can also be expressed by `χ = α c` where `c` is amount-of-substance concentration (ISO 80000-9). Similarly, luminous and photon quantities can be defined.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MolarAbsorptionCoefficientUnit[1];
    }

    attribute molarAbsorptionCoefficient: MolarAbsorptionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def MolarAbsorptionCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute amountOfSubstancePF: QuantityPowerFactor[1] { :>> quantity = isq.N; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, amountOfSubstancePF); }
    }

}
