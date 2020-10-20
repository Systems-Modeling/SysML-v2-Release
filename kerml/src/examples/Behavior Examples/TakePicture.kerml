behavior TakePicture() {
	import Base::*;
	import Camera;
	
	feature camera: Camera[1] subsets involvedObjects {
		// Note: In the future, these "connection point" redefinitions 
		// will be automatic.
		feature focusedState redefines Camera::focusedState;
		feature shotState redefines Camera::shotState;
	}
	
	class Exposure;
	
	behavior Focus(out xrsl: Exposure);
	behavior Shoot(in xsf: Exposure);	
	
	composite step step1: Focus[1] (out xrsl);	
	composite step step2: Shoot[1] (in xsf);
	
	composite flow exposure[1] from step1::xrsl to step2::xsf;

//	The above flow is semantically equivalent to the following:
//	
//	feature succFlow subsets Transfers::flows {
//		import Transfers::*;
//		feature item: Exposure[1] redefines Transfer::item;
//		feature transferSource subsets step1 redefines TransferBefore::transferSource {
//			feature sourceOutput redefines step1::xrsl, Transfer::transferSource::sourceOutput;
//		}
//		feature transferTarget subsets step2 redefines TransferBefore::transferTarget {
//			feature targetInput redefines step2::xsf, Transfer::transferTarget::targetInput;
//		}
//	}
	
	composite succession step1 then camera::focusedState;
	composite succession step2 then camera::shotState;
}
