package PartTest {
	
	part f: A;

	public part def A {
		part <'1'> b: B;
		protected port c: C;
		readonly attribute x[0..2];
		derived ref attribute y :> x;
		ref z : ScalarValues::Integer;
	}
	
	abstract part def <xx> B {
		public abstract part a: A;
		port x: ~C;
		package P { }
		
		action a1;
		perform action a2;
		
		state s1;
		exhibit state s2;
	}
	
	private port def C {
		private in ref y: A, B;
		alias z1 for y;
		alias z2 for y;
	}
	
}