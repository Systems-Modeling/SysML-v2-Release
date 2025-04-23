package SimpleQuadcopter {
    private import ISQ::*;
    private import SI::*;
    private import SpatialItems::*;
    private import ShapeItems::*;
    private import RealFunctions::sqrt;
    private import TrigFunctions::pi;
    private import TrigFunctions::tan;
    private import MeasurementReferences::CoordinateFrame;
    private import MeasurementReferences::TranslationRotationSequence;
    private import MeasurementReferences::Translation;
    private import MeasurementReferences::Rotation;

    part motorShape : SpatialItem {
        item :>> shape : Cylinder {
            :>> radius = 18 [mm];
            :>> height = 30 [mm];
        }
    }
    
    part def Strut :> SpatialItem {
        // By default will get same coordinateFrame.mRefs as owning SpatialItem, i.e.:
        // attribute :>> coordinateFrame { :>> mRefs = (mm, mm, mm); }
        
        /* rawStrut is a construction shape: a rectangular beam */
        part rawStrut : SpatialItem {
            item :>> shape : Box {
                :>> length = 160 [mm];
                :>> width = 15 [mm];
                :>> height = 8 [mm];
            }
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (0, shape.width/2, 0)[source]));
                }
            }        
        }

        /* motorCutout is a construction shape: a cylinder of the same shape as the  */
        part motorCutout : SpatialItem {
            item :>> shape = motorShape.shape;
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (175, 0, -1)[source]));
                }
            }
        }
        
        /* Strut shape is CSG difference of rawStrut minus motorCutout */
        attribute :> differencesOf[1] {
            item :>> elements = (rawStrut, motorCutout);
        }        
    }
    
    part def PropellerMotorAssy :> SpatialItem {
        // By default will get same coordinateFrame.mRefs as owning CompoundSpatialItem, i.e.:
        // attribute :>> coordinateFrame { :>> mRefs = (mm, mm, mm); }

        part propeller : SpatialItem {
            item :>> shape : Cylinder {
                doc /* propeller stay-out volume, without propeller shaft */
                :>> radius = 80 [mm];
                :>> height = 6 [mm];
            }
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (175, 0, 31)[source]));
                }
            }
        }

        part motor : SpatialItem {
            item :>> shape = motorShape.shape;
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (175, 0, 0)[source]));
                }
            }
        }
        
        // By default the shape of a PropellerMotorAssy is the union of its owned composite items and parts that are SpatialItems.
    }

    part def Camera :> SpatialItem {
        // By default will get same coordinateFrame.mRefs as owning CompoundSpatialItem, i.e.:
        // attribute :>> coordinateFrame { :>> mRefs = (mm, mm, mm); }

        part cameraHousing : SpatialItem {
            item :>> shape : Cylinder {
                :>> radius = 15 [mm];
                :>> height = 24 [mm];
            }
        }

        /* The field of view is modeled as an item, since it is not a part of the quadcopter but rather a stay-out volume 
         * that can for example be used to formulate a constraint.
         */
        item fieldOfView : SpatialItem {
            doc /* Conical field of view with half-top angle 20 degree */
            item :>> shape : Cone {
                :>> radius = height * tan(20 * pi/180) [mm];
                :>> height = 500 [mm];
            }
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Rotation( (0, 1, 0)[source], 180['°']));
                }
            }
        }
        
        // By default the shape of a Camera is the union of its owned composite items and parts that are SpatialItems.
    }

    part quadCopter : SpatialItem {
        attribute datum :>> coordinateFrame {
            doc /* The datum is the top level coordinate frame of the system-of-interest, i.e., the quadcopter.
                 * By convention its origin is placed at the bottom of the mainBody with the +X axis pointing in the 
                 * forward fligth (velocity) direction and the +Z axis pointing upward. The +Y axis completes the 
                 * right-handed Cartesian coordinate system.
                 */
            :>> mRefs = (mm, mm, mm);
        }

        part mainBody : SpatialItem {

            /* rawBody is a construction shape: the enveloping rectangular box */
            part rawBody : SpatialItem {
                item :>> shape : Box {
                    :>> length = 160 [mm];
                    :>> width = 15 [mm];
                    :>> height = 8 [mm];
                }
                attribute :>> coordinateFrame {
                    :>> transformation : TranslationRotationSequence {
                        :>> elements = (new Translation( (0, shape.width/2, 0)[source]));
                    }
                }        
            }
            
            /* cuttingBox is a construction shape: the enveloping rectangular box */
            part cuttingCornersBox : SpatialItem {
                item :>> shape : Box {
                    :>> length = 105 [mm];
                    :>> width = 105 [mm];
                    :>> height = 60 [mm];
                }
                attribute :>> coordinateFrame {
                    :>> transformation : TranslationRotationSequence {
                        :>> elements = (new Translation( (0, -shape.length/sqrt(2), -10)[source]), 
                                        new Rotation((0, 0, 1)[source], 45['°']));
                    }
                }        
            }

            /* Main body shape is the CSG intersection of rawBody and cuttingCornersBox */
            attribute :> intersectionsOf[1] {
                item :>> elements = (rawBody, cuttingCornersBox);
            }
            // Current syntax is not end-user friendly
            // It will be possible to specify following simple CSG expression:
            // item :>> shape = rawBody & cuttingCornersBox;
        }

        // Helper construction parameters
        private attribute xStrut : LengthValue = 49.60[mm];
        private attribute yStrut : LengthValue = 24.65[mm];
        private attribute zStrut : LengthValue = 25[mm];
        private attribute zPMAssy : LengthValue = 12[mm];

        part strut1 : Strut {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (xStrut.num, yStrut.num, zStrut.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 45['°']));
                }
            }        
        }
        part strut2 : Strut {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (-xStrut.num, yStrut.num, zStrut.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 135['°']));
                }
            }        
        }
        part strut3 : Strut {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (-xStrut.num, -yStrut.num, zStrut.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 225['°']));
                }
            }        
        }
        part strut4 : Strut {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (xStrut.num, -yStrut.num, zStrut.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 315['°']));
                }
            }        
        }

        part propellerMotorAssy1 : PropellerMotorAssy {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (xStrut.num, yStrut.num, zPMAssy.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 45['°']));
                }
            }        
        }
        part propellerMotorAssy2 : PropellerMotorAssy {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (-xStrut.num, yStrut.num, zPMAssy.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 135['°']));
                }
            }        
        }
        part propellerMotorAssy3 : PropellerMotorAssy {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (-xStrut.num, -yStrut.num, zPMAssy.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 225['°']));
                }
            }        
        }
        part propellerMotorAssy4 : PropellerMotorAssy {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (xStrut.num, -yStrut.num, zPMAssy.num)[source]), 
                                    new Rotation((0, 0, 1)[source], 315['°']));
                }
            }        
        }

        /* The camera is placed protruding from the +X face of the main body, rotated about the +Y axis over 50° downwards */
        part camera : Camera {
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (new Translation( (59, 0, 2)[source]), 
                                    new Rotation((0, 1, 0)[source], 50['°']));
                }
            }        
        }
        
    }
}