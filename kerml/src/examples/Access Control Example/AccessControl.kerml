package AccessControl {
	import ScalarValues::*;
	
	class Authorizer {
		port ap[1];
		port console[1];
	}
	class SpecialAuthorizer specializes Authorizer;
	
	class Console {
		port authorizer[*];
		port supervisor[1];
	}
	
	class AccessPoint {
		feature floor: Integer; // 0..10
		feature seclev: Integer; // 1..4
		
		port user;
		port door;
		port authorizer[1];
	}
	
	class BlockingAccessPoint specializes AccessPoint;
	class LoggingAccessPoint specializes AccessPoint;
	
	class ACSystem {
		composite ap: AccessPoint[2..100] {
			port user redefines AccessPoint::user;
			port authorizer redefines AccessPoint::authorizer;
		}
		composite aut: Authorizer[2] {
			port ap redefines Authorizer::ap;
			port console redefines Authorizer::console;
		}
		composite c: Console[1] {
			port authorizer redefines Console::authorizer;
			port supervisor redefines Console::supervisor;
		}
		
		port user;
		port door;
		port supervisor;
		
		connector user to ap::user[*];
		connector ap_aut from ap::authorizer[*] to aut::ap[1];
		connector aut::console[*] to c::authorizer[1];
		connector c::supervisor[1] to supervisor[1];	
	}
	
	class MyACSystem specializes ACSystem {
		composite ground: LoggingAccessPoint[1..25] subsets ap;
		composite top: BlockingAccessPoint[2..99] subsets ap;
	}
	
	class MyACSnapshot specializes MyACSystem {
		composite zero: LoggingAccessPoint[1..25] subsets ground {
			feature floor redefines LoggingAccessPoint::floor = 0;
			feature seclev redefines LoggingAccessPoint::seclev = 4;
			
			port authorizer redefines LoggingAccessPoint::authorizer;
		}
		composite 'first': BlockingAccessPoint[2..99] subsets top {
			feature floor redefines LoggingAccessPoint::floor = 1;
			feature seclev redefines LoggingAccessPoint::seclev = 3;
			
			port authorizer redefines LoggingAccessPoint::authorizer;
		}
		composite second: BlockingAccessPoint[2..99] subsets top {
			feature floor redefines LoggingAccessPoint::floor = 2;
			feature seclev redefines LoggingAccessPoint::seclev = 3;
			
			port authorizer redefines LoggingAccessPoint::authorizer;
		}
		
		composite secureAut: SpecialAuthorizer[1] subsets aut {
			composite ap redefines aut::ap;
		}
		composite regularAut: Authorizer[1] subsets aut {
			port ap redefines aut::ap;
		}
		
		connector zero_aut subsets ap_aut from zero::authorizer[1] to secureAut::ap[1] ;
		connector first_aut subsets ap_aut from 'first'::authorizer[1] to regularAut::ap[1];
		connector second_aut subsets ap_aut from second::authorizer[1] to regularAut::ap[1];
	}

}