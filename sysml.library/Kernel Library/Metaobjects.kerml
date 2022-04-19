/**
 * This package defines Metaclasses and Features that are related to the typing of syntactic and semantic metadata.
 */
package Metaobjects {
	private import Objects::Object;
	private import Objects::objects;
	private import KerML::Element;
	private import KerML::Type;
	
	/**
	 * A Metaobject contains syntactic or semantic information about one or more annotatedElements. 
	 * It is the most general Metaclass. All other Metaclasses must subclassify it directly or indirectly.
	 */
	abstract metaclass Metaobject specializes Object {
		feature redefines self : Metaobject;
		
		/**
		 * The Elements annotated by this Metaobject. This is set automatically when a Metaobject is
		 * instantiated as the value of a MetadataFeature.
		 */
		abstract readonly feature annotatedElement : Element[1..*];
	}
	
	/**
	 * SemanticMetadata is a Metaobject that requires its single annotatedType to directly or indirectly specialize 
	 * a baseType that models the semantics for the annotatedType.
	 */
	abstract metaclass SemanticMetadata specializes Metaobject {
		
		/**
		 * The single annotatedElement of this SemanticMetadata, which must be a Type.
		 */
		abstract readonly feature redefines annotatedElement : Type[1];
		
		/**
		 * The required base Type for the annotatedType.
		 */
		feature baseType : Type[1];
	}
	
	/**
	 * metaobjects is a specialization of objects restricted to type Metadata. It is the most general 
	 * MetadataFeature. All other MetadataFeatures must subset it directly or indirectly.
	 */
	feature metaobjects : Metaobject[0..*] :> objects;
}