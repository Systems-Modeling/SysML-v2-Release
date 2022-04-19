package Filtering {
	import ScalarValues::*;
	
	package Annotations {
		metaclass ApprovalAnnotation {
			approved : Boolean;
			approver : String;
			level : Natural;
		}
	}
	
	package DesignModel {
	    import Annotations::*;
	    struct System {
	         @ApprovalAnnotation {
	            approved = true;
	            approver = "John Smith";
	            level = 2;
	        }
	    }
	}
	
	package UpperLevelApprovals {
	    import DesignModel::**;
	    filter @Annotations::ApprovalAnnotation && 
	           Annotations::ApprovalAnnotation::approved && 
	           Annotations::ApprovalAnnotation::level > 1;
	}
	
	package UpperLevelApprovals1 {
	    import Annotations::**;
	    import DesignModel::**[@ApprovalAnnotation && approved && level > 1];
	}

}