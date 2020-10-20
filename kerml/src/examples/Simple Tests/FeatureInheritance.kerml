package FeatureInheritance {
	feature s {
		feature t : ISQ::TorqueValue;
	}
	
	feature u redefines s;
}