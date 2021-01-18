package 'Signaling Example' {
	part def Scene;
	part def Image;
	part def Picture;
	
	action def Focus(in scene : Scene, out image : Image);
	action def Shoot(in image : Image, out picture : Picture);
	action def TakePicture;
	
	action display;
		
	action takePicture : TakePicture {
		action trigger accept scene : Scene;
		
		then action focus : Focus {
			in item scene = trigger::scene;
			out item image;
		}
		
		then action shoot : Shoot {
			in item image stream from focus::image; 
			out item picture;
		}
		
		then send shoot::picture to display;
	}
}