package 'Messaging Example' {
	item def Scene;
	item def Image;
	item def Picture;
	
	attribute def Show {
		item picture : Picture;
	}
	
	action def Focus(in scene : Scene, out image : Image);
	action def Shoot(in image : Image, out picture : Picture);
	action def TakePicture;
	
	action screen;
		
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
		
		then send Show(shoot::picture) to screen;
	}
}