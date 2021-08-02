package RiskMetadata {
	import ScalarValues::Real;
	
	attribute def Level :> Real {
		private attribute level : Level :>> self;
		assert constraint { level >= 0.0 && level <= 1.0 }
	}
	
	enum def LevelEnum :> Level {
		L = 0.25;
		M = 0.50;
		H = 0.75;
	}

	attribute def RiskLevel {
		attribute probability : Level;
		attribute impact : Level [0..1];
	}
	
	enum def RiskLevelEnum :> RiskLevel {
		L = RiskLevel(probability = LevelEnum::L);
		M = RiskLevel(probability = LevelEnum::M);
		H = RiskLevel(probability = LevelEnum::H);
	}
	
	attribute def Risk {
		attribute totalRisk : RiskLevel [0..1];
		attribute technicalRisk : RiskLevel [0..1];
		attribute scheduleRisk : RiskLevel [0..1];
		attribute costRisk : RiskLevel [0..1];
	}
	
}