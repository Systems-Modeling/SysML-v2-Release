package SimpleVehicleModel{
    // 2023-02 release
    import Definitions::*;  
    import ISQ::*;
    package Definitions{
        import PartDefinitions::*;
        import PortDefinitions::*;
        import ItemDefinitions::*;
        import SignalDefinitions::*;
        import InterfaceDefinitions::*;
        import AllocationDefinitions::*;
        import ActionDefinitions::*;
        import StateDefinitions::*;
        import RequirementDefinitions::*;
        import AttributeDefinitions::*;
        import IndividualDefinitions::*;
        import MetadataDefinitions::**;
        import KeyWord_MetadataDefinitions::*;
        package PartDefinitions{
            part def Vehicle {
                attribute mass :> ISQ::mass;
                attribute dryMass:>ISQ::mass;
                attribute cargoMass:>ISQ::mass;
                attribute position:>ISQ::length;
                attribute velocity:>ISQ::speed;
                attribute acceleration:>ISQ::acceleration;
                attribute electricalPower:>ISQ::power;
                attribute Tmax:>ISQ::temperature;
                attribute maintenanceTime: Time::DateTime; 
                attribute brakePedalDepressed: Boolean;
                port ignitionCmdPort:IgnitionCmdPort;
                port pwrCmdPort:PwrCmdPort;
                port vehicleToRoadPort:VehicleToRoadPort;
                port statusPort:StatusPort;
                perform action providePower;
                perform action provideBraking;
                perform action controlDirection;
                perform action performSelfTest;
                perform action applyParkingBrake;
                perform action senseTemperature;
                exhibit state vehicleStates parallel {
                    ref controller : VehicleController;
                    state operatingStates {
                        entry action initial;
                        state off;                    
                        state starting;                    
                        state on {
                            entry performSelfTest;
                            do providePower;
                            exit applyParkingBrake;
                            constraint {electricalPower<=500[W]}
                        }

                        transition initial then off;

                        transition off_To_starting
                            first off
                            accept ignitionCmd:IgnitionCmd via ignitionCmdPort
                                if ignitionCmd.ignitionOnOff==IgnitionOnOff::on and brakePedalDepressed
                            do send StartSignal() to controller
                            then starting;
                        
                        transition starting_To_on
                            first starting
                            accept VehicleOnSignal
                            then on;
                        
                        transition on_To_off
                            first on
                            accept VehicleOffSignal
                            do send OffSignal() to controller
                            then off;
                    }

                    state healthStates {
                        entry action initial;
                        do senseTemperature{
                            out temp;
                        }

                        state normal;
                        state maintenance;
                        state degraded;                    

                        transition initial then normal;

                        transition normal_To_maintenance
                            first normal
                            accept at maintenanceTime
                            then maintenance;

                        transition normal_To_degraded
                            first normal
                            accept when senseTemperature.temp > Tmax 
                            do send OverTemp() to controller
                            then degraded;

                        transition maintenance_To_normal
                            first maintenance
                            accept ReturnToNormal
                            then normal;

                        transition degraded_To_normal
                            first degraded
                            accept ReturnToNormal
                            then normal;
                    }
                }
            }
            part def Engine{
                attribute mass :> ISQ::mass;
                attribute peakHorsePower:>ISQ::power;
                attribute fuelEfficiency:Real;
                attribute cost:Real;
                attribute displacement :> ISQ::volume;
                port engineControlPort: ~ControlPort;
                port fuelInPort: ~ FuelPort;
                port fuelCmdPort:FuelCmdPort;
                port drivePwrPort:DrivePwrPort;
                port ignitionCmdPort:IgnitionCmdPort;
                port flyWheelPort;
                perform action generateTorque;
                exhibit state engineStates{
                    state off;
                    state starting;
                    state on{
                        do generateTorque;
                    }
                }
            }
            part def StarterMotor{
                port gearPort:GearPort;
            }
            part def Cylinder;
            part def Transmission{
                attribute gearRatio:Real;
                port clutchPort:~DrivePwrPort;
                exhibit state transmissionStates;
            }
            part def Driveshaft;
            part def AxleAssembly;
            part def Axle{
                attribute mass:>ISQ::mass;
            }
            part def FrontAxle:>Axle{
                attribute steeringAngle:>ISQ::planeAngle;
            }
            part def HalfAxle{
                port shankCompositePort:ShankCompositePort{
                }
            }
            part def Differential;
            part def Wheel{
                attribute diameter:LengthValue;
                port lugNutCompositePort:LugNutCompositePort;
            }
            part def Hub{
                port shankCompositePort:ShankCompositePort;
            }
            abstract part def Software;
            part def VehicleSoftware:>Software;
            part def VehicleController:>Software {
                port controlPort:ControlPort;
                exhibit state controllerStates parallel {
                    state operatingStates {
                        entry action initial; 
                        state off;
                        state on;    
                        transition initial then off;
                        transition 'off-on'
                            first off
                            accept StartSignal
                            then on;
                        transition 'on-off'
                            first on
                            accept OffSignal
                            then off;
                    }
                }  
            }
            part def CruiseController:>Software {
                port setSpeedPort:~SetSpeedPort;
                port speedSensorPort:~SpeedSensorPort;
                port cruiseControlPort:CruiseControlPort;
                exhibit state cruiseControllerStates;
            }
            part def SpeedSensor{
                port speedSensorPort:SpeedSensorPort;
            }
            part def FuelTank{
                attribute mass :> ISQ::mass;
                ref item fuel:Fuel{
                    attribute :>> fuelMass;
                }
                attribute fuelKind:FuelKind;
                attribute fuelMassMax:>ISQ::mass;
                assert constraint fuelConstraint {fuel.fuelMass<=fuelMassMax}
                port fuelOutPort:FuelPort;
                port fuelInPort:~FuelPort;
            }
            part def BodyAssy;
            part def Body{
                attribute color:Colors;
            }
            part def Thermostat;
            part def WaterHose;
            part def Road{
                attribute incline:Real;
                attribute friction:Real;
            }
            part def Engine4Cyl;
            part def Engine6Cyl;
            part def TransmissionChoices;
            part def TransmissionAutomatic;
            part def TransmissionManual;
            part def Sunroof;
            
            //logical Components
            part def ElectricalGenerator;
            part def TorqueGenerator;
            part def SteeringSubsystem;
            part def BrakingSubsystem;
        }
        package PortDefinitions{
            port def IgnitionCmdPort{
                in item ignitionCmd:IgnitionCmd;
            }
            port def StatusPort;
            port def GearPort;
            port def PwrCmdPort{
                in item pwrCmd:PwrCmd;
            }
            port def FuelCmdPort:>PwrCmdPort{
                in item fuelCmd:FuelCmd redefines pwrCmd;
            }
            port def FuelPort{
                out item fuel:Fuel;
            }
            port def DrivePwrPort{
                out torque:Torque;
            }
            port def ShaftPort_a;
            port def ShaftPort_b;
            port def ShaftPort_c;
            port def ShaftPort_d;
            port def DiffPort;
            port def AxlePort;
            port def AxleToWheelPort;
            port def WheelToAxlePort;
            port def WheelToRoadPort;

            port def LugNutCompositePort{
                port lugNutPort:LugNutPort [*];
            }
            port def ShankCompositePort{
                port shankPort:ShankPort [*];
            }
            port def LugNutPort{
                attribute threadDia;
                attribute threadPitch;
            }
            port def ShankPort{
                attribute threadDia;
                attribute threadPitch;   
                attribute shaftLength;
            }
            
            port def VehicleToRoadPort;
            port def ControlPort;
            port def CruiseControlPort:>ControlPort;
            port def SpeedSensorPort;
            port def SetSpeedPort;

            port def DriverCmdPort{
                out item driverCmd[*]:DriverCmd;
            }
            port def HandPort :> DriverCmdPort {
                out item ignitionCmd:IgnitionCmd subsets driverCmd;
                out item pwrCmd:PwrCmd subsets driverCmd;
            }  
        }
        package ItemDefinitions{
            item def PwrCmd{
                attribute throttleLevel:Real;
            }
            item def FuelCmd:>PwrCmd;
            item def Fuel{
                attribute fuelMass:>ISQ::mass;
            }
            item def SensedSpeed{
                attribute speed:>ISQ::speed;
            }
        }
        package SignalDefinitions{
            item def Cmd{
            }
            item def DriverCmd;
            item def IgnitionCmd:>DriverCmd{
                attribute ignitionOnOff:IgnitionOnOff;
            }
            item def EngineStatus;
            
            attribute def VehicleStartSignal;
            attribute def VehicleOnSignal;
            attribute def VehicleOffSignal;
            attribute def StartSignal;
            attribute def OffSignal;
            attribute def OverTemp;
            attribute def ReturnToNormal;
            attribute def SetSpeed:>Real;
        }
        package InterfaceDefinitions{
            interface def EngineToTransmissionInterface{
                end p1:DrivePwrPort;
                end p2:~DrivePwrPort;
                flow p1.torque to p2.torque;
            }
            interface def FuelInterface {
                end fuelOutPort:FuelPort;
                end fuelInPort:~FuelPort;
                flow of Fuel from fuelOutPort.fuel to fuelInPort.fuel;
            }
            
            interface def WheelFastenerInterface{
                end lugNutPort:LugNutPort;
                end shankPort:ShankPort;
                attribute maxTorque : Torque;
                constraint {lugNutPort.threadDia == shankPort.threadDia}
            }
            interface def WheelHubInterface{
                end lugNutCompositePort:LugNutCompositePort;
                end shankCompositePort:ShankCompositePort;
                interface wheelFastenerInterface:WheelFastenerInterface [5]
                    connect lugNutCompositePort.lugNutPort to shankCompositePort.shankPort;
            }
        }
        package AllocationDefinitions{
            allocation def LogicalToPhysical{
                end #logical logicalEnd;
                end #physical physicalEnd;
            }
        }
        package ActionDefinitions{
            action def ProvidePower {
                in item pwrCmd:PwrCmd;
                out wheelToRoadTorque:Torque[2];
            }
            action def GenerateTorque {
                in item fuelCmd:FuelCmd;
                out engineTorque:Torque;
            }
            action def AmplifyTorque {
                in engineTorque:Torque;
                out transmissionTorque:Torque;
            }
            action def TransferTorque {
                in transmissionTorque:Torque;
                out driveshaftTorque:Torque;
            }
            action def DistributeTorque {
                in driveshaftTorque:Torque;
                out wheelToRoadTorque:Torque[2];
            }
            action def PerformSelfTest;
            action def ApplyParkingBrake;
            action def SenseTemperature{
                out temp: ISQ::TemperatureValue;
            }
        }    
        package StateDefinitions {
            state def VehicleStates;
            state def ControllerStates;  
            state def CruiseControllerStates;
        }
        package RequirementDefinitions{
            requirement def MassRequirement{
                doc /*The actual mass shall be less than the required mass*/
                attribute massRequired:>ISQ::mass;
                attribute massActual:>ISQ::mass;
                require constraint {massActual<=massRequired}
            }
            requirement def ReliabilityRequirement{
                doc /*The actual reliability shall be greater than the required reliability*/
                attribute reliabilityRequired:Real;
                attribute reliabilityActual:Real;
                require constraint {reliabilityActual>=reliabilityRequired}
            }
            requirement def TorqueGenerationRequirement {
                doc /* The engine shall generate torque as a function of RPM as shown in Table 1. */
                subject generateTorque:ActionDefinitions::GenerateTorque;
            }
            requirement def DrivePowerOutputRequirement { 
                doc /* The engine shall provide a connection point to transfer torque to the transmission.*/
            }
            requirement def FuelEconomyRequirement {
                doc /* The vehicle shall maintain an average fuel economomy of at least x miles per gallon for the nominal 
                driving scenario */
                attribute actualFuelEconomy :> distancePerVolume;
                attribute requiredFuelEconomy :> distancePerVolume;
                require constraint {actualFuelEconomy >= requiredFuelEconomy}
            }
        }
        package AttributeDefinitions{
            import ScalarValues::*;
            import Quantities::*;
            import MeasurementReferences::DerivedUnit;
            import SIPrefixes::kilo;
            // Numerical Functions provides basic operators such as Sum expression
            import NumericalFunctions::*;
            import SI::*;
            import USCustomaryUnits::*;
            alias Torque for ISQ::TorqueValue;
            
            enum def Colors {black;grey;red;}
            enum def DiameterChoices:>ISQ::LengthValue{
                enum = 60 [mm];
                enum = 80 [mm];
                enum = 100 [mm];
            }
            attribute cylinderDiameter: DiameterChoices = 80 [mm]; 
            enum def IgnitionOnOff {on;off;}
            enum def FuelKind {gas;diesel;}

            distancePerVolume :> scalarQuantities = distance / volume;
            timePerDistance :> scalarQuantities = time / distance;
            volumePerDistance :> scalarQuantities = volume / distance;
            volumePerTime :> scalarQuantities = volume / time;
            
            // kpl is approx .425 * mpg
            kpl : DerivedUnit = km / L;
            rpm : DerivedUnit = 1 / SI::min;
            kW : DerivedUnit = kilo * W;
            
        }
        package IndividualDefinitions{
            individual def VehicleRoadContext_1:>GenericContext::Context;
            individual def Vehicle_1:>Vehicle;
            individual def FrontAxleAssembly_1:>AxleAssembly;
            individual def FrontAxle_1:>FrontAxle;
            individual def Wheel_1:>Wheel;
            individual def Wheel_2:>Wheel;
            individual def RearAxleAssembly_1:>AxleAssembly;
            individual def Road_1:>Road;
        }
        package MetadataDefinitions { 
            import AnalysisTooling::*;   
            metadata def Safety {
                attribute isMandatory : Boolean;
            }
            metadata def Security;
        }
        package KeyWord_MetadataDefinitions{
            import Metaobjects::SemanticMetadata;
            
            // the following is used to define the key word failureMode
            state failureModes[*] nonunique;
            
            // with alias <fm>
            metadata def <fm> failureMode :> SemanticMetadata {
                :>> baseType = failureModes meta SysML::StateUsage;
            }
            
            occurrence logicalOccurrences [*] nonunique;
            
            metadata def <l> logical :> SemanticMetadata {
                :>> baseType = logicalOccurrences meta SysML::Usage;
            }
            
            occurrence physicalOccurrences [*] nonunique;
            
            metadata def <p> physical :> SemanticMetadata {
                :>> baseType = physicalOccurrences meta SysML::Usage;
            }  
        }
        package GenericContext {

            part def Context {
                attribute time:TimeValue;
                attribute spatialCF: CartesianSpatial3dCoordinateFrame[1] { :>> mRefs = (m, m, m); }
                attribute velocityCF: CartesianVelocity3dCoordinateFrame[1] = spatialCF/s;
                attribute accelarationCF: CartesianAcceleration3dCoordinateFrame[1] = velocityCF/s;
            }
        }
    }

    package VehicleLogicalConfiguration{
        package PartsTree{
            #logical part vehicleLogical:Vehicle{
                part torqueGenerator:TorqueGenerator{
                    action generateTorque;
                }
                part electricalGenerator:ElectricalGenerator{
                    action generateElectricity;
                }
                part steeringSystem:SteeringSubsystem;
                part brakingSubsystem:BrakingSubsystem;
            }
        }
    }
    package VehicleLogicalToPhysicalAllocation{
        import VehicleConfigurations::VehicleConfiguration_b::PartsTree::**;
        import VehicleLogicalConfiguration::PartsTree::*;

        allocation vehicleLogicalToPhysicalAllocation:LogicalToPhysical
            allocate vehicleLogical to vehicle_b{
                allocate vehicleLogical.torqueGenerator to vehicle_b.engine{
                    allocate vehicleLogical.torqueGenerator.generateTorque to vehicle_b.engine.generateTorque;
                }
                allocate vehicleLogical.electricalGenerator to vehicle_b.engine{
                    allocate vehicleLogical.electricalGenerator.generateElectricity to vehicle_b.engine.alternator.generateElectricity;
                }
            }
    } 
    package VehicleConfigurations{
        package VehicleConfiguration_a{
            package PartsTree{
                part vehicle_a:Vehicle{
                    attribute mass redefines Vehicle::mass=dryMass+cargoMass+fuelTank.fuel.fuelMass;
                    attribute dryMass redefines Vehicle::dryMass=sum(partMasses);
                    attribute redefines Vehicle::cargoMass=0 [kg];
                    attribute partMasses [*] nonunique :>ISQ::mass;
                    part fuelTank:FuelTank{
                        attribute redefines mass=75[kg];
                        ref item redefines fuel{
                            attribute redefines fuelMass=50[kg];
                        }   
                    }
                    part frontAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=800[kg];
                        part frontAxle:Axle;
                        part frontWheels:Wheel[2];
                    }
                    part rearAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=875[kg];
                        attribute driveTrainEfficiency:Real = 0.6;
                        part rearAxle:Axle;
                        part rearWheels:Wheel[2]{
                            attribute redefines diameter;
                        }
                    }
                }
            }
            package ActionTree{  
            }
            package Requirements{
            }
        }
        package VehicleConfiguration_b{
            //Shapes library for simple geometry
            import ShapeItems::Box;
            import ParametersOfInterestMetadata::mop;
            import ModelingMetadata::*; // incudes status info
            
            package PartsTree{
                part vehicle_b : Vehicle{
                    #mop attribute mass redefines mass=dryMass+cargoMass+fuelTank.fuel.fuelMass;
                    attribute dryMass redefines dryMass=sum(partMasses);
                    attribute redefines cargoMass default 0 [kg];
                    attribute partMasses=(fuelTank.mass,frontAxleAssembly.mass,rearAxleAssembly.mass,engine.mass,transmission.mass,driveshaft.mass);
                    attribute avgFuelEconomy :> distancePerVolume;
                    port fuelCmdPort: FuelCmdPort redefines pwrCmdPort {
                        in item fuelCmd redefines pwrCmd;
                    }
                    port setSpeedPort:~SetSpeedPort;
                    port vehicleToRoadPort redefines vehicleToRoadPort{
                        port wheelToRoadPort1:WheelToRoadPort;
                        port wheelToRoadPort2:WheelToRoadPort;
                    }
                    perform ActionTree::providePower redefines providePower;
                    perform ActionTree::performSelfTest redefines performSelfTest;
                    perform ActionTree::applyParkingBrake redefines applyParkingBrake;
                    perform ActionTree::senseTemperature redefines senseTemperature;
                    exhibit state vehicleStates redefines vehicleStates;
                    
                    // Example vehicle with simple enveloping shape that is a solid 
                    item :> envelopingShapes : Box[1] {
                        length1:>> length = 4800 [mm];
                        width1:>> width = 1840 [mm];
                        height1:>> height = 1350 [mm];
                    }
                    
                    part fuelTank:FuelTank{
                        attribute redefines mass=75[kg];
                        ref item redefines fuel{
                            attribute redefines fuelMass=60[kg];
                        }
                        attribute redefines fuelMassMax=60 [kg];
                    }
                    part frontAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=800[kg];
                        port shaftPort_d:ShaftPort_d;
                        part frontAxle:FrontAxle;
                        part frontWheels:Wheel[2];
                    }
                    
                    part rearAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=875[kg];
                        attribute driveTrainEfficiency:Real = 0.6;
                        port shaftPort_d:ShaftPort_d;
                        perform providePower.distributeTorque;
                        part rearWheel1:Wheel{
                            attribute redefines diameter;
                            port wheelToRoadPort:WheelToRoadPort;
                            port lugNutCompositePort :>> lugNutCompositePort{
                                port lugNutPort :>> lugNutPort [5];
                            }
                        }
                        part rearWheel2:Wheel{
                            attribute redefines diameter;
                            port wheelToRoadPort:WheelToRoadPort;
                            port lugNutCompositePort :>> lugNutCompositePort{
                                port lugNutPort :>> lugNutPort [5];
                            }
                        }
                        part differential:Differential{
                            port shaftPort_d:ShaftPort_d;
                            port leftDiffPort:DiffPort;
                            port rightDiffPort:DiffPort;
                        }
                        part rearAxle{
                            part leftHalfAxle:HalfAxle{
                                port leftAxleToDiffPort:AxlePort;
                                port shankCompositePort :>> shankCompositePort{
                                    port shankPort :>> shankPort [5];
                                }
                            }
                            part rightHalfAxle:HalfAxle{
                                port rightAxleToDiffPort:AxlePort;
                                port shankCompositePort :>> shankCompositePort {
                                    port shankPort :>> shankPort [5];
                                }
                            }
                        }
                        
                        bind shaftPort_d=differential.shaftPort_d;
                        connect differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort;
                        connect differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort;
                        
                        interface wheelToleftHalAxleInterface:WheelHubInterface 
                            connect rearWheel1.lugNutCompositePort [1] to rearAxle.leftHalfAxle.shankCompositePort [1];
                        interface wheelTorightHalAxleInterface:WheelHubInterface
                            connect rearWheel2.lugNutCompositePort [1] to rearAxle.rightHalfAxle.shankCompositePort [1];
                        
                    }
                    part starterMotor:StarterMotor;
                    part engine:Engine{
                        perform providePower.generateTorque redefines generateTorque;            
                        part cylinders:Cylinder[4..6];
                        part alternator{
                            action generateElectricity;
                        }
                        satisfy Requirements::engineSpecification by vehicle_b.engine{
                            requirement torqueGenerationRequirement :>> torqueGenerationRequirement{
                                subject generateTorque redefines generateTorque = vehicle_b.engine.generateTorque;
                            }
                            requirement drivePowerOuputRequirement :>> drivePowerOutputRequirement{
                                port torqueOutPort redefines torqueOutPort=vehicle_b.engine.drivePwrPort;
                            }
                        } 
                    }
                    part transmission:Transmission{
                        attribute mass :> ISQ::mass=100[kg];
                        port shaftPort_a:ShaftPort_a;
                        perform providePower.amplifyTorque;
                    }
                    part driveshaft:Driveshaft{
                        attribute mass :> ISQ::mass=100[kg];
                        port shaftPort_b:ShaftPort_b;
                        port shaftPort_c:ShaftPort_c;
                        perform providePower.transferTorque;
                    }
                    part vehicleSoftware:VehicleSoftware{
                        part vehicleController: VehicleController {
                            exhibit state controllerStates redefines controllerStates;
                            part cruiseController:CruiseController;
                        }
                    }
                    part speedSensor:SpeedSensor;
                    
                    // parts in bodyAssy and interioer are marked as safety or security features
                    part bodyAssy:BodyAssy{
                        part body:Body{
                            attribute :>> color = Colors::red;  
                        }
                        part bumper {@Safety{isMandatory = true;}}
                        part keylessEntry {@Security;}
                    }
                    part interior {
                        part alarm {@Security;}
                        part seatBelt[2] {@Safety{isMandatory = true;}}
                        part frontSeat[2];
                        part driverAirBag {@Safety{isMandatory = false;}}
                    }
                    
                    //connections
                    bind engine.fuelCmdPort=fuelCmdPort;

                    interface engineToTransmissionInterface:EngineToTransmissionInterface
                        connect engine.drivePwrPort to transmission.clutchPort;
                
                    interface fuelInterface:FuelInterface
                        connect fuelTank.fuelOutPort to engine.fuelInPort;

                    allocate ActionTree::providePower.generateToAmplify to engineToTransmissionInterface;
                    
                    bind engine.ignitionCmdPort=ignitionCmdPort;
                    connect starterMotor.gearPort to engine.flyWheelPort;
                    connect vehicleSoftware.vehicleController.controlPort to engine.engineControlPort;
                    bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
                    connect speedSensor.speedSensorPort to vehicleSoftware.vehicleController.cruiseController.speedSensorPort;
                    bind vehicleSoftware.vehicleController.cruiseController.cruiseControlPort = vehicleSoftware.vehicleController.controlPort;
                    connect transmission.shaftPort_a to driveshaft.shaftPort_b; 
                    connect driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d;
                    bind rearAxleAssembly.rearWheel1.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort1;
                    bind rearAxleAssembly.rearWheel2.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort2;
                    
                    satisfy Requirements::vehicleSpecification by vehicle_b{
                        requirement vehicleMassRequirement:>>vehicleMassRequirement{
                            attribute redefines massActual=vehicle_b.mass;
                            attribute redefines fuelMassActual = vehicle_b.fuelTank.fuel.fuelMass;
                        }
                    }
                }
            }
            package ActionTree{
                action providePower:ProvidePower{
                    in item fuelCmd:FuelCmd redefines pwrCmd;
                    out wheelToRoadTorque redefines wheelToRoadTorque [2] = distributeTorque.wheelToRoadTorque;
                    action generateTorque:GenerateTorque {
                        in item = providePower.fuelCmd;
                    }
                    action amplifyTorque:AmplifyTorque;
                    action transferTorque:TransferTorque;
                    action distributeTorque:DistributeTorque;
                    
                    //named flow
                    flow generateToAmplify from generateTorque.engineTorque to amplifyTorque.engineTorque;
                    //unnamed flows
                    flow amplifyTorque.transmissionTorque to transferTorque.transmissionTorque;
                    flow transferTorque.driveshaftTorque to distributeTorque.driveshaftTorque;
                }
                action performSelfTest: PerformSelfTest;
                action applyParkingBrake: ApplyParkingBrake;
                action senseTemperature: SenseTemperature;
            }                   
            package DiscreteInteractions{
                package Sequence{
                    part def Driver{
                        port p1;
                        port p2;
                    }

                    part part0{
                        perform action startVehicle{
                            action turnVehicleOn send ignitionCmd via driver.p1{
                                in ignitionCmd:IgnitionCmd;
                            }
                            action trigger1 accept ignitionCmd:IgnitionCmd via vehicle.ignitionCmdPort;
                            flow of IgnitionCmd from trigger1.ignitionCmd to startEngine.ignitionCmd;
                            action startEngine{
                                in item ignitionCmd:IgnitionCmd; 
                                out item es:EngineStatus;
                            }
                            flow of EngineStatus from startEngine.es to sendStatus.es;
                            action sendStatus send es via vehicle.statusPort{
                                in es:EngineStatus;
                            }
                            action trigger2 accept es:EngineStatus via driver.p2;
                        }
                        part driver : Driver {
                            perform startVehicle.turnVehicleOn;
                            perform startVehicle.trigger2;
                            event occurrence driverReady;
                        }
                        part vehicle : Vehicle {
                            perform startVehicle.trigger1;
                            perform startVehicle.sendStatus;
                            event occurrence doorClosed;
                        }
                        first vehicle.doorClosed then driver.driverReady;
                        message of ignitionCmd:IgnitionCmd from driver.turnVehicleOn to vehicle.trigger1;  
                        message of es:EngineStatus from vehicle.sendStatus to driver.trigger2;
                    }
                }
                occurrence CruiseControl1{
                    part vehicle_b:>PartsTree::vehicle_b{
                        port redefines setSpeedPort{
                            event occurrence setSpeedReceived;
                        }
                        part redefines speedSensor{
                            port redefines speedSensorPort{
                                event occurrence sensedSpeedSent;
                            }
                        }
                        part redefines vehicleSoftware{
                            part redefines vehicleController{
                                part redefines cruiseController{
                                    port redefines setSpeedPort{
                                        //analagous to gate: event occurrence bound but may not need this since the port is bound
                                        event occurrence setSpeedReceived = vehicle_b.setSpeedPort.setSpeedReceived;
                                    }
                                    port redefines speedSensorPort{
                                        event occurrence sensedSpeedReceived;
                                    }
                                    port redefines cruiseControlPort{
                                        event occurrence fuelCmdSent;
                                    }
                                }
                            }
                        }
                        part redefines engine{
                            port redefines fuelCmdPort{
                                event occurrence fuelCmdReceived;
                            }
                        }
                        message sendSensedSpeed of SensedSpeed
                            from speedSensor.speedSensorPort.sensedSpeedSent to vehicleSoftware.vehicleController.cruiseController.speedSensorPort.sensedSpeedReceived;
                        message sendFuelCmd of FuelCmd
                            from vehicleSoftware.vehicleController.cruiseController.cruiseControlPort.fuelCmdSent to engine.fuelCmdPort.fuelCmdReceived;
                    }
                }
                occurrence CruiseControl2{
                    part vehicle_b:>PartsTree::vehicle_b{
                        port redefines setSpeedPort{
                            event occurrence setSpeedReceived;
                        }
                        part redefines speedSensor{
                            port redefines speedSensorPort{
                                event sendSensedSpeed.source;
                            }
                        }
                        part redefines vehicleSoftware{
                            part redefines vehicleController{
                                part redefines cruiseController{
                                    port redefines setSpeedPort{
                                        //analagous to gate: event occurrence bound but may not need this since the port is bound
                                        event occurrence setSpeedReceived = vehicle_b.setSpeedPort.setSpeedReceived;
                                    }
                                    port redefines speedSensorPort{
                                        event occurrence setSpeedReceived=setSpeedPort.setSpeedReceived;
                                        then event sendSensedSpeed.target;
                                    }
                                    port redefines cruiseControlPort{             
                                        event sendFuelCmd.source;
                                    }
                                }
                            }
                        }
                        part redefines engine{
                            port redefines fuelCmdPort{
                                event sendFuelCmd.target;
                            }
                        }
                        message sendSensedSpeed of SensedSpeed;
                        message sendFuelCmd of FuelCmd;
                    }
                }
            }
            package Requirements{
                import RequirementDerivation::*;
                import ModelingMetadata::*; // incudes status info
                item marketSurvey;
                dependency from vehicleSpecification to marketSurvey;
                
                requirement vehicleSpecification{
                    subject vehicle:Vehicle;
                    requirement <'1'> vehicleMassRequirement: MassRequirement {
                        doc /* The total mass of the vehicle shall be less than or equal to the required mass.
                        Assume total mass includes a full tank of gas of 60 kg*/
                        attribute redefines massRequired=2000 [kg];                     
                        attribute redefines massActual default vehicle.dryMass + fuelMassActual;
                        attribute fuelMassActual:>ISQ::mass;
                        attribute fuelMassMax:>ISQ::mass = 60 [kg];
                        assume constraint {fuelMassActual==fuelMassMax}
                    }
                    
                    allocate vehicleMassRequirement to PartsTree::vehicle_b.mass;
                    
                    requirement <'2'> vehicleFuelEconomyRequirements{
                        doc /* fuel economy requirements group */
                        attribute assumedCargoMass:>ISQ::mass;
                        requirement <'2_1'> cityFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 10 [km / L];
                            assume constraint {assumedCargoMass<=500 [kg]}
                        }
                        requirement <'2_2'> highwayFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 12.75 [km / L];
                            assume constraint {assumedCargoMass<=500 [kg]}
                            
                            //StatusInfo is contained in ModelingMetadata library
                            // StatusKind has values for open, closed, tbd, tbr, tbd
                            @StatusInfo {
                                status = StatusKind::closed;     
                                originator = "Bob";
                                owner = "Mary";
                            }
                        }
                    }
                }
                requirement engineSpecification {
                    subject engine1:Engine;
                    requirement <'1'> engineMassRequirement: MassRequirement {
                        doc /* The total mass of the engine shall be less than or equal to the required mass.*/
                        attribute redefines massRequired=200 [kg];                     
                        attribute redefines massActual = engine1.mass;
                    }
                    requirement torqueGenerationRequirement : TorqueGenerationRequirement{
                        subject generateTorque default engine1.generateTorque;
                    }

                    requirement drivePowerOutputRequirement : DrivePowerOutputRequirement{
                        port torqueOutPort{
                            out torque:Torque;
                        }
                    }
                }
                // the engine mass requirement is derived from the vehicle mass requirement
                #derivation connection {
                    end #original ::> vehicleSpecification.vehicleMassRequirement;
                    end #derive ::> engineSpecification.engineMassRequirement;
                }

            }
        }    
        package Engine4Cyl_Variant{
            import ModelingMetadata::*; // incudes refinement
            part engine:Engine{
                part cylinders:Cylinder[4..8] ordered;
            }
            part engine4Cyl:>engine{
                part redefines cylinders [4];
                part cylinder1 subsets cylinders[1];
                part cylinder2 subsets cylinders[1];
                part cylinder3 subsets cylinders[1];
                part cylinder4 subsets cylinders[1];
            }
            #refinement dependency engine4Cyl to VehicleConfiguration_b::PartsTree::vehicle_b::engine;
        }
        package WheelHubAssemblies{
            // alternative 1 - w/o explicit nesxted interfaces
            part wheelHubAssy1{
                part wheel1:Wheel{
                    port :>>lugNutCompositePort:LugNutCompositePort {
                        port lugNutPort :>> lugNutPort [5];
                    }
                }
                part hub1:Hub{
                    port :>> shankCompositePort:ShankCompositePort {
                        port shankPort :>> shankPort [5];
                    }
                }
                interface wheelHubInterface:WheelHubInterface
                    connect wheel1.lugNutCompositePort [1] to hub1.shankCompositePort [1];
            }
            // alternative 2 - w multiple nesxted interfaces
            part wheelHubAssy2{
                part wheel1:Wheel{
                    port :>>lugNutCompositePort:LugNutCompositePort {
                        port lugNutPort :>> lugNutPort [5];
                    }
                }
                part hub1:Hub{
                    port :>> shankCompositePort:ShankCompositePort {
                        port shankPort :>> shankPort [5];
                    }
                }
                interface wheelHubInterface:WheelHubInterface
                    connect lugNutCompositePort ::> wheel1.lugNutCompositePort [1] to shankCompositePort ::> hub1.shankCompositePort [1] {
                        interface wheelFastenerInterface1 :> wheelFastenerInterface
                            connect lugNutPort ::> lugNutCompositePort.lugNutPort [5] to shankPort ::> shankCompositePort.shankPort [5];
                        }
            }
            // alternative 3 - w explicit nesxted interfaces
            part wheelHubAssy3{
                part wheel1:Wheel{
                    port lugNutCompositePort :>> lugNutCompositePort {
                        port lugNutPort [5] :>> lugNutPort {
                            attribute :>> threadDia = 14 [mm];
                            attribute :>> threadPitch = 1.5 [mm];
                        }
                        port lugNutPort1 [1] :> lugNutPort;
                        port lugNutPort2 [1] :> lugNutPort;
                        port lugNutPort3 [1] :> lugNutPort;
                    }
}
                part hub1:Hub{
                    port shankCompositePort :>> shankCompositePort {
                        port shankPort [5] :>> shankPort {
                            attribute :>> threadDia = 14 [mm];
                            attribute :>> threadPitch = 1.5 [mm];
                            attribute :>> shaftLength = 70 [mm];
                        }
                        port shankPort1 [1] :> shankPort;
                        port shankPort2 [1] :> shankPort;
                        port shankPort3 [1] :> shankPort;
                    }
}
                interface wheelHubInterface:WheelHubInterface
                    connect lugNutCompositePort ::> wheel1.lugNutCompositePort [1] to shankCompositePort ::> hub1.shankCompositePort [1] {
                        interface wheelFastenerInterface1 :> wheelFastenerInterface
                            connect lugNutPort ::> lugNutCompositePort.lugNutPort1 to shankPort ::> shankCompositePort.shankPort1 {
                                attribute :>> maxTorque = 90 * 1.356 [N*m];
                        }
                        interface wheelFastenerInterface2 :> wheelFastenerInterface
                            connect lugNutPort ::> lugNutCompositePort.lugNutPort2 to shankPort ::> shankCompositePort.shankPort2 {
                                attribute :>> maxTorque = 90 * 1.356 [N*m];
                        }
                        interface wheelFastenerInterface3 :> wheelFastenerInterface
                            connect lugNutPort ::> lugNutCompositePort.lugNutPort3 to shankPort ::> shankCompositePort.shankPort3 {
                                attribute :>> maxTorque = 90 * 1.356 [N*m];
                        }
                }
            }
        }
    }
    package VehicleAnalysis{
        import RiskMetadata::*;
        import RiskLevelEnum::*;
        // recursive import uses double asterisk **
        import VehicleConfigurations::VehicleConfiguration_b::**;
        package FuelEconomyAnalysisModel{
            import SampledFunctions::SampledFunction;
              
            /*
            This analysis model was provided by Hisashi Miyashita on January 27, 2021
              We use the simplest fuel consumption analysis model introduced in:
              Akcelik, R. "Fuel efficiency and other objectives in traffic system management." Traffic Engineering and Control 22.2 (1981): 54-65. 

              Fuel consumption rate f can be decomposed to:
              f = f_a + f_b * tpd_avg,
              where tpd_avg is average interrupted travel time per unit distance, actually the inverse of the average velocity [t/km];
              f_a is the best fuel consumption per distance; and
              f_b is the additional fuel consumption per distance and average travel time, which can be regarded as the idling fuel consumption.
              Approximately, it is proportional to engine displacement and it ranges from 0.5 to 0.6 [l/hour/litre of engine displacement]
              according to:
              Review of the Incidence, Energy Use and Costs of Passenger Vehicle Idling; Gordon W. Taylor, P.Eng. Prepared for the Office of Energy Efficiency, Natural Resources Canada, 2003

              We assume f_a can be approximated to
              fuel_consumption / distance = BSFC * SGG * required_power_avg * tpd_avg,
              where required_power_avg is the required power, and it can be approximately derived from:
                  total_energy == P_req * tpd_avg * distance == 1/2 * mass / tpd_avg^2
              This part is computed with BestFuelConsumptionPerDistance calc def.

              BSFC means Brake-Specific Fuel Consumption, defined as gram/power.  SGG is the specific gravity of gasoline.
              The high octane gasoline is about 0.76[l/kg].
            */
            
            attribute def Scenario :> SampledFunction {
                attribute wayPoint[1..*] {
                    attribute elapseTime[1] :> ISQ::time;
                    attribute position[1] :> ISQ::distance;
                }
            }
            
            calc def FuelConsumption {
                in bestFuelConsumption: Real;
                in idlingFuelConsumption: Real; 
                in tpd_avg:>timePerDistance;
                attribute f = bestFuelConsumption + idlingFuelConsumption * tpd_avg;
                return dpv :> distancePerVolume = 1/f;
            }
            
            calc def AverageTravelTimePerDistance {
                in scenario: Scenario;
                return tpd_avg:>timePerDistance;
            }
            calc def TraveledDistance {
                in scenario: Scenario;
                return distance:> length;
            }
            calc def IdlingFuelConsumptionPerTime {
                in engine:Engine;
                attribute idlingFuelConsumptionPerDisplacement: Real = 0.5;
                return f_a : Real = engine.displacement * idlingFuelConsumptionPerDisplacement;
            }

            attribute specificGravityOfGasoline: Real = 0.76;
            calc def BestFuelConsumptionPerDistance {
                in mass: MassValue;
                in bsfc: Real;
                in tpd_avg:> timePerDistance;
                in distance:>length;
                attribute required_power_avg:> ISQ::power;
                constraint {required_power_avg == 1/2 * mass * tpd_avg **(-3) / distance}
                return f_b : Real = bsfc * specificGravityOfGasoline * required_power_avg * tpd_avg;
            }

            calc def ComputeBSFC{
                in engine: Engine;
                return : Real;
            }

            analysis fuelEconomyAnalysis  {    
                subject = vehicle_b; 
                
                objective fuelEconomyAnalysisObjective {
                    doc /*estimate the vehicle fuel economy*/
                    require vehicleSpecification.vehicleFuelEconomyRequirements;
                }
                
                in attribute scenario: Scenario;
                // define a series of waypoints
                
                attribute distance = TraveledDistance(scenario);
                attribute tpd_avg = AverageTravelTimePerDistance(scenario);
                attribute bsfc = ComputeBSFC(vehicle_b.engine);
                attribute f_a = BestFuelConsumptionPerDistance(vehicle_b.mass, bsfc, tpd_avg, distance);
                attribute f_b = IdlingFuelConsumptionPerTime(vehicle_b.engine);

                return attribute calculatedFuelEconomy:>distancePerVolume=FuelConsumption(f_a, f_b, tpd_avg);
            }
        }
        package ElectricalPowerAnalysis{
        }
        package ReliabilityAnalyis{
        }
        package VehicleTradeOffAnalysis{
            /* The following example provides the rationale for selecting the engine4cyl. 
            The rationale and risk are contained in a metadata library. */
            
            @Rationale about engineTradeOffAnalysis::vehicle_b_engine4cyl{
                explanation = VehicleAnalysis::VehicleTradeOffAnalysis::engineTradeOffAnalysis;          
                text = "the engine4cyl was evaluated to have a higher objective function compared to the engine6cyl based on the trade-off analyiss"; 
            }
            
            // The following risk for the engine4cyl could have been included as part of the objective evaluaiton criteria
            
            @Risk about engineTradeOffAnalysis::vehicle_b_engine4cyl {
                totalRisk = medium;
                technicalRisk = medium;
                scheduleRisk = medium;
                costRisk = RiskLevelEnum::low;
            }
            @Risk about engineTradeOffAnalysis::vehicle_b_engine4cyl::engine::fuelEfficiency {
                technicalRisk {
                    probability = 0.3;
                    impact = 0.5;
                }
            }
            
                
            import TradeStudies::*;
            //evaluation function with criterion engine mass, engine power, and engine cost
            calc def EngineEvaluation {
                in engineMass:>ISQ::mass;
                in enginePower:>ISQ::power; 
                in engineFuelEfficiency:Real;
                in engineCost:Real;
                return eval:Real;
            }
            calc def EngineEvaluation_4cyl {
                in engineMass:>ISQ::mass;
                in enginePower:>ISQ::power;
                in engineFuelEfficiency:Real;
                in engineCost:Real;
                return eval:Real;
            }
            calc def EngineEvaluation_6cyl {
                in engineMass:>ISQ::mass;
                in enginePower:>ISQ::power;
                in engineFuelEfficiency:Real;
                in engineCost:Real;
                return eval:Real;
            }
            analysis engineTradeOffAnalysis:TradeStudy{
                subject vehicleAlternatives[2]:>vehicle_b;   
                
                part vehicle_b_engine4cyl:>vehicleAlternatives{   
                    part engine redefines engine{
                        part cylinders :>> cylinders [4];
                        attribute mass redefines mass=180 [kg];
                        attribute peakHorsePower redefines peakHorsePower = 180 [W];
                        attribute fuelEfficiency redefines fuelEfficiency=.6;
                        attribute cost redefines cost = 1000;                     
                    }
                }
                part vehicle_b_engine6cyl:>vehicleAlternatives{   
                    part engine redefines engine{  
                        part cylinders redefines cylinders [6];
                        attribute mass redefines mass=220 [kg];
                        attribute peakHorsePower redefines peakHorsePower = 220 [W];
                        attribute fuelEfficiency redefines fuelEfficiency=.5;
                        attribute cost redefines cost = 1500;
                    }
                }
                
                objective :MaximizeObjective;
                    /*Select vehicle alternative with the engine whose evaluation function returns the max value*/
                
                calc :> evaluationFunction{
                    in part vehicle:>vehicle_b_engine4cyl;
                    return attribute eval:Real=EngineEvaluation_4cyl (vehicle.engine.mass, vehicle.engine.peakHorsePower, vehicle.engine.fuelEfficiency, vehicle.engine.cost); 
                }
                calc :> evaluationFunction{
                    in part vehicle:>vehicle_b_engine6cyl;
                    return attribute eval:Real=EngineEvaluation_6cyl (vehicle.engine.mass, vehicle.engine.peakHorsePower, vehicle.engine.fuelEfficiency, vehicle.engine.cost); 
                }                                                  
                return part selectedVehicle:>vehicle_b;
            }
        }
    }
    package VehicleVerification{
        import VehicleConfigurations::VehicleConfiguration_b::**;
        import VerificationCaseDefinitions::*;
        import VerificationCases1::*;
        // the following is a model library which contains VerdictKind
        import VerificationCases::*;
        import VerificationSystem::*;
        package VerificationCaseDefinitions{
            verification def MassTest;
            verification def AccelerationTest;
            verification def ReliabilityTest;
        }
        package VerificationCases1{
            verification massTests:MassTest {
                subject vehicle_uut :> vehicle_b;
                actor vehicleVerificationSubSystem_1 = verificationContext.massVerificationSystem;
                objective {
                    verify vehicleSpecification.vehicleMassRequirement{
                        redefines massActual=weighVehicle.massMeasured;
                    }
                }     
                // method kinds are test, demo, analyze, should also include inspection, similarity
               @ VerificationMethod{
                    kind = (VerificationMethodKind::test, VerificationMethodKind::analyze);
                }
                action weighVehicle {
                    out massMeasured:>ISQ::mass;
                }
                then action evaluatePassFail {
                    in massMeasured:>ISQ::mass;
                    out verdict = PassIf(vehicleSpecification.vehicleMassRequirement(vehicle_uut));
                }
                flow from weighVehicle.massMeasured to evaluatePassFail.massMeasured;
                return :>> verdict = evaluatePassFail.verdict;
            }
        }
        package VerificationSystem{
            part verificationContext{
                perform massTests;
                part vehicle_UnitUnderTest :> vehicle_b;
                part massVerificationSystem{
                    part scale{
                        perform massTests.weighVehicle;
                    }
                    part operator{
                        perform massTests.evaluatePassFail;
                    }
                }
            }
        }
    }
    package VehicleIndividuals{
        individual a:VehicleRoadContext_1{
            timeslice t0_t2_a{
                snapshot t0_a {             
                    attribute t0 redefines time=0 [s];
                    snapshot t0_r:Road_1{
                        :>>Road::incline =0;
                        :>>Road::friction=.1;
                    }
                    snapshot t0_v:Vehicle_1{
                        :>>Vehicle::position=0 [m];
                        :>>Vehicle::velocity=0 [m];
                        :>>Vehicle::acceleration=1.96 [m/s**2];
                        // .2 g where 1 g = 9.8 meters/sec^2
                        snapshot t0_fa:FrontAxleAssembly_1{
                            snapshot t0_leftFront:Wheel_1;
                            snapshot t0_rightFront:Wheel_2;
                        }
                    }
                }
                snapshot t1_a{
                    attribute t1 redefines time=1 [s];
                    snapshot t1_r:Road_1{
                        :>>Road::incline =0;
                        :>>Road::friction=.1;
                    }
                    snapshot t1_v:Vehicle_1{
                        :>>Vehicle::position=.98 [m];
                        :>>Vehicle::velocity=1.96 [m/s];
                        :>>Vehicle::acceleration=1.96 [m/s**2];
                        // .2 g where 1 g = 9.8 meters/sec^2
                        snapshot t1_fa:FrontAxleAssembly_1{
                            snapshot t1_leftFront:Wheel_1;
                            snapshot t1_rightFront:Wheel_2;
                        }
                    }
                }
                snapshot t2_a{
                    attribute t2 redefines time=2 [s];
                    snapshot t2_r:Road_1{
                        :>>Road::incline =0;
                        :>>Road::friction=.1;
                    }
                    snapshot t2_v:Vehicle_1{
                        :>>Vehicle::position=3.92 [m];
                        :>>Vehicle::velocity=3.92 [m/s];
                        :>>Vehicle::acceleration=1.96 [m/s**2];
                        // .2 g where 1 g = 9.8 meters/sec^2
                        snapshot t2_fa:FrontAxleAssembly_1{
                            snapshot t2_leftFront:Wheel_1;
                            snapshot t2_rightFront:Wheel_2;
                        }
                    }
                }
            }
        }
    }
    package MissionContext{
        /* Define mission context with mission use cases for vehicle_b */
        import VehicleConfigurations::VehicleConfiguration_b::**;
        import ParametersOfInterestMetadata::moe;
        import TransportPassengerScenario::*;
        package ContextDefinitions{
            part def MissionContext:>GenericContext::Context;
            part def Road;
            part def Driver{
                port handPort:HandPort{
                }
                exhibit state driverStates{
                    state initial;
                    state wait;
                    transition initial then wait;
                    //ignition on
                    transition 'wait-wait-1'
                        first wait
                        do send IgnitionCmd (ignitionOnOff=IgnitionOnOff::on) via handPort
                        then wait;
                    // ignition off
                    transition 'wait-wait-2'
                        first wait
                        do send IgnitionCmd (ignitionOnOff=IgnitionOnOff::off) via handPort
                        then wait;
                }
            }
            part def Passenger;
            
            requirement transportRequirements;
            use case def TransportPassenger{
                objective TransportObjective {
                    doc /*deliver passenger to destination safely, comfortably, and within acceptable time*/
                    require transportRequirements;
                }
                subject vehicle:Vehicle;
                actor environment;
                actor road;
                actor driver;
                actor passenger [0..4];
                include use case getInVehicle_a:>getInVehicle [1..5];
                include use case getOutOfVehicle_a:>getOutOfVehicle [1..5];
            }
            
            use case getInVehicle:GetInVehicle {
                action unlockDoor_in [0..1];
                then action openDoor_in;
                then action enterVehicle;
                then action closeDoor_in;
            }
            use case def GetInVehicle{
                subject vehicle:Vehicle;
                actor driver [0..1];
                actor passenger [0..1];
                assert constraint {driver != null xor passenger != null}
            }

            use case getOutOfVehicle:GetOutOfVehicle {
                action openDoor_out;
                then action exitVehicle;
                then action closeDoor_out;
                then action lockDoor_out;
            }
            use case def GetOutOfVehicle{
                subject vehicle:Vehicle;
                actor driver [0..1];
                actor passenger [0..1];
                assert constraint {driver != null xor passenger != null}
            }
        }
        package TransportPassengerScenario{
            import ContextDefinitions::TransportPassenger;
            
            // this version uses nesting vs fork and join for concurrent actions
            use case transportPassenger:TransportPassenger{
                first start; 
                then action a{
                    action driverGetInVehicle subsets getInVehicle_a[1];
                    action passenger1GetInVehicle subsets getInVehicle_a[1];
                }
                then action trigger accept ignitionCmd:IgnitionCmd;
                then action b{
                    action driveVehicleToDestination;
                    action providePower;   
                }
                then action c{
                    action driverGetOutOfVehicle subsets getOutOfVehicle_a[1];
                    action passenger1GetOutOfVehicle subsets getOutOfVehicle_a[1];
                }
                then done;
            }
            
            
            //this version uses forks and joins
            use case transportPassenger_1:TransportPassenger{
                // declare actions
                action driverGetInVehicle subsets getInVehicle_a[1];
                action passenger1GetInVehicle subsets getInVehicle_a[1];
                action driverGetOutOfVehicle subsets getOutOfVehicle_a[1];
                action passenger1GetOutOfVehicle subsets getOutOfVehicle_a[1];
                action driveVehicleToDestination;
                action providePower;
                item def VehicleOnSignal;
                join join1;
                join join2;
                join join3;
                action trigger accept ignitionCmd:IgnitionCmd;
                
                // define control flow
                first start;               
                then fork fork1;
                    then driverGetInVehicle;
                    then passenger1GetInVehicle;
                first driverGetInVehicle then join1;
                first passenger1GetInVehicle then join1;
                first join1 then trigger;
                first trigger then fork2;
                //succession trigger if trigger.ignitionCmd.ignitionOnOff==IgnitionOnOff::on then fork2;
                
                fork fork2;
                    then driveVehicleToDestination;
                    then providePower;
                first driveVehicleToDestination then join2;
                first providePower then join2;
                first join2 then fork3;

                fork fork3; 
                    then driverGetOutOfVehicle;
                    then passenger1GetOutOfVehicle;
                first driverGetOutOfVehicle then join3;
                first passenger1GetOutOfVehicle then join3;

                first join3 then done;
            }
        }
        
        part missionContext:ContextDefinitions::MissionContext{
            #moe attribute transportTime :> ISQ::time;
            perform transportPassenger;
            // bind parts to actors of use case
            part road:ContextDefinitions::Road = transportPassenger.road;
            part driver:ContextDefinitions::Driver = transportPassenger.driver{
                perform transportPassenger.a.driverGetInVehicle.unlockDoor_in;
                perform transportPassenger.a.driverGetInVehicle.openDoor_in;
                perform transportPassenger.a.driverGetInVehicle.enterVehicle; 
                perform transportPassenger.a.driverGetInVehicle.closeDoor_in;
                perform transportPassenger.c.driverGetOutOfVehicle.openDoor_out;
                perform transportPassenger.c.driverGetOutOfVehicle.exitVehicle; 
                perform transportPassenger.c.driverGetOutOfVehicle.closeDoor_out;
                perform transportPassenger.c.driverGetOutOfVehicle.lockDoor_out;
                perform transportPassenger.b.driveVehicleToDestination;
            }
            part passenger1:ContextDefinitions::Passenger = transportPassenger.passenger {
                perform transportPassenger.a.passenger1GetInVehicle.unlockDoor_in;
                perform transportPassenger.a.passenger1GetInVehicle.openDoor_in;
                perform transportPassenger.a.passenger1GetInVehicle.enterVehicle; 
                perform transportPassenger.a.passenger1GetInVehicle.closeDoor_in;
                perform transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out;
                perform transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle; 
                perform transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out;
                perform transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out;
            }
            part vehicle_b_1:>vehicle_b = transportPassenger.vehicle{
                attribute :>> position3dVector = (0,0,0) [spatialCF];
                perform transportPassenger.b.providePower redefines providePower;
                perform transportPassenger.trigger;
            }
            connect driver.handPort to vehicle_b_1.ignitionCmdPort;
            connect road to vehicle_b_1.vehicleToRoadPort;
        }
    }
    package VehicleSuperSetModel{
        /* all of vehicleFamily is included in the superset model to enable subsetting a specific vehicle configuration*/
        package VariationPointDefinitions {
            variation part def TransmissionChoices:>Transmission {
                variant part transmissionAutomatic:TransmissionAutomatic;
                variant part transmissionManual:TransmissionManual;
            }
        }
        package VehiclePartsTree{
            import VariationPointDefinitions::*;
            abstract part vehicleFamily {
                // variation with nested variation
                variation part engine:Engine{
                    variant part engine4Cyl:Engine4Cyl;
                    variant part engine6Cyl:Engine6Cyl{
                        part cylinder:Cylinder [6]{
                            variation attribute diameter:LengthValue{
                                variant attribute smallDiameter:LengthValue;
                                variant attribute largeDiagmeter:LengthValue;
                            }
                        }
                    }
                }
                // variation point based on variation of part definition
                part transmissionChoices:TransmissionChoices;
                // optional variation point
                part sunroof:Sunroof[0..1];
                // selection constraint
                assert constraint selectionConstraint{
                    (engine==engine::engine4Cyl and transmissionChoices==TransmissionChoices::transmissionManual) xor
                    (engine==engine::engine6Cyl and transmissionChoices==TransmissionChoices::transmissionAutomatic)
                }
                part driveshaft;
                part frontAxleAssembly;
                part rearAxleAssembly;
            }
        }
    }
    package SafetyandSecurityGroups {
        import VehicleConfigurations::VehicleConfiguration_b::PartsTree::*;
        package SafetyGroup {
            /* Parts that contribute to safety. */
            import vehicle_b::**;
            filter @Safety;
        }
        package SecurityGroup {
            /* Parts that contribute to security. */
            import vehicle_b::**;
            filter @Security;
        }
        package SafetyandSecurityGroup {
            /* Parts that contribute to safety OR security. */
            import vehicle_b::**;
            filter @Safety or @Security;
        }
        package MandatorySafetyGroup {
            /* Parts that contribute to safety AND are mandatory. */
            import vehicle_b::**;
            filter @Safety and Safety::isMandatory;
        }
    }
    package Views_Viewpoints{
       package ViewpointDefinitions{
            viewpoint def BehaviorViewpoint;
            viewpoint def SafetyViewpoint{
                frame concern vs:VehicleSafety;
            }
            part def SafetyEngineer;
            concern def VehicleSafety {
                doc /* identify system safety features */
                stakeholder se:SafetyEngineer;
            }
        }
        package ViewDefinitions{
            //Import Views to access rendering method library 
            import Views::*;
            view def TreeView{
                render asTreeDiagram;
            }
            view def NestedView; 
            view def RelationshipView;
            view def TableView;
            view def PartsTreeView:>TreeView {
                filter @SysML::PartUsage;
            }
            view def PartsInterconnection:>NestedView;
        }
        package VehicleViews{
            import ViewpointDefinitions::*;
            import ViewDefinitions::*;
            import VehicleConfigurations::VehicleConfiguration_b::*;
            view vehiclePartsTree_Safety:PartsTreeView{
                satisfy requirement sv:SafetyViewpoint;
                expose PartsTree::**;
                filter @Safety;
            }
        }
    }
}

