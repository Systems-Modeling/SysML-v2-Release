behavior TakePicture() {
	import Base::*;
	import Camera;
	
	feature camera: Camera[1] subsets involvedObjects;
	
	class Exposure;
	
	behavior Focus(out xrsl: Exposure);
	behavior Shoot(in xsf: Exposure);	
	
	step step1: Focus[1] (out xrsl);	
	step step2: Shoot[1] (in xsf);
	
	flow exposure[1] from step1.xrsl to step2.xsf;

	succession step1 then camera.focusedState;
	succession step2 then camera.shotState;
}
