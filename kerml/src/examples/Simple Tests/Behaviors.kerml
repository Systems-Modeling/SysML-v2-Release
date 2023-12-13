package Behaviors {
    behavior A {
        in x;
        out y = b.y1;
        composite step b : B {
            in x1 = A::x;
        }
    }
    behavior B specializes A {
        in x1;
        out y1;
    }
}