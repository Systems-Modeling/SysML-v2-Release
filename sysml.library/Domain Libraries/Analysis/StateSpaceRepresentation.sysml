standard library package StateSpaceRepresentation {
	doc
	/*
	 * This package provides a model of the foundational state-space system representation, 
	 * commonly used in control systems.
	 */

    private import ISQ::DurationValue;
    private import Quantities::VectorQuantityValue;
    private import VectorCalculations::*;

    abstract attribute def StateSpace :> VectorQuantityValue;
    abstract attribute def Input :> VectorQuantityValue;
    abstract attribute def Output :> VectorQuantityValue;

    abstract calc def GetNextState { 
    	in input: Input; 
    	in stateSpace: StateSpace; 
    	in timeStep: DurationValue; 
    	return : StateSpace;
    }
    abstract calc def GetOutput {
    	in input: Input; 
    	in stateSpace: StateSpace;
    	return : Output;
	}
	
     abstract action def StateSpaceEventDef {
    	doc
    	/*
    	 * Events to be received.
    	 */
    }
    action def ZeroCrossingEventDef :> StateSpaceEventDef;

    item def StateSpaceItem {
    	doc
    	/*
    	 * Item for SSR connection
    	 */
    }

    abstract action def StateSpaceDynamics {
	    doc
	    /*
	     * StateSpaceDynamics is the simplest form of State Space Representation,
	     * and nextState directly computes the stateSpace of the next timestep. 
	     */
    
        in attribute input: Input;

        abstract calc getNextState: GetNextState;
        abstract calc getOutput: GetOutput;
        attribute stateSpace: StateSpace;

        out attribute output: Output = getOutput(input, stateSpace);
    }

    abstract attribute def StateDerivative :> VectorQuantityValue {
	    doc
	    /*
	     * The definition of the time derivative of StateSpace, which means dx/dt, where x is StateSpace
	     */
    
        ref stateSpace: StateSpace;
        constraint { stateSpace.order == order }
    }

    abstract calc def GetDerivative {
	    doc
	    /*
	     * Computes the time derivative of stateSpace, which corresponds dx/dt = f(u, x), where u is input and x is stateSpace.
	     */
	    
    	in input: Input;
    	in stateSpace: StateSpace;
    	return : StateDerivative;
	}
	
    abstract calc def Integrate {
	    doc
	    /*
	     * Integrates stateSpace to compute the next stateSpace, which corresponds to x + int dx/dt dt.
	     * Its actual implementation should be given by a solver. 
	     */
    
        in getDerivative: GetDerivative;
        in input: Input;
        in initialState: StateSpace;
        in timeInterval: DurationValue;
        return result: StateSpace;
	}
	
    abstract action def ContinuousStateSpaceDynamics :> StateSpaceDynamics {
	    doc
	    /*
	     * ContinuousStateSpaceDynamics represents continuous behavior.
	     * derivative needs to return a time derivative of stateSpace, i.e. dx/dt.
	     */
    
        abstract calc getDerivative: GetDerivative;
        calc :>> getNextState: GetNextState {
            /* We compute nextState by Integrate defined above by giving derivative calc. */
            calc integrate: Integrate {
                in getDerivative = ContinuousStateSpaceDynamics::getDerivative;
                in input = GetNextState::input;
                in initialState = GetNextState::stateSpace;
                in timeInterval = GetNextState::timeStep;
           }
           return result = integrate.result;
        }

        event occurrence zeroCrossingEvents[0..*] : ZeroCrossingEventDef {
        	/* ContinuousStateSpaceDynamics may cause zero crossings anomaly. */ 
        }
    }

    abstract calc def GetDifference {
    	doc
	    /*
	     * Computes difference of stateSpace by one timestep, that is x(k+1) - x(k),
	     * where k is the timestep number. 
	     */
    
    	in input: Input;
    	in stateSpace: StateSpace;
    	return : StateSpace;
	}
	
    abstract action def DiscreteStateSpaceDynamics :> StateSpaceDynamics {
	    doc
	    /*
	     * DiscreteStateSpaceDynamics represents discrete behavior.
	     * differences needs to return difference of the stateSpace for each timestep.
	     */
    
        abstract calc getDifference: GetDifference;
        calc :>> getNextState: GetNextState {
            attribute diff: StateSpace = getDifference(input, stateSpace);
            return result = stateSpace + diff;
        }
    }
}
