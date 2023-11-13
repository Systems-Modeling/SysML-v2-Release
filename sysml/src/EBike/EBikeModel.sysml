package 'EBikeSystemModel' {
	doc 'EBike Model' /* This Package contains the system of interest (SoI) */
	import EnterpriseLanguageExtensionsLibrary::OOSEMConcepts::*;
    import EBikeDefinitions::*;
    import EnterpriseViews_ViewpointsDefinitionsLibrary::*;  
    import ISQ::*;
    import EBikeAnalysis::*;
    import EBikeVerification::*;
    import ParametersOfInterestMetadata::mop; 
    package EBikeBlackBoxSpezification {
    	// The BlackBox spezification is made of the system boundary, the ports, interacting items, methods and properites 
    }
    package EBikeLogicalConfiguration{
    	doc 'Ebike Logical Configuration' /* The logical system configuration is defined in this package*/
    	package EBikeTree{
    		doc 'Ebike Tree' /* The logical configuration as a tree of agregated parts is defined here */
    	}
    }
    package EBikeLogicalToPhysiscalAllocation{
    	doc 'Ebike Logical to Physiscal Allocation' /* the allocations (usages) that relate logical and physiscal parts are defned in this package */ 
    }
    package EBikeConfigurations{
    	doc 'EBike Configurations' /* The physical configurations (usages) of the EBike are defined here */
    }
    package EBikeSuperSetModel{
    	doc 'EBike Superset Model' /* all of EBikeFamily is included in the superset model to enable subsetting a specific EBike configuration */
    	package VariationPointDefinitions {
    		doc 'Variation Point Definitions' /* Variation definitions specialise a definition form a design model, representing the type of thing being varied. The variants must then be valid valid usages of this type. */
    	}
    	package EBikePartsTree{
    		doc 'EBike Parts Tree' /* Variation usages */
    		import VariationPointDefinitions::*;
    		abstract part EBikeFamily{
    			// Variation with nested variation is defined here. EBikeFamily is an abstract part that owns all nested variations. //
    		}
    	}
    }
	package EBikeViews{
		doc 'EBike Views' /* This package contains the specific views for the EBike system model. The packages witht the elements to be displayed have to be imported for the rendering of the views */
		import EBikeLogicalConfiguration::*;
		import EBikeConfigurations::*;
    	}
}