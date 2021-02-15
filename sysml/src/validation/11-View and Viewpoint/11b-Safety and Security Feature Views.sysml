package '11b-Safety and Security Feaure Views' {
	import ScalarValues::*;
	
	package AnnotationDefinitions {	
		attribute def Safety {
			attribute isMandatory : Boolean;
		}
		attribute def Security;
	}
	
	package PartsTree {
		import AnnotationDefinitions::*;
		part vehicle {
			part interior {
				part alarm {@Security;}
				part seatBelt[2] {@Safety{isMandatory = true;}}
				part frontSeat[2];
				part driverAirBag {@Safety{isMandatory = false;}}
			}
			part bodyAssy {
				part body;
				part bumper {@Safety{isMandatory = true;}}
				part keylessEntry {@Security;}
			}
			part wheelAssy {
				part wheel[2];
				part antilockBrakes[2] {@Safety{isMandatory = false;}}
			}
		}
	}

	package ViewDefinitions {	
		import AnnotationDefinitions::*;
		view def SafetyFeatureView {
			/* Parts that contribute to safety. */		
			filter @Safety;
			rendering : Renderings::Tree;
		}
		
		view def SafetyOrSecurityFeatureView {
			/* Parts that contribute to safety OR security. */		 
			filter @Safety | @Security;
		}	
	}
	
	package Views {
		import ViewDefinitions::*;
		import PartsTree::vehicle;
		
		view vehicleSafetyFeatureView : SafetyFeatureView {
			expose vehicle::**;
		}
		
		view vehicleMandatorySafetyFeatureView :> vehicleSafetyFeatureView {
			filter Safety::isMandatory;
		}
		
		view vehicleMandatorySafetyFeatureViewStandalone {
			expose vehicle::**[@Safety && Safety::isMandatory];
			rendering : Renderings::Table;
		}	
	}
	
	/** Needs to move to the library. */
	package Renderings {
		rendering def Table;
		rendering def Tree;
	}
}