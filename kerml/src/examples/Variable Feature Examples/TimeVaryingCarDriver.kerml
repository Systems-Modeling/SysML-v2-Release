package TimeVaryingCarDriver {
    private import ScalarValues::*;
    
    // Example model without variable features.
    
    struct Person0 {
        feature isLicensed : Boolean [0..1];
    }
    
    struct Car0 {
        feature driver : Person0 [0..1];
        
        portion :>> startShot {
        	feature :>> driver [0];
        }
        
        succession first startShot then operated; 

        portion operated [0..*] :> timeSlices {
            feature :>> driver [1] {
                feature :>> isLicensed = true;
            }
        }

        abstract feature carParts [0..*];
        feature engine [1] :> carParts;
        feature transmission [1] :> carParts;
        
        connector drive from engine to transmission;      
    }
    
    // Example model with "variable features" identified
    
    struct Person1 {
        var feature isLicensed : Boolean [1];
    }
    
    struct Car1 {
        var feature driver : Person1 [0..1];
        
        portion :>> startShot {
        	var feature :>> driver [0]; 
        }
        
        succession first startShot then operated; 

        portion operated [0..*] :> timeSlices {
            var feature :>> driver [1] {
                var feature :>> isLicensed = true;
            }
        }
        
        abstract var feature carParts [0..*];
        var feature engine [1] :> carParts;
        var feature transmission [1] :> carParts;
        
        var connector drive from engine to transmission;
    }
    
  	// Semantic equivalent of implied relationships for variable features in
  	// the previous model
  
    struct Person1_ {
        // var feature isLicensed : Boolean [1];
        member feature isLicensed : Boolean [1] featured by Person_snapshots {
            member feature Person_snapshots :>> Occurrences::Occurrence::snapshots featured by Person1_;
        }
        member feature name : String [1] featured by Person_snapshots {
            member feature Person_snapshots :>> Occurrences::Occurrence::snapshots featured by Person1_;
        }
    }
    
    struct Car1_ {
        // var feature driver : Person [0..1];
        member feature driver : Person1_ [0..1] featured by Car_snapshots {
            member feature Car_snapshots :>> Occurrences::Occurrence::snapshots featured by Car1_;
        }
        
        portion :>> startShot {
        	// var feature :>> driver [0];
           	member feature :>> Car1_::driver [0] featured by Car_startShot_snapshots {
                member feature Car_startShot_snapshots :>> Car_snapshots featured by Car1_::startShot;
        	}
        }
        
        succession first startShot then operated; 

        portion operated [0..*] :> timeSlices {
            // var feature :>> driver [1]
            member feature :>> Car1_::driver [1] featured by Car_operated_snapshots {
                member feature Car_operated_snapshots :>> Car_snapshots featured by Car1_::operated;
                // var feature :>> isLicensed = true;
                member feature isLicensed1 :>> Person1_::isLicensed featured by Car_operated_driver_snapshots = true {
                    member feature Car_operated_driver_snapshots :>> Occurrences::Occurrence::snapshots featured by Car1_::operated::driver;
                }
            }
        }

        // var abstract feature carParts [0..*];
        member abstract feature carParts [0..*] featured by Car_snapshots {
            member feature Car_snapshots :>> Occurrences::Occurrence::snapshots featured by Car1_;
        }
        
        // var feature engine [1];
        member feature engine [1] :> carParts featured by Car_snapshots1 {
            member feature Car_snapshots1 :>> Occurrences::Occurrence::snapshots featured by Car1_;
        }       
        
        // var feature transmission [1];
        member feature transmission [1] :> carParts featured by Car_snapshots1 {
            member feature Car_snapshots1 :>> Occurrences::Occurrence::snapshots featured by Car1_;
        }       
        
        // var connector drive from engine to transmission;
        member connector drive featured by Car_snapshots from engine to transmission {
            member feature Car_snapshots :>> Occurrences::Occurrence::snapshots featured by Car1_;
        }
    }
    
}