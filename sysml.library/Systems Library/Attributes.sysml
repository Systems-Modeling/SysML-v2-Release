standard library package Attributes {
doc
/*
 * This package defines the base types for attributes and related structural elements 
 * in the SysML language.
 */

	private import Base::DataValue;
	private import Base::dataValues;

	alias AttributeValue for DataValue {
		doc
		/*
		 * AttributeValue is the most general type of data values that represent qualities or characteristics 
		 * of a system or part of a system. AttributeValue is the base type of all AttributeDefinitions.
		 */
	}
			
	alias attributeValues for dataValues {
		doc
		/*
		 * attributeValues is the base feature for all AttributeUsages.
		 */
	}		
}