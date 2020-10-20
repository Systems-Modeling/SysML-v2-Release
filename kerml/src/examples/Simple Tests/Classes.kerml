package Classes {
	
	feature f: A;

	public class id '1' A { 
		feature b: B;
		protected in port c: C;
	}
	
	abstract class id '2' B {
		public abstract feature a: A;
		package P { }
	}
	
	private class C specializes Classes::'2' {
		private y: A, '2'[0..*];
		z is y;
	}
	
}