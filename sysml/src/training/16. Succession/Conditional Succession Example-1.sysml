package 'Conditional Succession Example-1' {
	part def Scene;
	part def Image {
		isWellFocused: ScalarValues::Boolean;
	}
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
				
		succession focus 
			if focus.image.isWellFocused then shoot;
		
		action shoot : Shoot {
			in item image flow from focus.image; 
			out item picture = takePicture::picture;
		}
	}
	
}