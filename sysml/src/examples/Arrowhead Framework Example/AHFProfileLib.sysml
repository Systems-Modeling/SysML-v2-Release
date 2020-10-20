/** This is the start of a library for Arrowhead Framework
 */

package AHFProfileLib {
	/** Services and (later) functionalities */
	import Base::*;
	import ScalarValues::*;
	import Performances::*;
	
	port def SD{
		/* operations do not seem to be included yet*/
		attribute serviceDefinition:String;
		attribute serviceURL:String;
		attribute intrfce_protocol:String; // which may be "REST" or "MQTT" etc.		 
	}
	
	port def IDD :> SD{
		attribute encoding_kind:String;
	}
	
	/** System of Systems Definition*/	
	part def SoSD {
		part systems:SysD[1..*];
	
		/** System definitions */	
		part def SysD {
			port services: SD[1..*];
			attribute systemname: String;
			attribute address: String;
			attribute portno: Integer;
		}		
	}

	/** System of Systems Detailed Description */	
	part def SoSDD :> SoSD {

		/** System Detailed Description */
		part def SysDD :> SysD{
			action ServiceMethod:Performance[1..*]; //means behaviors
		}
	}
	
	/** Local cloud definition with devices (not covered all the way)*/
	part def LocalCloud :> SoSDD;	

}
