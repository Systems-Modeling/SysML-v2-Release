/**
 * International System of Quantities and Units
 * Generated on 2020-12-07T11:21:01Z from standard ISO-80000-8:2020 "Acoustics"
 * see also https://www.iso.org/obp/ui/#iso:std:iso:80000:-8:ed-2:v1:en
 *
 * Note 1: In documentation comments, AsciiMath notation (see http://asciimath.org/) is used for mathematical concepts,
 * with Greek letters in Unicode encoding. In running text, AsciiMath is placed between backticks.
 * Note 2: Limitation: for vector and tensor quantities currently only their (scalar) magnitude is defined. In a future 
 * upgrade they will be properly defined for multi-dimensional spaces with magnitude, direction and coordinate systems.
 */
package ISQAcoustics {
    private import ScalarValues::Real;
    private import Quantities::*;
    private import UnitsAndScales::*;    
    private import ISQ::SIDerivedUnit;

    private import ISQSpaceTime::LengthValue;
    private import ISQSpaceTime::displacement;
    private import ISQSpaceTime::TimeValue;
    private import ISQSpaceTime::time;
    private import ISQSpaceTime::velocity;
    private import ISQSpaceTime::acceleration;
    private import ISQMechanics::PowerValue;
    private import ISQMechanics::power;
    private import ISQMechanics::PressureValue;
    private import ISQMechanics::pressure;
    private import ISQThermodynamics::EnergyValue;
    private import ISQThermodynamics::energy;

    /**
     * source: item 8-1 logarithmic frequency range
     * symbol(s): `G`
     * application domain: General
     * name: LogarithmicFrequencyRange
     * quantity dimension: 1
     * measurement unit(s): oct, dec
     * definition: quantity given by: `G = log_2(f_2/f_1) "@[oct]" = log_10(f_2/f_1) "@[dec]"`, where `f_1` and `f_2` are two frequencies (ISO 80000-3)
     * remarks: One octave (oct) is the logarithmic frequency range between `f_1` and `f_2` when `f_2/f_1 = 2`. Similarly, one decade (dec) is the logarithmic frequency range between `f_1` and `f_2` when `f_2/f_1 = 10`; thus `1 "@[dec]" = log_2(10) "@[oct]" ≈ 3.322 "@[oct]"`. ISO 266 specifies preferred frequencies for acoustics separated by logarithmic frequency ranges equal to one tenth of a decade (`0.1 "@[dec]"`). Each `0.1 "@[dec]"` logarithmic frequency range is referred to in ISO 266 as a "one-third-octave interval" because `0.1 "@[dec]"` is approximately equal to `1/3 "@[oct]"`. Similarly, a logarithmic frequency range of `0.3 "@[dec]"` is referred to as a "one-octave interval" because `0.3 "@[dec]"` is approximately equal to `1 "@[oct]"`. A logarithmic frequency range equal to one tenth of a decade can be referred to as a decidecade.
     */
    attribute def LogarithmicFrequencyRangeUnit :> DimensionOneUnit {
    }
    attribute def LogarithmicFrequencyRangeValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: LogarithmicFrequencyRangeUnit :>> QuantityValue::mRef;
    }
    attribute logarithmicFrequencyRange: LogarithmicFrequencyRangeValue :> quantity;

    /**
     * source: item 8-2.1 static pressure
     * symbol(s): `p_s`
     * application domain: General
     * name: StaticPressure (specializes Pressure)
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: pressure (ISO 80000-4) in a medium when no sound wave is present
     * remarks: This definition applies to a medium with zero flow.
     */
    attribute staticPressure :> pressure;

    /**
     * source: item 8-2.2 sound pressure
     * symbol(s): `p`
     * application domain: General
     * name: SoundPressure (specializes Pressure)
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): Pa, kg*m^-1*s^-2
     * definition: difference between instantaneous total pressure and static pressure (item 8-2.1)
     * remarks: 
     */
    attribute soundPressure :> pressure;

    /**
     * source: item 8-3 sound particle displacement
     * symbol(s): `vec(δ)`
     * application domain: General
     * name: SoundParticleDisplacement (specializes Displacement)
     * quantity dimension: L^1
     * measurement unit(s): m
     * definition: vector (ISO 80000-2) quantity giving the instantaneous displacement (ISO 80000-3) of a particle in a medium from what would be its position in the absence of sound waves
     * remarks: 
     */
    attribute soundParticleDisplacement :> displacement;

    /**
     * source: item 8-4 sound particle velocity
     * symbol(s): `vec(u)`, `(vec(v))`
     * application domain: General
     * name: SoundParticleVelocity (specializes Velocity)
     * quantity dimension: L^1*T^-1
     * measurement unit(s): m*s^-1
     * definition: vector (ISO 80000-2) quantity given by: `vec(u) = del(vec(δ))/del(t)`, where `vec(δ)` is sound particle displacement (item 8-3) and `t` is time (ISO 80000-3)
     * remarks: The definition is limited to small-amplitude acoustic disturbances such that the magnitude of `vec(u)` is small relative to the phase speed (ISO 80000-3) of sound.
     */
    attribute soundParticleVelocity :> velocity;

    /**
     * source: item 8-5 sound particle acceleration
     * symbol(s): `vec(a)`
     * application domain: General
     * name: SoundParticleAcceleration (specializes Acceleration)
     * quantity dimension: L^1*T^-2
     * measurement unit(s): m*s^-2
     * definition: vector (ISO 80000-2) quantity given by: `vec(a) = (del(vec(u)))/(del(t))`, where `vec(u)` is sound particle velocity (item 8-4) and `t` is time
     * remarks: The definition is limited to small-amplitude acoustic disturbances such that the magnitude of `vec(u)` is small relative to the phase speed (ISO 80000-3) of sound.
     */
    attribute soundParticleAcceleration :> acceleration;

    /**
     * source: item 8-6 volume velocity, volume flow rate
     * symbol(s): `q`, `q_v`
     * application domain: General
     * name: VolumeVelocity (specializes Velocity)
     * quantity dimension: L^3*T^-1
     * measurement unit(s): m^3*s^-1
     * definition: surface integral of the normal component of the sound particle velocity (item 8-4) over a defined surface
     * remarks: 
     */
    attribute volumeVelocity :> velocity;

    alias volumeVelocity as volumeFlowRate;

    /**
     * source: item 8-7 sound energy density
     * symbol(s): `w`
     * application domain: General
     * name: SoundEnergyDensity
     * quantity dimension: L^-1*M^1*T^-2
     * measurement unit(s): J/m^3, kg*m^-1*s^-2
     * definition: quantity given by: `w = 1/2 ρ_m u^2 + 1/2 p^2/(ρ_m c^2)`, where `ρ_m` is mean density (ISO 80000-4), `u` is the magnitude of the sound particle velocity (item 8-4), `p` is sound pressure (item 8-2.2), and `c` is the phase speed (ISO 80000-3) of sound
     * remarks: In formula form: `E = int_(t_1)^(t_2) p^2 dt`, where `t_1` and `t_2` are the starting and ending times for the integral and `p` is sound pressure (item 8-2.2). In airborne acoustics, the sound pressure is frequency-weighted and frequency-band-limited. If frequency weightings as specified in IEC 61672-1 are applied, this should be indicated by appropriate subscripts to the symbol `E`. In underwater acoustics, the term ""sound exposure"" indicates an unweighted quantity unless indicated otherwise.
     */
    attribute def SoundEnergyDensityUnit :> SIDerivedUnit {
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
    attribute def SoundEnergyDensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundEnergyDensityUnit :>> QuantityValue::mRef;
    }
    attribute soundEnergyDensity: SoundEnergyDensityValue :> quantity;

    /**
     * source: item 8-8 sound energy
     * symbol(s): `Q`
     * application domain: General
     * name: SoundEnergy (specializes Energy)
     * quantity dimension: L^2*M^1*T^-2
     * measurement unit(s): J, kg*m^2*s^-2
     * definition: integral of sound energy density (item 8-7) over a specified volume
     * remarks: The sound energy in region `R` can be expressed by: `Q = oint_R w(x) d^3x`, where `d^3x` is an element of volume.
     */
    attribute soundEnergy :> energy;

    /**
     * source: item 8-9 sound power
     * symbol(s): `P`, `W`
     * application domain: General
     * name: SoundPower (specializes Power)
     * quantity dimension: L^2*M^1*T^-3
     * measurement unit(s): W, kg*m^2*s^-3
     * definition: integral over a surface of the product of sound pressure, `p` (item 8-2.2), and the component `u_n` of the particle velocity (item 8-4) in the direction normal to the surface, at a point on the surface
     * remarks: This definition holds for waves in the volume of homogenous fluids or gases. This definition can become inapplicable in situations with a high mean fluid flow. Sound power is for example used to indicate the rate at which energy is radiated by a sound source. Sound power is an oscillatory quantity that can be positive or negative. A positive sound power indicates that the sound power is radiated out of the surface. A negative sound power indicates that the sound power is absorbed into the surface.
     */
    attribute soundPower :> power;

    /**
     * source: item 8-10 sound intensity
     * symbol(s): `vec(I)`
     * application domain: General
     * name: SoundIntensity
     * quantity dimension: M^1*T^-3
     * measurement unit(s): W/m^2, kg*s^-3
     * definition: vector (ISO 80000-2) quantity given by: `vec(I) = p vec(u)`, where `p` is sound pressure (item 8-2.2) and `vec(u)` is sound particle velocity (item 8-4)
     * remarks: This definition can become inapplicable in situations with a high mean fluid flow.
     */
    attribute def SoundIntensityUnit :> SIDerivedUnit {
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def SoundIntensityValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundIntensityUnit :>> QuantityValue::mRef;
    }
    attribute soundIntensity: SoundIntensityValue :> quantity;

    /**
     * source: item 8-11 sound exposure
     * symbol(s): `E`
     * application domain: General
     * name: SoundExposure
     * quantity dimension: L^-2*M^2*T^-3
     * measurement unit(s): Pa^2*s, kg^2*m^-2*s^-3
     * definition: time-integrated squared sound pressure (item 8-2.2)
     * remarks: In formula form: `E = int_(t_1)^(t_2) p^2 dt`, where `t_1` and `t_2` are the starting and ending times for the integral and `p` is sound pressure (item 8-2.2). In airborne acoustics, the sound pressure is frequency-weighted and frequency-band-limited. If frequency weightings as specified in IEC 61672-1 are applied, this should be indicated by appropriate subscripts to the symbol `E`. In underwater acoustics, the term "sound exposure" indicates an unweighted quantity unless indicated otherwise.
     */
    attribute def SoundExposureUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -2;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 2;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -3;
        }
    }
    attribute def SoundExposureValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundExposureUnit :>> QuantityValue::mRef;
    }
    attribute soundExposure: SoundExposureValue :> quantity;

    /**
     * source: item 8-12 characteristic impedance of a medium for longitudinal waves
     * symbol(s): `Z_c`
     * application domain: General
     * name: CharacteristicImpedanceOfAMediumForLongitudinalWaves
     * quantity dimension: L^-2*M^1*T^-1
     * measurement unit(s): Pa*s/m, kg*m^-2*s^-1
     * definition: quotient of sound pressure (item 8-2.2) and the component of the sound particle velocity (item 8-4) in the direction of the wave propagation
     * remarks: The definition is limited to a progressive plane wave in a non-dissipative homogenous gas or fluid. Characteristic impedance is a property of the medium and is equal to `ρ c` where `ρ` is the time-averaged density (ISO 80000-4) of the medium and `c` the phase speed of sound (ISO 80000-3). Longitudinal waves are waves in which the displacement of the medium is in the same direction as, or the opposite direction to, the direction of propagation of the wave.
     */
    attribute def CharacteristicImpedanceOfAMediumForLongitudinalWavesUnit :> SIDerivedUnit {
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
    attribute def CharacteristicImpedanceOfAMediumForLongitudinalWavesValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: CharacteristicImpedanceOfAMediumForLongitudinalWavesUnit :>> QuantityValue::mRef;
    }
    attribute characteristicImpedanceOfAMediumForLongitudinalWaves: CharacteristicImpedanceOfAMediumForLongitudinalWavesValue :> quantity;

    /**
     * source: item 8-13 acoustic impedance
     * symbol(s): `Z_a`
     * application domain: General
     * name: AcousticImpedance
     * quantity dimension: L^-4*M^1*T^-1
     * measurement unit(s): Pa*s/m^3, kg*m^-4*s^-1
     * definition: at a surface, quotient of the average sound pressure (item 8-2.2) over that surface and the sound volume flow rate (item 8-6) through that surface
     * remarks: This definition applies to a sound pressure that is in phase with the volume flow rate. In this situation, the acoustic impedance is real. Both the sound pressure, `p`, and sound volume flow rate, `q`, are real quantities that fluctuate with time. If the fluctuations are in phase (phase difference equal to zero), the quotient `p/q` is a constant. If they are out of phase (phase difference not equal to zero), they can be represented by complex quantities in the frequency domain, the quotient of which is also complex.
     */
    attribute def AcousticImpedanceUnit :> SIDerivedUnit {
        attribute lengthPowerFactor :>> SIDerivedUnit::lengthPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -4;
        }
        attribute massPowerFactor :>> SIDerivedUnit::massPowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = 1;
        }
        attribute timePowerFactor :>> SIDerivedUnit::timePowerFactor {
            attribute exponent :>> UnitPowerFactor::exponent = -1;
        }
    }
    attribute def AcousticImpedanceValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: AcousticImpedanceUnit :>> QuantityValue::mRef;
    }
    attribute acousticImpedance: AcousticImpedanceValue :> quantity;

    /**
     * source: item 8-14 sound pressure level
     * symbol(s): `L_p`
     * application domain: General
     * name: SoundPressureLevel
     * quantity dimension: 1
     * measurement unit(s): dB
     * definition: quantity given by: `L_p = 10 log_10((p_(RMS)^2)/p_0^2) "@[dB]"`, where `p_(RMS)` is the root-mean-square sound pressure in the time domain and `p_0` is the reference value of sound pressure
     * remarks: For sound in air and other gases, the reference value of sound pressure is given by `p_0 = 20 "@[μPa]"`. For sound in water and other liquids, the reference value of sound pressure is given by `p_0 = 1 "@[μPa]"`. When stating a value of sound pressure level, the reference value shall be specified. The value of sound pressure level depends on the selected frequency range and time duration. When stating a value of sound pressure level, the frequency range and time duration shall be specified. In accordance with ISO 80000-1, any attachment to the unit symbol as a means of giving information about the special nature of the quantity or context of measurement under consideration is not permitted. If specific frequency and time weightings as specified in IEC 61672-1 or specific frequency bands or time duration are applied, this should be indicated by appropriate subscripts to the quantity symbol. In some applications the level of the peak sound pressure is required. This is obtained by replacing the root-mean-square sound pressure, with the instantaneous sound pressure having the greatest absolute value during a stated time interval, in the definition of sound pressure level.
     */
    attribute def SoundPressureLevelUnit :> DimensionOneUnit {
    }
    attribute def SoundPressureLevelValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundPressureLevelUnit :>> QuantityValue::mRef;
    }
    attribute soundPressureLevel: SoundPressureLevelValue :> quantity;

    /**
     * source: item 8-15 sound power level
     * symbol(s): `L_P`, `L_W`
     * application domain: General
     * name: SoundPowerLevel
     * quantity dimension: 1
     * measurement unit(s): dB
     * definition: quantity given by: `L_P = 10 log_10 ((P_m)/P_0) "@[dB]"`, where `P_m` is the magnitude of the time-averaged sound power (item 8-9) and `P_0` is the reference value of sound power
     * remarks: The reference value of sound power is given by `P_0 = 1 "@[pW]"`. When stating a value of sound power level, the reference value shall be specified. The value of sound power level depends on the selected frequency range and time duration. When stating a value of sound power level, the frequency range and time duration shall be specified. In accordance with ISO 80000-1, any attachment to the unit symbol as a means of giving information about the special nature of the quantity or context of measurement under consideration is not permitted. If specific frequency and time weightings as specified in IEC 61672-1 or specific frequency bands or time duration are applied, this should be indicated by appropriate subscripts to the quantity symbol.
     */
    attribute def SoundPowerLevelUnit :> DimensionOneUnit {
    }
    attribute def SoundPowerLevelValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundPowerLevelUnit :>> QuantityValue::mRef;
    }
    attribute soundPowerLevel: SoundPowerLevelValue :> quantity;

    /**
     * source: item 8-16 sound exposure level
     * symbol(s): `L_E`
     * application domain: General
     * name: SoundExposureLevel
     * quantity dimension: 1
     * measurement unit(s): dB
     * definition: quantity given by: `L_E = 10 log_10(E/E_0) "@[dB]"`, where `E` is sound exposure (item 8-11) and `E_0` is the reference value of sound exposure
     * remarks: For sound in air and other gases, the reference value of sound exposure is given by `E_0 = 400 "@"["μPa"^2*"s"]`. For sound in water and other liquids, the reference value of sound exposure is given by `E_0 = 1"@"["μPa"^2*"s"]`. When stating a value of sound exposure level, the reference value shall be specified. The value of sound exposure level depends on the selected frequency range and time duration. When stating a value of sound exposure level, the frequency range and time duration shall be specified. In accordance with ISO 80000-1, any attachment to the unit symbol as a means of giving information about the special nature of the quantity or context of measurement under consideration is not permitted. If specific frequency and time weightings as specified in IEC 61672-1 or specific frequency bands or time duration are applied, this should be indicated by appropriate subscripts to the quantity symbol.
     */
    attribute def SoundExposureLevelUnit :> DimensionOneUnit {
    }
    attribute def SoundExposureLevelValue :> QuantityValue {
        attribute num: Real :>> QuantityValue::num;
        attribute mRef: SoundExposureLevelUnit :>> QuantityValue::mRef;
    }
    attribute soundExposureLevel: SoundExposureLevelValue :> quantity;

    /**
     * source: item 8-17 reverberation time
     * symbol(s): `T`
     * application domain: General
     * name: ReverberationTime (specializes Time)
     * quantity dimension: T^1
     * measurement unit(s): s
     * definition: time duration (ISO 80000-3) required for the space-averaged sound energy density (item 8-7) to decrease to `10^(−6)` of its initial value (i.e. for its level to decrease by `60 "@[dB]"`) after the source emission has stopped
     * remarks: The reverberation time can be evaluated based on a dynamic range smaller than `60 "@[dB]"` and extrapolated to a decay time of `60 "@[dB]"`. It is then labelled accordingly `T_n`, where `n` is the dynamic range in `"@[dB]"`. See also ISO 3382-1.
     */
    attribute reverberationTime :> time;

}
