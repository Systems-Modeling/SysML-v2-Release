classifier A;
classifier B;

generalization Super subclass A specializes B;
generalization subclass B :> A;

subclass C specializes A;
subclass C specializes B;

classifier C specializes A, B;