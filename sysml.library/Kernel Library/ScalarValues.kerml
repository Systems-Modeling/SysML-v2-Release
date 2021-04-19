package ScalarValues {
	private import Base::DataValue;
	
	abstract datatype ScalarValue specializes DataValue;
	datatype Boolean specializes ScalarValue;
	datatype String specializes ScalarValue;
	abstract datatype NumericalValue specializes ScalarValue;
	
    abstract datatype Number specializes NumericalValue;
	datatype Integer specializes Number;
	datatype UnlimitedNatural specializes Number;
	datatype Natural specializes Integer, UnlimitedNatural;
    datatype Positive specializes Natural;
	datatype Rational specializes Number;
	datatype Real specializes Number;	
	datatype Complex specializes Number;
	
}		
