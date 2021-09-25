/**
 * This package provides a libary model of discretely sampled mathematical functions.
 */
package SampledFunctions {
	private import Base::Anything;
	private import ScalarValues::Positive;
	private import Collections::KeyValuePair;
	private import Collections::OrderedMap;
	private import SequenceFunctions::size;
	private import ControlFunctions::forAll;
	private import ControlFunctions::collect;
	private import ControlFunctions::select;
	
	/**
	 * SamplePair is a key-value pair of a domain-value and a range-value, used as a sample element in SampledFunction.
	 */
    attribute def SamplePair :> KeyValuePair {
        attribute domainValue :>> key;
        attribute rangeValue :>> val;
    }

	/**
     * SampledFunction is a variable-size, ordered collection of 'SamplePair' elements that represents a generic, discretely sampled, 
     * uni-variate or multi-variate mathematical function. The function must be montonic, either strictly increasing or strictly
     * decreasing.
     * 
     * It maps discrete domain values to discrete range values.
     * The domain of the function is represented by the sequence of 'domainValue' of each 'SamplePair' in 'samples', and 
     * the range of the function is represented by the sequence of 'rangeValue' of each 'SamplePair' in 'samples'.
     */
	attribute def SampledFunction :> OrderedMap {
		attribute samples: SamplePair[0..*] ordered :>> elements;
		
		assert constraint {
			// Note: Assumes the functions '<' and '>' are defined for the domain type.
			(1..size(samples)-1)->forAll { in i; (samples.domainValue[i] < samples.domainValue[i+1]) } or  // Strictly increasing
            (1..size(samples)-1)->forAll { in i; (samples.domainValue[i] > samples.domainValue[i+1]) }     // Strictly decreasing
		}
	}
	
	/* Domain returns the sequence of the domainValues of all samples in a SampledFunction. */
	calc def Domain(fn : SampledFunction) : Anything[0..*] = fn.samples.domainValue;
	
	/* Range returns the sequence of the rangeValues of all samples in a SampledFunction. */	
	calc def Range(fn : SampledFunction) : Anything[0..*] = fn.samples.rangeValue;
	
	/* Sample returns a SampledFunction that samples a given calculation over a seqence of domainValues. */
	calc def Sample {
		in calc calculation (x);
		in attribute domainValues [0..*];
		return sampling = SampledFunction (
			samples = domainValues->collect { in x; SamplePair(x, calculation(x)) }
		);
	}
	
	/**
	 * An Interpolate calculation returns an interpolated range value from a given SampledFunction for a given domain value.
	 * If the input domain value is outside the bounds of the domainValues of the SampleFunction, null is returned.
	 */
	calc def Interpolate (attribute fn : SampledFunction, attribute value) attribute result;
		
	/** 
	 * interpolateLinear is an Interpolate calculation assuming a linear functional form between SamplePairs.
	 */
	calc interpolateLinear : Interpolate {
		in attribute fn : SampledFunction;
		in attribute value;
		
		private attribute domainValues = Domain(fn);
		private attribute index : Positive[0..1] =
			(1..size(domainValues))->select { in i : Positive; domainValues[i] <= value }[1];
			
		private calc def Linear 
			(attribute lowerSample : SamplePair, attribute upperSample : SamplePair, attribute value) {
			private attribute f = (value - lowerSample.domainValue) / (lowerSample.domainValue - upperSample.domainValue);
			return result = upperSample.rangeValue + f * (lowerSample.rangeValue - upperSample.rangeValue);				
		}
		
		return result [0..1] =
			if index == null or index == size(domainValues)? null
			else if domainValues[index] < domainValues[index+1]? Linear(fn.samples[index], fn.samples[index+1], value)
			else Linear(fn.samples[index+1], fn.samples[index], value);
	}
	
}