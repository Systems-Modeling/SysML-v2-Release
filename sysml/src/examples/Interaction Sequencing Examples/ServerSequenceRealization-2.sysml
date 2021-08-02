package ServerSequenceRealization_2 {
	import Transfers::TransferBefore;
	import ServerSequenceModel::*;
	import Configuration::*;
	
	package Configuration {
		
		port def PublicationPort;
		
		port def SubscriptionPort;
		
		part producer_2[1] {
			attribute someTopic : String;
			private item somePublication;
			
			port publicationPort : ~PublicationPort;
			
			perform action producerBehavior {
				action publish send Publish(someTopic, somePublication) to publicationPort;
			}
			
		}
		
		interface producer_2.publicationPort to server_2.publicationPort {
			bind source::incomingTransfers = target::incomingTransfers;
		}
		
		part server_2[1] {
			port publicationPort : PublicationPort;
			port subscriptionPort : SubscriptionPort;
			
			exhibit state serverBehavior {
				entry; then waitForSubscription;
				
				state waitForSubscription;
				transition subscribing
					first waitForSubscription
					accept sub : Subscribe via subscriptionPort
					then waitForPublication;
					
				state waitForPublication;
				transition delivering
					first waitForPublication
					accept pub : Publish via publicationPort
					if pub.topic == subscribing.sub.topic
					do send Deliver(pub.publication) to subscribing.sub.subscriber
					then waitForPublication;
			}
		}
		
		interface consumer_2.subscriptionPort to server_2.subscriptionPort {
			bind source::incomingTransfers = target::incomingTransfers;
		}
		
		part consumer_2[1] {
			attribute myTopic : String;
			
			port subscriptionPort : ~SubscriptionPort;
			
			perform action consumerBehavior {
				action subscribe send Subscribe(myTopic, consumer_2) to server_2;
				then action delivery accept Deliver via consumer_2;
			}
		}
		
	}
	
	part realization_2 : PubSubSequence {
		part :>> producer :> producer_2 {
			event occurrence :>> publish_source_event = producerBehavior.publish;
		}

		part :>> server :> server_2 {
			event occurrence :>> subscribe_target_event = serverBehavior.subscribing.accepter;
			event occurrence :>> publish_target_event = serverBehavior.delivering.accepter;
			event occurrence :>> deliver_source_event = serverBehavior.delivering.effect;
		}
		
		part :>> consumer :> consumer_2 {
			event occurrence :>> subscribe_source_event = consumerBehavior.subscribe;
			event occurrence :>> deliver_target_event = consumerBehavior.delivery;
		}
		
		message :>> publish_message = producer_2.producerBehavior.publish.outgoingTransfer;
		message :>> subscribe_message = consumer_2.consumerBehavior.subscribe.outgoingTransfer;
		message :>> deliver_message = server_2.serverBehavior.delivering.effect.outgoingTransfer;
	}
}