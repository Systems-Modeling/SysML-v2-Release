package SysML {
	import KerML::*;

	metadata def Dependency :> Relationship;
	
	metadata def Definition :> Classifier;
	metadata def Usage :> Feature;
	metadata def ReferenceUsage :> Usage;
	metadata def VariantMembership :> Membership;
	
	metadata def EnumerationDefinition :> AttributeDefinition;
	metadata def EnumerationUsage :> AttributeUsage;
	
	metadata def AttributeDefinition :> Definition, DataType;
	metadata def AttributeUsage :> Usage;
	
	metadata def OccurrenceDefinition :> Definition, Class;
	metadata def OccurrenceUsage :> Usage;
	metadata def LifeClass :> Class;
	metadata def PortioningFeature :> Feature;
	metadata def EventOccurrenceUsage :> OccurrenceUsage;
	
	metadata def ItemDefinition :> OccurrenceDefinition, Structure;
	metadata def ItemUsage :> OccurrenceUsage;
	
	metadata def MetadataDefinition :> ItemDefinition, Metaclass;
	metadata def MetadataUsage :> ItemDefinition, MetadataFeature;
	
	metadata def PartDefinition :> ItemDefinition;
	metadata def PartUsage :> ItemUsage;
	
	metadata def PortDefinition :> OccurrenceDefinition, Structure;
	metadata def ConjugatePortDefinition :> PortDefinition;
	metadata def PortUsage :> OccurrenceUsage;
	metadata def PortConjuation :> Conjugation;
	metadata def ConjugatePortTyping :> FeatureTyping;
	
	metadata def ConnectionDefinition :> PartDefinition, AssociationStructure;
	abstract metadata def ConnectorAsUsage :> Connector, Usage;
	metadata def BindingConnectorAsUsage :> BindingConnector, ConnectorAsUsage;
	metadata def SuccessionAsUsage :> Succession, ConnectorAsUsage;
	metadata def ConnectionUsage :> PartUsage, ConnectorAsUsage;
	metadata def FlowConnectionUsage :> ItemFlow, ConnectionUsage;
	metadata def SuccessionFlowConnectionUsage :> SuccessionItemFlow, ConnectionUsage;
	
	metadata def InterfaceDefinition :> ConnectionDefinition;
	metadata def InterfaceUsage :> ConnectionUsage;
	
	metadata def AllocationDefinition :> ConnectionDefinition;
	metadata def AllocationUsage :> ConnectionUsage;
	
	metadata def ActionDefinition :> OccurrenceDefinition, Behavior;
	metadata def ActionUsage :> OccurrenceUsage, Step;
	metadata def PerformActionUsage :> EventOccurrenceUsage, ActionUsage;
	metadata def SendActionUsage :> ActionUsage;
	metadata def AcceptActionUsage :> ActionUsage;
	metadata def ControlNode :> ActionUsage;
	metadata def MergeNode :> ControlNode;
	metadata def DecisionNode :> ControlNode;
	metadata def ForkNode :> ControlNode;
	metadata def JoinNode :> ControlNode;
	metadata def AssignmentActionUsage :> ActionUsage;
	metadata def IfActionUsage :> ActionUsage;
	abstract metadata def LoopActionUsage :> ActionUsage;
	metadata def WhileLoopActionUsage :> LoopActionUsage;
	metadata def ForLoopActionUsage :> LoopActionUsage;
	metadata def TriggerInvocationExpression :> InvocationExpression;
	
	metadata def StateDefinition :> ActionDefinition;
	metadata def StateUsage :> ActionUsage;
	metadata def ExhibitStateUsage :> PerformActionUsage, StateUsage;
	metadata def TransitionUsage :> ActionUsage;
	metadata def StateSubactionMembership :> FeatureMembership;
	metadata def TransitionFeatureMembership :> FeatureMembership;
	
	metadata def CalculationDefinition :> ActionDefinition, Function;
	metadata def CalculationUsage :> ActionUsage, Expression;
	
	metadata def ConstraintDefinition :> OccurrenceDefinition, Predicate;
	metadata def ConstraintUsage :> OccurrenceUsage, BooleanExpression;
	metadata def AssertConstraintUsage :> ConstraintUsage, Invariant;
	
	metadata def RequirementDefinition :> ConstraintDefinition;
	metadata def RequirementUsage :> ConstraintUsage;
	metadata def SatisfyRequirementUsage :> RequirementUsage, AssertConstraintUsage;
	metadata def SubjectMembership :> FeatureMembership;
	metadata def ActorMembership :> FeatureMembership;
	metadata def StakeholderMembership :> FeatureMembership;
	metadata def RequirementConstraintMembership :> FeatureMembership;
	
	metadata def ConcernDefinition :> RequirementDefinition;
	metadata def ConcernUsage :> RequirementUsage;
	metadata def FramedConcernMembership :> RequirementConstraintMembership;
	
	metadata def CaseDefinition :> CalculationDefinition;
	metadata def CaseUsage :> CalculationUsage;
	metadata def ObjectiveMembership :> FeatureMembership;
	
	metadata def AnalysisCaseDefinition :> CaseDefinition;
	metadata def AnalysisCaseUsage :> CaseUsage;
	
	metadata def VerificationCaseDefinition :> CaseDefinition;
	metadata def VerificationCaseUsage :> CaseUsage;
	metadata def RequirementVerificationMembership :> FeatureMembership;
	
	metadata def UseCaseDefinition :> CaseDefinition;
	metadata def UseCaseUsage :> CaseUsage;
	metadata def IncludeUseCaseUsage :> PerformActionUsage, UseCaseUsage;
	
	metadata def ViewDefinition :> PartDefinition;
	metadata def ViewUsage :> PartUsage;
	metadata def Expose :> Import;
	
	metadata def ViewpointDefinition :> RequirementDefinition;
	metadata def ViewpointUsage :> RequirementUsage;
	
	metadata def RenderingDefinition :> PartDefinition;
	metadata def RenderingUsage :> PartUsage;
	metadata def ViewRenderingMembership :> FeatureMembership;
	
}