package OccurrenceTest {
	occurrence def Occ {
		attribute a;
		ref occurrence occ1 : Occ;
		occurrence occ2 : Occ;
		
		individual snapshot s : Ind;
		timeslice t;
	}

	individual occurrence def Ind {
		snapshot s2;
		timeslice t2;
	}
	individual occurrence ind : Ind, Occ {
		snapshot s3;
		individual timeslice t3;
	}
	
	individual snapshot s4 : Ind;
}