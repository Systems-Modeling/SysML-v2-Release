package EBikeDefinitions{
	doc 'Package Definitions' /* This Package contains all elements of definition for the model */
	import EnterpriseDefinitionsLibrary::*;
	package UseCaseDefinitions{
		doc 'Use Case Definitions' /* This package contains all use case definitions for the model. In SysML 1.6 they do not exist */		
	}	
	package PartDefinitions{
		doc 'Part Definitions' /* This package contains all part definitions for the model. In SysML 1.6 they were named "Block" */
	}
	package PortDefinitions{
		doc 'Port Definitions' /* This package contains all port definitions for the model. In SysML 1.6 they were named "Interface Block" */
	}
	package ItemDefinition{
		doc 'Item Definition' /* This package contains all item definitions for the model. Items are entities that flow in and out of parts. In SysML 1.6 they were named "Block" */
	}
	package SignalDefinition{
		doc 'Signal Definition' /* This package contains all signal definitions for the model. Signals were also so called in SysML 1.6 */
	}
	package InterfaceDefinition{
		doc 'Interface Definition' /* This package contains all interface definitions for the model. In SysML 1.6 they were modelled with structured associations named "Association Blocks" */
	}
	package AllocationDefinition{
		doc 'Allocation Definition' /* This package contains all allocation definitions for the model. The Allocation definition defines a class of allocation between features of specific types. This alows classes of Allocations that in SysML 1.6 would habe to be created with stereotypes of allocations. */
	}
	package ActionDefinition {
		doc 'Action Definition' /* This package contains all action definitions for the model. In SysML 1.6 they were named "Activity" */
	}
	package StateDefinition {
		doc 'State Definition' /* This package contains all state definitions for the model. In SysML 1.6 they were named "stm" and were represented as a diagram container */
	}
	package RequirementDefinition{
		doc 'Requirement Definition' /* This package contains all requirement definitions for the model. In SysML 1.6 requirement definitions were represented as constrains. A 'Requirement' in SysML V2 is a usage of a requirements definition */
	}
	package AttributeDefinition{
		doc 'Attribute Definition' /* This package contains all attribute definitions for the model. In SysML 1.6 they were modelled as ValueTypes */
	}
	package IndividualDeinition{
		doc 'Individual Definition' /* This package contains all individual definitions and their snapshots for the model. In SysML 1.6 they were modelled as instances but there was no snapshot mechanism */
	}
	package MetadataDefinition{
		doc 'Metadata Definition' /* This package contains all metadata definitions for the model. Metadata anotations are like tags. The definition can set restrictions to the kind of element can be anotated */
	}
}