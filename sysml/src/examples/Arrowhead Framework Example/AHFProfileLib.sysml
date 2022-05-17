package AHFProfileLib {
	// Systems and Services and their functionalities
	import ScalarValues::*;
	
	// Design level
	/** Service definition 
	*/
	port def SD{		
		attribute serviceDefinition:String;
		attribute serviceURL:String;
		attribute intrfce_protocol:String; // which may be "REST" or "MQTT" etc.		 
	}	
		
	/** System of Systems Definition */	
	part def SysLocalCloudsDesign {
		// System of Local Clouds 
		part locclouds:LocalCloudDesign[1..*];
	}
	
	part system_of_systems:SysLocalCloudsDD; // defining a top level usage
	
	/** Local Cloud definition */
	part def LocalCloudDesign {
		part systems:SysD[1..*];	
	}

	/** System definitions */	
	part def SysD {
		port services: SD[1..*];
		attribute systemname: String;
		attribute address: String;
		attribute portno: Integer;
	}	

	// Design Description level
	/** Interface Design Description of services */
	port def IDD :> SD{		
		attribute encoding_kind:String;
	}
	
	/** Service Definition Design Description */
	port def SDDD :> SD{		
		port idd:IDD[*]; // nested protocol-specific services
	}	

	/** System of Systems Detailed Description */	
	part def SysLocalCloudsDD :> SysLocalCloudsDesign {
		part :>> locclouds:LocalCloudDD[1..*]; // the descriptions
	}

	part def LocalCloudDD :> LocalCloudDesign {
		part :>> systems:SysDD[1..*];
	}

	/** System Detailed Description */
	part def SysDD :> SysD{
		port :>> services:SDDD;
		action ServiceMethod[1..*]; //means general behaviors
	}
}

package AHFProfileMetadata{
	import Metaobjects::SemanticMetadata;
	import AHFProfileLib::*;

	port global_sd:SD;
	metadata def <service> SDMetadata :> SemanticMetadata{
		// :>> baseType = system_of_systems.locclouds.systems.services as SysML::PortUsage;
		// :>> baseType = SysD::services as SysML::PortUsage;
		:>> baseType = global_sd as SysML::PortUsage;
	}
	
	metadata def <sos> SysLocalCloudsMetadata :> SemanticMetadata{
		:>> baseType = system_of_systems as SysML::PartUsage;
	}
	
	metadata def <cloud> LocalCloudsMetadata :> SemanticMetadata{
		:>> baseType = system_of_systems.locclouds as SysML::PartUsage;
	}
	
	metadata def <system> SysDMetadata :> SemanticMetadata{
		:>> baseType = system_of_systems.locclouds.systems as SysML::PartUsage;
		// :>> baseType = LocalCloudDesign::systems as SysML::PartUsage;
	}

	metadata def <idd> IDDMetadata :> SDMetadata{
		// :>> baseType = system_of_systems.locclouds.systems.services.idd as SysML::PortUsage;
		// :>> baseType = SDDD::idd as SysML::PortUsage;
		:>> global_sddd.idd;
	}

	port global_sddd:SDDD;
	metadata def <servicedd> SDDDMetadata :> SDMetadata {
		// :>> baseType = system_of_systems.locclouds.systems.services as SysML::PortUsage;
		:>> baseType = global_sddd as SysML::PortUsage;
	}
	
	metadata def <clouddd> LocalCloudsDDMetadata :> LocalCloudsMetadata{
		:>> baseType = system_of_systems.locclouds as SysML::PartUsage;
	}
	
	part global_clouddd:LocalCloudDD;
	part global_systemsdd:SysDD;
	metadata def <systemdd> SysDDMetadata :> SysDMetadata{
		// :>> baseType = system_of_systems.locclouds.systems as SysML::PartUsage;
		//:>> baseType = LocalCloudDD::systems as SysML::PartUsage;
		:>> baseType = global_systemsdd as SysML::PartUsage;
	}	
	
}