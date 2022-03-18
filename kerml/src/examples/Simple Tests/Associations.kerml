package Associations {	
	assoc A {
		end x;
		end y[1..*];
	}
	
	assoc B specializes A {
		end x1;
		end y1[0..*] redefines y;
	}
}