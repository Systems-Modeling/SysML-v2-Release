package Classes {
	
	feature f: A;

	public class <'1'> A { 
		feature b: B;
		protected in c: C;
	}
	
	abstract class <'2'> B {
		public abstract feature a: A;
		package P { }
	}
	
	private class C specializes Classes::'2' {
		private y: A, '2'[0..*];
		z is y;
	}
	
}