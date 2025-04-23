package TimeVaryingSteps {
	behavior TakePicture {
 		// var step merge : MergePerformance [0..1];
 		member step merge : ControlPerformances::MergePerformance [0..1] featured by TakePicture_snapshots {
 			member feature TakePicture_snapshots :>> Occurrences::Occurrence::snapshots featured by TakePicture {
 				public import merge;
 			}
 		}
 		
		// var step focus [0..1];
 		member step focus [0..1] featured by TakePicture_snapshots {
 			member feature TakePicture_snapshots :>> Occurrences::Occurrence::snapshots featured by TakePicture {
 				public import focus;
 			}
 		}
 		
 		// var step shoot [0..1];
 		member step shoot [0..1] featured by TakePicture_snapshots {
 			member feature TakePicture_snapshots :>> Occurrences::Occurrence::snapshots featured by TakePicture {
 				public import shoot;
 			}
 		}
 		
 		// var step decide : DecisionPerformance [0..1];
 		member step decide : ControlPerformances::DecisionPerformance [0..1] featured by TakePicture_snapshots {
 			member feature TakePicture_snapshots :>> Occurrences::Occurrence::snapshots featured by TakePicture {
 				public import decide;
 			}
 		}
 		
 		succession first [0..1] startShot then  [1] merge::TakePicture_snapshots.merge;
 		succession first [1] merge::TakePicture_snapshots.merge then [1] focus::TakePicture_snapshots.focus;
  		succession first [1] focus::TakePicture_snapshots.focus then shoot::TakePicture_snapshots.shoot;
  		succession first [1] shoot::TakePicture_snapshots.shoot then [1] decide::TakePicture_snapshots.decide;
  		succession first [0..1] decide::TakePicture_snapshots.decide then [0..1] merge::TakePicture_snapshots.merge;
  		succession first [1] decide::TakePicture_snapshots.decide then[0..1] endShot;
  	}
	
	struct Camera {
		// Is always taking a picture, one at a time.
		// var step takePic : TakePicture [1];		
		member step takePic : TakePicture [1] featured by Camera_snapshots {
 			member feature Camera_snapshots :>> Occurrences::Occurrence::snapshots featured by Camera;
		}
	}

	struct MultiCamera {
		// Can take many pictures at one time.
		// var step takePics : TakePicture [0..*];		
		member step takePics : TakePicture [0..*] featured by Camera_snapshots {
 			member feature Camera_snapshots :>> Occurrences::Occurrence::snapshots featured by Camera;
		}
	}

}