standard library package SpatialFrames {
    doc
    /*
     * This package models spatial frames of reference for quantifying the position of points 
     * in a three-dimensional space. 
     */

    private import Clocks::*;
    private import ScalarValues::NumericalValue;
    private import VectorValues::ThreeVectorValue;
    private import VectorValues::CartesianThreeVectorValue;
    private import VectorFunctions::isZeroVector;
    private import Occurrences::Life;
    private import Objects::Body;
    private import Objects::Point;
    private import ControlFunctions::forAll;
    private import SequenceFunctions::includes;
    
    private struct DefaultFrameLife[1] :> SpatialFrame, Life {
        doc
        /*
         * DefaultFrameLife is the classifier of the singleton Life of the defaultFrame.
         */
    }
    
    feature defaultFrame : DefaultFrameLife[1] {
        doc
        /*
         * defaultFrame is a fixed SpatialFrame used as a universal default.
         */
    }
    
    abstract struct SpatialFrame specializes Body {
        doc
        /*
         * A SpatialFrame is a three-dimensional Body that provides a spatial extent that 
         * acts as a frame of reference for defining the physical position and displacement 
         * vectors of Points over time.
         */
    }
    
    abstract function PositionOf {
        doc
        /*
         * The PositionOf a Point relative to a SpatialFrame, at a specific time relative to a given
         * Clock, as a positionVector that is a ThreeVectorValue.
         */
    
        in point : Point[1];
        in time : NumericalValue[1];
        in frame : SpatialFrame[1] default defaultFrame;
        in clock : Clock[1] default frame.localClock;
        return positionVector : ThreeVectorValue[1];
        
        inv positionTimePrecondition {
            doc
            /*
             * The given point must exist at the given time.
             */
        
            TimeOf(point.startShot) <= time and
            time <= TimeOf(point.endShot)
        }
        
        inv spacePositionConstraint {
            doc
            /*
             * The result positionVector is equal to the PositionOf the Point spaceShot of the
             * frame that encloses the given point, at the given time.
             */
        
            (frame.spaceShots as Point)->forAll{in p : Point;
                p.spaceTimeEnclosedOccurrences->includes(point) implies
                    positionVector == PositionOf(p, time, frame)
            }
        }
    }
    
    abstract function CurrentPositionOf {
        doc
        /*
         * The CurrentPositionOf a Point relative to a SpatialFrame and a Clock is the PositionOf
         * the Point relative to the SpatialFrame at the currentTime of the Clock.
         */
    
        in point : Point[1];
        in frame : SpatialFrame[1] default defaultFrame;
        in clock : Clock[1] default frame.localClock;
        return positionVector : ThreeVectorValue[1] =
            PositionOf(point, clock.currentTime, frame, clock);
    }
        
    function DisplacementOf {
        doc
        /*
         * The DisplacementOf two Points relative to a SpatialFrame, at a specific time relative to a
         * given Clock, is the displacementVector computed as the difference between the PositionOf the 
         * first Point and PositionOf the second Point, relative to that SpatialFrame, at that time.
         */
    
        in point1 : Point[1];
        in point2 : Point[1];
        in time : NumericalValue;
        in frame : SpatialFrame[1] default defaultFrame;
        in clock : Clock[1] default frame.localClock;
        return displacementVector : ThreeVectorValue[1] =
            PositionOf(point2, time, frame, clock) - PositionOf(point1, time, frame, clock);
            
        inv zeroDisplacementConstraint {
        doc
        /*
         * If either point1 or point2 occurs within the other, then the displacementVector is
         * the zero vector.
         */
        
            (point1.spaceTimeEnclosedOccurrences->includes(point2) or
            point2.spaceTimeEnclosedOccurrences->includes(point1)) implies
                isZeroVector(displacementVector)
        }
    }
    
    function CurrentDisplacementOf {
        doc
        /*
         * The CurrentDisplacementOf two Points relative to a SpatialFrame and Clock is the DisplacementOf
         * the Points relative to the SpatialFrame at the currentTime of the Clock.
         */
    
        in point1 : Point[1];
        in point2 : Point[1];
        in frame : SpatialFrame[1] default defaultFrame;
        in clock : Clock[1] default frame.localClock;
        return displacementVector : ThreeVectorValue[1] =
            DisplacementOf(point1, point2, clock.currentTime, frame, clock);
    }
    
    abstract struct CartesianSpatialFrame :> SpatialFrame {
        doc
        /*
         * A CartesianSpatialFrame is a SpatialFrame relative to which all position and displacement
         * vectors can be represented as CartesianThreeVectorValues.
         */
    }
    
    abstract function CartesianPositionOf :> PositionOf {
        doc
        /*
         * The PositionOf a Point relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
         */
    
        in point : Point[1];
        in time : NumericalValue[1];
        in frame : CartesianSpatialFrame[1];
        in clock : Clock[1] default frame.localClock;
        return positionVector : CartesianThreeVectorValue[1];
    }
    
    abstract function CartesianCurrentPositionOf :> CurrentPositionOf {
        doc
        /*
         * The CurrentPositionOf a Point relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
         */
    
        in point : Point[1];
        in frame : CartesianSpatialFrame[1];
        in clock : Clock[1] default frame.localClock;
        return positionVector : CartesianThreeVectorValue[1];
    }
    
    function CartesianDisplacementOf :> DisplacementOf {
        doc
        /*
         * The DisplacementOf two Points relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
         */
    
        in point1 : Point[1];
        in point2 : Point[1];
        in time : NumericalValue[1];
        in frame : CartesianSpatialFrame[1];
        in clock : Clock[1] default frame.localClock;
        return displacementVector : CartesianThreeVectorValue[1];
    }
        
    function CartesianCurrentDisplacementOf :> CurrentDisplacementOf {
        doc
        /*
         * The CurrentDisplacementOf two Points relative to a CartesianSpatialFrame is a CartesianThreeVectorValue.
         */
    
        in point1 : Point[1];
        in point2 : Point[1];
        in frame : CartesianSpatialFrame[1];
        in clock : Clock[1] default frame.localClock;
        return displacementVector : CartesianThreeVectorValue[1];
    }

}