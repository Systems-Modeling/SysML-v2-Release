package ParameterTest {
	attribute def A {
		attribute x : ScalarValues::String;
		attribute y : A;
	}
	
	attribute a : A;
	
	calc def F { in p : A; in q : ScalarValues::Integer; return :  ScalarValues::Integer; }
	
	attribute f = F(a, 2);
	attribute g = F(q = 1, p = a);
	
	attribute b = new A(y=a, x=""); 
	attribute c = new A("test2");
}