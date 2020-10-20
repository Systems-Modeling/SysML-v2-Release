package 'Action Allocation Example' {
	import 'Action Decomposition'::*;
	
	part def Camera;
	part def AutoFocus;
	part def Imager;
	
	part camera : Camera {
		ref views : Scene[*] ordered = takePhoto::scene;
		ref photos : Picture[*] ordered = takePhoto::picture;
		
		perform action takePhoto[*] ordered 
			:> takePicture (in scene, out picture);
		
		part f : AutoFocus {
			perform takePhoto::focus;			
		}
		
		part i : Imager {
			perform takePhoto::shoot;
		}		
	}
}
