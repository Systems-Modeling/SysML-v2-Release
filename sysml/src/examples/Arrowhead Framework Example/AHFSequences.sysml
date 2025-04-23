// ** This is the Norwegian use-case for Arrowhead Framework */
package AHFNorwaySequences {
	// Here we show sequences of the Norwegian use-case
	private import AHFProfileLib::*;
	private import AHFCoreLib::*;
	private import AHFNorway::*;
	private import ScalarValues::*;
	
	part AHFN_LocalCloudDD_Seqs = AHFNorway_LocalCloudDD{
		occurrence def APIS_transfer_lifetime {			
			// lifetime orderings 
			ref part tlc = AHFNorway_LocalCloudDD.TellUConsumer{
				event occurrence call_getItems1;
				then event occurrence return_getItems1;
				event occurrence call_getItems2;
				then event occurrence return_getItems2;
			}
			ref part apsp = AHFNorway_LocalCloudDD.APISProducer{
				event occurrence send_publish_returnallitems;
				then event occurrence receive_call_getItems1;
				then event occurrence send_returnallitems1;
				then event occurrence return_getItems_ack1;
				then event occurrence receive_call_getItems2;
				then event occurrence send_returnallitems2;
				then event occurrence return_getItems_ack2;
			}
			ref part mqtts = AHFNorway_LocalCloudDD.MQTTServer{
				event occurrence receive_publish_returnallitems;
				then event occurrence receive_subscribe_returnallitems;
				then event forw1:MQTTforwarding;
				then event forw2:MQTTforwarding;
			}
			ref part apsc = AHFNorway_LocalCloudDD.APISConsumer{
				event occurrence send_subscribe_returnallitems;
				then event forw1:MQTTforwarding;
				then event forw2:MQTTforwarding;
			}
			occurrence forw1:MQTTforwarding;	
			occurrence forw2:MQTTforwarding;	

			message publish_returnallitems of Publish
			from apsp.send_publish_returnallitems to mqtts.receive_publish_returnallitems;
			message subscribe_returnallitems of Subscribe
			from apsc.send_subscribe_returnallitems to mqtts.receive_subscribe_returnallitems;
			message call_getItems1 of CallGiveItems[1]
			from tlc.call_getItems1 to apsp.receive_call_getItems1;	
			bind apsp.send_returnallitems1 = forw1.mq; // binding the sending to the actual gate
			/* How to express that this event sends a Return_AllItems? */
			message returnack1 of ResultGiveItems
			from apsp.return_getItems_ack1 to tlc.return_getItems1;
			message call_getItems2 of CallGiveItems[1]
			from tlc.call_getItems2 to apsp.receive_call_getItems2;
			bind apsp.send_returnallitems2 = forw2.mq; // binding the sending to the actual gate
			message returnack2 of ResultGiveItems
			from apsp.return_getItems_ack2 to tlc.return_getItems2;
		}

		occurrence def MQTTforwarding {
			ref part mqttsf = AHFNorway_LocalCloudDD.MQTTServer{
				event occurrence receive_returnallitems;
				then event occurrence send_returnallitems;
			}

			ref part apscf :> AHFNorway_LocalCloudDD.APISConsumer {
				event occurrence receive_returnallitems;
			}

			in event occurrence mq; // parameter for gate

			message sendallitems1 of Return_AllItems
			from mq to mqttsf.receive_returnallitems;
			message sendallitems2 of Return_AllItems
			from mqttsf.send_returnallitems to apscf.receive_returnallitems;
		}

		
		interface APIS_transfer_interface : Interfaces::Interface connect (
			tlu ::> AHFNorway_LocalCloudDD.TellUConsumer.apisp.APIS_HTTP, // port reference
		    apsph ::> AHFNorway_LocalCloudDD.APISProducer.tellu.APIS_HTTP, 
			apspm ::> AHFNorway_LocalCloudDD.APISProducer.apisc.APIS_MQTT,
			apsc ::> AHFNorway_LocalCloudDD.APISConsumer.apisp.APIS_MQTT,
			mqget ::> AHFNorway_LocalCloudDD.MQTTServer.getTopic,
			mqgive ::> AHFNorway_LocalCloudDD.MQTTServer.giveTopic) {
			
			flow publish_returnallitems of Publish
			from apspm.pub to mqget.APIS_MQTT.pub;
			flow subscribe_returnallitems of Subscribe
			from apsc.subscr to mqgive.APIS_MQTT.subscr;
			flow call_getItems of CallGiveItems[1]
			from tlu.cll to apsph.cll;
			flow returnallitems of Return_AllItems
			from apspm.retall to mqget.APIS_MQTT.retall;
			flow sendallitems of Return_AllItems
			from mqgive.APIS_MQTT.retall to apsc.retall;
			flow returnack of ResultGiveItems
			from apsph.retrn to tlu.retrn;
			
			// Successions on each lifetime
			// tlu
			succession first call_getItems.start
			then returnack.done;	
			// apisp (taking both ports)
			succession first publish_returnallitems.start
			then call_getItems.done;
			succession first call_getItems.done
			then returnallitems.start;
			succession first returnallitems.start
			then returnack.start;
			// MQTTServer
			succession first publish_returnallitems.done
			then subscribe_returnallitems.done;
			succession first subscribe_returnallitems
			then returnallitems.done;
			succession first returnallitems.done
			then sendallitems.start;
			// apisc
			succession first subscribe_returnallitems.start
			then sendallitems.done;
		}
		
	}
}