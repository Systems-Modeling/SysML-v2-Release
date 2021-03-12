package 'Merge Example' {
	part def Scene;
	part def Image;
	part def Picture;
	
	action def Focus(in item scene : Scene, out item image : Image);
	action def Shoot(in item image : Image, out item picture : Picture);
	action def Display(in item picture : Picture);
	action def TakePicture;
	
	action takePicture : TakePicture {
		first start;
		
		then merge continue;
			
		then action trigger {
			in item scene : Scene;
		}
		
		then action focus : Focus {
			in item scene stream from trigger::scene;
			out item image;
		}
		
		then action shoot : Shoot {
			in item image stream from focus::image;
			out item picture;
		}
		
		then action display : Display {
			in item picture stream from shoot::picture;
		}
		
		then continue;	
	}
}