package StateTest {
	attribute def Sig {
		x;
	}
	attribute def Exit;
	
	part p;
	
	action act;
	
	state def S {
		entry action A; then S1;
		do action B;
		exit act;
		
		state S1;
		
		state S2 {
			do send Sig(T::s::x) to p;
		}
		accept Exit then done;
		
		transition
			first S1
			accept s : Sig
			do action D
			then S2;
		
		transition T
			first S2
			accept s : Sig
			if true
			do send s to p
			then S1;		
	}
}