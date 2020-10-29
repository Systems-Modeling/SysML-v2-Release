class Camera {
	import Base::*;
	import ScalarValues::*;
	import Occurrences::*;
	
	portion focusedState: Camera subsets Occurrence::timeSlices;
	portion shotState: Camera subsets Occurrence::timeSlices;
	
	succession focusedState then shotState;
}