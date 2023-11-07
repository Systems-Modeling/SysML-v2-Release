library package EnterpriseViews_ViewpointsDefinitionsLibrary{
    	doc 'Enterprise Views and Viewpoints' /* This package contains the Views and the Viewpoints needed to resolve the conerns of the stakeholders */
    	package EnterpriseViewpointDefinitions{
    		doc 'Enterprise Viewpoint Definitions' /* This package contains de viewpoint definitions and the stakeholders and their concerns */
    	}
    	package EnterpriseViewDefinitions{
    		doc 'Enterprise View Definitions' /* This package imports Views to access rendering library from sysml.library and defines views for the models */
    		import Views::*;
    	}
}