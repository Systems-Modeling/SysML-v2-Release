package SysML {
	import KerML::*;

	item def Dependency :> Relationship;
	
	abstract item def Definition :> Classifier;
	abstract item def Usage :> Feature;
	item def ReferenceUsage :> Usage;
	item def VariantMembership :> Membership;
	
	item def EnumerationDefinition :> AttributeDefinition;
	item def EnumerationUsage :> AttributeUsage;
	
	item def AttributeDefinition :> Definition, DataType;
	item def AttributeUsage :> Usage;
	
	item def OccurrenceDefinition :> Definition, Class;
	item def OccurrenceUsage :> Usage;
	item def LifeClass :> Class;
	item def PortioningFeature :> Feature;
	item def EventOccurrenceUsage :> OccurrenceUsage;
	
	item def ItemDefinition :> OccurrenceDefinition, Structure;
	item def ItemUsage :> OccurrenceUsage;
	
	item def PartDefinition :> ItemDefinition;
	item def PartUsage :> ItemUsage;
	
	item def PortDefinition :> OccurrenceDefinition, Structure;
	item def ConjugatePortDefinition :> PortDefinition;
	item def PortUsage :> OccurrenceUsage;
	item def PortConjuation :> Conjugation;
	item def ConjugatePortTyping :> FeatureTyping;
	
	item def ConnectionDefinition :> PartDefinition, AssociationStructure;
	abstract item def ConnectorAsUsage :> Connector, Usage;
	item def BindingConnectorAsUsage :> BindingConnector, ConnectorAsUsage;
	item def SuccessionAsUsage :> Succession, ConnectorAsUsage;
	item def ConnectionUsage :> PartUsage, ConnectorAsUsage;
	item def FlowConnectionUsage :> ItemFlow, ConnectionUsage;
	item def SuccessionFlowConnectionUsage :> SuccessionItemFlow, ConnectionUsage;
	
	item def InterfaceDefinition :> ConnectionDefinition;
	item def InterfaceUsage :> ConnectionUsage;
	
	item def AllocationDefinition :> ConnectionDefinition;
	item def AllocationUsage :> ConnectionUsage;
	
	item def ActionDefinition :> OccurrenceDefinition, Behavior;
	item def ActionUsage :> OccurrenceUsage, Step;
	item def PerformActionUsage :> EventOccurrenceUsage, ActionUsage;
	item def SendActionUsage :> ActionUsage;
	item def AcceptActionUsage :> ActionUsage;
	item def ControlNode :> ActionUsage;
	item def MergeNode :> ControlNode;
	item def DecisionNode :> ControlNode;
	item def ForkNode :> ControlNode;
	item def JoinNode :> ControlNode;
	item def AssignmentActionUsage :> ActionUsage;
	item def IfActionUsage :> ActionUsage;
	abstract item def LoopActionUsage :> ActionUsage;
	item def WhileLoopActionUsage :> LoopActionUsage;
	item def ForLoopActionUsage :> LoopActionUsage;
	
	item def StateDefinition :> ActionDefinition;
	item def StateUsage :> ActionUsage;
	item def ExhibitStateUsage :> PerformActionUsage, StateUsage;
	item def TransitionUsage :> ActionUsage;
	item def StateSubactionMembership :> FeatureMembership;
	item def TransitionFeatureMembership :> FeatureMembership;
	
	item def CalculationDefinition :> ActionDefinition, Function;
	item def CalculationUsage :> ActionUsage, Expression;
	
	item def ConstraintDefinition :> OccurrenceDefinition, Predicate;
	item def ConstraintUsage :> OccurrenceUsage, BooleanExpression;
	item def AssertConstraintUsage :> ConstraintUsage, Invariant;
	
	item def RequirementDefinition :> ConstraintDefinition;
	item def RequirementUsage :> ConstraintUsage;
	item def SatisfyRequirementUsage :> RequirementUsage, AssertConstraintUsage;
	item def SubjectMembership :> FeatureMembership;
	item def ActorMembership :> FeatureMembership;
	item def StakeholderMembership :> FeatureMembership;
	item def RequirementConstraintMembership :> FeatureMembership;
	
	item def ConcernDefinition :> RequirementDefinition;
	item def ConcernUsage :> RequirementUsage;
	item def FramedConcernMembership :> RequirementConstraintMembership;
	
	item def CaseDefinition :> CalculationDefinition;
	item def CaseUsage :> CalculationUsage;
	item def ObjectiveMembership :> FeatureMembership;
	
	item def AnalysisCaseDefinition :> CaseDefinition;
	item def AnalysisCaseUsage :> CaseUsage;
	
	item def VerificationCaseDefinition :> CaseDefinition;
	item def VerificationCaseUsage :> CaseUsage;
	item def RequirementVerificationMembership :> FeatureMembership;
	
	item def UseCaseDefinition :> CaseDefinition;
	item def UseCaseUsage :> CaseUsage;
	item def IncludeUseCaseUsage :> PerformActionUsage, UseCaseUsage;
	
	item def ViewDefinition :> PartDefinition;
	item def ViewUsage :> PartUsage;
	item def Expose :> Import;
	
	item def ViewpointDefinition :> RequirementDefinition;
	item def ViewpointUsage :> RequirementUsage;
	
	item def RenderingDefinition :> PartDefinition;
	item def RenderingUsage :> PartUsage;
	item def ViewRenderingMembership :> FeatureMembership;
	
}