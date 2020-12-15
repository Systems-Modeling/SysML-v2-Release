package VariabilityTest {
	part def P {
		attribute a;
	}
	part def Q :> P;
	attribute def B;
	variation part def V :> P {
		variant part x : Q {
			attribute b : B :>> a;
		}
	}
	part q : Q;
	variation part v : P {
		variant part y :> q {
			attribute b : B :>> a;
		}
	}
}