standard library package KerML {
	doc 
	/*
	 * This package contains a reflective KerML model of the KerML abstract syntax.
	 */
	 
	private import ScalarValues::*;
	import Kernel::*;
	
	package Root {
		metaclass AnnotatingElement specializes Element {
			feature annotation : Annotation[0..*];
			derived feature annotatedElement : Element[1..*] redefines annotatedElement;
			composite derived feature ownedAnnotatingRelationship : Annotation[0..*] subsets annotation, ownedRelationship;
		}		
				
		metaclass Annotation specializes Relationship {
			feature annotatingElement : AnnotatingElement[1..1] redefines source;
			feature annotatedElement : Element[1..1] redefines target, annotatedElement;
			derived feature owningAnnotatedElement : Element[0..1] subsets annotatedElement, owningRelatedElement;
			derived feature owningAnnotatingElement : AnnotatingElement[0..1] subsets annotatingElement, owningRelatedElement;
		}		
				
		metaclass Comment specializes AnnotatingElement {
			feature locale : String[0..1];
			feature body : String[1..1];
		}		
				
		metaclass Dependency specializes Relationship {
			feature client : Element[1..*] redefines source;
			feature supplier : Element[1..*] redefines target;
		}		
				
		metaclass Documentation specializes Comment {
			derived feature documentedElement : Element[1..1] subsets owner redefines annotatedElement;
		}		
				
		abstract metaclass Element {
			feature elementId : String[1..1];
			feature aliasIds : String[0..*];
			feature declaredShortName : String[0..1];
			feature declaredName : String[0..1];
			feature isImpliedIncluded : Boolean[1..1];
			derived feature shortName : String[0..1];
			derived feature name : String[0..1];
			derived feature qualifiedName : String[0..1];
			derived feature isLibraryElement : Boolean[1..1];
			
			feature owningRelationship : Relationship[0..1];
			composite feature ownedRelationship : Relationship[0..*];
			derived feature owningMembership : OwningMembership[0..1] subsets owningRelationship;
			derived feature owningNamespace : Namespace[0..1];
			derived feature owner : Element[0..1];
			derived feature ownedElement : Element[0..*];
			derived feature documentation : Documentation[0..*] subsets ownedElement;
			composite derived feature ownedAnnotation : Annotation[0..*] subsets ownedRelationship;
			derived feature textualRepresentation : TextualRepresentation[0..*] subsets ownedElement;
		}		
				
		abstract metaclass Import specializes Relationship {
			feature visibility : VisibilityKind[1..1];
			feature isRecursive : Boolean[1..1];
			feature isImportAll : Boolean[1..1];
			
			derived feature importOwningNamespace : Namespace[1..1] subsets owningRelatedElement redefines source;
			derived feature importedElement : Element[1..1];
		}		
				
		metaclass Membership specializes Relationship {
			feature memberShortName : String[0..1];
			feature memberName : String[0..1];
			feature visibility : VisibilityKind[1..1];
			derived feature memberElementId : String[1..1];
			
			feature memberElement : Element[1..1] redefines target;
			derived feature membershipOwningNamespace : Namespace[1..1] subsets owningRelatedElement redefines source;
		}		
				
		metaclass MembershipImport specializes Import {
			feature importedMembership : Membership[1..1] redefines target;
		}		
				
		metaclass Namespace specializes Element {
			abstract derived feature membership : Membership[0..*];
			composite derived feature ownedImport : Import[0..*] subsets ownedRelationship;
			derived feature 'member' : Element[0..*];
			derived feature ownedMember : Element[0..*] subsets 'member';
			composite derived feature ownedMembership : Membership[0..*] subsets membership, ownedRelationship;
			derived feature importedMembership : Membership[0..*] subsets membership;
		}		
				
		metaclass NamespaceImport specializes Import {
			feature importedNamespace : Namespace[1..1] redefines target;
		}		
				
		metaclass OwningMembership specializes Membership {
			derived feature ownedMemberElementId : String[1..1] redefines memberElementId;
			derived feature ownedMemberShortName : String[0..1] redefines memberShortName;
			derived feature ownedMemberName : String[0..1] redefines memberName;
			
			composite derived feature ownedMemberElement : Element[1..1] subsets ownedRelatedElement redefines memberElement;
		}		
				
		abstract metaclass Relationship specializes Element {
			feature isImplied : Boolean[1..1];
			
			feature target : Element[0..*] subsets relatedElement;
			feature source : Element[0..*] subsets relatedElement;
			feature owningRelatedElement : Element[0..1] subsets relatedElement;
			composite feature ownedRelatedElement : Element[0..*] subsets relatedElement;
			derived feature relatedElement : Element[0..*];
		}		
				
		metaclass TextualRepresentation specializes AnnotatingElement {
			feature 'language' : String[1..1];
			feature body : String[1..1];
			
			derived feature representedElement : Element[1..1] subsets owner redefines annotatedElement;
		}		
				
		datatype VisibilityKind {
			member feature 'private' : VisibilityKind[1];
			member feature 'protected' : VisibilityKind[1];
			member feature 'public' : VisibilityKind[1];
		}
				
	}
	
	package Core {
		import Root::*;
		
		metaclass Classifier specializes Type {
			composite derived feature ownedSubclassification : Subclassification[0..*] subsets ownedSpecialization;
		}		
				
		metaclass Conjugation specializes Relationship {
			feature originalType : Type[1..1] redefines target;
			feature conjugatedType : Type[1..1] redefines source;
			derived feature owningType : Type[0..1] subsets conjugatedType, owningRelatedElement;
		}		
				
		metaclass Differencing specializes Relationship {
			feature differencingType : Type[1..1] redefines target;
			derived feature typeDifferenced : Type[1..1] subsets owningRelatedElement redefines source;
		}		
				
		metaclass Disjoining specializes Relationship {
			feature typeDisjoined : Type[1..1] redefines source;
			feature disjoiningType : Type[1..1] redefines target;
			derived feature owningType : Type[0..1] subsets typeDisjoined, owningRelatedElement;
		}		
				
		metaclass EndFeatureMembership specializes FeatureMembership {
			composite derived feature ownedMemberFeature : Feature[1..1] redefines ownedMemberFeature;
		}		
				
		metaclass Feature specializes Type {
			feature isUnique : Boolean[1..1];
			feature isOrdered : Boolean[1..1];
			feature isComposite : Boolean[1..1];
			feature isEnd : Boolean[1..1];
			feature isDerived : Boolean[1..1];
			feature isReadOnly : Boolean[1..1];
			feature isPortion : Boolean[1..1];
			feature direction : FeatureDirectionKind[0..1];
			
			derived feature owningType : Type[0..1] subsets owningNamespace, featuringType;
			derived feature 'type' : Type[0..*];
			composite derived feature ownedRedefinition : Redefinition[0..*] subsets ownedSubsetting;
			composite derived feature ownedSubsetting : Subsetting[0..*] subsets ownedSpecialization;
			derived feature owningFeatureMembership : FeatureMembership[0..1] subsets owningMembership;
			derived feature endOwningType : Type[0..1] subsets owningType;
			composite derived feature ownedTyping : FeatureTyping[0..*] subsets ownedSpecialization;
			derived feature featuringType : Type[0..*];
			composite derived feature ownedTypeFeaturing : TypeFeaturing[0..*] subsets ownedRelationship;
			derived feature chainingFeature : Feature[0..*];
			composite derived feature ownedFeatureInverting : FeatureInverting[0..*] subsets ownedRelationship;
			composite derived feature ownedFeatureChaining : FeatureChaining[0..*] subsets ownedRelationship;
			composite derived feature ownedReferenceSubsetting : ReferenceSubsetting[0..1] subsets ownedSubsetting;
		}		
				
		metaclass FeatureChaining specializes Relationship {
			feature chainingFeature : Feature[1..1] redefines target;
			derived feature featureChained : Feature[1..1] subsets owningRelatedElement redefines source;
		}		
				
		datatype FeatureDirectionKind {
			member feature 'in' : FeatureDirectionKind[1];
			member feature 'inout' : FeatureDirectionKind[1];
			member feature 'out' : FeatureDirectionKind[1];
		}
				
		metaclass FeatureInverting specializes Relationship {
			feature featureInverted : Feature[1..1] redefines source;
			feature invertingFeature : Feature[1..1] redefines target;
			derived feature owningFeature : Feature[0..1] subsets owningRelatedElement, featureInverted;
		}		
				
		metaclass FeatureMembership specializes OwningMembership, Featuring {
			derived feature owningType : Type[1..1] redefines membershipOwningNamespace, 'type';
			composite derived feature ownedMemberFeature : Feature[1..1] redefines ownedMemberElement, 'feature';
		}		
				
		metaclass FeatureTyping specializes Specialization {
			feature typedFeature : Feature[1..1] redefines specific;
			feature 'type' : Type[1..1] redefines general;
			derived feature owningFeature : Feature[0..1] subsets typedFeature redefines owningType;
		}		
				
		abstract metaclass Featuring specializes Relationship {
			feature 'type' : Type[1..1] subsets relatedElement;
			feature 'feature' : Feature[1..1] subsets relatedElement;
		}		
				
		metaclass Intersecting specializes Relationship {
			feature intersectingType : Type[1..1] redefines target;
			derived feature typeIntersected : Type[1..1] subsets owningRelatedElement redefines source;
		}		
				
		metaclass Multiplicity specializes Feature;		
				
		metaclass Redefinition specializes Subsetting {
			feature redefiningFeature : Feature[1..1] redefines subsettingFeature;
			feature redefinedFeature : Feature[1..1] redefines subsettedFeature;
		}		
				
		metaclass ReferenceSubsetting specializes Subsetting {
			feature referencedFeature : Feature[1..1] redefines subsettedFeature;
			derived feature referencingFeature : Feature[1..1] redefines subsettingFeature, owningFeature;
		}		
				
		metaclass Specialization specializes Relationship {
			feature general : Type[1..1] redefines target;
			feature specific : Type[1..1] redefines source;
			derived feature owningType : Type[0..1] subsets specific, owningRelatedElement;
		}		
				
		metaclass Subclassification specializes Specialization {
			feature superclassifier : Classifier[1..1] redefines general;
			feature 'subclassifier' : Classifier[1..1] redefines specific;
			derived feature owningClassifier : Classifier[0..1] redefines owningType;
		}		
				
		metaclass Subsetting specializes Specialization {
			feature subsettedFeature : Feature[1..1] redefines general;
			feature subsettingFeature : Feature[1..1] redefines specific;
			derived feature owningFeature : Feature[0..1] subsets subsettingFeature redefines owningType;
		}		
				
		metaclass Type specializes Namespace {
			feature isAbstract : Boolean[1..1];
			feature isSufficient : Boolean[1..1];
			derived feature isConjugated : Boolean[1..1];
			
			composite derived feature ownedSpecialization : Specialization[0..*] subsets ownedRelationship;
			composite derived feature ownedFeatureMembership : FeatureMembership[0..*] subsets ownedMembership, featureMembership;
			derived feature 'feature' : Feature[0..*] subsets 'member';
			derived feature ownedFeature : Feature[0..*] subsets ownedMember;
			derived feature input : Feature[0..*] subsets directedFeature;
			derived feature output : Feature[0..*] subsets directedFeature;
			derived feature inheritedMembership : Membership[0..*] subsets membership;
			derived feature endFeature : Feature[0..*] subsets 'feature';
			derived feature ownedEndFeature : Feature[0..*] subsets endFeature, ownedFeature;
			composite derived feature ownedConjugator : Conjugation[0..1] subsets ownedRelationship;
			derived feature inheritedFeature : Feature[0..*] subsets 'feature';
			derived feature 'multiplicity' : Multiplicity[0..1] subsets ownedMember;
			derived feature unioningType : Type[0..*];
			composite derived feature ownedIntersecting : Intersecting[0..*] subsets ownedRelationship;
			derived feature intersectingType : Type[0..*];
			composite derived feature ownedUnioning : Unioning[0..*] subsets ownedRelationship;
			composite derived feature ownedDisjoining : Disjoining[0..*] subsets ownedRelationship;
			derived feature featureMembership : FeatureMembership[0..*];
			derived feature differencingType : Type[0..*];
			composite derived feature ownedDifferencing : Differencing[0..*] subsets ownedRelationship;
			derived feature directedFeature : Feature[0..*] subsets 'feature';
		}		
				
		metaclass TypeFeaturing specializes Featuring {
			feature featureOfType : Feature[1..1] redefines source, 'feature';
			feature featuringType : Type[1..1] redefines target, 'type';
			derived feature owningFeatureOfType : Feature[0..1] subsets featureOfType, owningRelatedElement;
		}		
				
		metaclass Unioning specializes Relationship {
			feature unioningType : Type[1..1] redefines target;
			derived feature typeUnioned : Type[1..1] subsets owningRelatedElement redefines source;
		}		
				
	}
	
	package Kernel {
		import Core::*;
		
		metaclass Association specializes Classifier, Relationship {
			derived feature relatedType : Type[0..*] redefines relatedElement;
			derived feature sourceType : Type[0..1] subsets relatedType redefines source;
			derived feature targetType : Type[0..*] subsets relatedType redefines target;
			derived feature associationEnd : Feature[0..*] redefines endFeature;
		}		
				
		metaclass AssociationStructure specializes Structure, Association;		
				
		metaclass Behavior specializes Class {
			derived feature 'step' : Step[0..*] subsets 'feature';
			derived feature parameter : Feature[0..*] redefines directedFeature;
		}		
				
		metaclass BindingConnector specializes Connector;		
				
		metaclass BooleanExpression specializes Expression {
			derived feature 'predicate' : Predicate[0..1] redefines 'function';
		}		
				
		metaclass Class specializes Classifier;		
				
		metaclass CollectExpression specializes OperatorExpression {
			feature operator : String[1..1] redefines operator;
		}		
				
		metaclass Connector specializes Feature, Relationship {
			derived feature relatedFeature : Feature[0..*] redefines relatedElement;
			derived feature association : Association[0..*] redefines 'type';
			derived feature connectorEnd : Feature[0..*] redefines endFeature;
			derived feature sourceFeature : Feature[0..1] subsets relatedFeature redefines source;
			derived feature targetFeature : Feature[0..*] subsets relatedFeature redefines target;
		}		
				
		metaclass DataType specializes Classifier;		
				
		metaclass ElementFilterMembership specializes OwningMembership {
			composite derived feature condition : Expression[1..1] redefines ownedMemberElement;
		}		
				
		metaclass Expression specializes Step {
			derived feature isModelLevelEvaluable : Boolean[1..1];
			
			derived feature 'function' : Function[0..1] redefines 'behavior';
			derived feature result : Feature[1..1] subsets parameter, output;
		}		
				
		metaclass FeatureChainExpression specializes OperatorExpression {
			feature operator : String[1..1] redefines operator;
			
			derived feature targetFeature : Feature[1..1] subsets 'member';
		}		
				
		metaclass FeatureReferenceExpression specializes Expression {
			derived feature referent : Feature[1..1] subsets 'member';
		}		
				
		metaclass FeatureValue specializes OwningMembership {
			feature isInitial : Boolean[1..1];
			feature isDefault : Boolean[1..1];
			
			derived feature featureWithValue : Feature[1..1] subsets membershipOwningNamespace;
			composite derived feature value : Expression[1..1] redefines ownedMemberElement;
		}		
				
		metaclass Function specializes Behavior {
			derived feature isModelLevelEvaluable : Boolean[1..1];
			
			derived feature expression : Expression[0..*] subsets 'step';
			derived feature result : Feature[1..1] subsets parameter, output;
		}		
				
		metaclass Interaction specializes Behavior, Association;		
				
		metaclass Invariant specializes BooleanExpression {
			feature isNegated : Boolean[1..1];
		}		
				
		metaclass InvocationExpression specializes Expression {
			derived feature argument : Expression[0..*] subsets ownedFeature;
		}		
				
		metaclass ItemFeature specializes Feature;		
				
		metaclass ItemFlow specializes Connector, Step {
			derived feature itemType : Classifier[0..*];
			derived feature targetInputFeature : Feature[0..1];
			derived feature sourceOutputFeature : Feature[0..1];
			derived feature itemFlowEnd : ItemFlowEnd[0..2] subsets connectorEnd;
			derived feature itemFeature : ItemFeature[0..1] subsets ownedFeature;
			derived feature 'interaction' : Interaction[0..*] redefines association, 'behavior';
		}		
				
		metaclass ItemFlowEnd specializes Feature;		
				
		metaclass LibraryPackage specializes Package {
			feature isStandard : Boolean[1..1];
		}		
				
		metaclass LiteralBoolean specializes LiteralExpression {
			feature value : Boolean[1..1];
		}		
				
		metaclass LiteralExpression specializes Expression;		
				
		metaclass LiteralInfinity specializes LiteralExpression;		
				
		metaclass LiteralInteger specializes LiteralExpression {
			feature value : Integer[1..1];
		}		
				
		metaclass LiteralRational specializes LiteralExpression {
			feature value : Real[1..1];
		}		
				
		metaclass LiteralString specializes LiteralExpression {
			feature value : String[1..1];
		}		
				
		metaclass Metaclass specializes Structure;		
				
		metaclass MetadataAccessExpression specializes Expression {
			feature referencedElement : Element[1..1];
		}		
				
		metaclass MetadataFeature specializes AnnotatingElement, Feature {
			derived feature 'metaclass' : Metaclass[0..1] subsets 'type';
		}		
				
		metaclass MultiplicityRange specializes Multiplicity {
			derived feature lowerBound : Expression[0..1] subsets bound;
			derived feature upperBound : Expression[1..1] subsets bound;
			abstract derived feature bound : Expression[1..2] redefines ownedMember;
		}		
				
		metaclass NullExpression specializes Expression;		
				
		metaclass OperatorExpression specializes InvocationExpression {
			feature operator : String[1..1];
		}		
				
		metaclass Package specializes Namespace {
			derived feature filterCondition : Expression[0..*] subsets ownedMember;
		}		
				
		metaclass ParameterMembership specializes FeatureMembership {
			composite derived feature ownedMemberParameter : Feature[1..1] redefines ownedMemberFeature;
		}		
				
		metaclass Predicate specializes Function;		
				
		metaclass ResultExpressionMembership specializes FeatureMembership {
			composite derived feature ownedResultExpression : Expression[1..1] redefines ownedMemberFeature;
		}		
				
		metaclass ReturnParameterMembership specializes ParameterMembership;		
				
		metaclass SelectExpression specializes OperatorExpression {
			feature operator : String[1..1] redefines operator;
		}		
				
		metaclass Step specializes Feature {
			derived feature 'behavior' : Behavior[0..*] subsets 'type';
			derived feature parameter : Feature[0..*] redefines directedFeature;
		}		
				
		metaclass Structure specializes Class;		
				
		metaclass Succession specializes Connector {
			derived feature transitionStep : Step[0..1];
			derived feature triggerStep : Step[0..*];
			derived feature effectStep : Step[0..*];
			derived feature guardExpression : Expression[0..*];
		}		
				
		metaclass SuccessionItemFlow specializes Succession, ItemFlow;		
				
	}
}
