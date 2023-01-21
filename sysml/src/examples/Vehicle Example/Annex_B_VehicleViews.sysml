package Annex_B_VehicleViews{
    import SimpleVehicleModel::*;
    
    package ModelOrganization{
        package SimpleVehicleModel_{
            import ISQ::*;
            package Definitions{
                package PartDefinitions{
                }
                package PortDefinitions{
                }
                package ItemDefinitions{
                }
                package InterfaceDefinitions{
                }
                package ActionDefinitions{
                }
                package RequirementDefinitions{
                }
                package AttributeDefinitions{
                }
            }
            package VehicleConfigurations{
                package VehicleConfiguration_a;
                package VehicleConfiguration_b{
                    package PartsTree;
                    package ActionTree;
                    package Requirements;
                }
            }
            package VehicleAnalyiss{}
            package VehicleVerification{}
            package Individuals{}
            package MissionContext{}
            package VehicleSuperSetModel{}
            package View_Viewpoints{}
        }
    }
    package VehiclePartDef{
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
            port statusPort:StatusPort;
            port pwrCmdPort:PwrCmdPort;
            port vehicleToRoadPort:VehicleToRoadPort;
            perform action providePower;
            perform action provideBraking;
            perform action controlDirection;
            perform action performSelfTest;
            perform action applyParkingBrake;
            perform action senseTemperature;
            exhibit state vehicleStates parallel {
            }
        }
        port def IgnitionCmdPort;
        port def StatusPort;
        port def PwrCmdPort;
        port def VehicleToRoadPort;
    }
    package FuelTankPartDef{
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

        port def FuelPort{
            out item fuel:Fuel;
        }
        item def Fuel{
            attribute fuelMass:>ISQ::mass;
        }
        enum def FuelKind {gas;diesel;}
    }
    package FrontAxlePartDef{
        package PartDefinitions{
            part def Axle{
    			attribute mass:>ISQ::mass;
			}
            part def FrontAxle:>Axle{
                attribute steeringAngle:>ISQ::planeAngle;
            }
        }
    }
    package DefinitionElements{
        action def ProvidePower {
            in item fuelCmd:FuelCmd;
            out wheelToRoadTorque:Torque [2];
        }
        //port def FuelCmdPort:>PwrCmdPort{
           // in item fuelCmd:FuelCmd;
        //}
        item def FuelCmd{
            attribute throttleLevel:Real;
        }
        port def FuelPort{
            out item fuel:Fuel;
        }
        item def Fuel{
            attribute fuelMass:>ISQ::mass;
        }
        interface def FuelInterface {
            end fuelOutPort:FuelPort;
            end fuelInPort:~FuelPort;
            flow of Fuel from fuelOutPort.fuel to fuelInPort.fuel;
        }
        enum def FuelKind {gas;diesel;}      
    }
    package DefinitionElements_original{
        action def ProvidePower {
            in item pwrCmd:PwrCmd;
            out wheelToRoadTorque:Torque[2];
        }
        port def PwrCmdPort{
            in item pwrCmd:PwrCmd;
        }
        port def FuelCmdPort:>PwrCmdPort{
            in item fuelCmd:FuelCmd redefines pwrCmd;
        }
        port def FuelPort{
            out item fuel:Fuel;
        }
        item def PwrCmd{
            attribute throttleLevel:Real;
        }
        item def FuelCmd:>PwrCmd;
        item def Fuel{
            attribute fuelMass:>ISQ::mass;
        }

        alias Torque for ISQ::TorqueValue;
    }
    package VehiclePart {
        import VehiclePartDef::Vehicle::*;
        import FuelTankPartDef::FuelTank::*;
        part vehicle_b : Vehicle{
            attribute mass redefines mass=dryMass+cargoMass+fuelTank.fuel.fuelMass;
            attribute dryMass redefines dryMass=sum(partMasses);
            attribute redefines cargoMass default 0 [kg];
            attribute partMasses; // collection of part masses
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
            part fuelTank:FuelTank{
                attribute redefines mass=75[kg];
                ref item redefines fuel{
                    attribute redefines fuelMass=60[kg];
                }
                attribute redefines fuelMassMax=60 [kg];
            }
        }
        package ActionTree{
            action providePower:ProvidePower;
            action performSelfTest: PerformSelfTest;
            action applyParkingBrake: ApplyParkingBrake;
            action senseTemperature: SenseTemperature;
        }      
    }
    package VehiclePartDecomposition {
        import VehiclePartDef::Vehicle::*;
        import FuelTankPartDef::FuelTank::*;
        part vehicle_b : Vehicle{

            part fuelTank:FuelTank;
            part starterMotor:StarterMotor;
            part engine:Engine;
            part transmission:Transmission;
            part driveshaft:Driveshaft;
            part rearAxleAssembly{
                part differential:Differential;
                part rearAxle:Axle;
                part rearWheel1:Wheel;
                part rearWheel2:Wheel;
            }
            part frontAxleAssembly{
                part frontAxle:FrontAxle;
                part frontWheels:Wheel[2];
            }
            part vehicleSoftware:VehicleSoftware;
        }     
    }
    package Engine4Cyl_Variant{
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
    }
    package VehiclePartsInterconnection{
            part vehicle_b : Vehicle{
                port fuelCmdPort: FuelCmdPort redefines pwrCmdPort {
                    in item redefines fuelCmd;
                }
                port setSpeedPort:~SetSpeedPort;
                port vehicleToRoadPort redefines vehicleToRoadPort{
                    port wheelToRoadPort1:WheelToRoadPort;
                    port wheelToRoadPort2:WheelToRoadPort;
                }
                part fuelTank:FuelTank;
                part frontAxleAssembly:AxleAssembly{
                    port shaftPort_d:ShaftPort_d;
                    part frontAxle:FrontAxle;
                    part frontWheels:Wheel[2];
                }
                part rearAxleAssembly:AxleAssembly{
                    port shaftPort_d:ShaftPort_d;
                    part rearWheel1:Wheel{
                        port wheelToRoadPort:WheelToRoadPort;
                        port lugNutCompositePort :>> lugNutCompositePort{
                            port lugNutPort :>> lugNutPort [5];
                        }
                    }
                    part rearWheel2:Wheel{
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

                    //connections
                    bind shaftPort_d=differential.shaftPort_d;
                    connect differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort;
                    connect differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort;

                    interface wheelToleftHalAxleInterface:WheelHubInterface 
                        connect rearWheel1.lugNutCompositePort [1] to rearAxle.leftHalfAxle.shankCompositePort [1];
                    interface wheelTorightHalAxleInterface:WheelHubInterface
                        connect rearWheel2.lugNutCompositePort [1] to rearAxle.rightHalfAxle.shankCompositePort [1];
                }
                part starterMotor:StarterMotor;
                part engine:Engine;
                part transmission:Transmission{
                    port shaftPort_a:ShaftPort_a;
                }
                part driveshaft:Driveshaft{
                    port shaftPort_b:ShaftPort_b;
                    port shaftPort_c:ShaftPort_c;
                }
                part vehicleSoftware:VehicleSoftware{
                    part vehicleController: VehicleController {
                        part cruiseController:CruiseController;
                    }
                }

                //connections
                bind engine.fuelCmdPort=fuelCmdPort;
                interface engineToTransmissionInterface:EngineToTransmissionInterface
                    connect engine.drivePwrPort to transmission.clutchPort;
                interface fuelInterface:FuelInterface
                    connect fuelTank.fuelOutPort to engine.fuelInPort;
                bind engine.ignitionCmdPort=ignitionCmdPort;
                connect starterMotor.gearPort to engine.flyWheelPort;
                connect vehicleSoftware.vehicleController.controlPort to engine.engineControlPort;
                bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
                connect vehicleSoftware.vehicleController.cruiseController.cruiseControlPort to engine.engineControlPort;
                connect transmission.shaftPort_a to driveshaft.shaftPort_b; 
                connect driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d;
                bind rearAxleAssembly.rearWheel1.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort1;
                bind rearAxleAssembly.rearWheel2.wheelToRoadPort=vehicleToRoadPort.wheelToRoadPort2;
            }
    }
    package ProvidePowerActionDecomposition{
        package ActionTree{
            action providePower:ProvidePower{
                action generateTorque:GenerateTorque;
                action amplifyTorque:AmplifyTorque;
                action transferTorque:TransferTorque;
                action distributeTorque:DistributeTorque;
            }
        }  
    }
    package ProvidePowerActionFlow{
        package ActionTree{
            action providePower:ProvidePower{
                in item fuelCmd:FuelCmd redefines pwrCmd;
                out wheelToRoadTorque redefines wheelToRoadTorque [2] = distributeTorque.wheelToRoadTorque;
                action generateTorque:GenerateTorque {
                    in item :>> fuelCmd = providePower.fuelCmd;
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
        }  
    }
    package TransportPassengerActionFlow{
        import MissionContext::ContextDefinitions::TransportPassenger;

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
    package VehicleStates{
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
        port def IgnitionCmdPort;
        port def PwrCmdPort;
        port def VehicleToRoadPort;
        part def VehicleController;
    }
        package Sequence{
            part def Driver{
                port p1;
                port p2;
            }
            /*
            part def Vehicle{
                port ignitiaonCmdPort;
                port statusPort;
            }
            */
            item def IgnitionCmd;
            item def EngineStatus;

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
    package MassRequirementDefinition{
        requirement def MassRequirement{
            doc /*The actual mass shall be less than the required mass*/
            attribute massRequired:>ISQ::mass;
            attribute massActual:>ISQ::mass;
            require constraint {massActual<=massRequired}
        }
    }
    package VehicleRequirements{
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
                attribute redefines massActual = vehicle.dryMass + fuelMassActual;
                attribute fuelMassActual:>ISQ::mass;
                attribute fuelMassMax:>ISQ::mass = 60 [kg];
                assume constraint {fuelMassActual==fuelMassMax}
            }

            //allocate vehicleMassRequirement to PartsTree::vehicle_b.mass;

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
        }
        // the engine mass requirement is derived from the vehicle mass requirement
        #derivation connection {
            end #original ::> vehicleSpecification.vehicleMassRequirement;
            end #derive ::> engineSpecification.engineMassRequirement;
            //end #derive ::> other mass requirements;
        }
    }
    package FuelEconomyAnalysis{
        import VehicleConfigurations::VehicleConfiguration_b::**;
        import SampledFunctions::SampledFunction;

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
    package VehicleMassVerificationTest{
        import VehicleConfigurations::VehicleConfiguration_b::**;
        import VerificationCases1::*;
        import VerificationSystem::*;
        // the following is a model library which contains VerdictKind
        import VerificationCases::*;
        verification def MassTest;
        package VerificationCases1{
            verification massTests:MassTest {
                subject vehicle_uut :> vehicle_b;
                actor vehicleVerificationSubSystem_1 = verificationContext.massVerificationSystem;
                objective {
                    verify vehicleSpecification.vehicleMassRequirement{
                        redefines massActual=weighVehicle.massMeasured;
                    }
                }
                // @ is shorthand for metadata
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
    package VehicleSafetyView_Viewpoint{
        package PartsTree{
        }
        package ViewpointDefinitions{
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
            view def PartsTreeView:>TreeView {
                filter @SysML::PartUsage;
            }
        }
        package VehicleSafetyView{
	        import ViewpointDefinitions::*;
	        import ViewDefinitions::*;
            view vehiclePartsTree_Safety:PartsTreeView{
                satisfy requirement sv:SafetyViewpoint;
                expose PartsTree::**;
                filter @Safety;
            }
        }
    }
    package VehicleFamily{
        import VariationPointDefinitions::*;
        package VariationPointDefinitions {
            variation part def TransmissionChoices:>Transmission {
                variant part transmissionAutomatic:TransmissionAutomatic;
                variant part transmissionManual:TransmissionManual;
            }
        }
        package VehicleFamilyPartsTree{
            abstract part vehicleFamily {
                // nested variation
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
    package VehicleIndividuals_Snapshots{
        import IndividualDefinitions::*;
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
        individual a:VehicleRoadContext_1{
            timeslice t0_t2_a{
                snapshot t0_a{             
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
}