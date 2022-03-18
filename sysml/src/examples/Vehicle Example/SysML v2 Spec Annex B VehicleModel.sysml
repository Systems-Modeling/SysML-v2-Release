package sfriedenthal_VehicleModel_1_simplified{
    import Definitions::*;  
    import ModelingMetadata::*;
    import RiskMetadata::*;
    import RiskLevelEnum::*;
    package Definitions{
        //these imports eliminate the need to import into each nested package
        import PartDefinitions::*;
        import PortDefinitions::*;
        import ItemDefinitions::*;
        import SignalDefinitions::*;
        import InterfaceDefinitions::*;
        import ActionDefinitions::*;
        import StateDefinitions::*;
        import RequirementDefinitions::*;
        import AttributeDefinitions::*;
        import IndividualDefinitions::*;
        import AnnotationDefinitions::**;
        package PartDefinitions{
            part def Vehicle:>PhysicalComponent {
                attribute mass :> ISQ::mass;
                attribute dryMass:>ISQ::mass;
                attribute cargoMass:>ISQ::mass;
                //attribute position:ISQ::LengthValue;
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
                perform action providePower;
                perform action provideBraking;
                perform action controlDirection;
                perform action performSelfTest;
                perform action applyParkingBrake;
                perform action senseTemperature;
                //the following uses a single concept of event for signal, change, and time event
                //the time event will be replaced by when eventname
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
                        do senseTemperature (out temp);

                        state normal;
                        state maintenance;
                        state degraded;                    

                        transition initial then normal;

                        transition normal_To_maintenance
                            first normal
                            accept 'at(vehicle::maintenanceTime)'
                            then maintenance;

                        transition normal_To_degraded
                            first normal
                            accept 'when(temp>vehicle::Tmax)' 
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
                port fuelInPort: ~ FuelPort{
                    in item fuel redefines fuel;
                }
                port fuelCmdPort:FuelCmdPort{
                    in item redefines fuelCmd;
                }
                port drivePwrPort:DrivePwrPort{
                    out redefines torque;
                }
                port ignitionCmdPort:IgnitionCmdPort;
                port flyWheelPort;
                perform action generateTorque;
            }
            part def StarterMotor{
                port gearPort:GearPort;
            }
            part def Cylinder;
            part def Transmission{
                port clutchPort:ClutchPort{
                    in redefines torque;
                }
            }
            part def Driveshaft;
            part def AxleAssembly;
            part def Axle{
                attribute mass:>ISQ::mass;
            }
            part def FrontAxle:>Axle{
                attribute steeringAngle:>ISQ::planeAngle;
            }
            part def HalfAxle;
            part def Differential;
            part def Wheel {
                attribute diameter:LengthValue;
            }
            part def Hub;
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
                // should use fuel volume instead of fuel mass and fuelCopacity instead of fuelMassMax
                ref item fuel:Fuel{
                    attribute :>> fuelMass;
                }
                attribute fuelMassMax:>ISQ::mass;
                assert constraint {fuel.fuelMass<=fuelMassMax}
                port fuelOutPort:FuelPort;
            }
            part def BodyAssy;
            part def Body{
                attribute color:Colors;
            }
            part def Road{
                attribute incline:Real;
                attribute friction:Real;
            }
            //part def VehicleRoadContext{
               // attribute time:TimeValue;
            //}
            // Used for Specifying Context for Individuals
            // replace SpatialTemporalReference by GenericContext::Context
            //part def SpatialTemporalReference;
            
            // Used for Defining Variants for Superset Model
            part def Engine4Cyl;
            part def Engine6Cyl;
            part def TransmissionChoices;
            part def TransmissionAutomatic;
            part def TransmissionManual;
            part def Sunroof;
            
            //create abstract physical element to support allocation def from logical to Physical
            // Parts::Part is a work around on both Physical Component and Logical Component until 2021-05 release
            part def PhysicalComponent:>PhysicalElement, Parts::Part;
            //logical Components
            part def LogicalComponent:>LogicalElement, Parts::Part;
            part def VehicleLogical:>LogicalComponent;
            
            part def ElectricalGenerator;
            part def TorqueGenerator;
            part def SteeringSubsystem;
            part def BrakingSubsystem;
            
            
        }
        package PortDefinitions{
            port def IgnitionCmdPort{
                in item ignitionCmd:IgnitionCmd;
            }
            //port on starter motor that connects to flywheel on engine
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
            port def ClutchPort{
                in torque:Torque;
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
            port def LugNutPort;
            port def ShankPort;
            port def VehicleToRoadPort;
            port def ControlPort;
            port def CruiseControlPort;
            port def SpeedSensorPort;
            port def SetSpeedPort;

            // User port definitions
            port def DriverCmdPort{
                out item driverCmd[*]:DriverCmd;
            }
            port def HandPort :> DriverCmdPort {
                out item ignitionCmd:IgnitionCmd subsets driverCmd;
                out item pwrCmd:PwrCmd subsets driverCmd;
            }  
        }
        package ItemDefinitions{
            item def Fuel{
                attribute fuelMass:>ISQ::mass;
            }
            // should FuelCmd and PwrCmd be attributes vs items
            item def FuelCmd:>PwrCmd;
            
            item def SensedSpeed{
                attribute speed:>ISQ::speed;
            }
            
            item def PwrCmd{
                attribute throttleLevel:Real;
            }
            item def LogicalElement;
            item def PhysicalElement;
        }
        package SignalDefinitions{
            item def Cmd{
            }
            item def DriverCmd;
            item def IgnitionCmd:>DriverCmd{
                attribute ignitionOnOff:IgnitionOnOff;
            }
            
            //change the following signals to be item def vs attribute def per above
            attribute def VehicleStartSignal;
            attribute def VehicleOnSignal;
            attribute def VehicleOffSignal;
            attribute def StartSignal;
            attribute def OffSignal;
            attribute def OverTemp;
            attribute def ReturnToNormal;
            // the following are work arounds until time events and change events are available
            attribute def 'at(vehicle::maintenanceTime)';
            attribute def 'when(temp>vehicle::Tmax)';
            //attribute def SensedSpeed:>Real;
            attribute def SetSpeed:>Real;
        }
        package InterfaceDefinitions{
            interface def EngineToTransmissionInterface{
                end p1:DrivePwrPort;
                end p2:ClutchPort;
                flow p1.torque to p2.torque;
            }
            interface def FuelInterface {
                end fuelOutPort:FuelPort;
                end fuelInPort:~FuelPort;
                flow fuelOutPort.fuel to fuelInPort.fuel;
            }
            interface def WheelFastenerInterface{
                end lugNutPort:LugNutPort;
                end shankPort:ShankPort;
                attribute threadDia = 14 [mm];
                attribute threadPitch = 1.5 [mm];
                attribute shaftLength = 70 [mm];
                attribute maxTorque;
            }
            interface def WheelHubInterface{
                end lugNutPorts:LugNutPort [5];
                end shankPorts:ShankPort [5];
                interface wheelFastenerInterface:WheelFastenerInterface [5]
                    connect lugNutPorts to shankPorts;
                
                /*  the following does not work
                interface wheelFastenerInterface1:WheelFastenerInterface
                    connect lugNutPort1[1]:>lugNutPorts to shankPort1[1]:>shankPorts;
                */
            }
        }
        package AllocationDefinitions{
            allocation def LogicalToPhysical{
                end logical:LogicalElement;
                end physical:PhysicalElement;
            }
        }
        package ActionDefinitions{
            // why is item key word not required here for fuelCmd
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
                //attribute actualFuelEconomy : DistancePerVolumeValue;
                //attribute requiredFuelEconomy : DistancePerVolumeValue;
                attribute actualFuelEconomy :> distancePerVolume;
                attribute requiredFuelEconomy :> distancePerVolume;
                require constraint {actualFuelEconomy >= requiredFuelEconomy}
            }
        }
        package AttributeDefinitions{
            import ScalarValues::*;
            // Scalar Functions provides Sum expression
            import NumericalFunctions::*;
            import ISQ::*;
            import SI::*;
            import USCustomaryUnits::*;
            alias Torque for ISQ::TorqueValue;
            
            //examples of enumerations
            enum def Colors {black;grey;red;}
            enum def DiameterChoices:>ISQ::LengthValue{
                enum = 60 [mm];
                enum = 80 [mm];
                enum = 100 [mm];
            }
            attribute cylinderDiameter: DiameterChoices = 80 [mm]; 
            enum def IgnitionOnOff {on;off;}
            

            // (from Ed's model) the following defines new quantities and units used in fuel economy reqts and analysis
            import Quantities::*;
            import UnitsAndScales::DerivedUnit;
            import SIPrefixes::kilo;
            
            /* should we add quantity and unit as key words? */
            distancePerVolume :> scalarQuantities = distance / volume;
            timePerDistance :> scalarQuantities = time / distance;
            volumePerDistance :> scalarQuantities = volume / distance;
            volumePerTime :> scalarQuantities = volume / time;
            
            // kpl is approx .425 * mpg
            kpl : DerivedUnit = km / L;
            rpm : DerivedUnit = 1 / SI::min;
            kW : DerivedUnit = kilo * W;
            //
        }
        package IndividualDefinitions{
            //individual def SpatialTemporalReference_1:>SpatialTemporalReference;
            individual def VehicleRoadContext_1:>GenericContext::Context;
            individual def Vehicle_1:>Vehicle;
            individual def FrontAxleAssembly_1:>AxleAssembly;
            individual def FrontAxle_1:>FrontAxle;
            individual def Wheel_1:>Wheel;
            individual def Wheel_2:>Wheel;
            individual def RearAxleAssembly_1:>AxleAssembly;
            individual def Road_1:>Road;
        }
        package AnnotationDefinitions {
            
            import AnalysisTooling::*;   
            //define the metadata as follows if not included in the AnalysisTooling library
            /*
            attribute def ToolExecution {
                attribute toolName:String;
                attribute uri:String;
            }
            */ 
            
            attribute def Safety {
                attribute isMandatory : Boolean;
            }
            attribute def Security;
        }
        package GenericContext {
            //import ISQ::*;
            //import SI::*;
            //import USCustomaryUnits::*;

            part def Context {
                attribute time:TimeValue;
                attribute spatialCS: Cartesian3dSpatialCoordinateSystem[1] { :>> mRefs = (m, m, m); }
                attribute velocityCS: Cartesian3dVelocityCoordinateSystem[1] = spatialCS/s { :>> isBound = false; }
                attribute accelarationCS: Cartesian3dAccelerationCoordinateSystem[1] = velocityCS/s { :>> isBound = false; }
            }
            // consider including in the Context
            // the following should replace startShot and endShot with start and done respectively
            occurrence starting_Ending_Conditions {
                timeslice starting_Ending {
                    snapshot starting = startShot {
                        attribute tstart :>ISQ::time default 0 [s];
                    }
                    snapshot ending = endShot {
                        attribute tend :>ISQ::time [s];
                    }
                    attribute tstart_To_tend :>ISQ::time [s] = ending.tend - starting.tstart;
                }
            }
        }
    }
    package VehicleLogicalConfiguration{
        package PartsTree{
            part vehicleLogical:VehicleLogical{
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
        import VehicleLogicalConfiguration::PartsTree::*;
        import VehicleConfigurations::VehicleConfiguration_b::PartsTree::**;
        allocation vehicleLogicalToPhysicalAllocation:AllocationDefinitions::LogicalToPhysical
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
                    //attribute partMasses={fuelTank::mass,frontAxleAssembly::mass,rearAxleAssembly::mass};
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
        }
        package VehicleConfiguration_b{
            package PartsTree{
                part vehicle_b : Vehicle{
                    attribute mass redefines mass=dryMass+cargoMass+fuelTank.fuel.fuelMass;
                    attribute dryMass redefines dryMass=sum(partMasses);
                    attribute redefines cargoMass default 0 [kg];
                    attribute partMasses=(fuelTank.mass,frontAxleAssembly.mass,rearAxleAssembly.mass,engine.mass,transmission.mass,driveshaft.mass);
                    attribute avgFuelEconomy :> distancePerVolume;
                    port fuelCmdPort: FuelCmdPort redefines pwrCmdPort {
                        in item redefines fuelCmd;
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
                    /*
                    exhibit States::vehicleStates redefines vehicleStates {
                        ref vehicle redefines vehicle = vehicle_b;
                    }
                    */
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
                        perform ActionTree::providePower::distributeTorque;
                        part rearWheel1:Wheel{
                            attribute redefines diameter;
                            port wheelToAxlePort:WheelToAxlePort;
                            port wheelToRoadPort:WheelToRoadPort;
                        }
                        part rearWheel2:Wheel{
                            attribute redefines diameter;
                            port wheelToRoadPort:WheelToRoadPort;
                            port wheelToAxlePort:WheelToAxlePort;
                        }
                        part differential:Differential{
                            port shaftPort_d:ShaftPort_d;
                            port leftDiffPort:DiffPort;
                            port rightDiffPort:DiffPort;
                        }
                        part rearAxle{
                            part leftHalfAxle:HalfAxle{
                                port leftAxleToDiffPort:AxlePort;
                                port leftAxleToWheelPort:AxlePort;
                            }
                            part rightHalfAxle:HalfAxle{
                                port rightAxleToDiffPort:AxlePort;
                                port rightAxleToWheelPort:AxlePort;
                            }
                        }
                        
                        bind shaftPort_d=differential.shaftPort_d;
                        connect differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort;
                        connect differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort;
                        connect rearAxle.leftHalfAxle.leftAxleToWheelPort to rearWheel1.wheelToAxlePort;
                        connect rearAxle.rightHalfAxle.rightAxleToWheelPort to rearWheel2.wheelToAxlePort;
                    }
                    part starterMotor:StarterMotor;
                    part engine:Engine{
                        perform ActionTree::providePower::generateTorque redefines generateTorque;            
                        part cylinders:Cylinder[4..6];
                        part alternator{
                            action generateElectricity;
                        }
                        satisfy Requirements::engineSpecification by vehicle_b.engine{
                            //subject engine1 = vehicle_b::engine;
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
                        //conjugate notation ~
                        //port clutchPort:~DrivePwrPort;
                        port shaftPort_a:ShaftPort_a;
                        perform ActionTree::providePower::amplifyTorque;
                    }
                    part driveshaft:Driveshaft{
                        attribute mass :> ISQ::mass=100[kg];
                        port shaftPort_b:ShaftPort_b;
                        port shaftPort_c:ShaftPort_c;
                        perform ActionTree::providePower::transferTorque;
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

                    //Example: the following identifies an issue with the interface
                    // Issue is in the ModelingMetadata library
                    metadata InterfaceCompatibilityIssue : Issue about engineToTransmissionInterface {
                    text = "This issue is about the interface compatability between the engine and transmission." +
                    "The CAD model inidcates tolerances are not properly specified";
                    }                    
                    
                    
                    //connections
                    bind engine.fuelCmdPort=fuelCmdPort;
                    
                    //connect engine.drivePwrPort to transmission.clutchPort; 
                    /* the following interface replaces the above connect statement. */
                    interface engineToTransmissionInterface:EngineToTransmissionInterface
                        connect engine.drivePwrPort to transmission.clutchPort;
                        //can ref or allocate the flow - generateToAmplify :> ActionTree::providePower.generateToAmplify;
                    
                    interface fuelInterface:FuelInterface
                        connect fuelTank.fuelOutPort to engine.fuelInPort;
                    //allocate flow from action flows to connections
                    
                    bind engine.ignitionCmdPort=ignitionCmdPort;
                    connect starterMotor.gearPort to engine.flyWheelPort;
                    connect vehicleSoftware.vehicleController.controlPort to engine.engineControlPort;
                    bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
                    connect speedSensor.speedSensorPort to vehicleSoftware.vehicleController.cruiseController.speedSensorPort;
                    connect vehicleSoftware.vehicleController.cruiseController.cruiseControlPort to engine.engineControlPort;
                    connect transmission.shaftPort_a to driveshaft.shaftPort_b; 
                    connect driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d;
                    bind rearAxleAssembly.rearWheel1.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort1;
                    bind rearAxleAssembly.rearWheel2.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort2;
                    
                    // assert the vehicle features (e.g, mass, reliability) satisfy the requirements
                    satisfy Requirements::vehicleSpecification by vehicle_b{
                        // attribute redefines vehicleMassRequirement.massActual = vehicle_b.mass;
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
                    /* No successions (control flows) between these actions, because the input/outputs are continuous flows.*/
                    action generateTorque:GenerateTorque {
                        in item = providePower::fuelCmd;
                    }
                    action amplifyTorque:AmplifyTorque;
                    action transferTorque:TransferTorque;
                    action distributeTorque:DistributeTorque;

                    flow generateToAmplify from generateTorque.engineTorque to amplifyTorque.engineTorque;
                    flow amplifyTorque.transmissionTorque to transferTorque.transmissionTorque;
                    flow transferTorque.driveshaftTorque to distributeTorque.driveshaftTorque;
                }
                action performSelfTest: PerformSelfTest;
                action applyParkingBrake: ApplyParkingBrake;
                action senseTemperature: SenseTemperature;
            }                   
            //package States{}
            package DiscreteInteractions{
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
                                /* introduce loop operand with test when available so that
                                 sensedSpeedSent continues at periodic intervals until cancelSpeedReceived */
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
                                /* introduce loop operand with test when available so that
                                 sensedSpeedSent continues at periodic intervals until cancelSpeedReceived */
                                    port redefines setSpeedPort{
                                        //analagous to gate: event occurrence bound but may not need this since the port is bound
                                        event occurrence setSpeedReceived = vehicle_b.setSpeedPort.setSpeedReceived;
                                    }
                                    port redefines speedSensorPort{
                                        event occurrence setSpeedReceived=setSpeedPort.setSpeedReceived;
                                        then event sendSensedSpeed.target;
                                    }
                                    port redefines cruiseControlPort{
                                        //event occurrence sensedSpeedReceived=speedSensorPort.sensedSpeedReceived;
                                        //event occurrence  = speedSensorPort::sendSensedSpeed::target;
                                                                         
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
                occurrence CruiseControl3{
                    //create example using interface pattern for sending and receiving messages per Conrad
                }
                occurrence TestScenario1{
                    part vehicle_c:>PartsTree::vehicle_b{
                        event occurrence on = vehicleStates.operatingStates.on;
                        then event occurrence on_To_off = vehicleStates.operatingStates.on_To_off;
                        then event occurrence off = vehicleStates.operatingStates.off;
                        
                        /*
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
                        */
                    }
                }
            }
            package Requirements{
                item marketSurvey;
                dependency from vehicleSpecification to marketSurvey;
                
                requirement vehicleSpecification{
                    subject vehicle:Vehicle;
                    requirement <'1'> vehicleMassRequirement: MassRequirement {
                        doc /* The total mass of a vehicle shall be less than or equal to the required mass.
                        Assume total mass includes a full tank of gas of 60 kg*/
                        attribute redefines massRequired=2000 [kg];                     
                        attribute redefines massActual = vehicle.dryMass + fuelMassActual;
                        attribute fuelMassActual:>ISQ::mass;
                        attribute fuelMassMax:>ISQ::mass = 60 [kg];
                        assume constraint {fuelMassActual==fuelMassMax}
                    }
                    requirement <'2'> vehicleFuelEconomyRequirements{
                        doc /* fuel economy requirements group */
                        attribute assumedCargoMass:>ISQ::mass;
                        requirement <'2_1'> cityFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 10 [km / L];
                            assume constraint {assumedCargoMass>=500 [kg]}
                        }
                        requirement <'2_2'> highwayFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 12.75 [km / L];
                            attribute assumedCargoMass:>ISQ::mass;
                            assume constraint {assumedCargoMass>=500 [kg]}
                            
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
                    requirement torqueGenerationRequirement : TorqueGenerationRequirement{
                        subject generateTorque = engine1.generateTorque;
                    }

                    requirement drivePowerOutputRequirement : DrivePowerOutputRequirement{
                        port torqueOutPort{
                            out torque:Torque;
                        }
                    }
                }
            }
        }
        // the following shows the vehicle decomposition using part definitions similar to SysML v1
        package VehicleConfiguration_B{
            package VehicleDecomposition{
                part def Vehicle_B:>Vehicle{
                    port fuelCmdPort: FuelCmdPort redefines pwrCmdPort {
                        in item redefines fuelCmd;
                    }
                    port vehicleToRoadPort redefines vehicleToRoadPort{
                        port wheelToRoadPort1:WheelToRoadPort;
                        port wheelToRoadPort2:WheelToRoadPort;
                    }
                    part fuelTank:FuelTank_B{
                        port fuelOutPort redefines fuelOutPort{
                            out item redefines fuel;
                        }
                    }
                    part frontAxleAssy:FrontAxleAssy_B;
                    part rearAxleAssy:RearAxleAssy_B;
                    part engine:Engine_B{
                        port engineControlPort:>> engineControlPort;
                        port fuelInPort:>> fuelInPort{
                            in item fuel redefines fuel;
                        }
                        port fuelCmdPort:>> fuelCmdPort {
                            in item redefines fuelCmd;
                        }
                        port drivePwrPort:>> drivePwrPort {
                            out redefines torque;
                        }                    
                    }
                    part transmission:Transmission_B{
                        port clutchPort:>>clutchPort;
                        port shaftPort_a:>>shaftPort_a;
                    }
                    part driveshaft:Driveshaft_B{
                        port shaftPort_b:>>shaftPort_b;
                        port shaftPort_c:>>shaftPort_c;
                    }
                    part vehicleSoftware:VehicleSoftware_B;
                    part bodyAssy:BodyAssy_B;
                    part interior{
                        part alarm {@Security;}
                        part seatBelt[2] {@Safety{isMandatory = true;}}
                        part frontSeat[2];
                        part driverAirBag {@Safety{isMandatory = false;}}
                    }
                    bind engine.fuelCmdPort=fuelCmdPort;
                    connect fuelTank.fuelOutPort to engine.fuelInPort;
                    connect engine.drivePwrPort to transmission.clutchPort;
                    connect transmission.shaftPort_a to driveshaft.shaftPort_b; 
                }
                part def FuelTank_B:>FuelTank;
                part def FrontAxleAssy_B:>AxleAssembly{
                    part frontWheels:Wheel_B[2];
                    part frontAxle:FrontAxle_B;
                }
                part def RearAxleAssy_B:>AxleAssembly{
                    part rearWheel1:Wheel_B;
                    part rearWheel2:Wheel_B;
                    part rearAxle{
                        part leftHalfAxle:HalfAxle_B;
                        part rightHalfAxle:HalfAxle_B;
                    }
                }
                part def FrontAxle_B:>FrontAxle;
                part def HalfAxle_B:>HalfAxle;
                part def Differential_B:>Differential;
                part def Wheel_B:>Wheel;
                part def Engine_B:>Engine{
                    port engineControlPort:>> engineControlPort;
                    port fuelInPort:>> fuelInPort{
                        in item fuel redefines fuel;
                    }
                    port fuelCmdPort:>> fuelCmdPort {
                        in item redefines fuelCmd;
                    }
                    port drivePwrPort:>> drivePwrPort {
                        out redefines torque;
                    }
                    part cylinders:Cylinder_B[4..6];
                }
                part def Cylinder_B:>Cylinder;
                part def Transmission_B:>Transmission{
                    //port clutchPort:~DrivePwrPort;
                    port shaftPort_a:ShaftPort_a;
                }
                part def Driveshaft_B:>Driveshaft{
                    port shaftPort_b:ShaftPort_b;
                    port shaftPort_c:ShaftPort_c;
                }
                part def VehicleSoftware_B:>VehicleSoftware{
                    part vehicleController:VehicleController_B;
                }
                part def VehicleController_B:>VehicleController{
                    port controlPort redefines controlPort;
                }
                part def BodyAssy_B:>BodyAssy{
                    part body:Body_B;
                    part bumper;
                    part keylessEntry;
                }
                part def Body_B:>Body;
            }
        }
        package engine4Cyl_Variant{
            part engine{
                part cylinders:Cylinder[4..8] ordered;
            }
            part engine4Cyl:>engine{
                part redefines cylinders [4];
                part cylinder1 subsets cylinders[1];
                part cylinder2 subsets cylinders[1];
                part cylinder3 subsets cylinders[1];
                part cylinder4 subsets cylinders[1];
            }
        }
        package WheelHubAssemblies{
            part wheelHubAssy{
                part wheel1:Wheel{
                    port lugNutPorts:LugNutPort[5];
                }
                part hub1:Hub{
                    port shankPorts:ShankPort[5];
                }
                interface wheelHubInterface:WheelHubInterface [5]
                    connect wheel1.lugNutPorts [1] to hub1.shankPorts [1];
            }
            part wheelHubAssy1{
                part wheel1:Wheel{
                    port lugNutPort1:LugNutPort;
                    port lugNutPort2:LugNutPort;
                    port lugNutPort3:LugNutPort;
                }
                part hub1:Hub{
                    port shankPort1:ShankPort;
                    port shankPort2:ShankPort;
                    port shankPort3:ShankPort;
                }
                interface wheelHubInterface1:WheelHubInterface
                    connect wheel1.lugNutPort1 to hub1.shankPort1;
                interface wheelHubInterface2:WheelHubInterface
                    connect wheel1.lugNutPort2 to hub1.shankPort2;
                interface wheelHubInterface3:WheelHubInterface
                    connect wheel1.lugNutPort3 to hub1.shankPort3;
            }
        }
    }
    package VehicleAnalysis{
        // recursive import uses double asterisk **
        import VehicleConfigurations::VehicleConfiguration_b::**;
        package FuelEconomyAnalysisModel_ModelCenter{
            // metadata library
            import AnalysisTooling::*;
            
            // create indviduals to record analysis results (e.g., output values)
            individual def Vehicle_2:>Vehicle;
            individual def Engine_2:>Engine;
            //individual vehicle_b2:Vehicle_2{
            individual vehicle_b2:Vehicle_2:>PartsTree::vehicle_b{
                //attribute fuelEconomy:Real; 
                attribute :>>avgFuelEconomy;
                attribute distanceTraveled:LengthValue = 1000 [m];
                individual engine_b2:Engine_2 redefines PartsTree::vehicle_b::engine {
                    attribute :>> peakHorsePower = 200*745.7[W];
                    attribute :>> fuelEfficiency = .4;                  
                }
            }
           analysis fuelEconomyAnalysis  {
                //return attribute calculatedFuelEconomy:KilometersPerLitre;
                return attribute calculatedFuelEconomy:>distancePerVolume;               
                subject v:>vehicle_b2;
                
                objective fuelEconomyAnalysisObjective {
                    /* the objective of this analysis is to determine whether the vehicle design configuration can 
                    satisfy the fuel economy requirements */
                    require vehicleSpecification::vehicleFuelEconomyRequirements;
                }
                
                action fuelConsumption {
                    metadata ToolExecution {
                        toolName = "ModelCenter";
                        uri = "aserv://localhost/sysml2/vehicleModel/fuelConsumption";
                    }
                    in power:PowerValue=v.engine_b2.peakHorsePower                  { @ToolVariable { name = "pv"; } }
                    in fuelEfficiency:Real=v.engine_b2.fuelEfficiency               { @ToolVariable { name = "fuelEff"; } }
                    in distanceTraveled:LengthValue=v.distanceTraveled              { @ToolVariable { name = "distance"; } }
                    out fuelEconomy:>distancePerVolume=v.avgFuelEconomy                { @ToolVariable { name = "fuelEconomy"; }}
                }
           }
        }
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

            //calc def FuelConsumption (bestFuelConsumption: Real, idlingFuelConsumption: Real, tpd_avg: Real) : KilometersPerLitre {
            calc def FuelConsumption (bestFuelConsumption: Real, idlingFuelConsumption: Real, tpd_avg:>timePerDistance) :> distancePerVolume {
                attribute f = bestFuelConsumption + idlingFuelConsumption * tpd_avg;
                1/f
            }
            calc def AverageTravelTimePerDistance(scenario: Scenario) tpd_avg:>timePerDistance;
            calc def TraveledDistance(scenario: Scenario) distance:> length;
            calc def IdlingFuelConsumptionPerTime(engine: Engine) f_a : Real {
                attribute idlingFuelConsumptionPerDisplacement: Real = 0.5;
                engine.displacement * idlingFuelConsumptionPerDisplacement
            }

            attribute specificGravityOfGasoline: Real = 0.76;
            calc def BestFuelConsumptionPerDistance(mass: MassValue, bsfc: Real, tpd_avg:> timePerDistance, distance:>length) f_b : Real {
                attribute required_power_avg:> power;
                constraint {
                    required_power_avg == 1/2 * mass * tpd_avg **(-3) / distance
                }
                bsfc * specificGravityOfGasoline * required_power_avg * tpd_avg
            }

            calc def ComputeBSFC(engine: Engine): Real;

            analysis fuelEconomyAnalysis  {
                
                // metadata defined in Annotation Definitions
                metadata ToolExecution {
                    toolName = "ModelCenter";
                    uri = "aserv://localhost/Vehicle/Equation1";
                }             
                
                in attribute scenario: Scenario;
                // define a series of waypoints
                
                subject = vehicle_b;
                
                objective fuelEconomyAnalysisObjective {
                    doc /*the objective of this analysis is to determine whether the vehicle design configuration can 
                    satisfy the fuel economy requirements*/
                    require vehicleSpecification::vehicleFuelEconomyRequirements;
                }
                /* this is the longhand for a calc
                calc calc1:TraveledDistance(in=scenario) result;
                attribute distance=calc1::result;
                */
                
                // specify vehicle_b.engine.displacement;
                
                attribute distance = TraveledDistance(scenario);
                attribute tpd_avg = AverageTravelTimePerDistance(scenario);
                attribute bsfc = ComputeBSFC(vehicle_b.engine);
                attribute f_a = BestFuelConsumptionPerDistance(vehicle_b.mass, bsfc, tpd_avg, distance);
                attribute f_b = IdlingFuelConsumptionPerTime(vehicle_b.engine);

                //return attribute calculatedFuelEconomy:KilometersPerLitre=FuelConsumption(f_a, f_b, tpd_avg) ;
                return attribute calculatedFuelEconomy:>distancePerVolume=FuelConsumption(f_a, f_b, tpd_avg);
            }
        }
        package ElectricalPowerAnalysis{
        }
        package ReliabilityAnalyis{
        }
        package VehicleTradeOffAnalysis{
            /* The following example provides the rationale for selecting the engine4cyl. 
            The rationale could be contained in the vehicle configuration with the selected engine.
            The rationale and risk are contained in a metadata library. */
            
            @Rationale about engineTradeOffAnalysis::vehicle_b_engine4cyl{
                explanation = VehicleAnalysis::VehicleTradeOffAnalysis::engineTradeOffAnalysis;          
                text = "the engine4cyl was evaluated to have a higher objective function compared to the engine6cyl based on the trade-off analyiss"; 
            }
            
            // The following risk for the engine4cyl could have been included as part of the objective evaluaiton criteria
            
            @Risk about engineTradeOffAnalysis::vehicle_b_engine4cyl {
                totalRisk = RiskLevelEnum::medium;
                technicalRisk = RiskLevelEnum::medium;
                scheduleRisk = RiskLevelEnum::medium;
                costRisk = RiskLevelEnum::low;
            }
            @RiskLevel about engineTradeOffAnalysis::vehicle_b_engine4cyl::engine::fuelEfficiency {
                Risk::technicalRisk.probability = 0.3;
                Risk::technicalRisk.impact = 0.5;
            }
            
            /*
            The following did not parse.
            
            @Risk about engineTradeOffAnalysis::vehicle_b_engine4cyl::engine::fuelEfficiency {
                technicalRisk {
                    technicalRisk.probability = 0.3;
                    technicalRisk.impact = 0.5;
                }
            }
            */
                
            import TradeStudies::*;
            //objective function with criterion engine mass, engine power, and engine cost
            calc def EngineEvaluation (engineMass:>ISQ::mass, enginePower:>ISQ::power, engineFuelEfficiency:Real,engineCost:Real) eval:Real;
            calc def EngineEvaluation_4cyl (engineMass:>ISQ::mass, enginePower:>ISQ::power, engineFuelEfficiency:Real,engineCost:Real) eval:Real;
            calc def EngineEvaluation_6cyl (engineMass:>ISQ::mass, enginePower:>ISQ::power, engineFuelEfficiency:Real,engineCost:Real) eval:Real;
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
                
                // the objective includes the objectiveFunction to select the maximum
                objective :MaximizeObjective;
                    /*Select vehicle alternative with the engine whose evaluation function returns the max value*/
                
                // Use the following if the evaluation function is the same for each alternative
                /*
                calc :>> objectiveFunction {
                    in part vehicle:>vehicle_b;
                    return attribute eval:Real=EngineEvaluation (vehicle::engine::mass, vehicle::engine::peakHorsePower, vehicle::engine::fuelEfficiency, vehicle::engine::cost);               
                }
                */
                
                // Use the following if the evaluation function is different for each alternative
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
        import VerificationCases::VerificationMethodKind::*;
        package VerificationCaseDefinitions{
            verification def MassTest;
            verification def AccelerationTest;
            verification def ReliabilityTest;
        }
        package VerificationCases1{
            verification massTests:MassTest {
                subject = vehicle_b;
                objective {
                    verify vehicleSpecification.vehicleMassRequirement{
                        redefines massActual=weighVehicle.massMeasured;
                    }
                }
                // @ is shorthand for metadata
                // method kindes are test, demo, analyze, should also include inspection, similarity
               @ VerificationMethod{
                    kind = (test, analyze);
                }
                action weighVehicle (
                    out massMeasured:>ISQ::mass);
                then action evaluatePassFail {
                    in massMeasured:>ISQ::mass;
                    out verdict = PassIf(vehicleSpecification::vehicleMassRequirement(vehicle_b));
                }
                //return :>> verdict = PassIf(vehicleSpecification::vehicleMassRequirement(vehicle_b));
            }
        }
        package VerificationSystem{
            part massVerificationSystem{
                perform massTests;
                part scale{
                    perform massTests.weighVehicle;
                }
                part operator{
                    perform massTests.evaluatePassFail;
                }
            }
        }
    }
    package VehicleIndividuals{
        // VehicleRoadContext_1 subclasses GenericContext::Context with spatial reference and time attribute
        individual a:VehicleRoadContext_1{
            //timeslice t0_t2:VehicleRoadContext_1{
            timeslice t0_t2_a{
                /*
                snapshot start redefines start{
                    attribute t0:TimeValue=0;
                }
                snapshot done redefines done{
                    attribute t2:TimeValue=2;
                }
                */
                
                //snapshot t0:VehicleRoadContext_1{
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
                        // how do you represent state=on;
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
                        // how do you represent state=on;
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
                        // how do you represent state=on;
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
        //import VehicleConfigurations::VehicleConfiguration_b::PartsTree::*;
        //import VehicleConfigurations::VehicleConfiguration_b::ActionTree::*;
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
                        do send IgnitionCmd (ignitionOnOff=IgnitionOnOff::on) to handPort
                        then wait;
                    // ignition off
                    transition 'wait-wait-2'
                        first wait
                        do send IgnitionCmd (ignitionOnOff=IgnitionOnOff::off) to handPort
                        then wait;
                }
            }
            part def Passenger;
            // replace action def with use case def where vehicle_b is subject and objective is defined
            
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
                assert constraint {driver[1] xor passenger[1]}
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
                assert constraint {driver[1] xor passenger[1]}
            }
        }
        package TransportPassengerScenario{
            import ContextDefinitions::TransportPassenger;
            
            // action defined by Use Case Def
            // this version uses nesting vs fork and join for concurrent actions
            action transportPassenger:TransportPassenger{
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
            action transportPassenger_1:TransportPassenger{
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
            perform transportPassenger;
            part road:ContextDefinitions::Road;
            part driver:ContextDefinitions::Driver{
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
            part passenger1:ContextDefinitions::Passenger{
                perform transportPassenger.a.passenger1GetInVehicle.unlockDoor_in;
                perform transportPassenger.a.passenger1GetInVehicle.openDoor_in;
                perform transportPassenger.a.passenger1GetInVehicle.enterVehicle; 
                perform transportPassenger.a.passenger1GetInVehicle.closeDoor_in;
                perform transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out;
                perform transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle; 
                perform transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out;
                perform transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out;
            }
            part vehicle_b_1:>vehicle_b {
                attribute :>> positionVector = (0,0,0) [spatialCS];
                perform transportPassenger.b.providePower redefines providePower;
                perform transportPassenger.trigger;
            }
            connect driver.handPort to vehicle_b_1.ignitionCmdPort;
            connect road to vehicle_b_1.vehicleToRoadPort;
        }
    }
    package VehicleSuperSetModel{
        //recursive import with **
        import VehicleConfigurations::VehicleConfiguration_a::**;
        /* all of vehicle_b must be included in the superset modelto make vehicle_b a specific vehicle configuration 
        from this product family instead of a subset of vehicle_a*/
        package VariationPointDefinitions {
            variation part def TransmissionChoices:>Transmission {
                variant part transmissionAutomatic:TransmissionAutomatic;
                variant part transmissionManual:TransmissionManual;
            }
        }
        package VehiclePartsTree{
            import VariationPointDefinitions::*;
            abstract part vehicleFamily:>vehicle_a{
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
                // varaition point based on variation of part definition
                variation part transmissionChoices:TransmissionChoices;
                // optional variation point
                variation part sunroof:Sunroof;
                // selection constraint
                assert constraint {
                    (engine==engine::engine4Cyl and transmissionChoices==TransmissionChoices::transmissionManual) xor
                    (engine==engine::engine6Cyl and transmissionChoices==TransmissionChoices::transmissionAutomatic)
                }
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
            filter @Safety && Safety::isMandatory;
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
                doc /* clarify how system is decomposed */
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
                // include query expression
                filter @SysML::PartUsage;
                //*
                view attributes[*]{
                }*/
            }
            view def PartsInterconnection:>NestedView;
        }
        package VehicleViews{
            import ViewpointDefinitions::*;
            import ViewDefinitions::*;
            import VehicleConfigurations::VehicleConfiguration_b::*;
            view vehiclePartsTree_Safety:PartsTreeView{
                // if safetyViewpoint is a usage, statement can be satisfy safetyViewpoint
                satisfy requirement sv:SafetyViewpoint;
                expose PartsTree::**;
                filter @Safety;
            }
        }
    }
    package OtherFunctionality{
        // not constraint
        // implies operator
    }
}

