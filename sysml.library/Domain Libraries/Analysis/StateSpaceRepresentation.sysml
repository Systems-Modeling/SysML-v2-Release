package StateSpaceRepresentation {
    import ISQ::DurationValue;

    // TODO: StateSpace should be a vector (rank-one tensor)
    abstract attribute def StateSpace;
    abstract attribute def Input;
    abstract attribute def Output;
   
    abstract calc def NextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue): StateSpace;
    abstract calc def GetOutput(input: Input, stateSpace: StateSpace): Output;
    
    /** Events to be received. */
    abstract attribute def StateSpaceEvent;
    attribute def ZeroCrossingEvent :> StateSpaceEvent;
    
    /** Item for SSR connection */
    item def StateSpaceItem;
    
    /** StateSpaceDynamics is the simplest form of State Space Representation,
        and nextState directly computes the stateSpace of the next timestep. */
    abstract action def StateSpaceDynamics {
    	in attribute input: Input;
    	
        abstract calc nextState: NextState;
        abstract calc getOutput: GetOutput;
        attribute stateSpace: StateSpace;

       	out attribute output: Output = getOutput(input, stateSpace);
    }
   
    /** The definition of the time derivative of StateSpace, which means dx/dt, where x is StateSpace */
    abstract attribute def StateDerivative;
   
    /** Computes the time derivative of stateSpace, which corresponds dx/dt = f(u, x), where u is input and x is stateSpace. */
    abstract calc def Derivative(input: Input, stateSpace: StateSpace): StateDerivative;
    
    /** Integrates stateSpace to compute the next stateSpace, which corresponds to x + int dx/dt dt.
     *  Its actual implementation should be given by a solver. */
    abstract calc def Integrate (
        in derivative: Derivative,
        in input: Input,
        in initialState: StateSpace,
        in timeInterval: DurationValue) return result: StateSpace;
    
    /** ContinuousStateSpaceDynamics represents continuous behavior.
        derivative needs to return a time derivative of stateSpace, i.e. dx/dt. */
    abstract action def ContinuousStateSpaceDynamics :> StateSpaceDynamics {
        abstract calc derivative: Derivative;
        calc :>> nextState: NextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue) result: StateSpace {
            // We compute nextState by Integrate defined above by giving derivative calc.
            calc integrate: Integrate(
                derivative = ContinuousStateSpaceDynamics::derivative,
                input = NextState::input,
                initialState = NextState::stateSpace,
                timeInterval = NextState::timeStep
            ) return resultState = result;  
        }
    }  

    /** Computes difference of stateSpace by one timestep, that is x(k+1) - x(k),
         where k is the number of timesteps. */
    abstract calc def Difference(input: Input, stateSpace: StateSpace): StateSpace;
    // TODO: Computes next stateSpace by adding the diff.  Vector addition should replace this.
    abstract calc def AddDiff(stateSpace: StateSpace, diff: StateSpace): StateSpace;

    /** DiscreteStateSpaceDynamics represents discrete behavior.
      * differences needs to return difference of the stateSpace for each timestep.  */
    abstract action def DiscreteStateSpaceDynamics :> StateSpaceDynamics {
        abstract calc difference: Difference;
        calc :>> nextState: NextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue) result: StateSpace {
            attribute diff: StateSpace = difference(input, stateSpace);
            calc addDiff: AddDiff(stateSpace, diff) return result;
        }
    }
}