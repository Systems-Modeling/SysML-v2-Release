package RiskMetadataExample {
	import RiskMetadata::*;
	import RiskLevelEnum::*;
	
    part engine4cyl{
        @Risk {
            totalRisk = high;
            technicalRisk = medium;
            scheduleRisk = medium;
        }
        @Risk {
        	totalRisk.probability = 0.3;
        	totalRisk.impact = 0.7;
        }
    }
        
}