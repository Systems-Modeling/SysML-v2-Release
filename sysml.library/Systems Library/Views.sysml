/**
 * This package defines the base types for views, viewpoints, renderings and related elements 
 * in the SysML language.
 */
package Views {
	import Parts::Part;
	import Parts::parts;
	import Requirements::RequirementCheck;
	import Requirements::requirementChecks;
	
	abstract view def View :> Part {
		ref view :>> self : View;
		
		/**
		 * Other Views that are used in the rendering of this View.
		 */
		abstract ref view subviews : View[0..*] :> views;
		
		rendering render : Rendering[0..1];
		
		viewpoint viewpointSatisfactions : ViewpointCheck[0..*];
		
		satisfy requirement viewpointConformance by View::self {
			require viewpointSatisfactions;
		}
	}
	
	/**
	 * ViewpointCheck is a RequirementCheck for checking if a View meets the concerns of viewpoint stakeholders. 
	 * It is the base type of all ViewpointDefinitions.
	 */
	abstract viewpoint def ViewpointCheck :> RequirementCheck {
		ref viewpoint thisViewpoint : ViewpointCheck :>> thisRequirement;		
		subject : View[1];
	}
	
	/**
	 * Rendering is the base type of all RenderingDefinitions.
	 */
	abstract rendering def Rendering :> Part {
		ref part :>> self : Rendering;
		
		/**
		 * Other Renderings used to carry out this Rendering.
		 */
		abstract ref rendering subrenderings : Rendering[0..*] :> renderings;
	}
	
	/**
	 * views is the base feature of all ViewUsages.
	 */
	abstract view views : View[0..*] :> parts;
	
	/**
	 * viewpointChecks is the base feature of all ViewpointUsages.
	 */
	abstract viewpoint viewpointChecks : ViewpointCheck[0..*] :> requirementChecks;
	
	/**
	 * renderings is the base feature of all RenderingUsages.
	 */
	abstract rendering renderings : Rendering[0..*] :> parts;
}