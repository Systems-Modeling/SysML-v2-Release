package PartTest {
	
	part f: A;

	public part def A {
		part id '1' b: B;
		protected port c: C;
	}
	
	abstract part def id xx B {
		public abstract part a: A;
		port x: ~C;
		package P { }
	}
	
	private port def C {
		private in ref y: A, B;
		import y as z1;
		alias y as z2;
	}
	
}