/** This is the Norwegian use-case for Arrowhead Framework */
package AHFNorway {
	// The use-case is for Productive4.0 and Arrowhead Tools
	// The system is taken from a chemical factory
	// This is focusing on the monitoring of products when delivered
	import AHFProfileLib::*;
	import AHFCoreLib::*;
	import ScalarValues::*;
		
	port def APISService :> SD{
		attribute :>> serviceDefinition = "APISPullService";
		attribute :>> intrfce_protocol = "{JSON}";
		attribute :>> serviceURL = "pull";
	}

	action def GetAllItems(in key:Real, out itms:String); // Defining empty behavior to be filled by provider
	action def GiveItems(in itms:String, out ack:Boolean); // Defining another empty behavior
	
	port def APIS_REST :> APISService{
		// functionalities 
		out ref action getAllItems:GetAllItems; // referring to empty functionality
		in ref action giveItems:GiveItems; // referring to empty functionality again
	}
	
	port def APIS_MQTT :> APISService{
		// GetAllItems functionality
		out pub:Publish;
		out retall:Return_AllItems;
		in subscr:Subscribe;
		// GiveItems functionality
		in publ:Publish;
		in retack:Return_Ack;
		out subsr_give:Subscribe_giveItems;
	}
	
	attribute def Publish {nametopic:String;}
	attribute def Subscribe{nametopic:String;}
	attribute def Return_AllItems {itms:String;}
	attribute def Subscribe_giveItems{itms:String;}
	attribute def Return_Ack{ack:Boolean;}
	
	part def AHFNorway_SoSD :> ArrowheadCore {	
		part def TellUConsumer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
			port apisp:APIS_REST subsets services
			{	/** The body here is to get the contexts and types right, may be changed later */
				in ref action :>> giveItems;
				out ref action :>> getAllItems;
			}
			
			attribute :>> systemname = "UngerApisClient";
			attribute :>> address = "Unger_network_ip";
			attribute :>> portno = 0;
						
			// operation call to GiveItems, while actually sending the payload
			perform apisp::giveItems(in allitems: String = "All the items", out ackback:Boolean);			
		}
		
		part def APISProducer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
			port tellu:~APIS_REST subsets services // providing the APISService
			{	/** The body here is to get the contexts and types right, may be changed later */
				out ref action :>> giveItems;
				in ref action :>> getAllItems;
			}
			port apisc:APIS_MQTT subsets services; // talking to APISConsumer
			
			:>> systemname = "PrediktorApisServer";
			:>> address = "Prediktor_network_ip";
			:>> portno = 6565;
			
			// Defining the method to correspond to GiveItems
			action def REST_giveItems :> GiveItems (in itms:String, out ack:Boolean)
			 { /* Forward itms and return an ack */
			 	first start;
			 	then send Return_AllItems(itms) to apisc;
			 	success = true;
			 	bind ack = success;
			 }
			private action rest_giveItems:REST_giveItems :> ServiceMethod();
			bind tellu::giveItems = rest_giveItems; // binding the functionality to the method
			
			// initialize the asynchronous communication with MQTT
			state MQTTPublish {
				entry send Publish("Return_AllItems") to apisc;
				then done;
			}
		}
		
		part def APISConsumer :> SysDD{
			port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
			port apisp:~APIS_MQTT subsets services;
			:>> systemname = "TellUClient";
			:>> address = "Prediktor_network_ip";
			:>> portno = 1;
			
			// Now sending signal to the remote behavior through the port functionality
			state MQTT_APISP {
				entry send Subscribe("Return_AllItems") to apisp;
				then Idle;		
				state Idle;
					accept Return_AllItems
					// Get the items and do something with them
					then Idle;
			}
		}

 		part apisc:APISConsumer subsets systems
 		{	port :>> apisp;
 			port :>> serviceDiscovery;
 		}
 		part apisp:APISProducer subsets systems
 		{	port :>> apisc;
 			port :>> tellu;
 			port :>> serviceDiscovery;
 		}
 		part telluc:TellUConsumer subsets systems
 		{	port :>> apisp;
 			port :>> serviceDiscovery;
 		}
 		
 		part MQTTServer {
 			port getTopic:~APIS_MQTT;
 			port giveTopic:APIS_MQTT;
 			
 			state Serve{				
 				entry;
 				then Publ;
 				state Publ;
 					accept pub:Publish
 					// store information about who will provide "Publish::nametopic"
 				then Subsr;
 				
 				state Subsr;
 					accept Subscribe
 					// store information about who want to receive "Subscribe::nametopic"
 				then Idle;
 				
 				state Idle;
 					accept Return_AllItems // going through getTopic::retall
 					do send getTopic::retall to giveTopic // forwarding it through giveTopic::retall
 				then Idle;
 			} 			
 		}
 		
 		part :>> service_registry {
 			port :>> serviceDiscovery;
 		}
 		
 		connect apisp::apisc to MQTTServer::getTopic; 
 		connect MQTTServer::giveTopic to apisc::apisp; 
		
 		connect telluc::apisp to apisp::tellu; 
 		
 		// Then we need to connect the application systems to the mandatory systems
 		connect apisp::serviceDiscovery to service_registry::serviceDiscovery;
 		connect telluc::serviceDiscovery to service_registry::serviceDiscovery;
 		connect apisc::serviceDiscovery to service_registry::serviceDiscovery;
 		
 		// Same procedure for the other mandatory services
		
	}
	
}