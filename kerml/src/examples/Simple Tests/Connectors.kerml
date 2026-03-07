package Connectors {
	
	class A {
		feature a : A;
		feature b : A;
		
		connector c1 from a to b;
		abstract connector c2 = c1;
		connector = c2 {
			end feature references a;
			end feature references b;
		}
		
		binding a = b;
		binding ab of a = b;
		binding {
			end feature references a;
			end feature references b;
		}
		binding ab1 : AS of a = b;
		
		succession a then b;
		succession s first a then b;
		succession {
			end feature references a;
			end feature references b;
		}
		succession s1 : AS first a then b;
		
	}
	
	class B {
	    feature a : A; 
	    connector :> a.c1 from a.a to a.b;
	}
	
	assoc struct AS {
		end a;
		end b;
	}
	
	
}