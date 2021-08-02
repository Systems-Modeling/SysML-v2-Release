/**
 * This package defines the base types for attributes and related structural elements 
 * in the SysML language.
 */
package Attributes {
	private import Base::DataValue;
	private import Base::dataValues;

	/**
	 * AttributeValue is the most general type of data values that represent qualities or characteristics 
	 * of a system or part of a system. AttributeValue is the base type of all AttributeDefinitions.
	 */
	alias AttributeValue for DataValue;
			
	/**
	 * attributeValues is the base feature for all AttributeUsages.
	 */
	alias attributeValues for dataValues;		
}