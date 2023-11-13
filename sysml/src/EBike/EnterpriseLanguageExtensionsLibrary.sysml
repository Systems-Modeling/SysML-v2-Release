library package EnterpriseLanguageExtensionsLibrary{
	doc 'Enterprise Language Extensions' /* This library contains domain-specific extensions for the system model */
	// OOSEM specific language extensions: «configuration item», «data», «document», «file», «hardware», «logical», «node physical», «operator», «procedure», «software», «system of interest»
	package OOSEMSpecificConcepts{
		abstract part def Logical;
		abstract part logical:Logical;
		abstract part def LogicalNode:>Logical;
		abstract part logicalNode:LogicalNode;
		abstract part def Physical;
		abstract part physical:Physical;
		abstract part def PhysicalNode:>Physical;
		abstract part physicalNode:PhysicalNode;
		abstract part def Hardware:>Physical;
		abstract part hardware:Hardware;		
		abstract part def Software:>Physical;
		abstract part software:Software;
		abstract part def Operator;
		abstract part operator:Operator;	
	}
	package OOSEMConcepts{
		import Metaobjects::SemanticMetadata;
		import OOSEMSpecificConcepts::*;
		metadata def logical :> SemanticMetadata{
			:>> baseType = logical meta SysML::Usage;
		}
		metadata def logicalNode :> SemanticMetadata{
			:>> baseType = logicalNode meta SysML::Usage;
		}
		metadata def physical :> SemanticMetadata{
			:>> baseType = physical meta SysML::Usage;
		}
		metadata def physicalNode :> SemanticMetadata{
			:>> baseType = physicalNode meta SysML::Usage;
		}
		metadata def hardware :> SemanticMetadata{
			:>> baseType = hardware meta SysML::Usage;
		}
		metadata def software :> SemanticMetadata{
			:>> baseType = software meta SysML::Usage;
		}
		metadata def operator :> SemanticMetadata{
			:>> baseType = operator meta SysML::Usage;
		}
	}
}