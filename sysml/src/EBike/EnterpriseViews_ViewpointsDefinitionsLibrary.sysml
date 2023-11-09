library package EnterpriseViews_ViewpointsDefinitionsLibrary{
    	doc 'Enterprise Views and Viewpoints' /* This package contains the Views and the Viewpoints needed to resolve the conerns of the stakeholders */
    	package EnterpriseViewpointDefinitions{
    		doc 'Enterprise Viewpoint Definitions' /* This package contains de viewpoint definitions and the stakeholders and their concerns */
    		viewpoint 'Package structure'{
    			frame concern PackageStructureViewpoint;
    			require constraint {
    				doc /* A Package Structure view shall display only the packages structure. Starting wit a specified root package */
    			}
    		}
    		part def Architect;
    		concern def	PackageStructureViewpoint{
    			doc /* Represent the package structure */
    			stakeholder Architect;
    		}
    	}
    	package EnterpriseViewDefinitions{
    		doc 'Enterprise View Definitions' /* This package imports Views to access rendering library from sysml.library and defines views for the models */
    		import Views::*;
    		view def PackageStructureView{
    			filter @SysML::Package;
    		}
    	}
}