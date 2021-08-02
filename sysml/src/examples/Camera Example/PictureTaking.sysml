package PictureTaking {
	part def Exposure;
	
	action def Focus(out xrsl: Exposure);
	action def Shoot(in xsf: Exposure);	
		
	action takePicture() {		
		action focus: Focus[1] (out xrsl);	
		action shoot: Shoot[1] (in xsf flow from focus.xrsl);
	}
}