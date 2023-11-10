package MissionVerification{
	doc 'Mission Verification' /* The Verification cases at the mission level are described here */
	// the mission configuration shall be imported here
	// the following library contains VeredictKind
	import VerificationCases::*;
	package VerificationCasesDefinitions{
		doc 'Verification Cases Definition' /* The definition elements of the verification cases are defined here */
	}
	package VerificationsCasesUsage{
		doc 'Verification Cases Usage' /* The Verification cases for the mission are defined here */
	}
	package VerificationMission{
		doc 'Verification Mission' /* The sequence of verification cases to fully verify the mission are defined here */
	}
}