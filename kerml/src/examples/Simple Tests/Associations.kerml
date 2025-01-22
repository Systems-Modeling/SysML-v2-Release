package Associations {	
	assoc A {
		end x;
		end [1..*] feature y;
	}
	
	assoc B specializes A {
		end x1;
		end [0..*] feature y1 redefines y;
	}
}