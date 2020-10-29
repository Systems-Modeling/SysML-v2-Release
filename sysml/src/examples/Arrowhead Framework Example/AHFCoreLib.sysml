/** Mandatory Services and Systems */
package AHFCoreLib {
	import AHFProfileLib::*;
	import ScalarValues::*;
	
	port def ServiceDiscovery :> SD{
		// The functionalities as Requests (Operations) cannot be defined yet
		// We could consider using flows to designate the functionalities
	}
		
	port def Authorisation :> SD{
		attribute publickey:String; // just as examples
	}
	
	part def ArrowheadCore :> LocalCloud{
		/* First the system definitions (SysD) of core systems */
		part def ServiceRegistry :> SysD {
			port serviceDiscovery:ServiceDiscovery subsets services;
		}
		
		part def Authorization :> SysD {
			port authorisation:Authorisation subsets services;
		}
		
		part def Orchestration :> SysD; // just indicated for now
		
		part service_registry:ServiceRegistry subsets systems;
		part authorization:Authorization subsets systems;
		part orchestration:Orchestration subsets systems;
		
		/* Then we include an example of SysDD specializations wrt protocol */
		part def Authorization_HTTP :> Authorization, SysDD{
			action Echo_behavior subsets ServiceMethod;
		}
		
		port def Authorisation_HTTP :> Authorisation, IDD{
			protocol:String = "HTTP";
		}
	}
}
