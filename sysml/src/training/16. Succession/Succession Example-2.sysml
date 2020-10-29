package 'Succession Example-2' {
	part def Scene;
	part def Image;
	part def Picture;
	
	action def Focus(in scene : Scene, out image : Image);
	action def Shoot(in image: Image, out picture : Picture);	
	action def TakePicture(in scene : Scene, out picture : Picture);
		
	action takePicture : TakePicture {
		in item scene;
		out item picture;
		
		action focus : Focus {
			in item scene = takePicture::scene; 
			out item image;
		}
		
		then action shoot: Shoot {
			in item image stream from focus::image;
			out item picture = takePicture::picture;
		}
	}
	
}