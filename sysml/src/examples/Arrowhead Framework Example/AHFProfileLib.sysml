package AHFProfileLib {
	// Systems and Services and their functionalities
	import Base::*;
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
		action ServiceMethod[1..*]; //means general behaviors
	}

}
