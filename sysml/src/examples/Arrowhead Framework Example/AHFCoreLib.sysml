/** Mandatory Services and Systems */
package AHFCoreLib {
	import AHFProfileLib::*;
	import ScalarValues::*;
	
	port def ServiceDiscovery :> SD{
		// The functionalities as Requests (Operations) cannot be defined yet
		// We could consider using flows to designate the functionalities
	}
	
	port def ServiceDiscoveryDD :> ServiceDiscovery, SDDD{
		port ServiceDiscovery_HTTP :> idd{// nested port for HTTP protocol
			/* here we refer the functionalities like operation Register etc. */
		} 
	}
		
	port def Authorisation :> SD{
		attribute publickey:String; // just as examples
	}

	port def AuthorisationDD :> Authorisation, SDDD{
		port Authorisation_HTTP :> idd; // nested port for HTTP protocol
	}
	
	part def ArrowheadCore :> LocalCloudDD{
		/** Design Level */
		/* First the system definitions (SysD) of core systems */
		part def ServiceRegistryDesign :> SysD {
			port serviceDiscovery:ServiceDiscovery :> services;
		}
		
		part def AuthorizationDesign :> SysD {
			port authorisation:Authorisation :> services;
			attribute protocol:String = "HTTP";
		}
		
		part def OrchestrationDesign :> SysD; // just indicated for now

		part service_registry:ServiceRegistryDesign :> systems;
		part authorization:AuthorizationDesign :> systems;
		part orchestration:OrchestrationDesign :> systems;
		
		/** Design Description level */		
		part def ServiceRegistryDD :> ServiceRegistryDesign{
			port :>> serviceDiscovery:ServiceDiscoveryDD;
		}

		part def Authorization_DD :> AuthorizationDesign, SysDD{
			port :>> authorisation:AuthorisationDD;
			action Echo_behavior :> ServiceMethod;
		}
	}
}
