package 'Action Definition Example-1' {
	item def Scene;
	item def Image;
	item def Picture;
	
	action def Focus(in item scene : Scene, out item image : Image);
	action def Shoot(in item image: Image, out item picture : Picture);	
		
	action def TakePicture {
		in item scene : Scene;
		out item picture : Picture;
		
		action focus: Focus {
			in item scene = TakePicture::scene;
			out item image;
		}
		
		action shoot: Shoot {
			in item image flow from focus.image;
			out item picture = TakePicture::picture;
		}
	}
	
}