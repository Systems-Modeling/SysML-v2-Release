package VerificationTest {

	part def V {
		m : ScalarValues::Integer;
	}
	
	part vv : V;
	
	requirement def VerificationObjective {
		doc /* ... */
	}

	verification def VerificationCase {		
		subject v : V;	
		objective : VerificationObjective {
			subject = v;
		}
		
		v::m == 0
	}
	
	verification def VerificationPlan {
		subject v : V;
		
		objective {
			doc /* ... */
		}
		
		verification verificationCase : VerificationCase;
	}
	
	part verificationContext {
		verification verificationPlan : VerificationPlan {
			subject v = vv;
		}
	}
}