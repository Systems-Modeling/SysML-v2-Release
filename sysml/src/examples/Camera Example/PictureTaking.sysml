package PictureTaking {
	part def Exposure;
	
	action def Focus { out xrsl: Exposure; }
	action def Shoot { in xsf: Exposure; }	
		
	action takePicture {		
		action focus: Focus[1];
		flow of Exposure from focus.xrsl to shoot.xsf;
		action shoot: Shoot[1];
	}
}