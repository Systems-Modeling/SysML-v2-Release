standard library package Metaobjects {
	doc
	/*
	 * This package defines Metaclasses and Features that are related to the typing of syntactic and semantic metadata.
	 */

	private import Objects::Object;
	private import Objects::objects;
	private import KerML::Element;
	private import KerML::Type;
	
	abstract metaclass Metaobject specializes Object {
		doc
		/*
		 * A Metaobject contains syntactic or semantic information about one or more annotatedElements. 
		 * It is the most general Metaclass. All other Metaclasses must subclassify it directly or indirectly.
		 */

		feature redefines self : Metaobject;
		
		abstract feature annotatedElement : Element[1..*] {
			doc
			/*
			 * The Elements annotated by this Metaobject. This is set automatically when a Metaobject is
			 * instantiated as the value of a MetadataFeature.
			 */
		}
	}
	
	abstract metaclass SemanticMetadata specializes Metaobject {
		doc
		/*
		 * SemanticMetadata is a Metaobject that requires its single annotatedType to directly or indirectly specialize 
		 * a baseType that models the semantics for the annotatedType.
		 */
		
		abstract feature redefines annotatedElement : Type[1] {
			doc
			/*
			 * The single annotatedElement of this SemanticMetadata, which must be a Type.
			 */
		}
		
		feature baseType : Type[1] {
			doc
			/*
			 * The required base Type for the annotatedType.
			 */
		}
	}
	
	feature metaobjects : Metaobject[0..*] :> objects {
		/*
		 * metaobjects is a specialization of objects restricted to type Metadata. It is the most general 
		 * MetadataFeature. All other MetadataFeatures must subset it directly or indirectly.
		 */
	}
}