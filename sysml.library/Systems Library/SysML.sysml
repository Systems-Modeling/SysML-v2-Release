standard library package SysML {
	doc 
	/*
	 * This package contains a reflective KerML model of the KerML abstract syntax.
	 */
	 
	private import ScalarValues::*;
	import Systems::*;
	
	package Systems {
		import KerML::Kernel::*;
		
		metadata def AcceptActionUsage specializes ActionUsage {
			derived ref item receiverArgument : Expression[0..1];
			derived ref item payloadParameter : ReferenceUsage[1..1] subsets nestedReference, parameter;
			derived ref item payloadArgument : Expression[0..1];
		}		
				
		metadata def ActionDefinition specializes Behavior, OccurrenceDefinition {
			derived ref item 'action' : ActionUsage[0..*] subsets step, usage;
		}		
				
		metadata def ActionUsage specializes Step, OccurrenceUsage {
			derived ref item actionDefinition : Behavior[0..*] redefines behavior, occurrenceDefinition;
		}		
				
		metadata def ActorMembership specializes ParameterMembership {
			derived item ownedActorParameter : PartUsage[1..1] redefines ownedMemberParameter;
		}		
				
		metadata def AllocationDefinition specializes ConnectionDefinition {
			derived ref item 'allocation' : AllocationUsage[0..*] subsets usage;
		}		
				
		metadata def AllocationUsage specializes ConnectionUsage {
			derived ref item allocationDefinition : AllocationDefinition[0..*] redefines connectionDefinition;
		}		
				
		metadata def AnalysisCaseDefinition specializes CaseDefinition {
			derived ref item analysisAction : ActionUsage[0..*] subsets 'action';
			derived ref item resultExpression : Expression[0..1] subsets expression, ownedFeature;
		}		
				
		metadata def AnalysisCaseUsage specializes CaseUsage {
			derived ref item analysisAction : ActionUsage[0..*] subsets feature;
			derived ref item analysisCaseDefinition : AnalysisCaseDefinition[0..1] redefines caseDefinition;
			derived ref item resultExpression : Expression[0..1] subsets ownedFeature;
		}		
				
		metadata def AssertConstraintUsage specializes ConstraintUsage, Invariant {
			derived ref item assertedConstraint : ConstraintUsage[1..1];
		}		
				
		metadata def AssignmentActionUsage specializes ActionUsage {
			derived ref item targetArgument : Expression[1..1];
			derived ref item valueExpression : Expression[1..1];
			derived ref item referent : Feature[1..1] subsets member;
		}		
				
		metadata def AttributeDefinition specializes DataType, Definition;		
				
		metadata def AttributeUsage specializes Usage {
			derived attribute isReference : Boolean[1..1] redefines isReference;
			
			derived ref item attributeDefinition : DataType[0..*] redefines definition;
		}		
				
		metadata def BindingConnectorAsUsage specializes BindingConnector, ConnectorAsUsage;		
				
		metadata def CalculationDefinition specializes Function, ActionDefinition {
			derived ref item calculation : CalculationUsage[0..*] subsets 'action', expression;
		}		
				
		metadata def CalculationUsage specializes Expression, ActionUsage {
			derived ref item calculationDefinition : Function[0..1] redefines function, actionDefinition;
		}		
				
		metadata def CaseDefinition specializes CalculationDefinition {
			derived ref item objectiveRequirement : RequirementUsage[0..1] subsets ownedRequirement;
			derived ref item subjectParameter : Usage[1..1] subsets parameter, ownedUsage;
			derived ref item actorParameter : PartUsage[0..*] subsets parameter, ownedPart;
		}		
				
		metadata def CaseUsage specializes CalculationUsage {
			derived ref item objectiveRequirement : RequirementUsage[0..1] subsets nestedRequirement;
			derived ref item caseDefinition : CaseDefinition[0..1] redefines calculationDefinition;
			derived ref item subjectParameter : Usage[1..1] subsets parameter, nestedUsage;
			derived ref item actorParameter : PartUsage[0..*] subsets nestedPart, parameter;
		}		
				
		metadata def ConcernDefinition specializes RequirementDefinition;		
				
		metadata def ConcernUsage specializes RequirementUsage {
			derived ref item concernDefinition : ConcernDefinition[0..1] redefines requirementDefinition;
		}		
				
		metadata def ConjugatedPortDefinition specializes PortDefinition {
			derived ref item originalPortDefinition : PortDefinition[1..1] redefines owningNamespace;
			derived ref item ownedPortConjugator : PortConjugation[1..1] redefines ownedConjugator;
		}		
				
		metadata def ConjugatedPortTyping specializes FeatureTyping {
			ref item conjugatedPortDefinition : ConjugatedPortDefinition[1..1] redefines type;
			derived ref item portDefinition : PortDefinition[1..1];
		}		
				
		metadata def ConnectionDefinition specializes AssociationStructure, PartDefinition {
			derived ref item connectionEnd : Usage[0..*] redefines associationEnd;
		}		
				
		metadata def ConnectionUsage specializes ConnectorAsUsage, PartUsage {
			derived ref item connectionDefinition : AssociationStructure[0..*] subsets itemDefinition redefines association;
		}		
				
		abstract metadata def ConnectorAsUsage specializes Usage, Connector;		
				
		metadata def ConstraintDefinition specializes OccurrenceDefinition, Predicate;		
				
		metadata def ConstraintUsage specializes BooleanExpression, OccurrenceUsage {
			derived ref item constraintDefinition : Predicate[0..1] redefines predicate;
		}		
				
		abstract metadata def ControlNode specializes ActionUsage;		
				
		metadata def DecisionNode specializes ControlNode;		
				
		metadata def Definition specializes Classifier {
			attribute isVariation : Boolean[1..1];
			
			derived ref item ownedUsage : Usage[0..*] subsets ownedFeature, usage;
			derived ref item ownedPort : PortUsage[0..*] subsets ownedUsage;
			derived ref item directedUsage : Usage[0..*] subsets usage, directedFeature;
			derived ref item usage : Usage[0..*] subsets feature;
			derived ref item ownedState : StateUsage[0..*] subsets ownedAction;
			derived ref item ownedConstraint : ConstraintUsage[0..*] subsets ownedOccurrence;
			derived ref item ownedTransition : TransitionUsage[0..*] subsets ownedUsage;
			derived ref item ownedRequirement : RequirementUsage[0..*] subsets ownedConstraint;
			derived ref item ownedCalculation : CalculationUsage[0..*] subsets ownedAction;
			derived item variantMembership : VariantMembership[0..*] subsets ownedMembership;
			derived ref item ownedAnalysisCase : AnalysisCaseUsage[0..*] subsets ownedCase;
			derived ref item 'variant' : Usage[0..*] subsets ownedMember;
			derived ref item ownedCase : CaseUsage[0..*] subsets ownedCalculation;
			derived ref item ownedReference : ReferenceUsage[0..*] subsets ownedUsage;
			derived ref item ownedAction : ActionUsage[0..*] subsets ownedOccurrence;
			derived ref item ownedConnection : ConnectorAsUsage[0..*] subsets ownedPart;
			derived ref item ownedItem : ItemUsage[0..*] subsets ownedOccurrence;
			derived ref item ownedPart : PartUsage[0..*] subsets ownedItem;
			derived ref item ownedInterface : InterfaceUsage[0..*] subsets ownedConnection;
			derived ref item ownedAttribute : AttributeUsage[0..*] subsets ownedUsage;
			derived ref item ownedView : ViewUsage[0..*] subsets ownedPart;
			derived ref item ownedViewpoint : ViewpointUsage[0..*] subsets ownedRequirement;
			derived ref item ownedRendering : RenderingUsage[0..*] subsets ownedPart;
			derived ref item ownedVerificationCase : VerificationCaseUsage[0..*] subsets ownedCase;
			derived ref item ownedEnumeration : EnumerationUsage[0..*] subsets ownedAttribute;
			derived ref item ownedAllocation : AllocationUsage[0..*] subsets ownedConnection;
			derived ref item ownedConcern : ConcernUsage[0..*] subsets ownedRequirement;
			derived ref item ownedOccurrence : OccurrenceUsage[0..*] subsets ownedUsage;
			derived ref item ownedUseCase : UseCaseUsage[0..*] subsets ownedCase;
			derived ref item ownedFlow : FlowConnectionUsage[0..*] subsets ownedConnection;
			derived ref item ownedMetadata : MetadataUsage[0..*] subsets ownedItem;
		}		
				
		metadata def EnumerationDefinition specializes AttributeDefinition {
			attribute isVariation : Boolean[1..1] redefines isVariation;
			
			derived ref item enumeratedValue : EnumerationUsage[0..*] redefines 'variant';
		}		
				
		metadata def EnumerationUsage specializes AttributeUsage {
			derived ref item enumerationDefinition : EnumerationDefinition[1..1] redefines attributeDefinition;
		}		
				
		metadata def EventOccurrenceUsage specializes OccurrenceUsage {
			derived attribute isReference : Boolean[1..1] redefines isReference;
			
			derived ref item eventOccurrence : OccurrenceUsage[1..1];
		}		
				
		metadata def ExhibitStateUsage specializes StateUsage, PerformActionUsage {
			derived ref item exhibitedState : StateUsage[1..1] redefines performedAction;
		}		
				
		abstract metadata def Expose specializes Import {
			attribute isImportAll : Boolean[1..1] redefines isImportAll;
		}		
				
		metadata def FlowConnectionDefinition specializes Interaction, ConnectionDefinition, ActionDefinition;		
				
		metadata def FlowConnectionUsage specializes ConnectionUsage, ItemFlow, ActionUsage {
			derived ref item flowConnectionDefinition : Interaction[0..*] redefines actionDefinition, connectionDefinition, interaction;
		}		
				
		metadata def ForLoopActionUsage specializes LoopActionUsage {
			derived ref item seqArgument : Expression[1..1];
			derived ref item loopVariable : ReferenceUsage[1..1];
		}		
				
		metadata def ForkNode specializes ControlNode;		
				
		metadata def FramedConcernMembership specializes RequirementConstraintMembership {
			attribute kind : RequirementConstraintKind[1..1] redefines kind;
			
			derived item ownedConcern : ConcernUsage[1..1] redefines ownedConstraint;
			derived ref item referencedConcern : ConcernUsage[1..1] redefines referencedConstraint;
		}		
				
		metadata def IfActionUsage specializes ActionUsage {
			derived ref item elseAction : ActionUsage[0..1];
			derived ref item thenAction : ActionUsage[1..1];
			derived ref item ifArgument : Expression[1..1];
		}		
				
		metadata def IncludeUseCaseUsage specializes UseCaseUsage, PerformActionUsage {
			derived ref item useCaseIncluded : UseCaseUsage[1..1] redefines performedAction;
		}		
				
		metadata def InterfaceDefinition specializes ConnectionDefinition {
			derived ref item interfaceEnd : PortUsage[0..*] redefines connectionEnd;
		}		
				
		metadata def InterfaceUsage specializes ConnectionUsage {
			derived ref item interfaceDefinition : InterfaceDefinition[0..*] redefines connectionDefinition;
		}		
				
		metadata def ItemDefinition specializes Structure, OccurrenceDefinition;		
				
		metadata def ItemUsage specializes OccurrenceUsage {
			derived ref item itemDefinition : Structure[0..*] subsets occurrenceDefinition;
		}		
				
		metadata def JoinNode specializes ControlNode;		
				
		metadata def LifeClass specializes Class {
			attribute isSufficient : Boolean[1..1] redefines isSufficient;
		}		
				
		abstract metadata def LoopActionUsage specializes ActionUsage {
			derived ref item bodyAction : ActionUsage[1..1];
		}		
				
		metadata def MembershipExpose specializes MembershipImport, Expose;		
				
		metadata def MergeNode specializes ControlNode;		
				
		metadata def MetadataDefinition specializes ItemDefinition, Metaclass;		
				
		metadata def MetadataUsage specializes ItemUsage, MetadataFeature {
			derived ref item metadataDefinition : Metaclass[0..1] redefines itemDefinition, metaclass;
		}		
				
		metadata def NamespaceExpose specializes Expose, NamespaceImport;		
				
		metadata def ObjectiveMembership specializes FeatureMembership {
			derived item ownedObjectiveRequirement : RequirementUsage[1..1] redefines ownedMemberFeature;
		}		
				
		metadata def OccurrenceDefinition specializes Definition, Class {
			attribute isIndividual : Boolean[1..1];
			
			derived ref item lifeClass : LifeClass[0..1] subsets ownedMember;
		}		
				
		metadata def OccurrenceUsage specializes Usage {
			attribute isIndividual : Boolean[1..1];
			attribute portionKind : PortionKind[0..1];
			
			derived ref item occurrenceDefinition : Class[0..*] redefines definition;
			derived ref item individualDefinition : OccurrenceDefinition[0..1] subsets occurrenceDefinition;
		}		
				
		metadata def PartDefinition specializes ItemDefinition;		
				
		metadata def PartUsage specializes ItemUsage {
			derived ref item partDefinition : PartDefinition[0..*] subsets itemDefinition;
		}		
				
		metadata def PerformActionUsage specializes ActionUsage, EventOccurrenceUsage {
			derived ref item performedAction : ActionUsage[1..1] redefines eventOccurrence;
		}		
				
		metadata def PortConjugation specializes Conjugation {
			ref item originalPortDefinition : PortDefinition[1..1] redefines originalType;
			derived ref item conjugatedPortDefinition : ConjugatedPortDefinition[1..1] redefines owningType;
		}		
				
		metadata def PortDefinition specializes OccurrenceDefinition, Structure {
			derived ref item conjugatedPortDefinition : ConjugatedPortDefinition[0..1] subsets ownedMember;
		}		
				
		metadata def PortUsage specializes OccurrenceUsage {
			derived ref item portDefinition : PortDefinition[0..*] redefines occurrenceDefinition;
		}		
				
		enum def PortionKind {
			enum 'timeslice';
			enum 'snapshot';
		}
				
		metadata def ReferenceUsage specializes Usage {
			derived attribute isReference : Boolean[1..1] redefines isReference;
		}		
				
		metadata def RenderingDefinition specializes PartDefinition {
			derived ref item 'rendering' : RenderingUsage[0..*] subsets usage;
		}		
				
		metadata def RenderingUsage specializes PartUsage {
			derived ref item renderingDefinition : RenderingDefinition[0..1] redefines partDefinition;
		}		
				
		enum def RequirementConstraintKind {
			enum assumption;
			enum 'requirement';
		}
				
		metadata def RequirementConstraintMembership specializes FeatureMembership {
			attribute kind : RequirementConstraintKind[1..1];
			
			derived item ownedConstraint : ConstraintUsage[1..1] redefines ownedMemberFeature;
			derived ref item referencedConstraint : ConstraintUsage[1..1];
		}		
				
		metadata def RequirementDefinition specializes ConstraintDefinition {
			attribute reqId : String[0..1] redefines declaredShortName;
			derived attribute text : String[0..*];
			
			derived ref item assumedConstraint : ConstraintUsage[0..*] subsets ownedFeature;
			derived ref item requiredConstraint : ConstraintUsage[0..*] subsets ownedFeature;
			derived ref item subjectParameter : Usage[1..1] subsets parameter, ownedUsage;
			derived ref item framedConcern : ConcernUsage[0..*] subsets requiredConstraint;
			derived ref item actorParameter : PartUsage[0..*] subsets ownedPart, parameter;
			derived ref item stakeholderParameter : PartUsage[0..*] subsets ownedPart, parameter;
		}		
				
		metadata def RequirementUsage specializes ConstraintUsage {
			attribute reqId : String[0..1] redefines declaredShortName;
			derived attribute text : String[0..*];
			
			derived ref item requirementDefinition : RequirementDefinition[0..1] redefines constraintDefinition;
			derived ref item requiredConstraint : ConstraintUsage[0..*] subsets ownedFeature;
			derived ref item assumedConstraint : ConstraintUsage[0..*] subsets ownedFeature;
			derived ref item subjectParameter : Usage[1..1] subsets parameter, nestedUsage;
			derived ref item framedConcern : ConcernUsage[0..*] subsets requiredConstraint;
			derived ref item actorParameter : PartUsage[0..*] subsets nestedPart, parameter;
			derived ref item stakeholderParameter : PartUsage[0..*] subsets nestedPart, parameter;
		}		
				
		metadata def RequirementVerificationMembership specializes RequirementConstraintMembership {
			attribute kind : RequirementConstraintKind[1..1] redefines kind;
			
			derived item ownedRequirement : RequirementUsage[1..1] redefines ownedConstraint;
			derived ref item verifiedRequirement : RequirementUsage[1..1] redefines referencedConstraint;
		}		
				
		metadata def SatisfyRequirementUsage specializes RequirementUsage, AssertConstraintUsage {
			derived ref item satisfiedRequirement : RequirementUsage[1..1] redefines assertedConstraint;
			derived ref item satisfyingFeature : Feature[1..1];
		}		
				
		metadata def SendActionUsage specializes ActionUsage {
			derived ref item receiverArgument : Expression[0..1];
			derived ref item payloadArgument : Expression[1..1];
			derived ref item senderArgument : Expression[0..1];
		}		
				
		metadata def StakeholderMembership specializes ParameterMembership {
			derived item ownedStakeholderParameter : PartUsage[1..1] redefines ownedMemberParameter;
		}		
				
		metadata def StateDefinition specializes ActionDefinition {
			attribute isParallel : Boolean[1..1];
			
			derived ref item 'state' : StateUsage[0..*] subsets 'action';
			derived ref item entryAction : ActionUsage[0..1];
			derived ref item doAction : ActionUsage[0..1];
			derived ref item exitAction : ActionUsage[0..1];
		}		
				
		enum def StateSubactionKind {
			enum 'entry';
			enum 'do';
			enum 'exit';
		}
				
		metadata def StateSubactionMembership specializes FeatureMembership {
			attribute kind : StateSubactionKind[1..1];
			
			derived item 'action' : ActionUsage[1..1] redefines ownedMemberFeature;
		}		
				
		metadata def StateUsage specializes ActionUsage {
			attribute isParallel : Boolean[1..1];
			
			derived ref item stateDefinition : Behavior[0..*] redefines actionDefinition;
			derived ref item entryAction : ActionUsage[0..1];
			derived ref item doAction : ActionUsage[0..1];
			derived ref item exitAction : ActionUsage[0..1];
		}		
				
		metadata def SubjectMembership specializes ParameterMembership {
			derived item ownedSubjectParameter : Usage[1..1] redefines ownedMemberParameter;
		}		
				
		metadata def SuccessionAsUsage specializes ConnectorAsUsage, Succession;		
				
		metadata def SuccessionFlowConnectionUsage specializes SuccessionItemFlow, FlowConnectionUsage;		
				
		enum def TransitionFeatureKind {
			enum trigger;
			enum guard;
			enum effect;
		}
				
		metadata def TransitionFeatureMembership specializes FeatureMembership {
			attribute kind : TransitionFeatureKind[1..1];
			
			derived item transitionFeature : Step[1..1] redefines ownedMemberFeature;
		}		
				
		metadata def TransitionUsage specializes ActionUsage {
			derived ref item source : ActionUsage[1..1];
			derived ref item target : ActionUsage[1..1];
			derived ref item triggerAction : AcceptActionUsage[0..*] subsets ownedFeature;
			derived ref item guardExpression : Expression[0..*] subsets ownedFeature;
			derived ref item effectAction : ActionUsage[0..*] subsets feature;
			derived ref item 'succession' : Succession[1..1] subsets ownedMember;
		}		
				
		metadata def TriggerInvocationExpression specializes InvocationExpression {
			attribute kind : TriggerKind[1..1];
		}		
				
		enum def TriggerKind {
			enum 'when';
			enum 'at';
			enum 'after';
		}
				
		metadata def Usage specializes Feature {
			attribute isVariation : Boolean[1..1];
			derived attribute isReference : Boolean[1..1];
			
			derived ref item nestedUsage : Usage[0..*] subsets ownedFeature, usage;
			derived ref item owningUsage : Usage[0..1] subsets owningType;
			derived ref item owningDefinition : Definition[0..1] subsets owningType;
			derived ref item nestedPort : PortUsage[0..*] subsets nestedUsage;
			derived ref item nestedAction : ActionUsage[0..*] subsets nestedOccurrence;
			derived ref item nestedState : StateUsage[0..*] subsets nestedAction;
			derived ref item nestedConstraint : ConstraintUsage[0..*] subsets nestedOccurrence;
			derived ref item nestedTransition : TransitionUsage[0..*] subsets nestedUsage;
			derived ref item nestedRequirement : RequirementUsage[0..*] subsets nestedConstraint;
			derived ref item nestedCalculation : CalculationUsage[0..*] subsets nestedAction;
			derived ref item directedUsage : Usage[0..*] subsets usage, directedFeature;
			derived ref item nestedCase : CaseUsage[0..*] subsets nestedCalculation;
			derived ref item nestedAnalysisCase : AnalysisCaseUsage[0..*] subsets nestedCase;
			derived item variantMembership : VariantMembership[0..*] subsets ownedMembership;
			derived ref item usage : Usage[0..*] subsets feature;
			derived ref item 'variant' : Usage[0..*] subsets ownedMember;
			derived ref item nestedReference : ReferenceUsage[0..*] subsets nestedUsage;
			derived ref item nestedConnection : ConnectorAsUsage[0..*] subsets nestedPart;
			derived ref item nestedItem : ItemUsage[0..*] subsets nestedOccurrence;
			derived ref item nestedPart : PartUsage[0..*] subsets nestedItem;
			derived ref item nestedInterface : InterfaceUsage[0..*] subsets nestedConnection;
			derived ref item nestedAttribute : AttributeUsage[0..*] subsets nestedUsage;
			derived ref item nestedView : ViewUsage[0..*] subsets nestedPart;
			derived ref item nestedViewpoint : ViewpointUsage[0..*] subsets nestedRequirement;
			derived ref item nestedRendering : RenderingUsage[0..*] subsets nestedPart;
			derived ref item nestedVerificationCase : VerificationCaseUsage[0..*] subsets nestedCase;
			derived ref item nestedEnumeration : EnumerationUsage[0..*] subsets nestedAttribute;
			derived ref item nestedAllocation : AllocationUsage[0..*] subsets nestedConnection;
			derived ref item nestedConcern : ConcernUsage[0..*] subsets nestedRequirement;
			derived ref item nestedOccurrence : OccurrenceUsage[0..*] subsets nestedUsage;
			derived ref item definition : Classifier[0..*] redefines type;
			derived ref item nestedUseCase : UseCaseUsage[0..*] subsets nestedCase;
			derived ref item nestedFlow : FlowConnectionUsage[0..*] subsets nestedConnection;
			derived ref item nestedMetadata : MetadataUsage[0..*] subsets nestedItem;
		}		
				
		metadata def UseCaseDefinition specializes CaseDefinition {
			derived ref item includedUseCase : UseCaseUsage[0..*];
		}		
				
		metadata def UseCaseUsage specializes CaseUsage {
			derived ref item useCaseDefinition : UseCaseDefinition[0..1] redefines caseDefinition;
			derived ref item includedUseCase : UseCaseUsage[0..*];
		}		
				
		metadata def VariantMembership specializes OwningMembership {
			derived item ownedVariantUsage : Usage[1..1] redefines ownedMemberElement;
		}		
				
		metadata def VerificationCaseDefinition specializes CaseDefinition {
			derived ref item verifiedRequirement : RequirementUsage[0..*];
		}		
				
		metadata def VerificationCaseUsage specializes CaseUsage {
			derived ref item verificationCaseDefinition : VerificationCaseDefinition[0..1] subsets caseDefinition;
			derived ref item verifiedRequirement : RequirementUsage[0..*];
		}		
				
		metadata def ViewDefinition specializes PartDefinition {
			derived ref item 'view' : ViewUsage[0..*] subsets usage;
			derived ref item satisfiedViewpoint : ViewpointUsage[0..*] subsets ownedUsage;
			derived ref item viewRendering : RenderingUsage[0..1] subsets ownedUsage;
			derived ref item viewCondition : Expression[0..*] subsets ownedMember;
		}		
				
		metadata def ViewRenderingMembership specializes FeatureMembership {
			derived item ownedRendering : RenderingUsage[1..1] redefines ownedMemberFeature;
			derived ref item referencedRendering : RenderingUsage[1..1];
		}		
				
		metadata def ViewUsage specializes PartUsage {
			derived ref item viewDefinition : ViewDefinition[0..1] redefines partDefinition;
			derived ref item satisfiedViewpoint : ViewpointUsage[0..*] subsets nestedUsage;
			derived ref item exposedElement : Element[0..*] subsets member;
			derived ref item viewRendering : RenderingUsage[0..1] subsets nestedUsage;
			derived ref item viewCondition : Expression[0..*] subsets ownedMember;
		}		
				
		metadata def ViewpointDefinition specializes RequirementDefinition {
			derived ref item viewpointStakeholder : PartUsage[0..*];
		}		
				
		metadata def ViewpointUsage specializes RequirementUsage {
			derived ref item viewpointDefinition : ViewpointDefinition[0..1] redefines requirementDefinition;
			derived ref item viewpointStakeholder : PartUsage[0..*];
		}		
				
		metadata def WhileLoopActionUsage specializes LoopActionUsage {
			derived ref item whileArgument : Expression[1..1];
			derived ref item untilArgument : Expression[0..1];
		}		
				
	}
	
}
