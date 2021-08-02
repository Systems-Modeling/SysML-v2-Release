// ** This is the Norwegian use-case for Arrowhead Framework */
package AHFNorway {
	// The use-case is for Productive4.0 and Arrowhead Tools
	// The system is taken from a chemical factory
	// This is focusing on the monitoring of products when delivered
	import AHFProfileLib::*;
	import AHFCoreLib::*;
	import ScalarValues::*;

	/** Service design */		
	port def APISService :> SD{
		attribute :>> serviceDefinition = "APISPullService";
		attribute :>> intrfce_protocol = "{JSON}";
		attribute :>> serviceURL = "pull";
	}

	action def GetAllItems(in key:Real, out itms:String); // Defining empty behavior to be filled by provider
	action def GiveItems(in itms:String, out ack:Boolean); // Defining another empty behavior
	
	/** Service design description with nested protocol-specific ports */	
	port def APIS_DD :> APISService, SDDD {
		port APIS_HTTP:>idd{
			// functionalities 
			out ref action getAllItems:GetAllItems; // referring to empty functionality
			in ref action giveItems:GiveItems; // referring to empty functionality
			
			// the asynch implementation of synchronous remote calls
			out cll:Call;
			in retrn:Result;
		}
		
		port APIS_MQTT :> idd {
			// GetAllItems functionality
			out pub:Publish;
			out retall:Return_AllItems;
			in subscr:Subscribe;
			// GiveItems functionality
			in publ:Publish;
			in retack:Return_Ack;
			out subsr_give:Subscribe_giveItems;
		}
	}
	
	// Asynchronous signals
	attribute def Publish {nametopic:String;}
	attribute def Subscribe{nametopic:String;}
	attribute def Return_AllItems {itms:String;}
	attribute def Subscribe_giveItems{itms:String;}
	attribute def Return_Ack{ack:Boolean;}
	
	// Signals for implementing the remote procedure call by asynch signals
	attribute def Call{ref action act; attribute payload;}
	attribute def Result{attribute ret;}
	
	part def AHFNorway_LocalCloudDD :> ArrowheadCore {	
		part def TellUConsumer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
			port apisp:APIS_DD subsets services;
			
			attribute :>> systemname = "UngerApisClient";
			attribute :>> address = "Unger_network_ip";
			attribute :>> portno = 0;
						
			// We want an operation call to GiveItems, and actually sending the payload
			// Call apisp::APIS_HTTP::giveItems(in allitems: String = "All the items", out ackback:Boolean);
			
			state TellUbehavior{
				entry send Call(apisp.APIS_HTTP.giveItems, "All the items") to apisp.APIS_HTTP;
				then Wait;
				state Wait;
					accept rs:Result
					// Here do whatever about the result rs.ret 
				then done;
			}
						
		}
		
		part def APISProducer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery :> services; // communicating with ServiceRegistry
			port tellu:~APIS_DD :> services; // providing the APISService
			port apisc:APIS_DD :> services; // talking to APISConsumer
			
			:>> systemname = "PrediktorApisServer";
			:>> address = "Prediktor_network_ip";
			:>> portno = 6565;
			attribute x:Boolean;
			
			// Defining the method to correspond to GiveItems
			action def REST_giveItems :> GiveItems (in itms:String, out ack:Boolean, in apisc:APIS_DD)
			 {  /* Forward itms and return an ack */
			 	first start;
			 	then send Return_AllItems(itms) to apisc.APIS_MQTT;
			 	success = true;
			 	bind ack = success;
			 }
			action rest_giveItems:REST_giveItems :> ServiceMethod {
				in :>> apisc = APISProducer::apisc;
			}
			
			state APISPbehavior{
				entry send Publish("Return_AllItems") to apisc.APIS_MQTT;
				then WaitOnData;
				// initialize the asynchronous communication with MQTT
				state WaitOnData;
					accept cl:Call via tellu.APIS_HTTP.cll
					do action {
						first start;
						then action rest_giveItems(in itms=cl.payload,out ack=x);
						then send Result(x) to tellu.APIS_HTTP;
					}
				then done;
				
			}
		}
		
		part def APISConsumer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery :> services; // communicating with ServiceRegistry
			port apisp:~APIS_DD :> services;
			:>> systemname = "TellUClient";
			:>> address = "Prediktor_network_ip";
			:>> portno = 1;
			
			// Now sending signal to the remote behavior through the port functionality
			state MQTT_APISP {
				entry send Subscribe("Return_AllItems") to apisp.APIS_MQTT; 
				then Idle;		
				state Idle;
					accept Return_AllItems via apisp.APIS_MQTT.retall
					// Get the stuff and do something with them
					then Idle;
			}
		}

 		part apisc:APISConsumer :> systems;
 		
 		part apisp:APISProducer :> systems;

 		part telluc:TellUConsumer :> systems;
 		
 		part MQTTServer {
 			port getTopic:~APIS_DD;
 			port giveTopic:APIS_DD;
 			
 			state Serve{				
 				entry;
 				then Publ;
 				state Publ;
 					accept pub:Publish via getTopic.APIS_MQTT.pub
 					// store information about who will provide "Publish::nametopic"
 				then Subsr;
 				
 				state Subsr;
 					accept Subscribe via giveTopic.APIS_MQTT.subscr
 					// store information about who want to receive "Subscribe::nametopic"
 				then Idle;
 				
 				state Idle;
 					accept retrnall:Return_AllItems via getTopic.APIS_MQTT.retall
 					do send retrnall to giveTopic.APIS_MQTT
 				then Idle;
 			} 			
 		}
 				
 		connect apisp.apisc to MQTTServer.getTopic; 
 		connect MQTTServer.giveTopic to apisc.apisp; 
		
 		connect telluc.apisp to apisp.tellu; 
 		
 		// Then we need to connect the application systems to the mandatory systems
 		connect apisp.serviceDiscovery to service_registry.serviceDiscovery;
 		connect telluc.serviceDiscovery to service_registry.serviceDiscovery;
 		connect apisc.serviceDiscovery to service_registry.serviceDiscovery;
 		
 		// Same procedure for the other mandatory services
		
	}
	
}