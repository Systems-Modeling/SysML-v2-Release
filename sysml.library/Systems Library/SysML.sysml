package SysML {
	import KerML::*;

	item def Dependency :> Relationship;
	
	item def Definition :> Classifier;
	item def Usage :> Feature;
	item def VariantMembership :> Membership;
	
	item def AttributeDefinition :> Definition, DataType;
	item def AttributeUsage :> Usage;
	
	item def EnumerationDefinition :> AttributeDefinition;
	item def EnumerationUsage :> AttributeUsage;
	
	item def ItemDefinition :> Definition, Structure;
	item def ItemUsage :> Usage;
	
	item def PartDefinition :> ItemDefinition;
	item def PartUsage :> ItemUsage;
	
	item def PortDefinition :> Definition;
	item def ConjugatePortDefinition :> PortDefinition;
	item def PortUsage :> Usage;
	item def PortConjuation :> Conjugation;
	item def ConjugatePortTyping :> FeatureTyping;
	
	item def ConnectionDefinition :> PartDefinition, AssociationStructure;
	item def ConnectionUsage :> PartUsage, Connector;
	
	item def InterfaceDefinition :> ConnectionDefinition;
	item def InterfaceUsage :> ConnectionUsage;
	
	item def AllocationDefinition :> ConnectionDefinition;
	item def AllocationUsage :> ConnectionUsage;
	
	item def IndividualDefinition :> ItemDefinition;
	item def IndividualUsage :> ItemUsage;
	
	item def ActionDefinition :> Definition, Behavior;
	item def ActionUsage :> Usage, Step;
	item def PerformActionUsage :> ActionUsage;
	item def SendActionUsage :> ActionUsage;
	item def AcceptActionUsage :> ActionUsage;
	item def ControlNode :> ActionUsage;
	item def MergeNode :> ControlNode;
	item def DecisionNode :> ControlNode;
	item def ForkNode :> ControlNode;
	item def JoinNode :> ControlNode;
	
	item def StateDefinition :> ActionDefinition;
	item def StateUsage :> ActionUsage;
	item def ExhibitStateUsage :> StateUsage;
	item def TransitionUsage :> ActionUsage;
	item def StateSubactionMembership :> FeatureMembership;
	item def TransitionFeatureMembership :> FeatureMembership;
	
	
	item def CalculationDefinition :> ActionDefinition, Function;
	item def CalculationUsage :> ActionUsage, Expression;
	
	item def ConstraintDefinition :> Definition, Predicate;
	item def ConstraintUsage :> Usage, BooleanExpression;
	item def AssertConstraintUsage :> ConstraintUsage, Invariant;
	
	item def RequirementDefinition :> ConstraintDefinition;
	item def RequirementUsage :> ConstraintUsage;
	item def SatisfyRequirementUsage :> RequirementUsage, AssertConstraintUsage;
	item def SubjectMembership :> FeatureMembership;
	item def RequirementConstraintMembership :> FeatureMembership;
	
	item def ConcernDefinition :> RequirementDefinition;
	item def ConcernUsage :> RequirementUsage;
	
	item def StakeholderDefinition :> PartDefinition;
	item def StakeholderUsage :> PartUsage;
	
	item def CaseDefinition :> CalculationDefinition;
	item def CaseUsage :> CalculationUsage;
	item def ObjectiveMembership :> FeatureMembership;
	
	item def AnalysisCaseDefinition :> CaseDefinition;
	item def AnalysisCaseUsage :> CaseUsage;
	
	item def VerificationCaseDefinition :> CaseDefinition;
	item def VerificationCaseUsage :> CaseUsage;
	item def RequirementVerificationMembership :> FeatureMembership;
	
	item def ViewDefinition :> PartDefinition;
	item def ViewUsage :> PartUsage;
	item def Expose :> Import;
	
	item def ViewpointDefinition :> RequirementDefinition;
	item def ViewpointUsage :> RequirementUsage;
	
	item def RenderingDefinition :> PartDefinition;
	item def RenderingUsage :> PartUsage;
	
}