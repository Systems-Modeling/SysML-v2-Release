package Q {
  part def F {
  	part a;
  }
  
  part f : F;
  
  part def A {
    part g = f.a;
  }
  
  part def B {
  	part f : F;
  	part a : A;
  }
  
  part b : B {
  	connect f.a to a.g;
  	bind f.a = a.g;
  }
}
