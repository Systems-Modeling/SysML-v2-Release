package Q {
  classifier F {
  	feature a;
  }
  
  feature f : F;
  
  classifier A {
    feature g = f.a;
  }
  
  classifier B {
  	feature f : F;
  	feature a : A;
  }
  
  feature b : B {
  	connector f.a to a.g;
  	binding f.a = a.g;
  }
}
