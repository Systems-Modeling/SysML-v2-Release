package VerificationTest {

	part def V {
		m : ScalarValues::Integer;
	}
	
	part vv : V;
	
	requirement def R {
		doc /* ... */
	}
	
	requirement r : R;

	verification def VerificationCase {		
		subject v : V;	
		objective {
			verify requirement : R;
		}
		
		VerificationCases::PassIf(v.m == 0)
	}
	
	verification def VerificationPlan {
		subject v : V;
		
		objective {
			verify r;
		}
		
		verification verificationCase : VerificationCase;
	}
	
	part verificationContext {
		verification verificationPlan : VerificationPlan {
			subject v = vv;
		}
	}
}