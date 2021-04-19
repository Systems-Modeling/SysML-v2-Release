package sfriedenthal_VehicleModel_1_simplified{
    import Definitions::*;
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
                port pwrCmdPort:PwrCmdPort;
                port vehicleToRoadPort:VehicleToRoadPort;
                perform action providePower;
                perform action provideBraking;
                perform action controlDirection;
                perform action performSelfTest;
                perform action applyParkingBrake;
                perform action senseTemperature;
                exhibit state vehicleStates;
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
                    out redefines engineTorque;
                }
                perform action generateTorque;
            }
            part def Cylinder;
            part def Transmission;
            part def Driveshaft;
            part def AxleAssembly;
            part def Axle{
                attribute mass:>ISQ::mass;
            }
            part def FrontAxle:>Axle{
                attribute steeringAngle:ScalarValues::Real;
            }
            part def HalfAxle;
            part def Differential;
            part def Wheel {
                attribute diameter:LengthValue;
            }
            abstract part def Software;
            part def VehicleSoftware:>Software;
            part def VehicleController:>Software {
                port controlPort:ControlPort;
                exhibit state controllerStates: ControllerStates;
            }
            part def FuelTank{
                attribute mass :> ISQ::mass;
                // should use fuel volume instead of fuel mass and fuelCopacity instead of fuelMassMax
                ref item fuel:Fuel{
                    attribute redefines fuelMass;
                }
                attribute fuelMassMax:>ISQ::mass;
                assert constraint {fuel::fuelMass<=fuelMassMax}
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
            part def VehicleRoadContext{
                attribute time:TimeValue;
            }
            // Used for Specifying Context for Individuals
            part def SpatialTemporalReference;
            
            // Used for Defining Variants for Superset Model
            part def Engine4Cyl;
            part def Engine6Cyl;
            part def TransmissionChoices;
            part def TransmissionAutomatic;
            part def TransmissionManual;
            part def Sunroof;
            
            //create abstract physical element to support allocation def from logical to Physical
            part def PhysicalComponent:>PhysicalElement;
            //logical Components
            part def LogicalComponent:>LogicalElement;
            part def VehicleLogical:>LogicalComponent;
            part def ElectricalGenerator;
            part def TorqueGenerator;
            part def SteeringSubsystem;
            part def BrakingSubsystem;
            
            
        }
        package PortDefinitions{
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
                out engineTorque:Torque;
            }
            port def ClutchPort;
            port def ShaftPort_a;
            port def ShaftPort_b;
            port def ShaftPort_c;
            port def ShaftPort_d;
            port def DiffPort;
            port def AxlePort;
            port def AxleToWheelPort;
            port def WheelToAxlePort;
            port def WheelToRoadPort;
            port def VehicleToRoadPort;
            port def ControlPort;
        }
        package ItemDefinitions{
            item def Fuel{
                attribute fuelMass:>ISQ::mass;
            }
            item def FuelCmd:>PwrCmd;
            item def PwrCmd{
                attribute throttleLevel:Real;
            }
            item def LogicalElement;
            item def PhysicalElement;
        }
        package SignalDefinitions{
            // should the following signals be item def vs attribute def?
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
        }
        package InterfaceDefinitions{
            interface def EngineToTransmissionInterface{
                end p1:DrivePwrPort;
                end p2:ClutchPort;
            }
            interface def FuelInterface {
                end fuelOutPort : FuelPort{
                    out item :>> fuel;
                }
                end fuelInPort : ~FuelPort {
                    in item :>> fuel;
                }
                stream fuelOutPort::fuel to fuelInPort::fuel;
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
            import ScalarFunctions::*;
            import ISQ::*;
            import SI::*;
            alias ISQ::TorqueValue as Torque;
            
            //examples of enumberations
            enum def Colors {black;grey;red;}
            enum def DiameterChoices:>ISQ::LengthValue{
                enum = 60 @[mm];
                enum = 80 @[mm];
                enum = 100 @[mm];
            }
            attribute cylinderDiameter: DiameterChoices = 80 @[mm];       

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
            rpm : DerivedUnit = 1 / min;
            kW : DerivedUnit = kilo * W;
            //
        }
        package IndividualDefinitions{
            individual def SpatialTemporalReference_1:>SpatialTemporalReference;
            individual def VehicleRoadContext_1:>VehicleRoadContext;
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
                allocate vehicleLogical::torqueGenerator to vehicle_b::engine{
                    allocate vehicleLogical::torqueGenerator::generateTorque to vehicle_b::engine::generateTorque;
                }
                allocate vehicleLogical::electricalGenerator to vehicle_b::engine{
                    allocate vehicleLogical::electricalGenerator::generateElectricity to vehicle_b::engine::alternator::generateElectricity;
                }
            }
    }
    package VehicleConfigurations{
        package VehicleConfiguration_a{
            package PartsTree{
                part vehicle_a:Vehicle{
                    attribute mass redefines Vehicle::mass=dryMass+cargoMass+fuelTank::fuel::fuelMass;
                    attribute dryMass redefines Vehicle::dryMass=sum(partMasses);
                    attribute redefines Vehicle::cargoMass=0;
                    attribute partMasses [*] nonunique :>ISQ::mass;
                    //attribute partMasses={fuelTank::mass,frontAxleAssembly::mass,rearAxleAssembly::mass};
                    part fuelTank:FuelTank{
                        attribute redefines mass=75@[kg];
                        ref item redefines fuel{
                            attribute redefines fuelMass=50@[kg];
                        }   
                    }
                    part frontAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=800@[kg];
                        part frontAxle:Axle;
                        part frontWheels:Wheel[2];
                    }
                    part rearAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=875@[kg];
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
                    attribute mass redefines mass=dryMass+cargoMass+fuelTank::fuel::fuelMass;
                    attribute dryMass redefines dryMass=sum(partMasses);
                    attribute redefines cargoMass=0;
                    attribute partMasses={fuelTank::mass,frontAxleAssembly::mass,rearAxleAssembly::mass,engine::mass,transmission::mass,driveshaft::mass};
                    attribute avgFuelEconomy :> distancePerVolume;
                    port fuelCmdPort: FuelCmdPort redefines pwrCmdPort {
                        in item redefines fuelCmd;
                    }
                    port vehicleToRoadPort redefines vehicleToRoadPort{
                        port wheelToRoadPort1:WheelToRoadPort;
                        port wheelToRoadPort2:WheelToRoadPort;
                    }
                    perform ActionTree::providePower redefines providePower;
                    perform ActionTree::performSelfTest redefines performSelfTest;
                    perform ActionTree::applyParkingBrake redefines applyParkingBrake;
                    perform ActionTree::senseTemperature redefines senseTemperature;
                    exhibit States::vehicleStates redefines vehicleStates {
                        ref vehicle redefines vehicle = vehicle_b;
                    }
                    part fuelTank:FuelTank{
                        attribute redefines mass=75@[kg];
                        ref item redefines fuel{
                            attribute redefines fuelMass=60@[kg];
                        }
                        attribute redefines fuelMassMax=60;
                        port fuelOutPort redefines fuelOutPort{
                            out item redefines fuel;
                        }
                    }
                    part frontAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=800@[kg];
                        port shaftPort_d:ShaftPort_d;
                        part frontAxle:FrontAxle;
                        part frontWheels:Wheel[2];
                    }
                    part rearAxleAssembly:AxleAssembly{
                        attribute mass :> ISQ::mass=875@[kg];
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
                        
                        bind shaftPort_d=differential::shaftPort_d;
                        connect differential::leftDiffPort to rearAxle::leftHalfAxle::leftAxleToDiffPort;
                        connect differential::rightDiffPort to rearAxle::rightHalfAxle::rightAxleToDiffPort;
                        connect rearAxle::leftHalfAxle::leftAxleToWheelPort to rearWheel1::wheelToAxlePort;
                        connect rearAxle::rightHalfAxle::rightAxleToWheelPort to rearWheel2::wheelToAxlePort;
                    }
                    part engine:Engine{
                        attribute :>> mass;
                        attribute :>> peakHorsePower;
                        attribute :>> fuelEfficiency;
                        attribute :>> cost;
                        port engineControlPort:>> engineControlPort;
                        port fuelInPort:>> fuelInPort{
                            in item fuel redefines fuel;
                        }
                        port fuelCmdPort:>> fuelCmdPort {
                            in item redefines fuelCmd;
                        }
                        port drivePwrPort:>> drivePwrPort {
                            out redefines engineTorque;
                        }
                        perform ActionTree::providePower::generateTorque redefines generateTorque;            
                        part cylinders:Cylinder[4..6];
                        part alternator{
                            action generateElectricity;
                        }
                        satisfy Requirements::engineSpecification by vehicle_b::engine{ 
                            //subject engine1 = vehicle_b::engine;
                            requirement torqueGenerationRequirement :>> torqueGenerationRequirement{
                                subject generateTorque redefines generateTorque = vehicle_b::engine::generateTorque;
                            }
                            requirement drivePowerOuputRequirement :>> drivePowerOutputRequirement{
                                port torqueOutPort redefines torqueOutPort=vehicle_b::engine::drivePwrPort;
                            }
                        } 
                    }
                    part transmission:Transmission{
                        attribute mass :> ISQ::mass=100@[kg];
                        //conjugate notation ~
                        port clutchPort:~DrivePwrPort;
                        port shaftPort_a:ShaftPort_a;
                        perform ActionTree::providePower::amplifyTorque;
                    }
                    part driveshaft:Driveshaft{
                        attribute mass :> ISQ::mass=100@[kg];
                        port shaftPort_b:ShaftPort_b;
                        port shaftPort_c:ShaftPort_c;
                        perform ActionTree::providePower::transferTorque;
                    }
                    part vehicleSoftware:VehicleSoftware{
                        part vehicleController: VehicleController {
                            port controlPort redefines controlPort;
                            exhibit States::controllerStates redefines controllerStates{
                                ref controller = vehicleController;
                            }
                        }
                    }
                    // parts in bodyAssy and interioer are marked as safety or security features
                    part bodyAssy:BodyAssy{
                        part body:Body{
                            attribute :>> color = red;  
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
                    bind engine::fuelCmdPort=fuelCmdPort;
                    
                    //connect engine::drivePwrPort to transmission::clutchPort; 
                    /** the following interface replaces the above connection. Would like to reference the stream (obj flow)*/
                    interface engineToTransmissionInterface:EngineToTransmissionInterface
                        connect engine::drivePwrPort to transmission::clutchPort{
                            ref generateToAmplify :> ActionTree::providePower::generateToAmplify;
                        }
                    
                    //connect fuelTank::fuelOutPort to engine::fuelInPort;
                    interface fuelInterface:FuelInterface
                        connect fuelTank::fuelOutPort to engine::fuelInPort;
                    
                    connect vehicleSoftware::vehicleController::controlPort to engine::engineControlPort;
                    connect transmission::shaftPort_a to driveshaft::shaftPort_b; 
                    connect driveshaft::shaftPort_c to rearAxleAssembly::shaftPort_d;
                    bind rearAxleAssembly::rearWheel1::wheelToRoadPort=vehicleToRoadPort::wheelToRoadPort1;
                    bind rearAxleAssembly::rearWheel2::wheelToRoadPort=vehicleToRoadPort::wheelToRoadPort2;
                    
                    // assert the vehicle features (e.g, mass, reliability) satisfy the requirements
                    satisfy Requirements::vehicleSpecification by vehicle_b{
                        requirement vehicleMassRequirement:>>vehicleMassRequirement{
                            attribute redefines massActual=vehicle_b::mass;
                        }
                    }
                }
            }
            package ActionTree{
                action providePower:ProvidePower{
                    in item fuelCmd:FuelCmd redefines pwrCmd;
                    out wheelToRoadTorque redefines wheelToRoadTorque [2] = distributeTorque::wheelToRoadTorque;
                    // No successions (control flows) between these actions, because the
                    // flows between them are continuous streams.
                    action generateTorque:GenerateTorque {
                        in item = providePower::fuelCmd;
                        out engineTorque redefines engineTorque;
                    }
                    action amplifyTorque:AmplifyTorque {
                        in engineTorque redefines engineTorque;
                        out transmissionTorque redefines transmissionTorque;
                    }
                    action transferTorque:TransferTorque {
                        // This is a shorthand for the stream commented out below.
                        in transmissionTorque redefines transmissionTorque;
                        out driveshaftTorque redefines driveshaftTorque;
                    }
                    action distributeTorque:DistributeTorque{
                        in driveshaftTorque redefines driveshaftTorque;
                        out wheelToRoadTorque redefines wheelToRoadTorque [2];
                    }

                    stream generateToAmplify from generateTorque::engineTorque to amplifyTorque::engineTorque;
                    //stream from generateTorque::engineTorque to amplifyTorque::engineTorque;
                    stream amplifyTorque::transmissionTorque to transferTorque::transmissionTorque;
                    stream transferTorque::driveshaftTorque to distributeTorque::driveshaftTorque;
                }
                action performSelfTest: PerformSelfTest;
                action applyParkingBrake: ApplyParkingBrake;
                action senseTemperature: SenseTemperature;
            }                
            package States{
                //the following uses a single concept of event for signal, change, and time event
                //the time event will be replaced by when eventname
                state vehicleStates: VehicleStates {
                    ref vehicle : Vehicle;
                    ref controller : VehicleController;

                    state operatingStates {
                        entry action initial;

                        state off;                    
                        state starting;                    
                        state on {
                            entry vehicle::performSelfTest;
                            // was vehicle::providePower;
                            do vehicle::providePower;
                            exit vehicle::applyParkingBrake;
                            constraint {vehicle::electricalPower<=500@[W]}
                        }

                        transition initial then off;

                        transition 'off-starting'
                            first off
                            accept VehicleStartSignal
                            if vehicle::brakePedalDepressed
                            do send StartSignal() to controller
                            then starting;

                        transition 'starting-on'
                            first starting
                            accept VehicleOnSignal
                            then on;
                        
                        transition 'on-off'
                            first on
                            accept VehicleOffSignal
                            do send OffSignal() to controller
                            then off;
                    }

                    state healthStates {
                        entry action initial;
                        do vehicle::senseTemperature (out temp);

                        state normal;
                        state maintenance;
                        state degraded;                    

                        transition initial then normal;

                        transition 'normal-maintenance'
                            first normal
                            accept 'at(vehicle::maintenanceTime)'
                            then maintenance;

                        transition 'normal-degraded'
                            first normal
                            accept 'when(temp>vehicle::Tmax)' 
                            do send OverTemp() to controller
                            then degraded;

                        transition 'maintenance-normal'
                            first maintenance
                            accept ReturnToNormal
                            then normal;

                        transition 'degraded-normal'
                            first degraded
                            accept ReturnToNormal
                            then normal;
                    }
            }
                state controllerStates: ControllerStates {
                    //ref controller : VehicleController;
                    state operatingStates {
                        entry action initial; 
                        state off;
                        state on;
                        
                        transition initial then off;
                        transition 'off-on'
                            first off
                            //why not a usage of StartSignal?
                            accept StartSignal
                            then on;
                        transition 'on-off'
                            first on
                            accept OffSignal
                            then off;
                    }
                }  
            }
            package Requirements{
                item marketSurvey;
                dependency from vehicleSpecification to marketSurvey;
                
                requirement vehicleSpecification{
                    subject vehicle:Vehicle;
                    requirement id '1' vehicleMassRequirement: MassRequirement {
                        doc /* The total mass of a vehicle shall be less than or equal to the required mass. */
                        /* Assume total mass includes a full tank of gas*/
                        attribute redefines massRequired=2000 @[kg];
                        attribute redefines massActual = vehicle::mass;
                    }
                    requirement id '2' vehicleFuelEconomyRequirements{
                        doc /* fuel economy requirements group */
                        attribute assumedCargoMass:>ISQ::mass;
                        requirement id '2_1' cityFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 10 @[km / L];
                            assume constraint {assumedCargoMass>=500 @[kg]}
                        }
                        requirement id ' 2_2' highwayFuelEconomyRequirement:FuelEconomyRequirement{
                            redefines requiredFuelEconomy= 12.75 @[km / L];
                            attribute assumedCargoMass:>ISQ::mass;
                            assume constraint {assumedCargoMass>=500 @[kg]}
                        }
                    }
                }
                requirement engineSpecification {
                    subject engine1:Engine;
                    requirement torqueGenerationRequirement : TorqueGenerationRequirement{
                        subject generateTorque = engine1::generateTorque;
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
                            out redefines engineTorque;
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
                    bind engine::fuelCmdPort=fuelCmdPort;
                    connect fuelTank::fuelOutPort to engine::fuelInPort;
                    connect engine::drivePwrPort to transmission::clutchPort;
                    connect transmission::shaftPort_a to driveshaft::shaftPort_b; 
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
                        out redefines engineTorque;
                    }
                    part cylinders:Cylinder_B[4..6];
                }
                part def Cylinder_B:>Cylinder;
                part def Transmission_B:>Transmission{
                    port clutchPort:~DrivePwrPort;
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
    }
    package VehicleAnalysis{
        // recursive import uses double asterist **
        import VehicleConfigurations::VehicleConfiguration_b::**;
        package FuelEconomyAnalysisModel{
            //import NonScalarValues::SampledFunctionValue;
            import Collections::SampledFunction;
              
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
                engine::displacement * idlingFuelConsumptionPerDisplacement
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
                
                // specify the engine_b::displacement
                
                attribute distance = TraveledDistance(scenario);
                attribute tpd_avg = AverageTravelTimePerDistance(scenario);
                attribute bsfc = ComputeBSFC(vehicle_b::engine);
                attribute f_a = BestFuelConsumptionPerDistance(vehicle_b::mass, bsfc, tpd_avg, distance);
                attribute f_b = IdlingFuelConsumptionPerTime(vehicle_b::engine);

                //return attribute calculatedFuelEconomy:KilometersPerLitre=FuelConsumption(f_a, f_b, tpd_avg) ;
                return attribute calculatedFuelEconomy:>distancePerVolume=FuelConsumption(f_a, f_b, tpd_avg);
            }
        }
        package ElectricalPowerAnalysis{
        }
        package ReliabilityAnalyis{
        }
        package VehicleTradeOffAnalysis{
            // the following provides the rationale that ould be contained in the vehicle configuration with the selected engine
            part engine4cyl;
            // the following should be the explained by relationship that refers to the rationale for selecting the engine4cyl
            dependency from engine4cyl to EngineSelectionRationale;
            comment EngineSelectionRationale about engineTradeOffAnalysis 
            /*this is the rationale that refers to the engineTradeOffAnalysis*/
            
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
                        attribute mass redefines mass=180 @[kg];
                        attribute peakHorsePower redefines peakHorsePower = 180;
                        attribute fuelEfficiency redefines fuelEfficiency=.6;
                        attribute cost redefines cost = 1000;                     
                    }
                }
                part vehicle_b_engine6cyl:>vehicleAlternatives{   
                    part engine redefines engine{  
                        part cylinders redefines cylinders [6];
                        attribute mass redefines mass=220;
                        attribute peakHorsePower redefines peakHorsePower = 220;
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
                calc :> objectiveFunction{
                    in part vehicle:>vehicle_b_engine4cyl;
                    return attribute eval:Real=EngineEvaluation_4cyl (vehicle::engine::mass, vehicle::engine::peakHorsePower, vehicle::engine::fuelEfficiency, vehicle::engine::cost); 
                }
                calc :> objectiveFunction{
                    in part vehicle:>vehicle_b_engine6cyl;
                    return attribute eval:Real=EngineEvaluation_6cyl (vehicle::engine::mass, vehicle::engine::peakHorsePower, vehicle::engine::fuelEfficiency, vehicle::engine::cost); 
                }                                                  
                return part selectedVehicle:>vehicle_b;
            }
        }
    }
    package VehicleVerification{
        import VehicleConfigurations::VehicleConfiguration_b::**;
        import VerificationCaseDefinitions::*;
        import VerificationCases1::*;
        // the following is a model library which contains VerfictKind
        import VerificationCases::*;
        package VerificationCaseDefinitions{
            verification def MassTest;
            verification def AccelerationTest;
            verification def ReliabilityTest;
        }
        package VerificationCases1{
            verification massTests:MassTest {
                subject = vehicle_b;
                objective {
                    verify vehicleSpecification::vehicleMassRequirement{
                        redefines massActual=weighVehicle::massMeasured;
                    }
                }
                action weighVehicle (
                    out massMeasured:>ISQ::mass);
                //return :>> verdict = PassIf(vehicleSpecification::vehicleMassRequirement(vehicle_b));
                // the following statement is not intended to be part of the model, but just confirm VerdictKind
                return :>> verdict:VerdictKind = pass;
            }
        }
        package VerificationSystem{
            part massVerificationSystem{
                perform massTests;
                part scale{
                    perform massTests::weighVehicle;
                }
                part operator;
            }
        }
    }
    package VehicleIndividuals{
        individual a:SpatialTemporalReference_1{
            timeslice t0_t2:VehicleRoadContext_1{
                snapshot start redefines start{:>>time=0;}
                snapshot done redefines done {:>>time=2;}
            }
            snapshot t0:VehicleRoadContext_1{
                attribute t0 redefines time=0;
                snapshot t0_r:Road_1{
                    :>>Road::incline =0;
                    :>>Road::friction=.1;
                }
                snapshot t0_v:Vehicle_1{
                    :>>Vehicle::position=0;
                    :>>Vehicle::velocity=0;
                    :>>Vehicle::acceleration=1.96;
                    // .2 g where 1 g = 9.8 meters/sec^2
                    // how do you represent state=on;
                    snapshot t0_fa:FrontAxleAssembly_1{
                        snapshot t0_leftFront:Wheel_1;
                        snapshot t0_rightFront:Wheel_2;
                    }
                }
            }
            snapshot t1:VehicleRoadContext_1{
                attribute t1 redefines time=1;
                snapshot t1_r:Road_1{
                    :>>Road::incline =0;
                    :>>Road::friction=.1;
                }
                snapshot t1_v:Vehicle_1{
                    :>>Vehicle::position=.98;
                    :>>Vehicle::velocity=1.96;
                    :>>Vehicle::acceleration=1.96;
                    // .2 g where 1 g = 9.8 meters/sec^2
                    // how do you represent state=on;
                    snapshot t1_fa:FrontAxleAssembly_1{
                        snapshot t1_leftFront:Wheel_1;
                        snapshot t1_rightFront:Wheel_2;
                    }
                }
            }
            snapshot t2:VehicleRoadContext_1{
                attribute t2 redefines time=2;
                snapshot t2_r:Road_1{
                    :>>Road::incline =0;
                    :>>Road::friction=.1;
                }
                snapshot t2_v:Vehicle_1{
                    :>>Vehicle::position=3.92;
                    :>>Vehicle::velocity=3.92;
                    :>>Vehicle::acceleration=1.96;
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
    package MissionContext{
        // Very crude example to illustrate how a use case can be defined
        /* Define mission context with mission use cases for vehicle_b */
        import VehicleConfigurations::VehicleConfiguration_b::**;
        //import VehicleConfigurations::VehicleConfiguration_b::PartsTree::*;
        //import VehicleConfigurations::VehicleConfiguration_b::ActionTree::*;
        import TransportPassengerScenario::*;
        package ContextDefinitions{
            part def MissionContext;
            part def Driver;
            part def Passenger;
            // replace action def with use case def where vehicle_b is subject and objective is defined
            action def TransportPassenger;
        }
        package TransportPassengerScenario{
            // replace action with use case
            action transportPassenger{
                action unlockDoor_1;
                then action openDoor_1;
                then action enterVehicle_1;
                then action closeDoor_1;
                then accept VehicleOnSignal;
                then fork;
                    then action driveVehicleToDestination;
                    then action providePower;
                then action openDoor_2;
                then action exitVehicle_2;
                then action closeDoor_2;
                then action lockDoor_2;
            }
        }
        part missionContext:ContextDefinitions::MissionContext{
            perform transportPassenger;
            part driver:ContextDefinitions::Driver{
                perform transportPassenger::unlockDoor_1;
                perform transportPassenger::lockDoor_2;
            }
            part passenger:ContextDefinitions::Passenger{
                perform transportPassenger::openDoor_1;
                perform transportPassenger::enterVehicle_1; 
                perform transportPassenger::closeDoor_1;
                perform transportPassenger::openDoor_2;
                perform transportPassenger::exitVehicle_2;
                perform transportPassenger::closeDoor_2;
            }
            part vehicle_b_1:>vehicle_b {
                perform transportPassenger::providePower redefines providePower;
            }
        }
    }
    package VehicleSuperSetModel{
        import VehicleConfigurations::VehicleConfiguration_a::**;
        //import VehicleConfigurations::VehicleConfiguration_a::PartsTree::*;
        //import VehicleConfigurations::VehicleConfiguration_a::ActionTree::*;
        // make vehicle_b a specific vehicle configuration from this product family instead of a subset of vehicle_a
        // this requires that we add all of vehicle_b into the superset model
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
                    (engine==engine::engine4Cyl & transmissionChoices==TransmissionChoices::transmissionManual) ^
                    (engine==engine::engine6Cyl & transmissionChoices==TransmissionChoices::transmissionAutomatic)
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
            filter @Safety || @Security;
        }
        package MandatorySafetyGroup {
            /* Parts that contribute to safety AND are mandatory. */
            import vehicle_b::**;
            filter @Safety && Safety::isMandatory;
        }
    }
    package Views_Viewpoints{
        package ViewpointDefinitions{
            viewpoint def StructureViewpoint;
            viewpoint def BehaviorViewpoint;
        }
        package RenderingDefinitions{
            rendering def Table;
        }
        package ViewDefinitions{
            view def TreeView;
            view def NestedView; 
            view def RelationshipView;
            view def TableView;
            view def PartsTree:>TreeView {
                // include query expression
                filter @Safety;
                view attributes[*]{
                }
            view def PartsInterconnection:>NestedView;
            }
        }
        package Views{
            import ViewpointDefinitions::*;
            import RenderingDefinitions::*;
            import ViewDefinitions::*;
            import VehicleConfigurations::VehicleConfiguration_b::*;
            view vehiclePartsTree_Safety:PartsTree{
                viewpoint treeDiagram:StructureViewpoint;
                expose PartsTree::*;
                rendering partsTreeTable:Table;
            }
        }
    }
}


