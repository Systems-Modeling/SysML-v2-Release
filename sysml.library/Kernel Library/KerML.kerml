/**
 * This package contains a reflective KerML model of the KerML abstract syntax.
 * 
 * NOTE: This model is currently incomplete. It includes all KerML abstract syntax metaclasses,
 * but none of their properties.
 */
package KerML {
	
	struct Element;
	struct Relationship :> Element;
	
	struct AnnotatingElement :> Element;
	struct Annotation :> Relationship;
	struct Comment :> AnnotatingElement;
	struct Documentation :> Annotation;
	struct TextualRepresentation :> AnnotatingElement;
	
	struct Import :> Relationship;
	struct Membership :> Relationship;
	struct Namespace :> Element;
	
	struct Type :> Namespace;
	struct Multiplicity :> Feature;
	struct FeatureMembership :> Membership, TypeFeaturing;
	struct Specialization :> Relationship;
	struct Conjugation :> Relationship;
	struct Disjoining :> Relationship;
	
	struct Classifier :> Type;
	struct Subclassification :> Specialization;
	
	struct Feature :> Type;
	struct Subsetting :> Specialization;
	struct Redefinition :> Subsetting;
	struct FeatureTyping :> Specialization;
	struct TypeFeaturing :> Relationship;
	struct FeatureChaining :> Relationship;
	struct EndFeatureMembersip :> FeatureMembership;
	
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
	struct ParameterMembership :> FeatureMembership;
	
	struct Function :> Behavior;
	struct Predicate :> Function;
	struct Expression :> Step;
	struct BooleanExpression :> Expression;
	struct Invariant :> BooleanExpression;
	struct ReturnParameterMembership :> ParameterMembership;
	struct ResultExpressionMembership :> FeatureMembership;
	
	struct FeatureReferenceExpression :> Expression;
	struct InvocationExpression :> Expression;
	struct LiteralExpression :> Expression;
	struct LiteralInteger :> LiteralExpression;
	struct LiteralRational :> LiteralExpression;
	struct LiteralBoolean :> LiteralExpression;
	struct LiteralString :> LiteralExpression;
	struct LiteralInfinity :> LiteralExpression;
	struct NullExpression :> Expression;
	struct OperatorExpression :> InvocationExpression;
	struct PathStepExpression :> OperatorExpression;
	struct PathSelectExpression :> OperatorExpression;
	
	struct Interaction :> Behavior, Association;
	struct ItemFlow :> Step, Connector;
	struct SuccessionItemFlow :> ItemFlow, Succession;
	
	struct FeatureValue :> Membership;
	
	struct MultiplicityRange :> Multiplicity;
	
	struct AnnotatingFeature :> AnnotatingElement, Feature;
	struct MetadataFeature :> Feature;
	struct MetadataFeatureValue :> FeatureValue;
	
	struct Package :> Namespace;
	struct ElementFilterMembership :> Membership;
	
}