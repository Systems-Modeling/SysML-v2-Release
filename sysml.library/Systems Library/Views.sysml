/**
 * This package defines the base types for views, viewpoints, renderings and related elements 
 * in the SysML language.
 */
package Views {
	private import Parts::Part;
	private import Parts::parts;
	private import Requirements::RequirementCheck;
	private import Requirements::requirementChecks;
	
	abstract view def View :> Part {
		ref view self : View :>> Part::self;
		
		/**
		 * Other Views that are used in the rendering of this View.
		 */
		abstract ref view subviews : View[0..*] :> views;
		
		/**
		 * The rendering of this View.
		 */
		abstract ref rendering viewRendering : Rendering[0..1];
		
		/**
		 * Checks that the View satisfies all required ViewpointsUsages.
		 */
		viewpoint viewpointSatisfactions : ViewpointCheck[0..*];
		
		/**
		 * An assertion that all viewpointSatisfactions are true.
		 */
		satisfy requirement viewpointConformance by View::self {
			/** The required ViewpointChecks. */
			require viewpointSatisfactions;
		}
	}
	
	/**
	 * ViewpointCheck is a RequirementCheck for checking if a View meets the concerns of viewpoint stakeholders. 
	 * It is the base type of all ViewpointDefinitions.
	 */
	abstract viewpoint def ViewpointCheck :> RequirementCheck {
		ref viewpoint thisViewpoint : ViewpointCheck :>> thisRequirement;		
		subject subj : View[1] :>> RequirementCheck::subj;
	}
	
	/**
	 * Rendering is the base type of all RenderingDefinitions.
	 */
	abstract rendering def Rendering :> Part {
		ref rendering self : Rendering :>> Part::self;
		
		/**
		 * Other Renderings used to carry out this Rendering.
		 */
		abstract ref rendering subrenderings : Rendering[0..*] :> renderings;
	}
	
	/**
	 * A TextualRendering is a Rendering of a View into a textual format.
	 */
	rendering def TextualRendering :> Rendering;

	/**
	 * A GraphicalRendering is a Rendering of a View into a Graphical format.
	 */
	rendering def GraphicalRendering :> Rendering;

	/**
	 * A TabularRendering is a Rendering of a View into a tabular format.
	 */
	rendering def TabularRendering :> Rendering;
	
	/**
	 * views is the base feature of all ViewUsages.
	 */
	abstract view views : View[0..*] nonunique :> parts;
	
	/**
	 * viewpointChecks is the base feature of all ViewpointUsages.
	 */
	abstract viewpoint viewpointChecks : ViewpointCheck[0..*] nonunique :> requirementChecks;
	
	/**
	 * renderings is the base feature of all RenderingUsages.
	 */
	abstract rendering renderings : Rendering[0..*] nonunique :> parts;
	
	/**
	 * asTextualNotation renders a View into textual notation as defined in the 
	 * KerML and SysML specifications.
	 */
	rendering asTextualNotation : TextualRendering[1] :> renderings;
	
	/**
	 * asTreeDiagram renders a View as a tree diagram, using the 
	 * graphical notation defined in the SysML specification.
	 */
	rendering asTreeDiagram : GraphicalRendering[1] :> renderings;
	
	/**
	 * asInterconnectionDiagram renders a View as an interconnection 
	 * diagram, using the graphical notation defined in the SysML specification.
	 */
	rendering asInterconnectionDiagram : GraphicalRendering[1] :> renderings;
	
	/**
	 * asElementTable  renders a View as a table, with one row for each exposed 
	 * Element and columns rendered by applying the columnViews in order to the
	 * Element in each row.
	 */
	rendering asElementTable : TabularRendering[1] :> renderings {
		/**
		 * The Views to be rendered in the column cells, in order, of each rows of the table.
		 */
		view columnView[0..*] ordered {
			abstract ref rendering :>> viewRendering[0..1];
		}
		rendering :>> subrenderings[0..*] = columnView.viewRendering;
	}
}