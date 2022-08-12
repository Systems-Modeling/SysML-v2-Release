package KerML {
	doc
	/*
	 * This package contains a reflective KerML model of the KerML abstract syntax.
	 * 
	 * NOTE: This model is currently incomplete. It includes all KerML abstract syntax metaclasses,
	 * but none of their properties.
	 */
	
	metaclass Element;
	metaclass Relationship :> Element;
	
	metaclass AnnotatingElement :> Element;
	metaclass Annotation :> Relationship;
	metaclass Comment :> AnnotatingElement;
	metaclass Documentation :> Annotation;
	metaclass TextualRepresentation :> AnnotatingElement;
	
	metaclass Import :> Relationship;
	metaclass Membership :> Relationship;
	metaclass Namespace :> Element;
	
	metaclass Type :> Namespace;
	metaclass Multiplicity :> Feature;
	metaclass FeatureMembership :> Membership, TypeFeaturing;
	metaclass Specialization :> Relationship;
	metaclass Conjugation :> Relationship;
	metaclass Disjoining :> Relationship;
	
	metaclass Classifier :> Type;
	metaclass Subclassification :> Specialization;
	
	metaclass Feature :> Type;
	metaclass Subsetting :> Specialization;
	metaclass Redefinition :> Subsetting;
	metaclass FeatureTyping :> Specialization;
	metaclass TypeFeaturing :> Relationship;
	metaclass FeatureChaining :> Relationship;
	metaclass EndFeatureMembersip :> FeatureMembership;
	
	metaclass Class :> Classifier;
	metaclass DataType :> Classifier;
	
	metaclass Structure :> Class;
	
	metaclass Association :> Classifier, Relationship;
	metaclass AssociationStructure :> Association, Structure;
	
	metaclass Connector :> Feature, Relationship;
	metaclass BindingConnector :> Connector;
	metaclass Succession :> Connector;
	
	metaclass Behavior :> Class;
	metaclass Step :> Feature;
	metaclass ParameterMembership :> FeatureMembership;
	
	metaclass Function :> Behavior;
	metaclass Predicate :> Function;
	metaclass Expression :> Step;
	metaclass BooleanExpression :> Expression;
	metaclass Invariant :> BooleanExpression;
	metaclass ReturnParameterMembership :> ParameterMembership;
	metaclass ResultExpressionMembership :> FeatureMembership;
	
	metaclass FeatureReferenceExpression :> Expression;
	metaclass InvocationExpression :> Expression;
	metaclass LiteralExpression :> Expression;
	metaclass LiteralInteger :> LiteralExpression;
	metaclass LiteralRational :> LiteralExpression;
	metaclass LiteralBoolean :> LiteralExpression;
	metaclass LiteralString :> LiteralExpression;
	metaclass LiteralInfinity :> LiteralExpression;
	metaclass NullExpression :> Expression;
	metaclass OperatorExpression :> InvocationExpression;
	metaclass FeatureChainExpression :> OperatorExpression;
	metaclass CollectExpression :> OperatorExpression;
	metaclass SelectExpression :> OperatorExpression;
	
	metaclass Interaction :> Behavior, Association;
	metaclass ItemFlow :> Step, Connector;
	metaclass SuccessionItemFlow :> ItemFlow, Succession;
	
	metaclass FeatureValue :> Membership;
	
	metaclass MultiplicityRange :> Multiplicity;
	
	metaclass Metaclass :> Structure;
	metaclass MetadataFeature :> AnnotatingElement, Feature;
	
	metaclass Package :> Namespace;
	metaclass ElementFilterMembership :> Membership;
	
}