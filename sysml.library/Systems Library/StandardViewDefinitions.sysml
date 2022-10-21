standard library package StandardViewDefinitions {
    doc /*
         * This package defines the standard view definitions for the SysML language.
         */
    import SysML::*;

    view def <cv> ContainmentView {
        doc /*
             * View definition to present the hierarchical membership structure of model
             * elements starting from an exposed root element.
             * The typical rendering in graphical notation is as an indented list of rows,
             * consisting of dynamically collapsible-expandable nodes that represent
             * branches and leaves of the tree.
             */
    }

    view def <mv> MemberView {
        doc /*
             * View definition to present any members of exposed model element(s).
             * This is the most general view, enabling presentation of any model element.
             * The typical rendering in graphical notation is as a graph of nodes and edges.
             */
    }

    view def <pv> PackageView {
        doc /*
             * View definition to present package structure and content.
             * Owned or imported packages are presented as nodes and their members can
             * be presented in textual compartments.
             */
    }

    view def <duv> DefinitionAndUsageView {
        doc /*
             * View definition to present Definition and Usage members of exposed model
             * element(s), as well as the relationships between them.
             */
    }

    view def <tv> TreeView {
        doc /*
             * View definition to present exposed features as nodes, and membership
             * relationships as edges.
             * The typical rendering in graphical notation is as a graph of nodes and edges.
             */
    }

    view def <iv> InterconnectionView {
        doc /*
             * View definition to present exposed features as nodes, nested features as
             * nested nodes, and connections between features
             * as edges between (nested) nodes. Nested nodes may present boundary features
             * (e.g., ports, parameters).
             */
    }

    view def <afv> ActionFlowView specializes InterconnectionView {
        doc /*
             * View definition to present connections between actions.
             * Valid nodes and edges in an ActionFlowView are:
             * - Actions with nested actions
             * - Parameters with direction
             * - Flow connection usages (e.g., kinds of transfers from output to input)
             * - Binding connections between parameters (e.g., delegate a parameter from
             *   one level of nesting to another)
             * - Proxy connection points
             * - Swim lanes
             * - Conditional succession
             * - Control nodes (fork, join, decision, merge)
             * - Control structures, e.g., if-then-else, until-while-loop, for-loop
             * - Send and accept actions
             * - Change and time triggers
             * - Compartments on actions and parameters
             */
    }

    view def <stv> StateTransitionView specializes InterconnectionView {
        doc /*
             * View definition to present states and their transitions.
             * Valid nodes and edges in a StateTransitionView are:
             * - States with nested states
             * - Entry, do, and exit actions
             * - Transition usages with triggers, guards, and actions
             * - Compartments on states
             */
    }

    view def <sv> SequenceView {
        doc /*
             * View definition to present time ordering of event occurrences on lifelines
             * of exposed features.
             * Valid nodes and edges in a SequenceView are:
             * - Features such as parts with their lifelines
             * - Event occurrences on the lifelines
             * - Messages sent from one part to another with and without a type of flow
             * - Succession between event occurrences
             * - Nested sequence view (e.g., a reference to a view)
             * - Compartments
             * The typical rendering in graphical notation depicts the exposed features
             * horizontally along the top, with vertical lifelines. The time axis is
             * vertical, with time increasing from top to bottom.
             */
    }

    view def <ucv> UseCaseView {
        doc /*
             * View definition to present exposed use cases.
             * Valid nodes and edges in a UseCaseView are:
             * - Use case, with subject
             * - Actor
             * - Include relationship
             * - Objective
             * - Compartments
             * - Binding connection between an actor and an input parameter with same
             *   name (TBC)
             */
    }

    view def <rv> RequirementView {
        doc /*
             * View definition to present exposed requirements and their relationships.
             * Valid nodes and edges in a UseCaseView are:
             * - Requirement, including possible metadata
             * - Nested requirements
             * - Objective
             * - Requirement allocation
             * - Requirement satisfaction (shown in a satisfy requirements compartment)
             * - Verified by
             */
    }

    view def <acv> AnalysisCaseView {
        doc /*
             * View definition to present exposed analysis cases and their relationships.
             * Valid nodes and edges in an AnalysisCaseView are:
             * - Analysis case
             * - Actor
             * - Objective
             * - Action
             * - Calculation
             * - Compartments
             * - Binding connection between an actor and an input parameter with same
             *   name (TBC)
             */
    }

    view def <vcv> VerificationCaseView {
        doc /*
             * View definition to present exposed verification cases and their
             * relationships.
             * Valid nodes and edges in a VerificationCaseView are:
             * - Verification case, with subject, i.e., unit/article under verification
             * - Actor
             * - Objective
             * - Action, e.g., steps needed to perform the verification
             * - Requirement
             * - Verify relationship
             * - Compartments
             * - Binding connection between an actor and an input parameter with the
             *   same name
             */
    }

    view def <vvv> ViewAndViewpointView {
        doc /*
             * View definition to present exposed View and Viewpoint.
             * Valid nodes and edges in a ViewAndViewpointView are:
             * - View definition
             * - View usage
             * - Viewpoint definition
             * - Viewpoint Usage
             * - Stakeholder
             * - Concern definition
             * - Concern Usage
             * - Expose
             * - Exposed element
             * - Subclassification
             * - Defined by
             * - Subset
             * - Redefinition
             */
    }

    view def <lev> LanguageExtensionView {
        doc /*
             * View definition to present an exposed metadata definition used to extend
             * a library concept.
             */
    }

    view def <gv> GridView {
        doc /*
             * View definition to present exposed model elements and their relationships,
             * arranged in a rectangular grid.
             * GridView is the generalization of the following more specialized views:
             * - Tabular view
             * - Data value tabular view
             * - Relationship matrix view
             */
    }

    view def <gev> GeometryView {
        doc /*
             * View definition to present a visualization of exposed spatial items in two
             * or three dimensions
             * Valid nodes and edges in a GeometryView are:
             * - Spatial item, including shape
             * - Coordinate frame
             * - Feature related to spatial item, such as a quantity (e.g. temperature)
             *   of which values are to be rendered on a color scale
             * The typical rendering in graphical notation would include a number of
             * visualization parameters, such as:
             * - 2D or 3D view
             * - viewing direction
             * - zoom level
             * - light sources
             * - object projection mode, e.g., isometric, perspective, orthographic
             * - object rendering mode, e.g., shaded, wireframe, hidden line
             * - object pan (placement) and rotate (orientation) settings
             * - color maps
             */
    }
}
