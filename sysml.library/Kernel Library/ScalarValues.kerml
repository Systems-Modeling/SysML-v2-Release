package ScalarValues {
	private import Base::DataValue;
	
	abstract datatype ScalarValue specializes DataValue;
	datatype Boolean specializes ScalarValue;
	datatype String specializes ScalarValue;
	abstract datatype NumericalValue specializes ScalarValue;
	
    abstract datatype Number specializes NumericalValue;
	datatype Complex specializes Number;
	datatype Real specializes Complex;	
	datatype Rational specializes Real;
	datatype Integer specializes Rational;
	datatype Natural specializes Integer;
    datatype Positive specializes Natural;	
}		
