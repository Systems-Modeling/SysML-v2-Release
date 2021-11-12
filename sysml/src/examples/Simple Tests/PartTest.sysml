package PartTest {
	
	part f: A;

	public part def A {
		part <'1'> b: B;
		protected port c: C;
		readonly attribute x[0..2];
		derived ref attribute y :> x;
	}
	
	abstract part def <xx> B {
		public abstract part a: A;
		port x: ~C;
		package P { }
	}
	
	private port def C {
		private in ref y: A, B;
		alias z1 for y;
		alias z2 for y;
	}
	
}