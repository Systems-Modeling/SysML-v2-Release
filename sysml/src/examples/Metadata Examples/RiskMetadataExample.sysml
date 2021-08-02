package RiskMetadataExample {
	import RiskMetadata::*;
	import RiskLevelEnum::*;
	
    part engine4cyl{
        @Risk {
            totalRisk = H;
            technicalRisk = M;
            scheduleRisk = M;
        }
        @Risk {
        	totalRisk.probability = 0.3;
        	totalRisk.impact = 0.7;
        }
    }
        
}