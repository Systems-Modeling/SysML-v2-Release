abstract type A specializes Base::Anything;
type all x specializes A, Base::things;

// This Type has exactly one instance.
type Singleton[1] specializes Base::Anything;

type Super specializes Base::Anything {
    private package P {
        type Sub specializes Super;
    }
    protected feature f : P::Sub;
}

type B :> Base::Anything;

generalization Gen subtype A specializes B;
generalization subtype x :> Base::things;

type Original specializes Base::Anything {
    in feature Input; 
}
type Conjugate1 specializes Base::Anything;
type Conjugate2 specializes Base::Anything;
conjugation c1 type Conjugate1 conjugates Original; 
conjugation c2 type Conjugate2 ~ Original; 

type Conjugate3 conjugates Original;
type Conjugate4 ~ Conjugate1;