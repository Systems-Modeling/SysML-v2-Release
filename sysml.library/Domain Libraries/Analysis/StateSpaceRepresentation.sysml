/**
 * This package provides a model of the foundational state-space system representation, 
 * commonly used in control systems.
 */
package StateSpaceRepresentation {
    import ISQ::DurationValue;
    import Quantities::VectorQuantityValue;
    import VectorCalculations::*;

    abstract attribute def StateSpace :> VectorQuantityValue;
    abstract attribute def Input :> VectorQuantityValue;
    abstract attribute def Output :> VectorQuantityValue;

    abstract calc def GetNextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue): StateSpace;
    abstract calc def GetOutput(input: Input, stateSpace: StateSpace): Output;

    /** Events to be received. */
    abstract action def StateSpaceEventDef;
    action def ZeroCrossingEventDef :> StateSpaceEventDef;

    /** Item for SSR connection */
    item def StateSpaceItem;

    /** StateSpaceDynamics is the simplest form of State Space Representation,
        and nextState directly computes the stateSpace of the next timestep. */
    abstract action def StateSpaceDynamics {
        in attribute input: Input;

        abstract calc getNextState: GetNextState;
        abstract calc getOutput: GetOutput;
        attribute stateSpace: StateSpace;

        out attribute output: Output = getOutput(input, stateSpace);
    }

    /** The definition of the time derivative of StateSpace, which means dx/dt, where x is StateSpace */
    abstract attribute def StateDerivative :> VectorQuantityValue {
        ref stateSpace: StateSpace;
        constraint { stateSpace.order == order }
    }

    /** Computes the time derivative of stateSpace, which corresponds dx/dt = f(u, x), where u is input and x is stateSpace. */
    abstract calc def GetDerivative(input: Input, stateSpace: StateSpace): StateDerivative;

    /** Integrates stateSpace to compute the next stateSpace, which corresponds to x + int dx/dt dt.
     *  Its actual implementation should be given by a solver. */
    abstract calc def Integrate (
        in getDerivative: GetDerivative,
        in input: Input,
        in initialState: StateSpace,
        in timeInterval: DurationValue) return result: StateSpace;

    /** ContinuousStateSpaceDynamics represents continuous behavior.
        derivative needs to return a time derivative of stateSpace, i.e. dx/dt. */
    abstract action def ContinuousStateSpaceDynamics :> StateSpaceDynamics {
        abstract calc getDerivative: GetDerivative;
        calc :>> getNextState: GetNextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue) result: StateSpace {
            // We compute nextState by Integrate defined above by giving derivative calc.
            calc integrate: Integrate(
                getDerivative = ContinuousStateSpaceDynamics::getDerivative,
                input = GetNextState::input,
                initialState = GetNextState::stateSpace,
                timeInterval = GetNextState::timeStep
            ) return resultState = result;
        }

        // ContinuousStateSpaceDynamics may cause zero crossings anomaly.
        event occurrence zeroCrossingEvents[0..*] : ZeroCrossingEventDef;
    }

    /** Computes difference of stateSpace by one timestep, that is x(k+1) - x(k),
         where k is the timestep number. */
    abstract calc def GetDifference(input: Input, stateSpace: StateSpace): StateSpace;

    /** DiscreteStateSpaceDynamics represents discrete behavior.
      * differences needs to return difference of the stateSpace for each timestep.  */
    abstract action def DiscreteStateSpaceDynamics :> StateSpaceDynamics {
        abstract calc getDifference: GetDifference;
        calc :>> getNextState: GetNextState(input: Input, stateSpace: StateSpace, timeStep: DurationValue) result: StateSpace {
            attribute diff: StateSpace = getDifference(input, stateSpace);
            stateSpace + diff
        }
    }
}
