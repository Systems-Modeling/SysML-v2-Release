package KerML {
	
	struct Element;
	struct Relationship :> Element;
	
	struct AnnotatingElement :> Element;
	struct Annotation :> Relationship;
	struct Comment :> AnnotatingElement;
	struct Dcoumentation :> Annotation;
	struct TextualRepresentation :> AnnotatingElement;
	
	struct Import :> Relationship;
	struct Membership :> Relationship;
	struct Namespace :> Element;
	
	struct Type :> Namespace;
	struct Multiplicity :> Feature;
	struct FeatureMembership :> Membership, TypeFeaturing;
	struct EndFeatureMembersip :> FeatureMembership;
	struct Generalization :> Relationship;
	struct Conjugation :> Relationship;
	
	struct Classifier :> Type;
	struct Superclassing :> Generalization;
	
	struct Feature :> Type;
	struct Subsetting :> Generalization;
	struct Redefinition :> Subsetting;
	struct FeatureTyping :> Generalization;
	struct TypeFeaturing :> Relationship;
	
	struct Class :> Classifier;
	struct DataType :> Classifier;
	
	struct Structure :> Class;
	
	struct Association :> Classifier, Relationship;
	struct AssociationStructure :> Association, Structure;
	
	struct Connector :> Feature, Relationship;
	struct BindingConnector :> Connector;
	struct Succession :> Connector;
	
	struct Behavior :> Class;
	struct Step :> Feature;
	
	struct Function :> Behavior;
	struct Predicate :> Function;
	struct Expression :> Step;
	struct BooleanExpression :> Expression;
	struct Invariant :> BooleanExpression;
	
	struct FeatureReferenceExpression :> Expression;
	struct InvocationExpression :> Expression;
	struct LiteralExpression :> Expression;
	struct LiteralInteger :> LiteralExpression;
	struct LiteralReal :> LiteralExpression;
	struct LiteralBoolean :> LiteralExpression;
	struct LiteralString :> LiteralExpression;
	struct LiteralUnbounded :> LiteralExpression;
	struct NullExpression :> LiteralExpression;
	
	struct Interaction :> Behavior, Association;
	struct ItemFlow :> Step, Connector;
	struct SuccessionItemFlow :> ItemFlow, Succession;
	
	struct FeatureValue :> Membership;
	
	struct MultiplicityRange :> Multiplicity;
	
	struct AnnotatingFeature :> Feature;
	struct MetadataFeature :> Feature;
	struct MetadataFeatureValue :> FeatureValue;
	
	struct Package :> Namespace;
	struct ElementFilterMembership :> Membership;
	
}