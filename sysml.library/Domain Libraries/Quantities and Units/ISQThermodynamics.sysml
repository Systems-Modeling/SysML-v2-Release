/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard ISO-80000-5:2019 "Thermodynamics"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-5:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQThermodynamics {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    /**    
     * source: item 5-1 thermodynamic temperature, temperature
     * symbol(s): `T`, `Θ`
     * application domain: General
     * name: ThermodynamicTemperature
     * quantity dimension: Θ^1
     * measurement unit(s): K
     * definition: partial derivative of internal energy with respect to entropy at constant volume and constant number of particles in the system: `T = ((partial U)/(partial S))_(V,N)` where `U` is internal energy (item 5-20.2), `S` is entropy (item 5-18), `V` is volume (ISO 80000-3), and `N` is number of particles
     * remarks: It is measured with a primary thermometer, examples of which are gas thermometers of different kinds, noise thermometers, or radiation thermometers. The Boltzmann constant (ISO 80000-1) relates energy at the individual particle level with thermodynamic temperature. Differences of thermodynamic temperatures or changes may be expressed either in kelvin, symbol K, or in de grees Celsius, symbol °C (item 5-2). Thermodynamic temperature is one of the seven base quantities in the International System of Quantities, ISQ (see ISO 80000-1). The International Temperature Scale of 1990. For the purpose of practical measurements, the International Temperature Scale of 1990, ITS-90, was adopted by CIPM in 1989, which is a close approximation to the thermodynamic temperature scale. The quantities defined by this scale are denoted T_(90) and t_(90), respectively (replacing T_(68) and t_(68) defined by the International Practical Temperature Scale of 1968, IPTS-68), where `t_90/(1 °C) = T_90/(1 K) - 273,1`. The units of T_(90) and t_(90) are the kelvin, symbol K, and the degree Celsius, symbol °C (item 5-2), respectively. For further information, see References^[5^],^[6^]. For ready conversion between temperatures reported on the International Temperature Scale and thermodynamic temperatures the systematic deviations can be found in Reference^[7^].
     */
    attribute def ThermodynamicTemperatureUnit :> SimpleUnit {
        attribute unitPowerFactor :>> SimpleUnit::unitPowerFactor {
            attribute unit: ThermodynamicTemperatureUnit :>> UnitPowerFactor::unit;
        }
    }
    attribute def ThermodynamicTemperatureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermodynamicTemperatureUnit :>> QuantityValue::mRef;
    }    
    attribute thermodynamicTemperature: ThermodynamicTemperatureValue :> quantity;

    alias ThermodynamicTemperatureUnit as TemperatureUnit;
    alias ThermodynamicTemperatureValue as TemperatureValue;
    alias thermodynamicTemperature as temperature;

    /**
     * source: item 5-2 Celsius temperature
     * symbol(s): `t`, `θ`
     * application domain: General
     * name: CelsiusTemperature
     * quantity dimension: Θ^1
     * measurement unit(s): °C
     * definition: temperature difference from the thermodynamic temperature of the ice point is called the Celsius temperature t, which is defined by the quantity equation: `t = T - T_0` where `T` is thermodynamic temperature (item 5-1) and `T_0 = 273,15 K`
     * remarks: The unit degree Celsius is a special name for the kelvin for use in stating values of Celsius temperature. The unit degree Celsius is by definition equal in magnitude to the kelvin. A difference or interval of temperature may be expressed in kelvin or in degrees Celsius. The thermodynamic temperature T_0 is 0,01 K below the thermodynamic temperature of the triple point of water. The symbol °C for the degree Celsius shall be preceded by a space (see ISO 80000-1). Prefixes are not allowed in combination with the unit °C.
     */
    attribute def CelsiusTemperatureUnit :> SIDerivedUnit {
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def CelsiusTemperatureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CelsiusTemperatureUnit :>> QuantityValue::mRef;
    }
    attribute celsiusTemperature: CelsiusTemperatureValue :> quantity;

    /**
     * source: item 5-3.1 linear expansion coefficient
     * symbol(s): `α_l`
     * application domain: General
     * name: LinearExpansionCoefficient
     * quantity dimension: Θ^-1
     * measurement unit(s): K^-1
     * definition: relative change of length with temperature: `α_l = 1/l * (dl)/(dT)` where l is length (ISO 80000-3) and `T` is thermodynamic temperature (item 5-1)
     * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
     */
    attribute def LinearExpansionCoefficientUnit :> SIDerivedUnit {
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def LinearExpansionCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LinearExpansionCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute linearExpansionCoefficient: LinearExpansionCoefficientValue :> quantity;

    /**
     * source: item 5-3.2 cubic expansion coefficient
     * symbol(s): `α_V`, `γ`
     * application domain: General
     * name: CubicExpansionCoefficient
     * quantity dimension: Θ^-1
     * measurement unit(s): K^-1
     * definition: relative change of volume with temperature: `α_V = 1/V * (dV)/(dT)` where `V` is volume (ISO 80000-3) and `T` is thermodynamic temperature (item 5-1)
     * remarks: Also called volumetric expansion coefficient. The subscripts in the symbols may be omitted when there is no risk of confusion.
     */
    attribute def CubicExpansionCoefficientUnit :> SIDerivedUnit {
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def CubicExpansionCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CubicExpansionCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute cubicExpansionCoefficient: CubicExpansionCoefficientValue :> quantity;

    /**
     * source: item 5-3.3 relative pressure coefficient
     * symbol(s): `α_p`
     * application domain: General
     * name: RelativePressureCoefficient
     * quantity dimension: Θ^-1
     * measurement unit(s): K^-1
     * definition: relative change of pressure with temperature at constant volume: `α_p = 1/p * ((partial p)/(partial T))_V` where `p` is pressure (ISO 80000-4), `T` is thermodynamic temperature (item 5-1), and `V` is volume (ISO 80000-3)
     * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
     */
    attribute def RelativePressureCoefficientUnit :> SIDerivedUnit {
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def RelativePressureCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativePressureCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute relativePressureCoefficient: RelativePressureCoefficientValue :> quantity;

    /**
     * source: item 5-4 pressure coefficient
     * symbol(s): `β`
     * application domain: General
     * name: PressureCoefficient
     * quantity dimension: L^-1*M^1*T^-2*Θ^-1
     * measurement unit(s): Pa/K, kg*m^-1*s^-2*K^-1
     * definition: change of pressure with temperature at constant volume: `β = ((partial p)/(partial T))_V` where `p` is pressure (ISO 80000-4), `T` is thermodynamic temperature (item 5-1), and `V` is volume (ISO 80000-3)
     * remarks: 
     */
    attribute def PressureCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def PressureCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PressureCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute pressureCoefficient: PressureCoefficientValue :> quantity;

    /**
     * source: item 5-5.1 isothermal compressibility
     * symbol(s): `ϰ_T`
     * application domain: General
     * name: IsothermalCompressibility
     * quantity dimension: L^1*M^-1*T^2
     * measurement unit(s): Pa^-1, kg^-1*m*s^2
     * definition: negative relative change of volume with pressure at constant temperature: ϰ_T `= - 1/V * ((partial V)/(partial p))_T` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and `T` is thermodynamic temperature (item 5-1)
     * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
     */
    attribute def IsothermalCompressibilityUnit :> SIDerivedUnit {
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
    attribute def IsothermalCompressibilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: IsothermalCompressibilityUnit :>> QuantityValue::mRef;
    }
    attribute isothermalCompressibility: IsothermalCompressibilityValue :> quantity;

    /**
     * source: item 5-5.2 isentropic compressibility
     * symbol(s): `ϰ_S`
     * application domain: General
     * name: IsentropicCompressibility
     * quantity dimension: L^1*M^-1*T^2
     * measurement unit(s): Pa^-1, kg^-1*m*s^2
     * definition: negative relative change of volume with pressure at constant entropy: ϰ_S `= - 1/V * ((partial V)/(partial p))_S` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and S is entropy (item 5-18)
     * remarks: The subscripts in the symbols may be omitted when there is no risk of confusion.
     */
    attribute def IsentropicCompressibilityUnit :> SIDerivedUnit {
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
    attribute def IsentropicCompressibilityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: IsentropicCompressibilityUnit :>> QuantityValue::mRef;
    }
    attribute isentropicCompressibility: IsentropicCompressibilityValue :> quantity;

    /**
     * source: item 5-6.1 heat, amount of heat
     * symbol(s): `Q`
     * application domain: General
     * name: Heat
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: difference between the increase in the internal energy (item 5-20.2) of a system and the work (ISO 80000-4) done on the system, provided that the amounts of substances within the system are not changed
     * remarks: The heat transferred in an isothermal phase transformation should be expressed as the change in the appropriate state functions, e.g. T ΔS, where `T` is thermodynamic temperature (item 5-1) and S is entropy (item 5-18), or ΔH, where H is enthalpy (item 5-20.3). NOTE A supply of heat can correspond to an increase in thermodynamic temperature or to other effects, such as phase change or chemical processes; see item 5-6.2.
     */
    attribute def HeatUnit :> SIDerivedUnit {
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
    attribute def HeatValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: HeatUnit :>> QuantityValue::mRef;
    }
    attribute heat: HeatValue :> quantity;

    alias HeatUnit as AmountOfHeatUnit;
    alias HeatValue as AmountOfHeatValue;
    alias heat as amountOfHeat;

    /**
     * source: item 5-6.2 latent heat
     * symbol(s): `Q`
     * application domain: General
     * name: LatentHeat
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: energy released or absorbed by a system during a constant-temperature process
     * remarks: Examples of latent heat are latent heat of fusion (melting) and latent heat of vaporization (boiling).
     */
    attribute def LatentHeatUnit :> SIDerivedUnit {
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
    attribute def LatentHeatValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LatentHeatUnit :>> QuantityValue::mRef;
    }
    attribute latentHeat: LatentHeatValue :> quantity;

    /**
     * source: item 5-7 heat flow rate
     * symbol(s): `dot(Q)`
     * application domain: General
     * name: HeatFlowRate
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): W, J/s, kg*m^2*s^-3
     * definition: time rate at which heat (item 5-6.1) crosses a given surface
     * remarks: 
     */
    attribute def HeatFlowRateUnit :> SIDerivedUnit {
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
    attribute def HeatFlowRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: HeatFlowRateUnit :>> QuantityValue::mRef;
    }
    attribute heatFlowRate: HeatFlowRateValue :> quantity;

    /**
     * source: item 5-8 density of heat flow rate
     * symbol(s): `q`, `φ`
     * application domain: General
     * name: DensityOfHeatFlowRate
     * quantity dimension: M^1*T^-3
     * measurement unit(s): W/m^2, kg*s^-3
     * definition: quotient of heat flow rate and area: `q = dot Q / A` where `dot Q` is heat flow rate (item 5-7) and A is area (ISO 80000-3) of a given surface
     * remarks: 
     */
    attribute def DensityOfHeatFlowRateUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def DensityOfHeatFlowRateValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: DensityOfHeatFlowRateUnit :>> QuantityValue::mRef;
    }
    attribute densityOfHeatFlowRate: DensityOfHeatFlowRateValue :> quantity;

    /**
     * source: item 5-9 thermal conductivity
     * symbol(s): `λ_l`, `(ϰ)`
     * application domain: General
     * name: ThermalConductivity
     * quantity dimension: L^1*M^1*T^-3*Θ^-1
     * measurement unit(s): W/(m*K), kg*m*s^-3*K^-1
     * definition: quotient of density of heat flow rate (item 5-8) and thermodynamic temperature gradient that has the same direction as the heat flow
     * remarks: 
     */
    attribute def ThermalConductivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ThermalConductivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalConductivityUnit :>> QuantityValue::mRef;
    }
    attribute thermalConductivity: ThermalConductivityValue :> quantity;

    /**
     * source: item 5-10.1 coefficient of heat transfer
     * symbol(s): `K`, `(k)`
     * application domain: General
     * name: CoefficientOfHeatTransfer
     * quantity dimension: M^1*T^-3*Θ^-1
     * measurement unit(s): W/(m^2*K), kg*s^-3*K^-1
     * definition: quotient of density of heat flow rate (item 5-8) and thermodynamic temperature (item 5-1) difference
     * remarks: In building technology, the coefficient of heat transfer is often called thermal transmittance, with the symbol U (no longer recommended). See remark to item 5-13.
     */
    attribute def CoefficientOfHeatTransferUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def CoefficientOfHeatTransferValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CoefficientOfHeatTransferUnit :>> QuantityValue::mRef;
    }
    attribute coefficientOfHeatTransfer: CoefficientOfHeatTransferValue :> quantity;

    /**
     * source: item 5-10.2 surface coefficient of heat transfer
     * symbol(s): `h`, `(α)`
     * application domain: General
     * name: SurfaceCoefficientOfHeatTransfer
     * quantity dimension: M^1*T^-3*Θ^-1
     * measurement unit(s): W/(m^2*K), kg*s^-3*K^-1
     * definition: quotient of density of heat flow rate and the difference of the temperature at the surface and a reference temperature: `h = q / (T_s - T_r)` where q is density of heat flow rate (item 5-8), T_s is the thermodynamic temperature (item 5-1) at the surface, and T_r is a reference thermodynamic temperature characterizing the adjacent surroundings
     * remarks: 
     */
    attribute def SurfaceCoefficientOfHeatTransferUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SurfaceCoefficientOfHeatTransferValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SurfaceCoefficientOfHeatTransferUnit :>> QuantityValue::mRef;
    }
    attribute surfaceCoefficientOfHeatTransfer: SurfaceCoefficientOfHeatTransferValue :> quantity;

    /**
     * source: item 5-11 thermal insulance, coefficient of thermal insulance
     * symbol(s): `M`
     * application domain: General
     * name: ThermalInsulance
     * quantity dimension: M^-1*T^3*Θ^1
     * measurement unit(s): m^2*K/W, kg^-1*s^3*K
     * definition: inverse of coefficient of heat transfer K: `M = 1/K` where K is coefficient of heat transfer (item 5-10.1)
     * remarks: In building technology, this quantity is often called thermal resistance, with the symbol R.
     */
    attribute def ThermalInsulanceUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ThermalInsulanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalInsulanceUnit :>> QuantityValue::mRef;
    }
    attribute thermalInsulance: ThermalInsulanceValue :> quantity;

    alias ThermalInsulanceUnit as CoefficientOfThermalInsulanceUnit;
    alias ThermalInsulanceValue as CoefficientOfThermalInsulanceValue;
    alias thermalInsulance as coefficientOfThermalInsulance;

    /**
     * source: item 5-12 thermal resistance
     * symbol(s): `R`
     * application domain: General
     * name: ThermalResistance
     * quantity dimension: L^-2*M^-1*T^3*Θ^1
     * measurement unit(s): K/W, kg^-1*m^-2*s^3*K
     * definition: quotient of thermodynamic temperature (item 5-1) difference and heat flow rate (item 5-7)
     * remarks: See remark to item 5-11.
     */
    attribute def ThermalResistanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def ThermalResistanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalResistanceUnit :>> QuantityValue::mRef;
    }
    attribute thermalResistance: ThermalResistanceValue :> quantity;

    /**
     * source: item 5-13 thermal conductance
     * symbol(s): `G`, `(H)`
     * application domain: General
     * name: ThermalConductance
     * quantity dimension: L^2*M^1*T^-3*Θ^-1
     * measurement unit(s): W/K, kg*m^2*s^-3*K^-1
     * definition: inverse of thermal resistance R: `G = 1/R` where R is thermal resistance (item 5-12)
     * remarks: See remark to item 5-11. This quantity is also called heat transfer coefficient. See item 5-10.1.
     */
    attribute def ThermalConductanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ThermalConductanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalConductanceUnit :>> QuantityValue::mRef;
    }
    attribute thermalConductance: ThermalConductanceValue :> quantity;

    /**
     * source: item 5-14 thermal diffusivity
     * symbol(s): `a`
     * application domain: General
     * name: ThermalDiffusivity
     * quantity dimension: L^2*T^-1
     * measurement unit(s): m^2*s^-1
     * definition: quotient of thermal conductivity and the product of mass density and specific heat capacity: `a = λ / (ρ C_p)` where λ is thermal conductivity (item 5-9), ρ is mass density (ISO 80000-4), and c_p is specific heat capacity at constant pressure (item 5-16.2)
     * remarks: 
     */
    attribute def ThermalDiffusivityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def ThermalDiffusivityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: ThermalDiffusivityUnit :>> QuantityValue::mRef;
    }
    attribute thermalDiffusivity: ThermalDiffusivityValue :> quantity;

    /**
     * source: item 5-15 heat capacity
     * symbol(s): `C`
     * application domain: General
     * name: HeatCapacity
     * quantity dimension: L^2*M^1*T^-2*Θ^-1
     * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
     * definition: derivative of added heat with respect to thermodynamic temperature of a system: `C = (dQ)/(dT)` where Q is amount of heat (item 5-6.1) and `T` is thermodynamic temperature (item 5-1)
     * remarks: Heat capacity is not completely defined unless specified as seen in items 5-16.2, 5-16.3 and 5-16.4.
     */
    attribute def HeatCapacityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def HeatCapacityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: HeatCapacityUnit :>> QuantityValue::mRef;
    }
    attribute heatCapacity: HeatCapacityValue :> quantity;

    /**
     * source: item 5-16.1 specific heat capacity
     * symbol(s): `c`
     * application domain: General
     * name: SpecificHeatCapacity
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: quotient of heat capacity and mass: `c = C/m` where C is heat capacity (item 5-15) and m is mass (ISO 80000-4)
     * remarks: For the corresponding quantities related to the amount of substance, see ISO 80000-9.
     */
    attribute def SpecificHeatCapacityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificHeatCapacityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificHeatCapacityUnit :>> QuantityValue::mRef;
    }
    attribute specificHeatCapacity: SpecificHeatCapacityValue :> quantity;

    /**
     * source: item 5-16.2 specific heat capacity at constant pressure
     * symbol(s): `c_p`
     * application domain: General
     * name: SpecificHeatCapacityAtConstantPressure
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: specific heat capacity (item 5-16.1) at constant pressure (ISO 80000-4)
     * remarks: Also called specific isobaric heat capacity.
     */
    attribute def SpecificHeatCapacityAtConstantPressureUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificHeatCapacityAtConstantPressureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificHeatCapacityAtConstantPressureUnit :>> QuantityValue::mRef;
    }
    attribute specificHeatCapacityAtConstantPressure: SpecificHeatCapacityAtConstantPressureValue :> quantity;

    /**
     * source: item 5-16.3 specific heat capacity at constant volume
     * symbol(s): `c_V`
     * application domain: General
     * name: SpecificHeatCapacityAtConstantVolume
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: specific heat capacity (item 5-16.1) at constant volume (ISO 80000-3)
     * remarks: Also called specific isochoric heat capacity.
     */
    attribute def SpecificHeatCapacityAtConstantVolumeUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificHeatCapacityAtConstantVolumeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificHeatCapacityAtConstantVolumeUnit :>> QuantityValue::mRef;
    }
    attribute specificHeatCapacityAtConstantVolume: SpecificHeatCapacityAtConstantVolumeValue :> quantity;

    /**
     * source: item 5-16.4 specific heat capacity at saturated vapour pressure
     * symbol(s): `c_(sat)`
     * application domain: General
     * name: SpecificHeatCapacityAtSaturatedVapourPressure
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: specific heat capacity (item 5-16.1) at saturated vapour pressure (ISO 80000-4)
     * remarks: 
     */
    attribute def SpecificHeatCapacityAtSaturatedVapourPressureUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificHeatCapacityAtSaturatedVapourPressureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificHeatCapacityAtSaturatedVapourPressureUnit :>> QuantityValue::mRef;
    }
    attribute specificHeatCapacityAtSaturatedVapourPressure: SpecificHeatCapacityAtSaturatedVapourPressureValue :> quantity;

    /**
     * source: item 5-17.1 ratio of specific heat capacities
     * symbol(s): `γ`
     * application domain: General
     * name: RatioOfSpecificHeatCapacities
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of specific heat capacity at constant pressure and specific heat capacity at constant volume: `γ = c_p/c_V` where c_p is specific heat capacity at constant pressure (item 5-16.2) and c_V is specific heat capacity at constant volume (item 5-16.3)
     * remarks: This quantity can also be expressed by `γ = C_p/C_V` where C_p is heat capacity at constant pressure and C_V is heat capacity at constant volume.
     */
    attribute def RatioOfSpecificHeatCapacitiesUnit :> DimensionOneUnit {
    }
    attribute def RatioOfSpecificHeatCapacitiesValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RatioOfSpecificHeatCapacitiesUnit :>> QuantityValue::mRef;
    }
    attribute ratioOfSpecificHeatCapacities: RatioOfSpecificHeatCapacitiesValue :> quantity;

    /**
     * source: item 5-17.2 isentropic exponent, isentropic expansion factor
     * symbol(s): `ϰ`
     * application domain: General
     * name: IsentropicExponent
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: the negative of relative pressure change, divided by relative volume change, at constant entropy: ϰ `= - V/p * ((partial p)/(partial V))_S` where `V` is volume (ISO 80000-3), `p` is pressure (ISO 80000-4), and S is entropy (item 5-18)
     * remarks: For an ideal gas, ϰ is equal to γ (item 5-17.1).
     */
    attribute def IsentropicExponentUnit :> DimensionOneUnit {
    }
    attribute def IsentropicExponentValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: IsentropicExponentUnit :>> QuantityValue::mRef;
    }
    attribute isentropicExponent: IsentropicExponentValue :> quantity;

    alias IsentropicExponentUnit as IsentropicExpansionFactorUnit;
    alias IsentropicExponentValue as IsentropicExpansionFactorValue;
    alias isentropicExponent as isentropicExpansionFactor;

    /**
     * source: item 5-18 entropy
     * symbol(s): `S`
     * application domain: General
     * name: Entropy
     * quantity dimension: L^2*M^1*T^-2*Θ^-1
     * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
     * definition: natural logarithm of number of equally probable microscopic configurations in a macroscopic system, multiplied by the Boltzmann constant: S = k lnW where W is number of configurations and k is the Boltzmann constant (ISO 80000-1)
     * remarks: 
     */
    attribute def EntropyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def EntropyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EntropyUnit :>> QuantityValue::mRef;
    }
    attribute entropy: EntropyValue :> quantity;

    /**
     * source: item 5-19 specific entropy
     * symbol(s): `s`
     * application domain: General
     * name: SpecificEntropy
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: quotient of entropy and mass: `s = S/m` where S is entropy (item 5-18) and m is mass (ISO 80000-4)
     * remarks: For the corresponding quantity related to amount of substance, see ISO 80000-9.
     */
    attribute def SpecificEntropyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificEntropyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificEntropyUnit :>> QuantityValue::mRef;
    }
    attribute specificEntropy: SpecificEntropyValue :> quantity;

    /**
     * source: item 5-20.1 energy
     * symbol(s): `E`
     * application domain: thermodynamics
     * name: Energy
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: ability of a system to do work (ISO 80000-4)
     * remarks: Energy exists in different forms that are mutually transformable into each other, either totally or partially. In contrast to internal energy (item 5-20.2), energy is not a state function.
     */
    attribute def EnergyUnit :> SIDerivedUnit {
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
    attribute def EnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnergyUnit :>> QuantityValue::mRef;
    }
    attribute energy: EnergyValue :> quantity;

    /**
     * source: item 5-20.2 internal energy, thermodynamic energy
     * symbol(s): `U`
     * application domain: General
     * name: InternalEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: energy of a system whose change is given by the amount of the heat (item 5-6.1) transferred to the system and the work (ISO 80000-4) done on the system, provided that the system is closed and no chemical reactions occur
     * remarks: In thermodynamic text books, usually the formula ΔU = Q + W is used. Note that the zero of the energy is undefined.
     */
    attribute internalEnergy :> energy;

    alias internalEnergy as thermodynamicEnergy;

    /**
     * source: item 5-20.3 enthalpy
     * symbol(s): `H`
     * application domain: General
     * name: Enthalpy
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: sum of internal energy of the system and the product of pressure and volume of the system: `H = U + p*V` where U is internal energy (item 5-20.2), `p` is pressure (ISO 80000-4), and `V` is volume (ISO 80000-3)
     * remarks: 
     */
    attribute def EnthalpyUnit :> SIDerivedUnit {
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
    attribute def EnthalpyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EnthalpyUnit :>> QuantityValue::mRef;
    }
    attribute enthalpy: EnthalpyValue :> quantity;

    /**
     * source: item 5-20.4 Helmholtz energy, Helmholtz function
     * symbol(s): `A`, `F`
     * application domain: General
     * name: HelmholtzEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: difference of internal energy of the system and the product of thermodynamic temperature and entropy of the system: A = U - TS where U is internal energy (item 5-20.2), `T` is thermodynamic temperature (item 5-1), and S is entropy (item 5-18)
     * remarks: The name Helmholtz free energy is also used. However, this term is not recommended.
     */
    attribute helmholtzEnergy :> energy;

    alias helmholtzEnergy as helmholtzFunction;

    /**
     * source: item 5-20.5 Gibbs energy, Gibbs function
     * symbol(s): `G`
     * application domain: General
     * name: GibbsEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: difference of the enthalpy and the product of thermodynamic temperature and entropy of the system: `G = H - T*S` where H is enthalpy (item 5-20.3), `T` is thermodynamic temperature (item 5-1), and S is entropy (item 5-18)
     * remarks: The name Gibbs free energy is also used. However, this term is not recommended.
     */
    attribute gibbsEnergy :> energy;

    alias gibbsEnergy as gibbsFunction;

    /**
     * source: item 5-21.1 specific energy
     * symbol(s): `e`
     * application domain: General
     * name: SpecificEnergy
     * quantity dimension: L^2*T^-2
     * measurement unit(s): J/kg, m^2*s^-2
     * definition: quotient of energy and mass: `e = E/m` where E is energy (item 5-20.1) and m is mass (ISO 80000-4)
     * remarks: 
     */
    attribute def SpecificEnergyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def SpecificEnergyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificEnergyUnit :>> QuantityValue::mRef;
    }
    attribute specificEnergy: SpecificEnergyValue :> quantity;

    /**
     * source: item 5-21.2 specific internal energy, specific thermodynamic energy
     * symbol(s): `u`
     * application domain: General
     * name: SpecificInternalEnergy (specializes SpecificEnergy)
     * quantity dimension: L^2*T^-2
     * measurement unit(s): J/kg, m^2*s^-2
     * definition: quotient of internal energy and mass: `u = U/m` where U is internal energy (item 5-20.2) and m is mass (ISO 80000-4)
     * remarks: 
     */
    attribute specificInternalEnergy :> specificEnergy;

    alias specificInternalEnergy as specificThermodynamicEnergy;

    /**
     * source: item 5-21.3 specific enthalpy
     * symbol(s): `h`
     * application domain: General
     * name: SpecificEnthalpy
     * quantity dimension: L^2*T^-2
     * measurement unit(s): J/kg, m^2*s^-2
     * definition: quotient of enthalpy and mass: `h = H/m` where H is enthalpy (item 5-20.3) and m is mass (ISO 80000-4)
     * remarks: 
     */
    attribute def SpecificEnthalpyUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
    }
    attribute def SpecificEnthalpyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificEnthalpyUnit :>> QuantityValue::mRef;
    }
    attribute specificEnthalpy: SpecificEnthalpyValue :> quantity;

    /**
     * source: item 5-21.4 specific Helmholtz energy, specific Helmholtz function
     * symbol(s): `a`, `f`
     * application domain: General
     * name: SpecificHelmholtzEnergy (specializes SpecificEnergy)
     * quantity dimension: L^2*T^-2
     * measurement unit(s): J/kg, m^2*s^-2
     * definition: quotient of Helmholtz energy and mass: `a = A/m` where A is Helmholtz energy (item 5-20.4) and m is mass (ISO 80000-4)
     * remarks: The name specific Helmholtz free energy is also used. However, this term is not recommended.
     */
    attribute specificHelmholtzEnergy :> specificEnergy;

    alias specificHelmholtzEnergy as specificHelmholtzFunction;

    /**
     * source: item 5-21.5 specific Gibbs energy, specific Gibbs function
     * symbol(s): `g`
     * application domain: General
     * name: SpecificGibbsEnergy (specializes SpecificEnergy)
     * quantity dimension: L^2*T^-2
     * measurement unit(s): J/kg, m^2*s^-2
     * definition: quotient of Gibbs energy and mass: `g = G/m` where G is Gibbs energy (item 5-20.5) and m is mass (ISO 80000-4)
     * remarks: The name specific Gibbs free energy is also used. However, this term is not recommended.
     */
    attribute specificGibbsEnergy :> specificEnergy;

    alias specificGibbsEnergy as specificGibbsFunction;

    /**
     * source: item 5-22 Massieu function
     * symbol(s): `J`
     * application domain: General
     * name: MassieuFunction
     * quantity dimension: L^2*M^1*T^-2*Θ^-1
     * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
     * definition: quotient of the negative of Helmholtz energy and temperature: `J = - A/T` where A is Helmholtz energy (item 5-20.4) and `T` is thermodynamic temperature (item 5-1)
     * remarks: 
     */
    attribute def MassieuFunctionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def MassieuFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassieuFunctionUnit :>> QuantityValue::mRef;
    }
    attribute massieuFunction: MassieuFunctionValue :> quantity;

    /**
     * source: item 5-23 Planck function
     * symbol(s): `Y`
     * application domain: General
     * name: PlanckFunction
     * quantity dimension: L^2*M^1*T^-2*Θ^-1
     * measurement unit(s): J/K, kg*m^2*s^-2*K^-1
     * definition: quotient of the negative of Gibbs energy and temperature: `Y = - G/T` where G is Gibbs energy (item 5-20.5) and `T` is thermodynamic temperature (item 5-1)
     * remarks: 
     */
    attribute def PlanckFunctionUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def PlanckFunctionValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: PlanckFunctionUnit :>> QuantityValue::mRef;
    }
    attribute planckFunction: PlanckFunctionValue :> quantity;

    /**
     * source: item 5-24 Joule-Thomson coefficient
     * symbol(s): `μ_(JT)`
     * application domain: General
     * name: JouleThomsonCoefficient
     * quantity dimension: L^1*M^-1*T^2*Θ^1
     * measurement unit(s): K/Pa, kg^-1*m*s^2*K
     * definition: change of thermodynamic temperature with respect to pressure in a Joule-Thomson process at constant enthalpy: `μ_(JT) = ((partial T)/(partial p))_H` where `T` is thermodynamic temperature (item 5-1), `p` is pressure (ISO 80000-4) and H is enthalpy (item 5-20.3)
     * remarks: 
     */
    attribute def JouleThomsonCoefficientUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def JouleThomsonCoefficientValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: JouleThomsonCoefficientUnit :>> QuantityValue::mRef;
    }
    attribute jouleThomsonCoefficient: JouleThomsonCoefficientValue :> quantity;

    /**
     * source: item 5-25.1 efficiency
     * symbol(s): `η`
     * application domain: thermodynamics
     * name: Efficiency
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of work (ISO 80000-4) delivered by a heat engine and supplied heat: `η = W/Q` where W is work (ISO 80000-4) and Q is heat (item 5-6.1)
     * remarks: 
     */
    attribute def EfficiencyUnit :> DimensionOneUnit {
    }
    attribute def EfficiencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: EfficiencyUnit :>> QuantityValue::mRef;
    }
    attribute efficiency: EfficiencyValue :> quantity;

    /**
     * source: item 5-25.2 maximum efficiency
     * symbol(s): `η_(max)`
     * application domain: General
     * name: MaximumEfficiency
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: efficiency determined by the quotient of the temperatures of the hot source and the cold sink: `η_max = 1 - T_c/T_h` where T_c is the thermodynamic temperature (item 5-1) of the cold sink and T_h is the thermodynamic temperature (item 5-1) of the hot source
     * remarks: An ideal heat engine operating according to the Carnot process is delivering the maximum efficiency.
     */
    attribute def MaximumEfficiencyUnit :> DimensionOneUnit {
    }
    attribute def MaximumEfficiencyValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MaximumEfficiencyUnit :>> QuantityValue::mRef;
    }
    attribute maximumEfficiency: MaximumEfficiencyValue :> quantity;

    /**
     * source: item 5-26 specific gas constant
     * symbol(s): `R_s`
     * application domain: General
     * name: SpecificGasConstant
     * quantity dimension: L^2*T^-2*Θ^-1
     * measurement unit(s): J/(kg*K), m^2*s^-2*K^-1
     * definition: quotient of the Boltzmann constant k (ISO 80000-1) and the mass m (ISO 80000-4) of the gas particle
     * remarks: 
     */
    attribute def SpecificGasConstantUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute temperaturePowerFactor :>> SIDerivedUnit::temperaturePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def SpecificGasConstantValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SpecificGasConstantUnit :>> QuantityValue::mRef;
    }
    attribute specificGasConstant: SpecificGasConstantValue :> quantity;

    /**
     * source: item 5-27 mass concentration of water
     * symbol(s): `w`
     * application domain: General
     * name: MassConcentrationOfWater
     * quantity dimension: L^-3*M^1
     * measurement unit(s): kg*m^-3
     * definition: quotient of mass of water and a specified volume: `w = m/V` where m is mass (ISO 80000-4) of water, irrespective of the form of aggregation state, and `V` is volume (ISO 80000-3)
     * remarks: Mass concentration of water at saturation is denoted w_(sat).
     */
    attribute def MassConcentrationOfWaterUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MassConcentrationOfWaterValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassConcentrationOfWaterUnit :>> QuantityValue::mRef;
    }
    attribute massConcentrationOfWater: MassConcentrationOfWaterValue :> quantity;

    /**
     * source: item 5-28 mass concentration of water vapour absolute humidity
     * symbol(s): `v`
     * application domain: General
     * name: MassConcentrationOfWaterVapourAbsoluteHumidity
     * quantity dimension: L^-3*M^1
     * measurement unit(s): kg*m^-3
     * definition: quotient of mass of water vapour and a specified volume: `v = m/V` where m is mass (ISO 80000-4) of water vapour and `V` is volume (ISO 80000-3)
     * remarks: Mass concentration of water vapour at saturation is denoted v_(sat).
     */
    attribute def MassConcentrationOfWaterVapourAbsoluteHumidityUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
    }
    attribute def MassConcentrationOfWaterVapourAbsoluteHumidityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassConcentrationOfWaterVapourAbsoluteHumidityUnit :>> QuantityValue::mRef;
    }
    attribute massConcentrationOfWaterVapourAbsoluteHumidity: MassConcentrationOfWaterVapourAbsoluteHumidityValue :> quantity;

    /**
     * source: item 5-29 mass ratio of water to dry matter
     * symbol(s): `u`
     * application domain: General
     * name: MassRatioOfWaterToDryMatter
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass of water and mass of dry matter: `u = m/m_d` where m is mass (ISO 80000-4) of water and m_d is mass of dry matter
     * remarks: Mass ratio of water to dry matter at saturation is denoted u_(sat).
     */
    attribute def MassRatioOfWaterToDryMatterUnit :> DimensionOneUnit {
    }
    attribute def MassRatioOfWaterToDryMatterValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassRatioOfWaterToDryMatterUnit :>> QuantityValue::mRef;
    }
    attribute massRatioOfWaterToDryMatter: MassRatioOfWaterToDryMatterValue :> quantity;

    /**
     * source: item 5-30 mass ratio of water vapour to dry gas
     * symbol(s): `r`, `(x)`
     * application domain: General
     * name: MassRatioOfWaterVapourToDryGas
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass of water vapour and mass of dry gas: `r = m/m_d` where m is mass (ISO 80000-4) of water vapour and m_d is mass of dry gas
     * remarks: Mass ratio of water vapour to dry gas at saturation is denoted r_(sat). Mass ratio of water vapour to dry gas is also called mixing ratio.
     */
    attribute def MassRatioOfWaterVapourToDryGasUnit :> DimensionOneUnit {
    }
    attribute def MassRatioOfWaterVapourToDryGasValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassRatioOfWaterVapourToDryGasUnit :>> QuantityValue::mRef;
    }
    attribute massRatioOfWaterVapourToDryGas: MassRatioOfWaterVapourToDryGasValue :> quantity;

    /**
     * source: item 5-31 mass fraction of water
     * symbol(s): `w_(H_(2)O)`
     * application domain: General
     * name: MassFractionOfWater
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantity given by: `w_(H_(2)O) = u/(1+u)` where u is mass ratio of water to dry matter (item 5-29)
     * remarks: 
     */
    attribute def MassFractionOfWaterUnit :> DimensionOneUnit {
    }
    attribute def MassFractionOfWaterValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassFractionOfWaterUnit :>> QuantityValue::mRef;
    }
    attribute massFractionOfWater: MassFractionOfWaterValue :> quantity;

    /**
     * source: item 5-32 mass fraction of dry matter
     * symbol(s): `w_d`
     * application domain: General
     * name: MassFractionOfDryMatter
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quantity given by: `w_d = 1 - w_(H_(2)O)` where `w_(H_(2)O)` is mass fraction of water (item 5-31)
     * remarks: 
     */
    attribute def MassFractionOfDryMatterUnit :> DimensionOneUnit {
    }
    attribute def MassFractionOfDryMatterValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: MassFractionOfDryMatterUnit :>> QuantityValue::mRef;
    }
    attribute massFractionOfDryMatter: MassFractionOfDryMatterValue :> quantity;

    /**
     * source: item 5-33 relative humidity
     * symbol(s): `φ`
     * application domain: General
     * name: RelativeHumidity
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of partial pressure of water vapour and partial pressure at its saturation: `φ = p/p_(sat)` where p is partial pressure (ISO 80000-4) of vapour and p_(sat) is its partial pressure at saturation at the same temperature
     * remarks: Relative humidity is often referred to as RH and expressed in percent. See also remark in item 5-35.
     */
    attribute def RelativeHumidityUnit :> DimensionOneUnit {
    }
    attribute def RelativeHumidityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeHumidityUnit :>> QuantityValue::mRef;
    }
    attribute relativeHumidity: RelativeHumidityValue :> quantity;

    /**
     * source: item 5-34 relative mass concentration of vapour
     * symbol(s): `φ`
     * application domain: General
     * name: RelativeMassConcentrationOfVapour
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass concentration of water vapour and mass concentration at its saturation: `φ = v/v_(sat)` where v is mass concentration of water vapour (item 5-28) and v_(sat) is its mass concentration of water vapour at saturation of the same temperature
     * remarks: For water vapour concentrations up to 1 kg/m^3, the relative humidity (item 5-33) is assumed to be equal to relative mass concentration of vapour. For details see Reference ^[8^].
     */
    attribute def RelativeMassConcentrationOfVapourUnit :> DimensionOneUnit {
    }
    attribute def RelativeMassConcentrationOfVapourValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeMassConcentrationOfVapourUnit :>> QuantityValue::mRef;
    }
    attribute relativeMassConcentrationOfVapour: RelativeMassConcentrationOfVapourValue :> quantity;

    /**
     * source: item 5-35 relative mass ratio of vapour
     * symbol(s): `ψ`
     * application domain: General
     * name: RelativeMassRatioOfVapour
     * quantity dimension: 1
     * measurement unit(s): 1
     * definition: quotient of mass ratio of water vapour to dry gas and mass ratio of water vapour to dry gas at saturation: `ψ = r/r_(sat)` where r is mass ratio of water vapour to dry gas (item 5-30) and r_(sat) is its mass ratio of water vapour to dry gas at saturation of the same temperature
     * remarks: This quantity is also used as an approximation of relative humidity (item 5-33).
     */
    attribute def RelativeMassRatioOfVapourUnit :> DimensionOneUnit {
    }
    attribute def RelativeMassRatioOfVapourValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: RelativeMassRatioOfVapourUnit :>> QuantityValue::mRef;
    }
    attribute relativeMassRatioOfVapour: RelativeMassRatioOfVapourValue :> quantity;

    /**
     * source: item 5-36 dew-point temperature
     * symbol(s): `T_d`
     * application domain: General
     * name: DewPointTemperature (specializes ThermodynamicTemperature)
     * quantity dimension: Θ^1
     * measurement unit(s): K
     * definition: temperature at which water vapour in the air reaches saturation under isobaric conditions
     * remarks: The corresponding Celsius temperature, denoted t_d, is still called dew-point temperature. The unit for the corresponding Celsius temperature is degree Celsius, symbol °C.
     */
    attribute dewPointTemperature :> thermodynamicTemperature;

}
