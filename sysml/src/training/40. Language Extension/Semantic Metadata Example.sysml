package 'Semantic Metadata Example' {
	import 'Model Library Example'::*;
	import Metaobjects::SemanticMetadata;

	metadata def situation :> SemanticMetadata {
		:>> baseType = situations as SysML::Usage;
	}
	
	metadata def cause :> SemanticMetadata {
		:>> baseType = causes as SysML::Usage;
	}
	
	metadata def failure :> SemanticMetadata {
		:>> baseType = failures as SysML::Usage;
	}
	
	metadata def causation :> SemanticMetadata {
		:>> baseType = causations as SysML::Usage;
	}
	
	metadata def scenario :> SemanticMetadata {
		:>> baseType = scenarios as SysML::Usage;
	}
	
}