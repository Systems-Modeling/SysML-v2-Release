package ServerSequenceRealization_3 {
	import Transfers::TransferBefore;
	import ServerSequenceModel::*;
	import Configuration::*;
	
	package Configuration {
		
		port def PublicationPort {
			in ref publish : Publish;
		}
		
		port def SubscriptionPort {
			in ref subscribe : Subscribe;
			out ref deliver : Deliver;
		}
		
		interface def PublicationInterface {
			end source : ~PublicationPort;
			end target : PublicationPort;
		}
		
		interface def SubscriptionInterface {
			end source : ~SubscriptionPort;
			end target : SubscriptionPort;
		}
		
		part producer_3[1] {
			attribute someTopic : String;
			private item somePublication;
			
			port publicationPort : ~PublicationPort {
				out ref :>> publish;
			}
			
			perform action producerBehavior {
				action publish {
					out ref request : Publish[1] = Publish(someTopic, somePublication);
				}
			}
			
			stream publish_request from producerBehavior.publish.request to publicationPort.publish;
					
		}
		
		interface publication_interface : PublicationInterface connect producer_3.publicationPort to server_3.publicationPort {
			stream publish_request from publication_interface.source.publish to publication_interface.target.publish;
		}
		
		part server_3[1] {
			port publicationPort : PublicationPort {
				in ref :>> publish;
			}
			port subscriptionPort : SubscriptionPort {
				in ref :>> subscribe;
				out ref :>> deliver;
			}
						
			stream subscribe_request from subscriptionPort.subscribe to serverBehavior.subscribing.request;
			stream publish_request from publicationPort.publish to serverBehavior.publishing.request;
			stream deliver_response from serverBehavior.delivering.response to subscriptionPort.deliver;
			
			perform action serverBehavior {
				
				action subscribing {
					in ref request : Subscribe[1];
					out attribute topic : String[1] = request.topic;
				}
				
				then merge continuePublishing;			
				then action publishing {
					in ref request : Publish[1];
					out attribute topic[1] = request.topic;
					out ref publication[1] = request.publication;
				}
				
				then decide;
					if publishing.topic == subscribing.topic then delivering;
					else continuePublishing;
					
				then action delivering {
					in topic : String[1] = subscribing.topic;
					in publication[1] = publishing.publication;
					out ref response : Deliver = Deliver(publication);
				}
				then continuePublishing;
				
			}
		}
		
		interface subscription_interface : SubscriptionInterface connect consumer_3.subscriptionPort to server_3.subscriptionPort {
			stream subscribe_request from subscription_interface.source.subscribe to subscription_interface.target.subscribe;
			stream deliver_response from subscription_interface.target.deliver to subscription_interface.source.deliver;
		}
		
		part consumer_3[1] {
			attribute myTopic : String;
			
			port subscriptionPort : ~SubscriptionPort {
				out ref :>> subscribe;
				in ref :>> deliver;
			}
			
			stream subscribe_request from consumerBehavior.subscribe.request to subscriptionPort.subscribe;
			stream deliver_response from subscriptionPort.deliver to consumerBehavior.delivery.response;

			perform action consumerBehavior {
				action subscribe {
					out ref request : Subscribe = Subscribe(myTopic);
				}
				then action delivery {
					in ref response : Deliver;
				}
			}
		}
		
	}
	
	part realization_2 : PubSubSequence {
		part :>> producer :> producer_3 {
			event occurrence :>> publish_source_event = producerBehavior.publish;
		}

		part :>> server :> server_3 {
			event occurrence :>> subscribe_target_event = serverBehavior.subscribing;
			event occurrence :>> publish_target_event = serverBehavior.publishing;
			event occurrence :>> deliver_source_event = serverBehavior.delivering;
		}
		
		part :>> consumer :> consumer_3 {
			event occurrence :>> subscribe_source_event = consumerBehavior.subscribe;
			event occurrence :>> deliver_target_event = consumerBehavior.delivery;
		}
		
		stream :>> publish_message from producer.producerBehavior.publish.request to server.serverBehavior.publishing.request {
			perform producer.producerBehavior.publish;
			perform publication_interface.publish_request;
			perform server.serverBehavior.publishing;
		}
		
		stream :>> subscribe_message from consumer.consumerBehavior.subscribe.request to server.serverBehavior.subscribing.request {
			perform consumer.consumerBehavior.subscribe;
			perform subscription_interface.subscribe_request;
			perform server.serverBehavior.subscribing;
		}
		
		stream :>> deliver_message from server.serverBehavior.delivering.response to consumer.consumerBehavior.delivery.response {
			perform server.serverBehavior.delivering;
			perform subscription_interface.deliver_response;
			perform consumer.consumerBehavior.delivery;
		}
	}
}