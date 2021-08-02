package Q {
  part def F {
  	part a : A;
  }
  
  part f : F;
  
  part def A {
    part g = f.a;
  }
  
  part def B {
  	part f : F;
  	part a : A;
  }
  
  part def C {
	part b : B {
	  connect f.a to a.g;
	  bind f.a = a.g;
	}
  
	part c subsets b.f {
	  	part aa subsets a;
	}
	
	flow b.f.a to c.aa;
  }
	
}
