// ** This is the Norwegian use-case for Arrowhead Framework */
package AHFNorwaySequences {
	// Here we show sequences of the Norwegian use-case
	import AHFProfileLib::*;
	import AHFCoreLib::*;
	import AHFNorway::*;
	import ScalarValues::*;
	
	part def AHFN_LocalCloudDD_Seqs :> AHFNorway_LocalCloudDD{
		occurrence APIS_transfer_lifetime {			
			// lifetime orderings 
			part tlc :> telluc{
				event occurrence call_getItems;
				then event occurrence return_getItems;
			}
			part apsp :> apisp{
				event occurrence send_publish_returnallitems;
				then event occurrence receive_call_getItems;
				then event occurrence send_returnallitems;
				then event occurrence return_getItems_ack;
			}
			part mqtts :> MQTTServer{
				event occurrence receive_publish_returnallitems;
				then event occurrence receive_subscribe_returnallitems;
				then event occurrence receive_returnallitems;
				then event occurrence send_returnallitems;
			}
			part apsc :> apisc {
				event occurrence send_subscribe_returnallitems;
				then event occurrence receive_returnallitems;
			}
	
			message publish_returnallitems of Publish
			from apsp.send_publish_returnallitems to mqtts.receive_publish_returnallitems;
			message subscribe_returnallitems of Subscribe
			from apsc.send_subscribe_returnallitems to mqtts.receive_subscribe_returnallitems;
			message call_getItems of Call[1]
			from tlc.call_getItems to apsp.receive_call_getItems;
			message returnallitems of Return_AllItems
			from apsp.send_returnallitems to mqtts.receive_returnallitems;
			message sendallitems of Return_AllItems
			from mqtts.send_returnallitems to apsc.receive_returnallitems;
			message returnack of Result
			from apsp.return_getItems_ack to tlc.return_getItems;
		}
		
		interface APIS_transfer_interface connect ( 
			tlu :> telluc.apisp.APIS_HTTP, // port reference
		    apsph :> apisp.tellu.APIS_HTTP, 
			apspm :> apisp.apisc.APIS_MQTT,
			apsc :> apisc.apisp.APIS_MQTT,
			mqget :> MQTTServer.getTopic,
			mqgive :> MQTTServer.giveTopic) {
			
			message publish_returnallitems of Publish
			from apspm to mqget;
			message subscribe_returnallitems of Subscribe
			from apsc to mqgive;
			message call_getItems of Call[1]
			from tlu to apsph;
			message returnallitems of Return_AllItems
			from apspm to mqget;
			message sendallitems of Return_AllItems
			from mqgive to apsc;
			message returnack of Result
			from apsph to tlu;
			
			// Successions on each lifetime
			// tlu
			succession call_getItems.startShot 
			then returnack.endShot;	
			// apisp (taking both ports)
			succession publish_returnallitems.startShot
			then call_getItems.endShot;
			succession call_getItems.endShot
			then returnallitems.startShot;
			succession returnallitems.startShot
			then returnack.startShot;
			// MQTTServer
			succession publish_returnallitems.endShot
			then subscribe_returnallitems.endShot;
			succession subscribe_returnallitems
			then returnallitems.endShot;
			succession returnallitems.endShot
			then sendallitems.startShot;
			// apisc
			succession subscribe_returnallitems.startShot
			then sendallitems.endShot;
		}
		
	}
}