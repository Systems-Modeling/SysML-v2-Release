standard library package ISQThermodynamics {
    doc
    /*
     * International System of Quantities and Units
     * Generated on 2022-08-07T14:44:27Z from standard ISO-80000-5:2019 "Thermodynamics"
     * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-5:ed-2:v1:en
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


    /* ISO-80000-5 item 5-1 thermodynamic temperature, temperature */
    /* See package ISQBase for the declarations of ThermodynamicTemperatureValue and ThermodynamicTemperatureUnit */

    alias TemperatureUnit for ThermodynamicTemperatureUnit;
    alias TemperatureValue for ThermodynamicTemperatureValue;
    alias temperature for thermodynamicTemperature;

    /* ISO-80000-5 item 5-2 Celsius temperature */
    attribute def CelsiusTemperatureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-2 Celsius temperature
         * symbol(s): `t`, `θ`
         * application domain: generic
         * name: CelsiusTemperature
         * quantity dimension: Θ^1
         * measurement unit(s): °C
         * tensor order: 0
         * definition: temperature difference from the thermodynamic temperature of the ice point is called the Celsius temperature t, which is defined by the quantity equation: `t = T - T_0` where `T` is thermodynamic temperature (item 5-1) and `T_0 = 273,15 K`
         * remarks: The unit degree Celsius is a special name for the kelvin for use in stating values of Celsius temperature. The unit degree Celsius is by definition equal in magnitude to the kelvin. A difference or interval of temperature may be expressed in kelvin or in degrees Celsius. The thermodynamic temperature `T_0` is 0,01 K below the thermodynamic temperature of the triple point of water. The symbol °C for the degree Celsius shall be preceded by a space (see ISO 80000-1). Prefixes are not allowed in combination with the unit °C.
         */
        attribute :>> num: Real;
        attribute :>> mRef: CelsiusTemperatureUnit[1];
    }

    attribute celsiusTemperature: CelsiusTemperatureValue[*] nonunique :> scalarQuantities;

    attribute def CelsiusTemperatureUnit :> DerivedUnit {
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = thermodynamicTemperaturePF; }
    }

    /* ISO-80000-5 item 5-3.1 linear expansion coefficient */
    attribute def LinearExpansionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-3.1 linear expansion coefficient
         * symbol(s): `α_l`
         * application domain: generic
         * name: LinearExpansionCoefficient
         * quantity dimension: Θ^-1
         * measurement unit(s): K^-1
         * tensor order: 0
         * definition: relative change of length with temperature: `α_l = 1/l * (dl)/(dT)` where l is length (ISO 80000-3) and `T` is thermodynamic temperature (item 5-1)
         * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
         */
        attribute :>> num: Real;
        attribute :>> mRef: LinearExpansionCoefficientUnit[1];
    }

    attribute linearExpansionCoefficient: LinearExpansionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def LinearExpansionCoefficientUnit :> DerivedUnit {
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = thermodynamicTemperaturePF; }
    }

    /* ISO-80000-5 item 5-3.2 cubic expansion coefficient */
    attribute def CubicExpansionCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-3.2 cubic expansion coefficient
         * symbol(s): `α_V`, `γ`
         * application domain: generic
         * name: CubicExpansionCoefficient
         * quantity dimension: Θ^-1
         * measurement unit(s): K^-1
         * tensor order: 0
         * definition: relative change of volume with temperature: `α_V = 1/V * (dV)/(dT)` where `V` is volume (ISO 80000-3) and `T` is thermodynamic temperature (item 5-1)
         * remarks: Also called volumetric expansion coefficient. The subscripts in the symbols may be omitted when there is no risk of confusion.
         */
        attribute :>> num: Real;
        attribute :>> mRef: CubicExpansionCoefficientUnit[1];
    }

    attribute cubicExpansionCoefficient: CubicExpansionCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def CubicExpansionCoefficientUnit :> DerivedUnit {
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = thermodynamicTemperaturePF; }
    }

    /* ISO-80000-5 item 5-3.3 relative pressure coefficient */
    attribute def RelativePressureCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-3.3 relative pressure coefficient
         * symbol(s): `α_p`
         * application domain: generic
         * name: RelativePressureCoefficient
         * quantity dimension: Θ^-1
         * measurement unit(s): K^-1
         * tensor order: 0
         * definition: relative change of pressure with temperature at constant volume: `α_p = 1/p * ((partial p)/(partial T))_V` where `p` is pressure (ISO 80000-4), `T` is thermodynamic temperature (item 5-1), and `V` is volume (ISO 80000-3)
         * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
         */
        attribute :>> num: Real;
        attribute :>> mRef: RelativePressureCoefficientUnit[1];
    }

    attribute relativePressureCoefficient: RelativePressureCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def RelativePressureCoefficientUnit :> DerivedUnit {
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = thermodynamicTemperaturePF; }
    }

    /* ISO-80000-5 item 5-4 pressure coefficient */
    attribute def PressureCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-4 pressure coefficient
         * symbol(s): `β`
         * application domain: generic
         * name: PressureCoefficient
         * quantity dimension: L^-1*M^1*T^-2*Θ^-1
         * measurement unit(s): Pa/K, kg*m^-1*s^-2*K^-1
         * tensor order: 0
         * definition: change of pressure with temperature at constant volume: `β = ((partial p)/(partial T))_V` where `p` is pressure (ISO 80000-4), `T` is thermodynamic temperature (item 5-1), and `V` is volume (ISO 80000-3)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PressureCoefficientUnit[1];
    }

    attribute pressureCoefficient: PressureCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def PressureCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-5.1 isothermal compressibility */
    attribute def IsothermalCompressibilityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-5.1 isothermal compressibility
         * symbol(s): `ϰ_T`
         * application domain: generic
         * name: IsothermalCompressibility
         * quantity dimension: L^1*M^-1*T^2
         * measurement unit(s): Pa^-1, kg^-1*m*s^2
         * tensor order: 0
         * definition: negative relative change of volume with pressure at constant temperature: `ϰ_T = -1/V * ((partial V)/(partial p))_T` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and `T` is thermodynamic temperature (item 5-1)
         * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
         */
        attribute :>> num: Real;
        attribute :>> mRef: IsothermalCompressibilityUnit[1];
    }

    attribute isothermalCompressibility: IsothermalCompressibilityValue[*] nonunique :> scalarQuantities;

    attribute def IsothermalCompressibilityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-5 item 5-5.2 isentropic compressibility */
    attribute def IsentropicCompressibilityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-5.2 isentropic compressibility
         * symbol(s): `ϰ_S`
         * application domain: generic
         * name: IsentropicCompressibility
         * quantity dimension: L^1*M^-1*T^2
         * measurement unit(s): Pa^-1, kg^-1*m*s^2
         * tensor order: 0
         * definition: negative relative change of volume with pressure at constant entropy: `ϰ_S = -1/V * ((partial V)/(partial p))_S` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and `S` is entropy (item 5-18)
         * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
         */
        attribute :>> num: Real;
        attribute :>> mRef: IsentropicCompressibilityUnit[1];
    }

    attribute isentropicCompressibility: IsentropicCompressibilityValue[*] nonunique :> scalarQuantities;

    attribute def IsentropicCompressibilityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-5 item 5-6.1 heat, amount of heat */
    attribute heat: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-6.1 heat, amount of heat
         * symbol(s): `Q`
         * application domain: generic
         * name: Heat (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference between the increase in the internal energy (item 5-20.2) of a system and the work (ISO 80000-4) done on the system, provided that the amounts of substances within the system are not changed
         * remarks: The heat transferred in an isothermal phase transformation should be expressed as the change in the appropriate state functions, e.g. `T ΔS`, where `T` is thermodynamic temperature (item 5-1) and `S` is entropy (item 5-18), or `ΔH`, where `H` is enthalpy (item 5-20.3). NOTE A supply of heat can correspond to an increase in thermodynamic temperature or to other effects, such as phase change or chemical processes; see item 5-6.2.
         */
    }

    alias amountOfHeat for heat;

    /* ISO-80000-5 item 5-6.2 latent heat */
    attribute latentHeat: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-6.2 latent heat
         * symbol(s): `Q`
         * application domain: generic
         * name: LatentHeat (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: energy released or absorbed by a system during a constant-temperature process
         * remarks: Examples of latent heat are latent heat of fusion (melting) and latent heat of vaporization (boiling).
         */
    }

    /* ISO-80000-5 item 5-7 heat flow rate */
    attribute def HeatFlowRateValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-7 heat flow rate
         * symbol(s): `dot(Q)`
         * application domain: generic
         * name: HeatFlowRate
         * quantity dimension: L^2*M^1*T^-3
         * measurement unit(s): W, J/s, kg*m^2*s^-3
         * tensor order: 0
         * definition: time rate at which heat (item 5-6.1) crosses a given surface
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: HeatFlowRateUnit[1];
    }

    attribute heatFlowRate: HeatFlowRateValue[*] nonunique :> scalarQuantities;

    attribute def HeatFlowRateUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-5 item 5-8 density of heat flow rate */
    attribute def DensityOfHeatFlowRateValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-8 density of heat flow rate
         * symbol(s): `q`, `φ`
         * application domain: generic
         * name: DensityOfHeatFlowRate
         * quantity dimension: M^1*T^-3
         * measurement unit(s): W/m^2, kg*s^-3
         * tensor order: 0
         * definition: quotient of heat flow rate and area: `q = dot Q / A` where `dot Q` is heat flow rate (item 5-7) and A is area (ISO 80000-3) of a given surface
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: DensityOfHeatFlowRateUnit[1];
    }

    attribute densityOfHeatFlowRate: DensityOfHeatFlowRateValue[*] nonunique :> scalarQuantities;

    attribute def DensityOfHeatFlowRateUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF); }
    }

    /* ISO-80000-5 item 5-9 thermal conductivity */
    attribute def ThermalConductivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-9 thermal conductivity
         * symbol(s): `λ_l`, `(ϰ)`
         * application domain: generic
         * name: ThermalConductivity
         * quantity dimension: L^1*M^1*T^-3*Θ^-1
         * measurement unit(s): W/(m*K), kg*m*s^-3*K^-1
         * tensor order: 0
         * definition: quotient of density of heat flow rate (item 5-8) and thermodynamic temperature gradient that has the same direction as the heat flow
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalConductivityUnit[1];
    }

    attribute thermalConductivity: ThermalConductivityValue[*] nonunique :> scalarQuantities;

    attribute def ThermalConductivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-10.1 coefficient of heat transfer */
    attribute def CoefficientOfHeatTransferValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-10.1 coefficient of heat transfer
         * symbol(s): `K`, `(k)`
         * application domain: generic
         * name: CoefficientOfHeatTransfer
         * quantity dimension: M^1*T^-3*Θ^-1
         * measurement unit(s): W/(m^2*K), kg*s^-3*K^-1
         * tensor order: 0
         * definition: quotient of density of heat flow rate (item 5-8) and thermodynamic temperature (item 5-1) difference
         * remarks: In building technology, the coefficient of heat transfer is often called thermal transmittance, with the symbol U (no longer recommended). See remark to item 5-13.
         */
        attribute :>> num: Real;
        attribute :>> mRef: CoefficientOfHeatTransferUnit[1];
    }

    attribute coefficientOfHeatTransfer: CoefficientOfHeatTransferValue[*] nonunique :> scalarQuantities;

    attribute def CoefficientOfHeatTransferUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-10.2 surface coefficient of heat transfer */
    attribute def SurfaceCoefficientOfHeatTransferValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-10.2 surface coefficient of heat transfer
         * symbol(s): `h`, `(α)`
         * application domain: generic
         * name: SurfaceCoefficientOfHeatTransfer
         * quantity dimension: M^1*T^-3*Θ^-1
         * measurement unit(s): W/(m^2*K), kg*s^-3*K^-1
         * tensor order: 0
         * definition: quotient of density of heat flow rate and the difference of the temperature at the surface and a reference temperature: `h = q / (T_s - T_r)` where q is density of heat flow rate (item 5-8), `T_s` is the thermodynamic temperature (item 5-1) at the surface, and `T_r` is a reference thermodynamic temperature characterizing the adjacent surroundings
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SurfaceCoefficientOfHeatTransferUnit[1];
    }

    attribute surfaceCoefficientOfHeatTransfer: SurfaceCoefficientOfHeatTransferValue[*] nonunique :> scalarQuantities;

    attribute def SurfaceCoefficientOfHeatTransferUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-11 thermal insulance, coefficient of thermal insulance */
    attribute def ThermalInsulanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-11 thermal insulance, coefficient of thermal insulance
         * symbol(s): `M`
         * application domain: generic
         * name: ThermalInsulance
         * quantity dimension: M^-1*T^3*Θ^1
         * measurement unit(s): m^2*K/W, kg^-1*s^3*K
         * tensor order: 0
         * definition: inverse of coefficient of heat transfer `K`: `M = 1/K` where `K` is coefficient of heat transfer (item 5-10.1)
         * remarks: In building technology, this quantity is often called thermal resistance, with the symbol R.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalInsulanceUnit[1];
    }

    attribute thermalInsulance: ThermalInsulanceValue[*] nonunique :> scalarQuantities;

    attribute def ThermalInsulanceUnit :> DerivedUnit {
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (massPF, durationPF, thermodynamicTemperaturePF); }
    }

    alias CoefficientOfThermalInsulanceUnit for ThermalInsulanceUnit;
    alias CoefficientOfThermalInsulanceValue for ThermalInsulanceValue;
    alias coefficientOfThermalInsulance for thermalInsulance;

    /* ISO-80000-5 item 5-12 thermal resistance */
    attribute def ThermalResistanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-12 thermal resistance
         * symbol(s): `R`
         * application domain: generic
         * name: ThermalResistance
         * quantity dimension: L^-2*M^-1*T^3*Θ^1
         * measurement unit(s): K/W, kg^-1*m^-2*s^3*K
         * tensor order: 0
         * definition: quotient of thermodynamic temperature (item 5-1) difference and heat flow rate (item 5-7)
         * remarks: See remark to item 5-11.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalResistanceUnit[1];
    }

    attribute thermalResistance: ThermalResistanceValue[*] nonunique :> scalarQuantities;

    attribute def ThermalResistanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-13 thermal conductance */
    attribute def ThermalConductanceValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-13 thermal conductance
         * symbol(s): `G`, `(H)`
         * application domain: generic
         * name: ThermalConductance
         * quantity dimension: L^2*M^1*T^-3*Θ^-1
         * measurement unit(s): W/K, kg*m^2*s^-3*K^-1
         * tensor order: 0
         * definition: inverse of thermal resistance `R`: `G = 1/R` where `R` is thermal resistance (item 5-12)
         * remarks: See remark to item 5-11. This quantity is also called heat transfer coefficient. See item 5-10.1.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalConductanceUnit[1];
    }

    attribute thermalConductance: ThermalConductanceValue[*] nonunique :> scalarQuantities;

    attribute def ThermalConductanceUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -3; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-14 thermal diffusivity */
    attribute def ThermalDiffusivityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-14 thermal diffusivity
         * symbol(s): `a`
         * application domain: generic
         * name: ThermalDiffusivity
         * quantity dimension: L^2*T^-1
         * measurement unit(s): m^2*s^-1
         * tensor order: 0
         * definition: quotient of thermal conductivity and the product of mass density and specific heat capacity: `a = λ / (ρ C_p)` where `λ` is thermal conductivity (item 5-9), `ρ` is mass density (ISO 80000-4), and `c_p` is specific heat capacity at constant pressure (item 5-16.2)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: ThermalDiffusivityUnit[1];
    }

    attribute thermalDiffusivity: ThermalDiffusivityValue[*] nonunique :> scalarQuantities;

    attribute def ThermalDiffusivityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-5 item 5-15 heat capacity */
    attribute def HeatCapacityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-15 heat capacity
         * symbol(s): `C`
         * application domain: generic
         * name: HeatCapacity
         * quantity dimension: L^2*M^1*T^-2*Θ^-1
         * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
         * tensor order: 0
         * definition: derivative of added heat with respect to thermodynamic temperature of a system: `C = (dQ)/(dT)` where `Q` is amount of heat (item 5-6.1) and `T` is thermodynamic temperature (item 5-1)
         * remarks: Heat capacity is not completely defined unless specified as seen in items 5-16.2, 5-16.3 and 5-16.4.
         */
        attribute :>> num: Real;
        attribute :>> mRef: HeatCapacityUnit[1];
    }

    attribute heatCapacity: HeatCapacityValue[*] nonunique :> scalarQuantities;

    attribute def HeatCapacityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-16.1 specific heat capacity */
    attribute def SpecificHeatCapacityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-16.1 specific heat capacity
         * symbol(s): `c`
         * application domain: generic
         * name: SpecificHeatCapacity
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: quotient of heat capacity and mass: `c = C/m` where `C` is heat capacity (item 5-15) and `m` is mass (ISO 80000-4)
         * remarks: For the corresponding quantities related to the amount of substance, see ISO 80000-9.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificHeatCapacityUnit[1];
    }

    attribute specificHeatCapacity: SpecificHeatCapacityValue[*] nonunique :> scalarQuantities;

    attribute def SpecificHeatCapacityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-16.2 specific heat capacity at constant pressure */
    attribute def SpecificHeatCapacityAtConstantPressureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-16.2 specific heat capacity at constant pressure
         * symbol(s): `c_p`
         * application domain: generic
         * name: SpecificHeatCapacityAtConstantPressure
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: specific heat capacity (item 5-16.1) at constant pressure (ISO 80000-4)
         * remarks: Also called specific isobaric heat capacity.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificHeatCapacityAtConstantPressureUnit[1];
    }

    attribute specificHeatCapacityAtConstantPressure: SpecificHeatCapacityAtConstantPressureValue[*] nonunique :> scalarQuantities;

    attribute def SpecificHeatCapacityAtConstantPressureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-16.3 specific heat capacity at constant volume */
    attribute def SpecificHeatCapacityAtConstantVolumeValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-16.3 specific heat capacity at constant volume
         * symbol(s): `c_V`
         * application domain: generic
         * name: SpecificHeatCapacityAtConstantVolume
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: specific heat capacity (item 5-16.1) at constant volume (ISO 80000-3)
         * remarks: Also called specific isochoric heat capacity.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificHeatCapacityAtConstantVolumeUnit[1];
    }

    attribute specificHeatCapacityAtConstantVolume: SpecificHeatCapacityAtConstantVolumeValue[*] nonunique :> scalarQuantities;

    attribute def SpecificHeatCapacityAtConstantVolumeUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-16.4 specific heat capacity at saturated vapour pressure */
    attribute def SpecificHeatCapacityAtSaturatedVapourPressureValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-16.4 specific heat capacity at saturated vapour pressure
         * symbol(s): `c_"sat"`
         * application domain: generic
         * name: SpecificHeatCapacityAtSaturatedVapourPressure
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: specific heat capacity (item 5-16.1) at saturated vapour pressure (ISO 80000-4)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificHeatCapacityAtSaturatedVapourPressureUnit[1];
    }

    attribute specificHeatCapacityAtSaturatedVapourPressure: SpecificHeatCapacityAtSaturatedVapourPressureValue[*] nonunique :> scalarQuantities;

    attribute def SpecificHeatCapacityAtSaturatedVapourPressureUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-17.1 ratio of specific heat capacities */
    attribute def RatioOfSpecificHeatCapacitiesValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-17.1 ratio of specific heat capacities
         * symbol(s): `γ`
         * application domain: generic
         * name: RatioOfSpecificHeatCapacities (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of specific heat capacity at constant pressure and specific heat capacity at constant volume: `γ = c_p/c_V` where `c_p` is specific heat capacity at constant pressure (item 5-16.2) and `c_V` is specific heat capacity at constant volume (item 5-16.3)
         * remarks: This quantity can also be expressed by `γ = C_p/C_V` where `C_p` is heat capacity at constant pressure and `C_V` is heat capacity at constant volume.
         */
    }
    attribute ratioOfSpecificHeatCapacities: RatioOfSpecificHeatCapacitiesValue :> scalarQuantities;

    /* ISO-80000-5 item 5-17.2 isentropic exponent, isentropic expansion factor */
    attribute def IsentropicExponentValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-17.2 isentropic exponent, isentropic expansion factor
         * symbol(s): `ϰ`
         * application domain: generic
         * name: IsentropicExponent (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: the negative of relative pressure change, divided by relative volume change, at constant entropy: `ϰ = -V/p * ((partial p)/(partial V))_S` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and `S` is entropy (item 5-18)
         * remarks: For an ideal gas, `ϰ` is equal to `γ` (item 5-17.1).
         */
    }
    attribute isentropicExponent: IsentropicExponentValue :> scalarQuantities;

    alias isentropicExpansionFactor for isentropicExponent;

    /* ISO-80000-5 item 5-18 entropy */
    attribute def EntropyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-18 entropy
         * symbol(s): `S`
         * application domain: generic
         * name: Entropy
         * quantity dimension: L^2*M^1*T^-2*Θ^-1
         * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
         * tensor order: 0
         * definition: natural logarithm of number of equally probable microscopic configurations in a macroscopic system, multiplied by the Boltzmann constant: `S = k lnW` where `W` is number of configurations and `k` is the Boltzmann constant (ISO 80000-1)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: EntropyUnit[1];
    }

    attribute entropy: EntropyValue[*] nonunique :> scalarQuantities;

    attribute def EntropyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-19 specific entropy */
    attribute def SpecificEntropyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-19 specific entropy
         * symbol(s): `s`
         * application domain: generic
         * name: SpecificEntropy
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: quotient of entropy and mass: `s = S/m` where `S` is entropy (item 5-18) and `m` is mass (ISO 80000-4)
         * remarks: For the corresponding quantity related to amount of substance, see ISO 80000-9.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificEntropyUnit[1];
    }

    attribute specificEntropy: SpecificEntropyValue[*] nonunique :> scalarQuantities;

    attribute def SpecificEntropyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-20.1 energy */
    attribute def EnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-20.1 energy
         * symbol(s): `E`
         * application domain: thermodynamics
         * name: Energy
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: ability of a system to do work (ISO 80000-4)
         * remarks: Energy exists in different forms that are mutually transformable into each other, either totally or partially. In contrast to internal energy (item 5-20.2), energy is not a state function.
         */
        attribute :>> num: Real;
        attribute :>> mRef: EnergyUnit[1];
    }

    attribute energy: EnergyValue[*] nonunique :> scalarQuantities;

    attribute def EnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF); }
    }

    /* ISO-80000-5 item 5-20.2 internal energy, thermodynamic energy */
    attribute internalEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-20.2 internal energy, thermodynamic energy
         * symbol(s): `U`
         * application domain: generic
         * name: InternalEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: energy of a system whose change is given by the amount of the heat (item 5-6.1) transferred to the system and the work (ISO 80000-4) done on the system, provided that the system is closed and no chemical reactions occur
         * remarks: In thermodynamic text books, usually the formula `ΔU = Q + W` is used. Note that the zero of the energy is undefined.
         */
    }

    alias thermodynamicEnergy for internalEnergy;

    /* ISO-80000-5 item 5-20.3 enthalpy */
    attribute enthalpy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-20.3 enthalpy
         * symbol(s): `H`
         * application domain: generic
         * name: Enthalpy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: sum of internal energy of the system and the product of pressure and volume of the system: `H = U + p*V` where U is internal energy (item 5-20.2), `p` is pressure (ISO 80000-4), and `V` is volume (ISO 80000-3)
         * remarks: None.
         */
    }

    /* ISO-80000-5 item 5-20.4 Helmholtz energy, Helmholtz function */
    attribute helmholtzEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-20.4 Helmholtz energy, Helmholtz function
         * symbol(s): `A`, `F`
         * application domain: generic
         * name: HelmholtzEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference of internal energy of the system and the product of thermodynamic temperature and entropy of the system: `A = U - TS` where `U` is internal energy (item 5-20.2), `T` is thermodynamic temperature (item 5-1), and `S` is entropy (item 5-18)
         * remarks: The name Helmholtz free energy is also used. However, this term is not recommended.
         */
    }

    alias helmholtzFunction for helmholtzEnergy;

    /* ISO-80000-5 item 5-20.5 Gibbs energy, Gibbs function */
    attribute gibbsEnergy: EnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-20.5 Gibbs energy, Gibbs function
         * symbol(s): `G`
         * application domain: generic
         * name: GibbsEnergy (specializes Energy)
         * quantity dimension: L^2*M^1*T^-2
         * measurement unit(s): J, kg*m^2*s^-2
         * tensor order: 0
         * definition: difference of the enthalpy and the product of thermodynamic temperature and entropy of the system: `G = H - T*S` where H is enthalpy (item 5-20.3), `T` is thermodynamic temperature (item 5-1), and `S` is entropy (item 5-18)
         * remarks: The name Gibbs free energy is also used. However, this term is not recommended.
         */
    }

    alias gibbsFunction for gibbsEnergy;

    /* ISO-80000-5 item 5-21.1 specific energy */
    attribute def SpecificEnergyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-21.1 specific energy
         * symbol(s): `e`
         * application domain: generic
         * name: SpecificEnergy
         * quantity dimension: L^2*T^-2
         * measurement unit(s): J/kg, m^2*s^-2
         * tensor order: 0
         * definition: quotient of energy and mass: `e = E/m` where `E` is energy (item 5-20.1) and `m` is mass (ISO 80000-4)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificEnergyUnit[1];
    }

    attribute specificEnergy: SpecificEnergyValue[*] nonunique :> scalarQuantities;

    attribute def SpecificEnergyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-5 item 5-21.2 specific internal energy, specific thermodynamic energy */
    attribute specificInternalEnergy: SpecificEnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-21.2 specific internal energy, specific thermodynamic energy
         * symbol(s): `u`
         * application domain: generic
         * name: SpecificInternalEnergy (specializes SpecificEnergy)
         * quantity dimension: L^2*T^-2
         * measurement unit(s): J/kg, m^2*s^-2
         * tensor order: 0
         * definition: quotient of internal energy and mass: `u = U/m` where `U` is internal energy (item 5-20.2) and `m` is mass (ISO 80000-4)
         * remarks: None.
         */
    }

    alias specificThermodynamicEnergy for specificInternalEnergy;

    /* ISO-80000-5 item 5-21.3 specific enthalpy */
    attribute def SpecificEnthalpyValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-21.3 specific enthalpy
         * symbol(s): `h`
         * application domain: generic
         * name: SpecificEnthalpy
         * quantity dimension: L^2*T^-2
         * measurement unit(s): J/kg, m^2*s^-2
         * tensor order: 0
         * definition: quotient of enthalpy and mass: `h = H/m` where `H` is enthalpy (item 5-20.3) and `m` is mass (ISO 80000-4)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificEnthalpyUnit[1];
    }

    attribute specificEnthalpy: SpecificEnthalpyValue[*] nonunique :> scalarQuantities;

    attribute def SpecificEnthalpyUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF); }
    }

    /* ISO-80000-5 item 5-21.4 specific Helmholtz energy, specific Helmholtz function */
    attribute specificHelmholtzEnergy: SpecificEnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-21.4 specific Helmholtz energy, specific Helmholtz function
         * symbol(s): `a`, `f`
         * application domain: generic
         * name: SpecificHelmholtzEnergy (specializes SpecificEnergy)
         * quantity dimension: L^2*T^-2
         * measurement unit(s): J/kg, m^2*s^-2
         * tensor order: 0
         * definition: quotient of Helmholtz energy and mass: `a = A/m` where A is Helmholtz energy (item 5-20.4) and m is mass (ISO 80000-4)
         * remarks: The name specific Helmholtz free energy is also used. However, this term is not recommended.
         */
    }

    alias specificHelmholtzFunction for specificHelmholtzEnergy;

    /* ISO-80000-5 item 5-21.5 specific Gibbs energy, specific Gibbs function */
    attribute specificGibbsEnergy: SpecificEnergyValue :> scalarQuantities {
        doc
        /*
         * source: item 5-21.5 specific Gibbs energy, specific Gibbs function
         * symbol(s): `g`
         * application domain: generic
         * name: SpecificGibbsEnergy (specializes SpecificEnergy)
         * quantity dimension: L^2*T^-2
         * measurement unit(s): J/kg, m^2*s^-2
         * tensor order: 0
         * definition: quotient of Gibbs energy and mass: `g = G/m` where `G` is Gibbs energy (item 5-20.5) and `m` is mass (ISO 80000-4)
         * remarks: The name specific Gibbs free energy is also used. However, this term is not recommended.
         */
    }

    alias specificGibbsFunction for specificGibbsEnergy;

    /* ISO-80000-5 item 5-22 Massieu function */
    attribute def MassieuFunctionValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-22 Massieu function
         * symbol(s): `J`
         * application domain: generic
         * name: MassieuFunction
         * quantity dimension: L^2*M^1*T^-2*Θ^-1
         * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
         * tensor order: 0
         * definition: quotient of the negative of Helmholtz energy and temperature: `J = -A/T` where `A` is Helmholtz energy (item 5-20.4) and `T` is thermodynamic temperature (item 5-1)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassieuFunctionUnit[1];
    }

    attribute massieuFunction: MassieuFunctionValue[*] nonunique :> scalarQuantities;

    attribute def MassieuFunctionUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-23 Planck function */
    attribute def PlanckFunctionValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-23 Planck function
         * symbol(s): `Y`
         * application domain: generic
         * name: PlanckFunction
         * quantity dimension: L^2*M^1*T^-2*Θ^-1
         * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
         * tensor order: 0
         * definition: quotient of the negative of Gibbs energy and temperature: `Y = -G/T` where G is Gibbs energy (item 5-20.5) and `T` is thermodynamic temperature (item 5-1)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: PlanckFunctionUnit[1];
    }

    attribute planckFunction: PlanckFunctionValue[*] nonunique :> scalarQuantities;

    attribute def PlanckFunctionUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-24 Joule-Thomson coefficient */
    attribute def JouleThomsonCoefficientValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-24 Joule-Thomson coefficient
         * symbol(s): `μ_"JT"`
         * application domain: generic
         * name: JouleThomsonCoefficient
         * quantity dimension: L^1*M^-1*T^2*Θ^1
         * measurement unit(s): K/Pa, kg^-1*m*s^2*K
         * tensor order: 0
         * definition: change of thermodynamic temperature with respect to pressure in a Joule-Thomson process at constant enthalpy: `μ_(JT) = ((partial T)/(partial p))_H` where `T` is thermodynamic temperature (item 5-1), `p` is pressure (ISO 80000-4) and H is enthalpy (item 5-20.3)
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: JouleThomsonCoefficientUnit[1];
    }

    attribute jouleThomsonCoefficient: JouleThomsonCoefficientValue[*] nonunique :> scalarQuantities;

    attribute def JouleThomsonCoefficientUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 1; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = -1; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = 2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-25.1 thermal efficiency */
    attribute def ThermalEfficiencyValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-25.1 thermal efficiency
         * symbol(s): `η`
         * application domain: thermodynamics
         * name: ThermalEfficiency (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of work (ISO 80000-4) delivered by a heat engine and supplied heat: `η = W/Q` where `W` is work (ISO 80000-4) and `Q` is heat (item 5-6.1)
         * remarks: None.
         */
    }
    attribute thermalEfficiency: ThermalEfficiencyValue :> scalarQuantities;

    /* ISO-80000-5 item 5-25.2 maximum thermal efficiency */
    attribute def MaximumThermalEfficiencyValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-25.2 maximum thermal efficiency
         * symbol(s): `η_"max"`
         * application domain: generic
         * name: MaximumThermalEfficiency (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: efficiency determined by the quotient of the temperatures of the hot source and the cold sink: `η_max = 1 - T_c/T_h` where `T_c` is the thermodynamic temperature (item 5-1) of the cold sink and `T_h` is the thermodynamic temperature (item 5-1) of the hot source
         * remarks: An ideal heat engine operating according to the Carnot process is delivering the maximum efficiency.
         */
    }
    attribute maximumThermalEfficiency: MaximumThermalEfficiencyValue :> scalarQuantities;

    /* ISO-80000-5 item 5-26 specific gas constant */
    attribute def SpecificGasConstantValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-26 specific gas constant
         * symbol(s): `R_s`
         * application domain: generic
         * name: SpecificGasConstant
         * quantity dimension: L^2*T^-2*Θ^-1
         * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
         * tensor order: 0
         * definition: quotient of the Boltzmann constant `k` (ISO 80000-1) and the mass `m` (ISO 80000-4) of the gas particle
         * remarks: None.
         */
        attribute :>> num: Real;
        attribute :>> mRef: SpecificGasConstantUnit[1];
    }

    attribute specificGasConstant: SpecificGasConstantValue[*] nonunique :> scalarQuantities;

    attribute def SpecificGasConstantUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = 2; }
        private attribute durationPF: QuantityPowerFactor[1] { :>> quantity = isq.T; :>> exponent = -2; }
        private attribute thermodynamicTemperaturePF: QuantityPowerFactor[1] { :>> quantity = isq.'Θ'; :>> exponent = -1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, durationPF, thermodynamicTemperaturePF); }
    }

    /* ISO-80000-5 item 5-27 mass concentration of water */
    attribute def MassConcentrationOfWaterValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-27 mass concentration of water
         * symbol(s): `w`
         * application domain: generic
         * name: MassConcentrationOfWater
         * quantity dimension: L^-3*M^1
         * measurement unit(s): kg*m^-3
         * tensor order: 0
         * definition: quotient of mass of water and a specified volume: `w = m/V` where `m` is mass (ISO 80000-4) of water, irrespective of the form of aggregation state, and `V` is volume (ISO 80000-3)
         * remarks: Mass concentration of water at saturation is denoted `w_"sat"`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassConcentrationOfWaterUnit[1];
    }

    attribute massConcentrationOfWater: MassConcentrationOfWaterValue[*] nonunique :> scalarQuantities;

    attribute def MassConcentrationOfWaterUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

    /* ISO-80000-5 item 5-28 mass concentration of water vapour absolute humidity */
    attribute def MassConcentrationOfWaterVapourAbsoluteHumidityValue :> ScalarQuantityValue {
        doc
        /*
         * source: item 5-28 mass concentration of water vapour absolute humidity
         * symbol(s): `v`
         * application domain: generic
         * name: MassConcentrationOfWaterVapourAbsoluteHumidity
         * quantity dimension: L^-3*M^1
         * measurement unit(s): kg*m^-3
         * tensor order: 0
         * definition: quotient of mass of water vapour and a specified volume: `v = m/V` where m is mass (ISO 80000-4) of water vapour and `V` is volume (ISO 80000-3)
         * remarks: Mass concentration of water vapour at saturation is denoted `v_"sat"`.
         */
        attribute :>> num: Real;
        attribute :>> mRef: MassConcentrationOfWaterVapourAbsoluteHumidityUnit[1];
    }

    attribute massConcentrationOfWaterVapourAbsoluteHumidity: MassConcentrationOfWaterVapourAbsoluteHumidityValue[*] nonunique :> scalarQuantities;

    attribute def MassConcentrationOfWaterVapourAbsoluteHumidityUnit :> DerivedUnit {
        private attribute lengthPF: QuantityPowerFactor[1] { :>> quantity = isq.L; :>> exponent = -3; }
        private attribute massPF: QuantityPowerFactor[1] { :>> quantity = isq.M; :>> exponent = 1; }
        attribute :>> quantityDimension { :>> quantityPowerFactors = (lengthPF, massPF); }
    }

    /* ISO-80000-5 item 5-29 mass ratio of water to dry matter */
    attribute def MassRatioOfWaterToDryMatterValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-29 mass ratio of water to dry matter
         * symbol(s): `u`
         * application domain: generic
         * name: MassRatioOfWaterToDryMatter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mass of water and mass of dry matter: `u = m/m_d` where `m` is mass (ISO 80000-4) of water and `m_d` is mass of dry matter
         * remarks: Mass ratio of water to dry matter at saturation is denoted `u_"sat"`.
         */
    }
    attribute massRatioOfWaterToDryMatter: MassRatioOfWaterToDryMatterValue :> scalarQuantities;

    /* ISO-80000-5 item 5-30 mass ratio of water vapour to dry gas */
    attribute def MassRatioOfWaterVapourToDryGasValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-30 mass ratio of water vapour to dry gas
         * symbol(s): `r`, `(x)`
         * application domain: generic
         * name: MassRatioOfWaterVapourToDryGas (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mass of water vapour and mass of dry gas: `r = m/m_d` where `m` is mass (ISO 80000-4) of water vapour and `m_d` is mass of dry gas
         * remarks: Mass ratio of water vapour to dry gas at saturation is denoted `r_"sat"`. Mass ratio of water vapour to dry gas is also called mixing ratio.
         */
    }
    attribute massRatioOfWaterVapourToDryGas: MassRatioOfWaterVapourToDryGasValue :> scalarQuantities;

    /* ISO-80000-5 item 5-31 mass fraction of water */
    attribute def MassFractionOfWaterValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-31 mass fraction of water
         * symbol(s): `w_(H_(2)O)`
         * application domain: generic
         * name: MassFractionOfWater (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `w_(H_(2)O) = u/(1+u)` where `u` is mass ratio of water to dry matter (item 5-29)
         * remarks: None.
         */
    }
    attribute massFractionOfWater: MassFractionOfWaterValue :> scalarQuantities;

    /* ISO-80000-5 item 5-32 mass fraction of dry matter */
    attribute def MassFractionOfDryMatterValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-32 mass fraction of dry matter
         * symbol(s): `w_d`
         * application domain: generic
         * name: MassFractionOfDryMatter (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quantity given by: `w_d = 1 - w_(H_(2)O)` where `w_(H_(2)O)` is mass fraction of water (item 5-31)
         * remarks: None.
         */
    }
    attribute massFractionOfDryMatter: MassFractionOfDryMatterValue :> scalarQuantities;

    /* ISO-80000-5 item 5-33 relative humidity */
    attribute def RelativeHumidityValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-33 relative humidity
         * symbol(s): `φ`
         * application domain: generic
         * name: RelativeHumidity (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of partial pressure of water vapour and partial pressure at its saturation: `φ = p/p_"sat"` where `p` is partial pressure (ISO 80000-4) of vapour and `p_"sat"` is its partial pressure at saturation at the same temperature
         * remarks: Relative humidity is often referred to as RH and expressed in percent. See also remark in item 5-35.
         */
    }
    attribute relativeHumidity: RelativeHumidityValue :> scalarQuantities;

    /* ISO-80000-5 item 5-34 relative mass concentration of vapour */
    attribute def RelativeMassConcentrationOfVapourValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-34 relative mass concentration of vapour
         * symbol(s): `φ`
         * application domain: generic
         * name: RelativeMassConcentrationOfVapour (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mass concentration of water vapour and mass concentration at its saturation: `φ = v/v_"sat"` where `v` is mass concentration of water vapour (item 5-28) and `v_"sat"` is its mass concentration of water vapour at saturation of the same temperature
         * remarks: For water vapour concentrations up to 1 kg/m^3, the relative humidity (item 5-33) is assumed to be equal to relative mass concentration of vapour. For details see Reference [8].
         */
    }
    attribute relativeMassConcentrationOfVapour: RelativeMassConcentrationOfVapourValue :> scalarQuantities;

    /* ISO-80000-5 item 5-35 relative mass ratio of vapour */
    attribute def RelativeMassRatioOfVapourValue :> DimensionOneValue {
        doc
        /*
         * source: item 5-35 relative mass ratio of vapour
         * symbol(s): `ψ`
         * application domain: generic
         * name: RelativeMassRatioOfVapour (specializes DimensionOneQuantity)
         * quantity dimension: 1
         * measurement unit(s): 1
         * tensor order: 0
         * definition: quotient of mass ratio of water vapour to dry gas and mass ratio of water vapour to dry gas at saturation: `ψ = r/r_"sat"` where `r` is mass ratio of water vapour to dry gas (item 5-30) and `r_"sat"` is its mass ratio of water vapour to dry gas at saturation of the same temperature
         * remarks: This quantity is also used as an approximation of relative humidity (item 5-33).
         */
    }
    attribute relativeMassRatioOfVapour: RelativeMassRatioOfVapourValue :> scalarQuantities;

    /* ISO-80000-5 item 5-36 dew-point temperature */
    attribute dewPointTemperature: ThermodynamicTemperatureValue :> scalarQuantities {
        doc
        /*
         * source: item 5-36 dew-point temperature
         * symbol(s): `T_d`
         * application domain: generic
         * name: DewPointTemperature (specializes ThermodynamicTemperature)
         * quantity dimension: Θ^1
         * measurement unit(s): K
         * tensor order: 0
         * definition: temperature at which water vapour in the air reaches saturation under isobaric conditions
         * remarks: The corresponding Celsius temperature, denoted `t_d`, is still called dew-point temperature. The unit for the corresponding Celsius temperature is degree Celsius, symbol °C.
         */
    }

}
