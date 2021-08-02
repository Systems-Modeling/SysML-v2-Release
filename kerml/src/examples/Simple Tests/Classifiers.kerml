package Classifiers {
	classifier A;
	classifier B;
	
	specialization Super subclassifier A specializes B;
	specialization subclassifier B :> A;
	
	subclassifier C specializes A;
	subclassifier C specializes B;
	
	classifier C specializes A, B;
}