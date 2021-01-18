/**
 * This package contains definitions for metadata annotations related
 * to analysis tool integration.
 */
package AnalysisTooling {
	private import ScalarValues::*;
	
	/**
	 * ToolExecution metadata identifies an external analysis tool to be
	 * used to implement the annotated action.
	 */
	attribute def ToolExecution {
		attribute toolName : String;
		attribute uri : String;
	}
	
	/**
	 * ToolVariable metadata is used in the context of an action that has
	 * been annotated with ToolExecution metadata. It is used to annotate
	 * a parameter or other feature of the action with the name of the
	 * variable in the tool that is to correspond to the annotated
	 * feature.
	 */
	attribute def ToolVariable {
		attribute name : String;
	}
	
}